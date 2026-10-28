# 徐景喆的学术主页

基于官方 al-folio v1 模板，部署到 GitHub Pages。

导航：Home · Research · Publications · Projects · Join Us · CV。

中文站点：https://misonoxu.github.io/；英文站点：https://misonoxu.github.io/en/。
导航栏右侧的 English / 中文按钮可切换到当前页面的另一语言版本。

## 日常更新

| 内容 | 修改文件 |
| --- | --- |
| 个人简介 | `_pages/about.md` |
| 研究方向 | `_pages/research.md` |
| 论文 | `_bibliography/papers.bib` |
| 项目、专利和荣誉 | `_pages/projects.md` |
| 招生 | `_pages/join.md` |
| 在线简历 | `_data/cv.yml` |
| 下载英文简历 | `assets/pdf/Jing-Zhe_Xu_English_CV.pdf` |
| 邮箱和学术链接 | `_data/socials.yml` |
| 英文页面与在线简历 | `_i18n/en/_pages/`、`_i18n/en/_data/cv.yml` |

论文按 BibTeX 文件中的条目顺序显示。首页显示 `selected = {true}` 的前六篇。新增论文时自行决定插入位置。

Google Scholar ID 确认后，在 `_data/socials.yml` 增加 `scholar_userid: 实际ID`。
在线 CV 与 PDF 是两份文件，更新经历或论文时请同时更新。
完整论文页保留全部论文；在线 CV 与英文 PDF 当前精选 10 篇。
中英文页面分别维护文字，共用论文 BibTeX、图片和 PDF。修改中文页面后，请同步相应的英文页面。

## 本地运行

使用 Ruby 3.3.5、Bundler 4.0.6 及 Node 20：

```sh
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

部署时自动使用 GitHub 仓库所有者确定个人主页域名。
GitHub Actions 通过 `scripts/build_bilingual.sh` 分别构建中文根目录和英文 `/en/` 目录，
并检查页面、导航、语言链接及论文顺序。语言按钮由 `_plugins/language_switch.rb` 注入。
手动执行双语构建前，请创建 `/tmp/pages-url.yml`，内容为：

```yaml
url: https://misonoxu.github.io
baseurl: ""
```

然后运行 `bash scripts/build_bilingual.sh`。

模板来源与许可证：https://github.com/alshedivat/al-folio （MIT，见 LICENSE）。
