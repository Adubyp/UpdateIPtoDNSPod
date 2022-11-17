#!/bin/bash

myLogin_token=12345,xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
myDomain_id=12341234
myRecord_id=1234567890
cd /root/CloudflareST/
#pwd
./CloudflareST
sleep 5s
newDXIP1=$(awk 'NR==2'{print} result.csv | awk -F ',' '{print $1}' )
newDXIP2=$(awk 'NR==3'{print} result.csv | awk -F ',' '{print $1}' )
echo "更新电信1记录为$newDXIP1"
#更新电信1记录
curl -X POST https://dnsapi.cn/Record.Modify -d "login_token=${myLogin_token}&format=json&domain_id=${myDomain_id}&record_id=${myRecord_id}&sub_domain=ss&value=$newDXIP1&record_type=A&record_line_id=10%3D0"
echo "更新电信2记录为$newDXIP2"
#更新电信2记录
curl -X POST https://dnsapi.cn/Record.Modify -d "login_token=123456,401e978e0554ead7f6e85b7e8c4bde65&format=json&domain_id=44687382&record_id=4064196111&sub_domain=ss&value=$newDXIP2&record_type=A&record_line_id=10%3D0"
