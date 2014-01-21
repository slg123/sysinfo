#!/usr/bin/env python

agent_version='vsau73'

build_systems=[]
def build_systems_listing():
    with open ( '/Unix3/Unix/agent/'+agent_version+'/build_tools/SYSTEMS' ) as inf:
        for line in inf:
            if not line.strip().startswith("#"):
                cols=line.split(';')        # SYSTEMS file is semicolon delimited
                #if cols[0] != "isuse1":     
                build_systems.append( cols[0] ) 

import subprocess 
def get_usr_size():
    with open( 'usr_sizes.txt', 'w' ) as outfile:
        for host in build_systems:
            subprocess.call(['/usr/bin/ssh', host, '/Unix2/Unix/scottg/src/c/fssiz'], stdout=outfile)

if __name__=='__main__':
    build_systems_listing()
    get_usr_size()
