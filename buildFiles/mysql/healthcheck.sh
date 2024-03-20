#!/bin/sh

# 尝试执行查询,这样可以保证wvp启动的时候，数据库已经初始化了
output=$(mysql --database=wvp --user=root --password=${MYSQL_ROOT_PASSWORD} --execute="select * from wvp_user where id=1;" 2>&1)

# 检查查询是否成功
if [[ $? -ne 0 ]]; then
    echo "$output"
    exit 1
fi

exit 0

