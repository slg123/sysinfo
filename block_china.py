#!/usr/bin/env python

import wget
import os

filename = 'chinacidr.txt'

def download_file():
    os.remove( filename ) if os.path.exists( filename ) else None
    url = 'http://www.okean.com/chinacidr.txt'
    wget.download( url )

def create_blocking_tables():
    f = open( filename, 'r' )
    for line in f:
        if not line.startswith( "#" ):    # skip commented lines
            cidr_ip = line.split(' ')[0]
            os.system( "iptables -I INPUT -s "+cidr_ip+" -j DROP" )

def main():
    download_file()
    print "\n[+] creating blocking tables... this will take some time."
    create_blocking_tables()

if __name__ == "__main__":
    main()



