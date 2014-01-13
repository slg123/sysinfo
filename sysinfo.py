#!/usr/bin/python

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

def get_gcc_version():
    for host in build_systems:
        print ":::"+host+":::"
        os.system( '/usr/bin/ssh '+host+' gcc --version | grep gcc | awk \'{ print $3 }\'' )

def get_usrlocal_gcc():
    for host in build_systems:
        print ":::"+host+":::"
        os.system( '/usr/bin/ssh '+host+' /usr/local/bin/gcc --version | grep gcc | awk \'{ print $3 }\'' )

def get_gmake_version():
    for host in build_systems:
        print ":::"+host+":::"
        os.system( '/usr/bin/ssh '+host+' gmake --version | grep Make | awk \'{ print $3 }\'' )

def get_usrlocal_gmake():
    for host in build_systems:
        print ":::"+host+":::"
        os.system( '/usr/bin/ssh '+host+' /usr/local/bin/gmake --version | grep Make | awk \'{ print $3 }\'' )


def main():
    build_systems_listing()
    print "_________________________________gcc   versions_________________________________"
    print "________________________________________________________________________________"
    get_gcc_version()
    get_usrlocal_gcc()
    print "_________________________________gmake versions_________________________________"
    print "________________________________________________________________________________"
    get_gmake_version()
    get_usrlocal_gmake()

main()


    

