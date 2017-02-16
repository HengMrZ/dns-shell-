# dns-shell-
检测dns server可用

for i in {1..10000};
do
    dig +short 域名 | grep ip >> result;
    sleep 2
done;
