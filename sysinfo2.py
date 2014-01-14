#!/usr/bin/env python

# get gcc and gmake versions on build systems

import os

agent_version='vsau73'

build_systems=[]
def build_systems_listing():
    with open ( '/Unix3/Unix/agent/'+agent_version+'/build_tools/SYSTEMS' ) as inf:
        for line in inf:
            if not line.strip().startswith("#"):
                cols=line.split(';')        # SYSTEMS file is semicolon delimited
                if cols[0] != "isuse1":     # exclude isuse1 for now 
                    build_systems.append( cols[0] ) 

build_systems_listing()

def get_sw_version( sw_name ):
    for host in build_systems:
        print ":::"+host+":::"+sw_name+":::"
        #os.system( '/usr/bin/ssh '+host+' '+sw_name+' --version | grep '+sw_name+'| awk \'{ print $3 }\'' )
        os.system( '/usr/bin/ssh '+host+' '+sw_name+' --version' )

software = [ "gcc", "/usr/local/bin/gcc", "gmake", "/usr/local/bin/gmake" ]
for pkg in software:
    get_sw_version( pkg )

