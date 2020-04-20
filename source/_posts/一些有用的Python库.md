---
title: 一些有用的Python库
copyright: true
top: 0
date: 2020-04-20 00:37:34
categories: 
- PYTHON
description: 一些有用的Python库
tags:
- PYTHON
---

## 一些有用的Python库
### 环境管理

管理 Python 版本和环境的工具

*   p – 非常简单的交互式 python 版本管理工具。
    
*   pyenv – 简单的 Python 版本管理工具。
    
*   Vex – 可以在虚拟环境中执行命令。
    
*   virtualenv – 创建独立 Python 环境的工具。
    
*   virtualenvwrapper- virtualenv 的一组扩展。
    

### 包管理

管理包和依赖的工具

*   pip – Python 包和依赖关系管理工具。
    
*   pip-tools – 保证 Python 包依赖关系更新的一组工具。
    
*   conda – 跨平台，Python 二进制包管理工具。
    
*   Curdling – 管理 Python 包的命令行工具。
    
*   wheel – Python 分发的新标准，意在取代 eggs。
    

### 包仓库

本地 PyPI 仓库服务和代理。

*   warehouse – 下一代 PyPI。
    
*   Warehousebandersnatch – PyPA 提供的 PyPI 镜像工具。
    
*   devpi – PyPI 服务和打包/测试/分发工具。
    
*   localshop – 本地 PyPI 服务(自定义包并且自动对 PyPI 镜像)。
    

## 分发

打包为可执行文件以便分发。

*   PyInstaller – 将 Python 程序转换成独立的执行文件(跨平台)。
    
*   dh-virtualenv – 构建并将 virtualenv 虚拟环境作为一个 Debian 包来发布。
    
*   Nuitka – 将脚本、模块、包编译成可执行文件或扩展模块。
    
*   py2app – 将 Python 脚本变为独立软件包(Mac OS X)。
    
*   py2exe – 将 Python 脚本变为独立软件包(Windows)。
    
*   pynsist – 一个用来创建 Windows 安装程序的工具，可以在安装程序中打包 Python本身。
    

## 构建工具

将源码编译成软件。

*   buildout – 一个构建系统，从多个组件来创建，组装和部署应用。
    
*   BitBake – 针对嵌入式 Linux 的类似 make 的构建工具。
    
*   fabricate – 对任何语言自动找到依赖关系的构建工具。
    
*   PlatformIO – 多平台命令行构建工具。
    
*   PyBuilder – 纯 Python 实现的持续化构建工具。
    
*   SCons – 软件构建工具。
    

## 交互式解析器

交互式 Python 解析器。

*   IPython – 功能丰富的工具，非常有效的使用交互式 Python。
    
*   bpython- 界面丰富的 Python 解析器。
    
*   ptpython – 高级交互式Python解析器， 构建于python-prompt-toolkit 之上。
    

文件管理和 MIME(多用途的网际邮件扩充协议)类型检测。

*   imghdr – (Python 标准库)检测图片类型。
    
*   mimetypes – (Python 标准库)将文件名映射为 MIME 类型。
    
*   path.py – 对 os.path 进行封装的模块。
    
*   pathlib – (Python3.4+ 标准库)跨平台的、面向对象的路径操作库。
    
*   python-magic- 文件类型检测的第三方库 libmagic 的 Python 接口。
    
*   Unipath- 用面向对象的方式操作文件和目录
    
*   watchdog – 管理文件系统事件的 API 和 shell 工具
    

## 日期和时间

操作日期和时间的类库。

*   arrow- 更好的 Python 日期时间操作类库。
    
*   Chronyk – Python 3 的类库，用于解析手写格式的时间和日期。
    
*   dateutil – Python datetime 模块的扩展。
    
*   delorean- 解决 Python 中有关日期处理的棘手问题的库。
    
*   moment – 一个用来处理时间和日期的Python库。灵感来自于Moment.js。
    
*   PyTime – 一个简单易用的Python模块，用于通过字符串来操作日期/时间。
    
*   pytz – 现代以及历史版本的世界时区定义。将时区数据库引入Python。
    
*   when.py – 提供用户友好的函数来帮助用户进行常用的日期和时间操作。
    

## 文本处理

用于解析和操作文本的库。

1. 通用

*   chardet – 字符编码检测器，兼容 Python2 和 Python3。
    
*   difflib – (Python 标准库)帮助我们进行差异化比较。
    
*   ftfy – 让Unicode文本更完整更连贯。
    
*   fuzzywuzzy – 模糊字符串匹配。
    
*   Levenshtein – 快速计算编辑距离以及字符串的相似度。
    
*   pangu.py – 在中日韩语字符和数字字母之间添加空格。
    
*   pyfiglet -figlet 的 Python实现。
    
