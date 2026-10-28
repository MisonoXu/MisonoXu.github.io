# Add a language link to the rendered theme without replacing its layouts.
require "nokogiri"

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.output_ext == ".html"
  html = Nokogiri::HTML(page.output)
  container = html.at_css("#navbar > .container")
  next unless container

  # The theme's 576px expansion is too narrow for the language button.
  # Remove it so its layered !important rule cannot force open our mobile menu.
  navbar = container.parent
  navbar["class"] = navbar["class"].split.reject { |name| name == "navbar-expand-sm" }.join(" ")
  panel = container.at_css(".navbar-collapse-main")
  panel["class"] = panel["class"].split.reject { |name| name == "collapse" }.join(" ") if panel

  english = page.site.config["lang"] == "en"
  route = page.url.sub(/index\.html$/, "")
  alternate = english ? route : "/en#{route}"
  base = page.site.config["baseurl"].to_s
  head = html.at_css("head")

  link = Nokogiri::XML::Node.new("a", html)
  link["class"] = "xu-language-switch"
  link["href"] = alternate
  link["hreflang"] = english ? "zh-CN" : "en"
  link["lang"] = english ? "zh-CN" : "en"
  link["aria-label"] = english ? "切换至中文页面" : "Switch this page to English"
  link.content = english ? "中文" : "English"
  container.add_child(link)

  {"zh-CN" => route, "en" => "/en#{route}", "x-default" => route}.each do |lang, path|
    node = Nokogiri::XML::Node.new("link", html)
    node["rel"] = "alternate"
    node["hreflang"] = lang
    node["href"] = "#{page.site.config['url']}#{path}"
    head.add_child(node)
  end
  css = Nokogiri::XML::Node.new("link", html)
  css["rel"] = "stylesheet"
  css["href"] = "#{base}/assets/css/language-switch.css"
  head.add_child(css)
  js = Nokogiri::XML::Node.new("script", html)
  js["src"] = "#{base}/assets/js/language-switch.js"
  js["defer"] = "defer"
  head.add_child(js)
  page.output = html.to_html
end
