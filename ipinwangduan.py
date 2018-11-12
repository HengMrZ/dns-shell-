#判断ip地址在不在网段内。
#coding:utf-8
import sys
from IPy import IP

try:
    f = open('./iplist', 'r')
    for line in f.readlines():
      ipadd=line.strip()
      try:
         g = open('./wangduan', 'r')
         for ip in g.readlines():
           ip1=ip.strip()
           if  ipadd in IP(ip1):
             print ipadd
             break
           else:
             continue
      finally:
          if g:
            g.close()
finally:
    if f:
        f.close()