*   shortuuid – 一个生成器库，用以生成简洁的，明白的，URL 安全的 UUID。
    
*   unidecode – Unicode 文本的 ASCII 转换形式 。
    
*   uniout – 打印可读的字符，而不是转义的字符串。
    
*   xpinyin – 一个用于把汉字转换为拼音的库。
    

2. Slug化

*   awesome-slugify – 一个 Python slug 化库，可以保持 Unicode。
    
*   python-slugify – Python slug 化库，可以把 unicode 转化为 ASCII。
    
*   unicode-slugify – 一个 slug 工具，可以生成 unicode slugs ,需要依赖 Django 。
    

3. 解析器

*   phonenumbers – 解析，格式化，储存，验证电话号码。
    
*   PLY – lex 和 yacc 解析工具的 Python 实现。
    
*   Pygments – 通用语法高亮工具。
    
*   pyparsing – 生成通用解析器的框架。
    
*   python-nameparser – 把一个人名分解为几个独立的部分。
    
*   python-user-agents – 浏览器 user agent 解析器。
    
*   sqlparse – 一个无验证的 SQL 解析器。
    

## 特殊文本格式处理
*   一些用来解析和操作特殊文本格式的库。

1. 通用
tablib – 一个用来处理中表格数据的模块。

2. Office
*   Marmir – 把输入的Python 数据结构转换为电子表单。
    
*   openpyxl – 一个用来读写 Excel 2010 xlsx/xlsm/xltx/xltm 文件的库。
    
*   python-docx – 读取，查询以及修改 Microsoft Word 2007/2008 docx 文件。
    
*   unoconv – 在 LibreOffice/OpenOffice 支持的任意文件格式之间进行转换。
    
*   XlsxWriter – 一个用于创建 Excel .xlsx 文件的 Python 模块。
    
*   xlwings – 一个使得在 Excel 中方便调用 Python 的库(反之亦然)，基于 BSD 协议。
    
*   xlwt / xlrd – 读写 Excel 文件的数据和格式信息。
    
*   relatorio – 模板化OpenDocument 文件。
    

3. PDF

*   PDFMiner – 一个用于从PDF文档中抽取信息的工具。
    
*   PyPDF2 – 一个可以分割，合并和转换 PDF 页面的库。
    
*   ReportLab – 快速创建富文本 PDF 文档。
    

4. Markdown

*   Mistune – 快速并且功能齐全的纯 Python 实现的 Markdown 解析器。
    
*   Python-Markdown – John Gruber’s Markdown 的 Python 版实现。
    

5. YAML

*   PyYAML – Python 版本的 YAML 解析器。
    

6. CSV

*   csvkit – 用于转换和操作 CSV 的工具。
    

7. Archive

*   unp – 一个用来方便解包归档文件的命令行工具。
    

## 自然语言处理

用来处理人类语言的库。

*   NLTK – 一个先进的平台，用以构建处理人类语言数据的 Python 程序。
    
*   jieba – 中文分词工具。
    
*   langid.py – 独立的语言识别系统。
    
*   Pattern – Python 网络信息挖掘模块。
    
*   SnowNLP – 一个用来处理中文文本的库。
    
*   TextBlob – 为进行普通自然语言处理任务提供一致的 API。
    
*   TextGrocery – 一简单高效的短文本分类工具，基于 LibLinear 和 Jieba。
    

## 文档

用以生成项目文档的库。

*   Sphinx – Python 文档生成器。
    
*   awesome-sphinxdoc
    
*   MkDocs – 对 Markdown 友好的文档生成器。
    
*   pdoc – 一个可以替换Epydoc 的库，可以自动生成 Python 库的 API 文档。
    
*   Pycco – 文学编程(literate-programming)风格的文档生成器。
    

## 配置

用来保存和解析配置的库。

*   config – logging 模块作者写的分级配置模块。
    
*   ConfigObj – INI 文件解析器，带验证功能。
    
*   ConfigParser – (Python 标准库) INI 文件解析器。
    
*   profig – 通过多种格式进行配置，具有数值转换功能。
    
*   python-decouple – 将设置和代码完全隔离。
    

## 命令行工具

用于创建命令行程序的库。

1. 命令行程序开发

*   cement – Python 的命令行程序框架。
    
*   click – 一个通过组合的方式来创建精美命令行界面的包。
    
*   cliff – 一个用于创建命令行程序的框架，可以创建具有多层命令的命令行程序。
    
*   clint – Python 命令行程序工具。
    
*   colorama – 跨平台彩色终端文本。
    
*   docopt – Python 风格的命令行参数解析器。
    
*   Gooey – 一条命令，将命令行程序变成一个 GUI 程序。
    
*   python-prompt-toolkit – 一个用于构建强大的交互式命令行程序的库。
    

2. 生产力工具

