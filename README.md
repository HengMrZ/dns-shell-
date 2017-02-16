# dns-shell-
检测dns server可用
dns：每两秒dig一次，如果有回显则记录在result。最后wc -l即可看到是否收到回显。
dns错误版本：单点检测。域名只对应一个ip可以用这个。
