#!/usr/bin/env python

file = open( 'web.log', 'r' )

ips = set()

def get_uniques():
    for line in file:
        column = line.split(' ')
        ip = column[0]
        ips.add( ip )

get_uniques()

def get_ip_count( address ):
    count = 0
    f = open( 'web.log', 'r' )
    for line in f:
        if address in line:
            count += 1
    return count

ip_last_dates = set()

def get_last_dates( date_count ):
    count = 0
    f = open( 'web.log', 'r' )
    for line in f:
        if address in line:
            count += 1
            if count == date_count:
                column = line.split(' ')
                date = column[2] + " " + column[3] + " " + column[4]
                return date

ip_counts = set()

for address in ips:
    ip_counts.add( get_ip_count( address ) )
    count = get_ip_count( address )
    ip_last_dates.add( get_last_dates( count ))

print "IP Addr | Num visits | Date of last visit"
for date in ip_last_dates:
    f = open( 'web.log', 'r' )
    for line in f:
        column = line.split(' ')
        ip = column[0]
        ip_count = get_ip_count( ip )
        str_ip_count = str( ip_count )
        if date in line:
            log = ip + " --  " + str_ip_count + " --  " + column[2] + " " + column[3] + " " + column[4]
            print log.rstrip()