*   aws-cli – Amazon Web Services 的通用命令行界面。
    
*   bashplotlib – 在终端中进行基本绘图。
    
*   caniusepython3 – 判断是哪个项目妨碍你你移植到 Python 3。
    
*   cookiecutter – 从 cookiecutters(项目模板)创建项目的一个命令行工具。
    
*   doitlive – 一个用来在终端中进行现场演示的工具。
    
*   howdoi – 通过命令行获取即时的编程问题解答。
    
*   httpie – 一个命令行HTTP 客户端，cURL 的替代品，易用性更好。
    
*   PathPicker – 从bash输出中选出文件。
    
*   percol – 向UNIX shell 传统管道概念中加入交互式选择功能。
    
*   SAWS – 一个加强版的 AWS 命令行。
    
*   thefuck – 修正你之前的命令行指令。
    
*   mycli – 一个 MySQL 命令行客户端，具有自动补全和语法高亮功能。
    
*   pgcli – Postgres 命令行工具，具有自动补全和语法高亮功能。
    

## 下载器

用来进行下载的库.

*   s3cmd – 一个用来管理Amazon S3 和 CloudFront 的命令行工具。
    
*   s4cmd – 超级 S3 命令行工具，性能更加强劲。
    
*   you-get – 一个 YouTube/Youku/Niconico 视频下载器，使用 Python3 编写。
    
*   youtube-dl – 一个小巧的命令行程序，用来下载 YouTube 视频。
    

## 图像处理

用来操作图像的库.

*   pillow – Pillow 是一个更加易用版的 PIL。
    
*   hmap – 图像直方图映射。
    
*   imgSeek – 一个使用视觉相似性搜索一组图片集合的项目。
    
*   nude.py – 裸体检测。
    
*   pyBarcode – 不借助 PIL 库在 Python 程序中生成条形码。
    
*   pygram – 类似 Instagram 的图像滤镜。
    
*   python-qrcode – 一个纯 Python 实现的二维码生成器。
    
*   Quads – 基于四叉树的计算机艺术。
    
*   scikit-image – 一个用于(科学)图像处理的 Python 库。
    
*   thumbor – 一个小型图像服务，具有剪裁，尺寸重设和翻转功能。
    
*   wand – MagickWand的Python 绑定。MagickWand 是 ImageMagick的 C API 。
    

## OCR

光学字符识别库。

*   pyocr – Tesseract 和 Cuneiform 的一个封装(wrapper)。
    
*   pytesseract – Google Tesseract OCR 的另一个封装(wrapper)。
    
*   python-tesseract – Google Tesseract OCR 的一个包装类。
    

## 音频

用来操作音频的库

*   audiolazy -Python 的数字信号处理包。
    
*   audioread – 交叉库 (GStreamer + Core Audio + MAD + FFmpeg) 音频解码。
    
*   beets – 一个音乐库管理工具及 MusicBrainz 标签添加工具
    
*   dejavu – 音频指纹提取和识别
    
*   django-elastic-transcoder – Django + Amazon Elastic Transcoder。
    
*   eyeD3 – 一个用来操作音频文件的工具，具体来讲就是包含 ID3 元信息的 MP3 文件。
    
*   id3reader – 一个用来读取 MP3 元数据的 Python 模块。
    
*   m3u8 – 一个用来解析 m3u8 文件的模块。
    
*   mutagen – 一个用来处理音频元数据的 Python 模块。
    
*   pydub – 通过简单、简洁的高层接口来操作音频文件。
    
*   pyechonest – Echo Nest API 的 Python 客户端
    
*   talkbox – 一个用来处理演讲/信号的 Python 库
    
*   TimeSide – 开源 web 音频处理框架。
    
*   tinytag – 一个用来读取MP3, OGG, FLAC 以及 Wave 文件音乐元数据的库。
    
*   mingus – 一个高级音乐理论和曲谱包，支持 MIDI 文件和回放功能。
    

## 视频

用来操作视频和GIF的库。

*   moviepy – 一个用来进行基于脚本的视频编辑模块，适用于多种格式，包括动图 GIFs。
    
*   scikit-video – SciPy 视频处理常用程序。
    

## 地理位置

地理编码地址以及用来处理经纬度的库。

*   GeoDjango – 世界级地理图形 web 框架。
    
*   GeoIP – MaxMind GeoIP Legacy 数据库的 Python API。
    
*   geojson – GeoJSON 的 Python 绑定及工具。
    
*   geopy – Python 地址编码工具箱。
    
*   pygeoip – 纯 Python GeoIP API。
    
*   django-countries – 一个 Django 应用程序，提供用于表格的国家选择功能，国旗图标静态文件以及模型中的国家字段。


[原文链接](https://mp.weixin.qq.com/s/Jnf1jaHQo8s2R_ioNrLk6A)


