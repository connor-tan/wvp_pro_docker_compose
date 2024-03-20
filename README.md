# wvp_pro_docker_compose
这个仓库独立了wvp_pro中需要用到的组件，分别部署

此项目在ubuntu22.04上验证通过，也仅在2204上验证过
## 用法配置
1、修改.env文件中的IP地址为你主机的IP地址   
2、修改config文件夹中，各个组件的配置文件，其中，zlm的配置文件中的hook地址为必改项，其它的没有要求    
运行docker compose up -d即可

目前同步的是最新的wvp，最新的zlm，编译时间根据机器和网络配置决定




此项目参考了https://github.com/SaltFish001/wvp_pro_compose
感谢
