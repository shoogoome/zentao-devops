# 禅道Linux版Docker镜像及启动

## 简要说明
主要是为了linux、mac系统使用者使用。  
需本机已安装docker

## 使用说明
使用时在当前目录下  
```./zentao.sh up 启动环境```  
```./zentao.sh down 关闭环境```  
```./zentao.sh logs 查看实例日志```  
```./zentao.sh kill 强制关闭环境```  
```./zentao.sh pull 拉取远端镜像```  
```./zentao.sh build 构建本地镜像```

## 自定义参数
对于zentao.sh内‘name’、‘port’、‘volume’为自行可修改参数

## 注意事项
dockerfile文件中需要的禅道安装包需自行在官网下载