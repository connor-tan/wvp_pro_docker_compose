# wvp_pro_docker_compose
这个仓库独立了wvp_pro中需要用到的组件，wvp_redis、wvp_mysql、wvp_zlm分别部署，你可以通过这个项目在单机上快速的启动wvp_pro项目

# 用法配置
1. 修改.env文件中的IP地址为你主机的IP地址，（REDIS_HOST/MYSQL_HOST/STREAM_HOST/SHOW_IP/ZLM_IP/WVP_IP），如果你是部署在同一个机器上，那么直接改成宿主机的ip地址就可以
2. 修改config/zlm文件夹中的config,ini，其中hook地址为必改项，将其修改为正确的IP地址，其它的没有要求    
3. 运行docker compose up -d即可，理论上只改IP的情况下，可以直接一把起来，其他配置虽然可以修改，但是请一定了解zlm的配置文件和wvp_pro的application.yml之后再做更改，以免发生配置不一致导致的其他问题

目前同步的是最新的wvp

此项目参考了https://github.com/SaltFish001/wvp_pro_compose

感谢
