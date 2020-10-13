# osm_displayer
Display .osm file on the WEB browse, using Echarts and Bmap.
！！！Pay attention. The coordinate in .osm file must be in format of WGS84.
！！！osm文档中的坐标系为WGS84坐标系
！！！程序已包含将WGS84转换为BD09的过程，所以可放心显示在百度地图上。

# Dependency 依赖
- Python 3
- node的npm

# Usage 使用说明

### Get a Bmap AK 获得百度地图开放平台的密钥

申请密钥网址：https://lbsyun.baidu.com/apiconsole/key#/home

百度地图开放平台————控制台————左栏的应用管理（我的应用）————创建应用————应用类型选择（浏览器端）

### Configure the AK 写入AK

打开osm_displayer/frontEnd/index.html
将script标签中“你的密钥”替换为刚才获得的AK


### npm install 安装
（假设此时已经下载了nodejs了，安装教程自行百度）
打开osm_displayer/frontEnd/，在此目录下使用cmd输入npm install并运行

### Put in your source file 放入源文件
将你想显示的.osm文件放在osm_displayer/目录下

### run the program 开始程序
点击start.bat（一定要确保Python的环境变量已经配置好了）


