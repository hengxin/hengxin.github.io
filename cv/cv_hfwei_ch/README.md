# 魏恒峰中文简历

- 源文件：`hfwei-cv-ch.tex`（原文件名 `hfwei-cv-en.tex`）。
- 编译结果：`hfwei-cv-ch.pdf`。
- 论文数据：`publications.bib`，与个人网站完整论文列表同步。
- 信息核对日期：2026 年 10 月 16 日。

## 编译

在此目录运行（需要含 XeLaTeX、Biber 和 latexmk 的 TeX Live）：

```powershell
latexmk -xelatex -interaction=nonstopmode -halt-on-error hfwei-cv-ch.tex
```

使用 TeX Live 自带的 Fandol 中文字体和 TeX Gyre 西文字体，不依赖 Windows 专有字体。
保留原简历配套的本地 moderncv 1.3.0 类文件与样式，确保排版可复现。

## 内容来源

任职与研究方向、论文、课程、荣誉、学生培养和学术服务分别依据仓库中的
`index.jemdoc`、`research.jemdoc`、`publications.jemdoc`、`teaching.jemdoc`、
`awards.jemdoc`、`students.jemdoc`、`activities.jemdoc`，并核对线上页面。
邮箱取自网站 `figs/hfwei-hnu-mail.png`。
学院中文名称按本人要求采用“计算机学院”，[教师介绍链接](https://csee.hnu.edu.cn/people/weihengfeng)保持不变。

项目名称、编号、起止时间、承担角色，以及南京大学早期任职细节和算法课程助教经历，
沿用原简历中的信息；个人网站没有提供这些项目或经历的完整清单。
教学学期按网站明确列出的时间填写，不延伸为“至今”。
论文作者顺序与通讯作者标记依照个人网站，元数据取自 `papers/*-bib.md`；
2022 年 Incremental Causal Consistency 论文没有独立 BibTeX 文件，依据论文列表录入。
论文元数据全部使用英文，简历中的论文统一列表展示，不按已发表或待刊状态分组。
VeriStrong 保留 VLDB 2026 标记，出版日期通过 `date = {2025-12}` 显示。

## 简历论文展示范围

2021 年及之后仅展示 CCF-A 类论文（含已接收的 PVLDB 待刊论文），2020 年及以前保留原论文列表。
依据 [CCF 推荐目录说明](https://www.ccf.org.cn/Academic_Evaluation/By_category/2022-12-02/780280.shtml)，
Demo、Workshop 等不计入推荐会议论文范围，因此 IsoVista 演示论文也不展示。
《软件学报》不属于该国际 CCF-A 目录，其 2021 年条目不展示。

全部 38 项论文数据仍保留在 `publications.bib`；源文件中 14 项不展示论文的 `\nocite` 语句已注释，可按需恢复。
