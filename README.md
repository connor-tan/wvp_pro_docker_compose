# wvp_pro_docker_compose
这个仓库独立了wvp_pro中需要用到的组件，分别编译部署

## 用法配置
1、修改.env文件中的IP地址为你主机的IP地址，（REDIS_HOST/MYSQL_HOST/STREAM_HOST/SHOW_IP/ZLM_IP/WVP_IP），如果你是部署在同一个机器上，那么直接改成宿主机的ip地址就可以
2、修改config/zlm文件夹中的config,ini，其中hook地址为必改项，其它的没有要求    
运行docker compose up -d即可

目前同步的是最新的wvp，最新的zlm，编译时间根据机器和网络配置决定

此项目参考了https://github.com/SaltFish001/wvp_pro_compose
感谢
