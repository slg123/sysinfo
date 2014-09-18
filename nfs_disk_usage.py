#!/usr/bin/python

import os

def disk_usage( path ):
    st = os.statvfs(path)
    free = (st.f_bavail * st.f_frsize)
    total = (st.f_blocks * st.f_frsize)
    used = (st.f_blocks - st.f_bfree) * st.f_frsize
    percent = ret = (float(used) / total) * 100

    try:
        percent = ret = (float(used) / total) * 100
    except ZeroDivisionError:
        percent = 0

    return total, used, free, round(percent, 1)

filesystems = []
filesystems.append( "/Unix2" )
filesystems.append( "/Unix3" )

for fs in filesystems: 
    ( total, used, free, percent ) = disk_usage( fs )
    print fs +" "+ str(percent)

