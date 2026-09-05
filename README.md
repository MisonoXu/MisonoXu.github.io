# 徐景喆的学术主页

基于官方 al-folio v1 模板，部署到 GitHub Pages。

导航：Home · Research · Publications · Projects · Join Us · CV。

## 日常更新

| 内容 | 修改文件 |
| --- | --- |
| 个人简介 | `_pages/about.md` |
| 研究方向 | `_pages/research.md` |
| 论文 | `_bibliography/papers.bib` |
| 项目、专利和荣誉 | `_pages/projects.md` |
| 招生 | `_pages/join.md` |
| 在线简历 | `_data/cv.yml` |
| 下载简历 | `assets/pdf/Jing-Zhe_Xu_CV.pdf` |
| 邮箱和学术链接 | `_data/socials.yml` |

论文按 BibTeX 文件中的条目顺序显示。首页显示 `selected = {true}` 的前六篇。新增论文时自行决定插入位置。

Google Scholar ID 确认后，在 `_data/socials.yml` 增加 `scholar_userid: 实际ID`。
在线 CV 与 PDF 是两份文件，更新经历或论文时请同时更新。

## 本地运行

使用 Ruby 3.3.5、Bundler 4.0.6 及 Node 20：

```sh
bundle install
bundle exec jekyll serve --host 127.0.0.1
```

部署时自动使用 GitHub 仓库所有者确定个人主页域名。

模板来源与许可证：https://github.com/alshedivat/al-folio （MIT，见 LICENSE）。
