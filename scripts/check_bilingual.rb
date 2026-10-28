require "nokogiri"
root = ARGV.fetch(0)
routes = ["", "research/", "publications/", "projects/", "join/", "cv/"]
routes.each do |route|
  ["", "en/"].each do |prefix|
    path = File.join(root, prefix, route, "index.html")
    html = Nokogiri::HTML(File.read(path))
    expected = prefix.empty? ? "/en/#{route}" : "/#{route}"
    raise "Wrong language switch: #{path}" unless html.at_css(".xu-language-switch")&.[]("href") == expected
    raise "Wrong language: #{path}" unless html.at_css("html")&.[]("lang") == (prefix.empty? ? "zh-CN" : "en")
    links = html.css("#navbar .navbar-menu-list .nav-link").map { |n| n["href"] }
    expected_nav = routes.map { |r| "/#{prefix}#{r}" }
    raise "Wrong navigation: #{path}: #{links}" unless links == expected_nav
    if route == "publications/"
      papers = html.css("ol.bibliography > li")
      raise "Expected 17 papers: #{path}" unless papers.size == 17
      raise "New paper not sixth: #{path}" unless papers[5].text.include?("Distributed Time-Varying Optimization")
    end
    if prefix == "en/"
      body = html.at_css("article").dup
      body.css("script, style").remove
      raise "Untranslated text: #{path}" if body.text.match?(/[\u4e00-\u9fff]/)
    end
  end
end
raise "Missing English CV" unless File.file?(File.join(root, "assets/pdf/Jing-Zhe_Xu_English_CV.pdf"))
puts "Verified bilingual routes, navigation, paper ordering, and English content."
