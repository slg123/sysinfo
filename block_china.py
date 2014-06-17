#!/usr/bin/env python

import wget
import os

def download_file():
    filename = 'chinacidr.txt'
    os.remove( filename ) if os.path.exists( filename ) else None

    url = 'http://www.okean.com/chinacidr.txt'
    wget.download( url )

def create_blocking_tables():
    f = open( filename, 'r' )
    for line in f:
        cidr_ip = line.split(' ')[0]
        os.system( "iptables -I INPUT -s cidr_ip -j DROP" )

def main():
    download_file()
    create_blocking_tables()

if __name__ == "__main__":
    main()



