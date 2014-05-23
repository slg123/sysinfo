<PROLOGUE>
<![CDATA[

]]>
</PROLOGUE>


<KSID>
  <Type>Regular</Type>
  <Name>UNIX_JavaGarbageCollectorMonitor</Name>
  <Desc>Monitors Java Garbage Collector Statistics.</Desc>
  <Version>
    <AppManID>6.5</AppManID>
    <KSVerID>1.0</KSVerID>
  </Version>
  <NeedPWD>0</NeedPWD>
  <AdminOnly>0</AdminOnly>
  <UnixOnly>1</UnixOnly>
  <DataSrcID>0</DataSrcID>
  <Platform>-1</Platform>
  <OptionExplicit>0</OptionExplicit>
</KSID>

<ObjType fullpath="0" dropfolderlist="0" styleversion="3">
  <Type name="UNIX_CPUFolder"></Type>
  <Type name="UNIX_CPUObj"></Type>
</ObjType>

<Schedule>
  <Default type="interval" runmode="sched">
    <Interval>
      <Hour>0</Hour>
      <Minute>5</Minute>
      <Second>0</Second>
    </Interval>
  </Default>
  <Allowed>
    <RunOnce>1</RunOnce>
    <IntervalIter>1</IntervalIter>
    <Daily>1</Daily>
    <Weekly>1</Weekly>
    <Monthly>1</Monthly>
  </Allowed>
</Schedule>

<DataSrc></DataSrc>

<Parameter>
  <Desc>Supported on:  [ALL LINUX AND UNIX PLATFORMS]
Java Garbage Collection statistics ( jstat -gc PID ).</Desc>
  <Param name="$EventSettings">
    <Desc>Event Settings</Desc>
    <ReqInput>0</ReqInput>
    <Folder>2</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$GeneralSettings">
    <Desc>General Settings</Desc>
    <ReqInput>0</ReqInput>
    <Folder>2</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Severity">
    <Desc>Event severity level</Desc>
    <Type>Integer</Type>
    <Min>1</Min>
    <Max>40</Max>
    <Value>5</Value>
    <Unit>Severity</Unit>
    <ReqInput>1</ReqInput>
    <Parent>$GeneralSettings</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Akpid">
    <Desc>Action taken</Desc>
    <Value>AKP_NULL</Value>
    <ReqInput>0</ReqInput>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Data_Options">
    <Desc>Data Collection Options </Desc>
    <ReqInput>0</ReqInput>
    <Folder>1</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_szero">
    <Desc>Collect data for current survivor space 0 capacity?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_sone">
    <Desc>Collect data for current survivor space 1 capacity?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_sou">
    <Desc>Collect data for survivor space 0 utilization?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_ec">
    <Desc>Collect data for current eden space capacity?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_eu">
    <Desc>Collect data for eden space utilization?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_oc">
    <Desc>Collect data for current old space capacity?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_ou">
    <Desc>Collect data for old space utilization?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_pc">
    <Desc>Collect data for permanent space capacity?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_pu">
    <Desc>Collect data for permanent space utilization?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_ygc">
    <Desc>Collect data for number of young generation GC events?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_ygct">
    <Desc>Collect data for young generation GC time?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_fgc">
    <Desc>Collect data for number of full GC events?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_fgct">
    <Desc>Collect data for full garbage collection time?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Do_data_gct">
    <Desc>Collect data for total garbage collection time?</Desc>
    <Value>n</Value>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <ReqInput>1</ReqInput>
    <Parent>$Data_Options</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$Folder_Thresholds">
    <Desc>Thresholds and Eventing</Desc>
    <ReqInput>0</ReqInput>
    <Folder>2</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_szero">
    <Desc>Threshold -- Maximum S0C survivor space capacity (KB). -1 disables.</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_sone">
    <Desc>Threshold -- Maximum survivor space 1 capacity (KB). -1 disables.</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_sou">
    <Desc>Threshold -- Maximum survivor space 0 utilization (KB). -1 disables.</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_ec">
    <Desc>Threshold -- Maximum current eden space utilization. -1 disables.</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_eu">
    <Desc>Threshold -- Maximum total eden space utilization. -1 disables.</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_oc">
    <Desc>Threshold -- Maximum current old space capacity. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_ou">
    <Desc>Threshold -- Maximum old space utilization. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_pc">
    <Desc>Threshold -- Maximum current permanent space capacity. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_pu">
    <Desc>Threshold -- Maximum permanent space utilization. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_ygc">
    <Desc>Threshold -- Maximum number of young garbage collection events. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_ygct">
    <Desc>Threshold -- Young garbage collection time maximum. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_fgc">
    <Desc>Threshold -- number of full GC events. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_fgct">
    <Desc>Threshold -- full garbage collection time. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$TH_gct">
    <Desc>Threshold -- total garbage collection time. -1 disables</Desc>
    <Type>Integer</Type>
    <Min>-1</Min>
    <Max>20000</Max>
    <Value>10000</Value>
    <Unit></Unit>
    <ReqInput>0</ReqInput>
    <Parent>$Folder_Thresholds</Parent>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
  <Param name="$debug">
    <Desc>Enable debugging?</Desc>
    <Value>n</Value>
    <ReqInput>1</ReqInput>
    <I_Type>I_CHECKBOX(Yes,y,n)</I_Type>
    <Folder>0</Folder>
    <NoQuote>0</NoQuote>
  </Param>
</Parameter>

<ActionDef></ActionDef>

<AdvanceConfig>
  <EventOp>
    <SupprTime uselast="1">1200</SupprTime>
    <OccurCnt nCount="1" nInterval="1">0</OccurCnt>
  </EventOp>
  <DataOp>
    <CollectIter>1</CollectIter>
    <CollectUponEvt pauseonevtstop="0">0</CollectUponEvt>
    <CollectDetail>1</CollectDetail>
    <NoArchiveDetail>0</NoArchiveDetail>
    <ReportArchive>0</ReportArchive>
  </DataOp>
</AdvanceConfig>

<ScriptDef>
<Script language="perl">
<![CDATA[###
### Please do not remove the following comments.
### Version string added by setQMLVersion.exe during build process.
### Copyright (c) 2014 NetIQ Corporation. All rights reserved.
### VERSION: 7.4.61.0
### Copyright (c) 2006-2014 NetIQ Corp. All rights reserved.
###
### Filename:  UNIX_JavaGarbageCollectorMonitor
### Branch:    main
### $Id$
### $Revision$
###
###
###
###
### -------------------------------------------------------------------------

use strict;
use NetIQ::Nqext;
our $Sev_fail = 10;
our $iterCount = 0;
my $JobID = NetIQ::Nqext::GetJobID();
my $RunTime = localtime();
my $KsVersion = '$Revision: #11 $ $DateTime: 2014/5/22 17:48:53 $';

our $useNQACUtil = 1;
eval 'require "NetIQ/NQACUtil.pm"';
if($@) 
{
    $useNQACUtil = 0;
    &printd ("useNQACUtil = 0\n");
}

sub printd {
    if ($debug eq 'y') {
        open(DEBUG, ">>$ENV{NQMAGT_HOME}/log/UNIX_JavaGarbageCollectorMonitor${JobID}");
        print "@_";
        print DEBUG "@_";
        close(DEBUG);  
    }
}

our ($sysname, $nodename, $release, $version, $machine);

NetIQ::Nqext::Uname($sysname, $nodename, $release, $version, $machine);
printd("JavaGarbageCollectorMonitor ($KsVersion): Run at $RunTime, JobID=$JobID\n");
printd("JavaGarbageCollectorMonitor: Uname returned sysname=$sysname, nodename=$nodename, version=$version, release=$release, machine=$machine\n");

printd("UNIX_CPUFolder=$UNIX_CPUFolder UNIX_CPUObj=$UNIX_CPUObj TH_szero=$TH_szero 
        TH_sone=$TH_sone TH_sou=$TH_sou TH_ec=$TH_ec TH_eu=$TH_eu TH_oc=$TH_oc TH_ou=$TH_ou 
        TH_pc=$TH_pc TH_pu=$TH_pu TH_ygc=$TH_ygc TH_ygct=$TH_ygct TH_fgc=$TH_fgc TH_fgct=$TH_fgct TH_gct=$TH_gct\n");

my $cmdline;
our $resmsg = "UNIX_CPUFolder = $UNIX_CPUFolder";

my $detail_msg;
our $agentOwner = NetIQ::Nqext::GetAgentOwner();

my $agentVersion = (split(/\./, NetIQ::Nqext::GetVersion()))[0];

sub get_jstats {
    # initialize total counters for Java GC stats
    my $data_szero = 0;
    my $data_sone  = 0; 
    my $data_sou   = 0;
    my $data_ec    = 0;
    my $data_eu    = 0;
    my $data_oc    = 0;
    my $data_ou    = 0;
    my $data_pc    = 0;
    my $data_pu    = 0;
    my $data_ygc   = 0;
    my $data_ygct  = 0;
    my $data_fgc   = 0;
    my $data_fgct  = 0;
    my $data_gct   = 0;

    my $java_pids = `ps -C java | awk '/[0-9]/ { print \$1 }'`;
    my @pids = split '\n', $java_pids;
    for ( @pids ) {
        my $cmd = "/usr/bin/jstat -gc $_"; 
        open my $fh, "-|", $cmd; 
        while ( <$fh> ) {
            my ( $szero, $sone, $sou, $ec, $eu, $oc, $ou, $pc, $pu, $ygc, $ygct, $fgc, $fgct, $gct ) = split /\s+/;
            if ( /\d+.\d/ ) {
                $data_szero += $szero;
                $data_sone  += $sone;
                $data_sou   += $sou;
                $data_ec    += $ec;
                $data_eu    += $eu;
                $data_oc    += $oc;
                $data_ou    += $ou;
                $data_pc    += $pc;
                $data_pu    += $pu;
                $data_ygc   += $ygc;
                $data_ygct  += $ygct;
                $data_fgc   += $fgc;
                $data_fgct  += $fgct;
                $data_gct   += $gct;
            }
        }
        close $fh;
    }

    printd( "DEBUG: $data_szero $data_sone $data_sou $data_ec $data_eu $data_oc $data_ou $data_pc $data_pu $data_ygc $data_ygct $data_fgc $data_fgct $data_gct" ); 

    if ( $TH_szero ) {
        if ( $data_szero > $TH_szero ) {
            my $detail_msg = "Threshhold for survivor space 0 capacity exceeded. Threshold is $TH_szero";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_sone ) {
        if ( $data_sone > $TH_sone ) {
            my $detail_msg = "Threshhold for survivor space 1 capacity exceeded. Threshold is $TH_sone";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_sou ) {
        if ( $data_sou > $TH_sou ) {
            my $detail_msg = "Threshhold for survivor space 0 utilization exceeded. Threshold is $TH_sou";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_ec ) {
        if ( $data_ec > $TH_ec ) {
            my $detail_msg = "Threshhold for eden space capacity exceeded. Threshold is $TH_ec";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_eu ) {
        if ( $data_eu > $TH_eu ) {
            my $detail_msg = "Threshhold for eden space utilization exceeded. Threshold is $TH_eu";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_oc ) {
        if ( $data_oc > $TH_oc ) {
            my $detail_msg = "Threshhold for old space capacity exceeded. Threshold is $TH_oc";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_ou ) {
        if ( $data_ou > $TH_ou ) {
            my $detail_msg = "Threshhold for old space utilization exceeded. Threshold is $TH_ou";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_pc ) {
        if ( $data_pc > $TH_pc ) {
            my $detail_msg = "Threshhold old current permanent space capacity exceeded. Threshold is $TH_pc";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_pu ) {
        if ( $data_pu > $TH_pu ) {
            my $detail_msg = "Threshhold for permanent space utilization exceeded. Threshold is $TH_pu";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_ygc ) {
        if ( $data_ygc > $TH_ygc ) {
            my $detail_msg = "Threshhold for number of young GC events exceeded. Threshold is $TH_ygc";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_ygct ) {
        if ( $data_ygct > $TH_ygct ) {
            my $detail_msg = "Threshhold for young GC collection time exceeded. Threshold is $TH_ygct";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_fgc ) {
        if ( $data_fgc > $TH_fgc ) {
            my $detail_msg = "Threshhold for number of full GC events. Threshold is $TH_fgc";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_fgct ) {
        if ( $data_fgct > $TH_fgct ) {
            my $detail_msg = "Threshhold for full garbage collection time. Threshold is $TH_fgct";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }
    if ( $TH_gct ) {
        if ( $data_gct > $TH_gct ) {
            my $detail_msg = "Threshhold for total garbage collection time. Threshold is $TH_gct";
            NetIQ::Nqext::CreateEvent( $Severity, "", $Akpid, "", 0, $detail_msg, 0, 0, 0 ); 
        }
    }

    #
    # Create data points for chart console. 
    # 
    if ( $Do_data_szero eq "y" ) {
        our $msg = "szero\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " szero ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/szero", "szero", $dynamicLegend, $resmsg, $data_szero, "", 0 ); 
        }
    }
    if ( $Do_data_sone eq "y" ) {
        our $msg = "sone\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " sone ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/sone", "sone", $dynamicLegend, $resmsg, $data_sone, "", 0 ); 
        }

    }
    if ( $Do_data_sou eq "y" ) {
        our $msg = "sou\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " sou ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/sou", "sou", $dynamicLegend, $resmsg, $data_sou, "", 0 ); 
        }

    }
    if ( $Do_data_ec eq "y" ) {
        our $msg = "ec\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " ec ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/ec", "ec", $dynamicLegend, $resmsg, $data_ec, "", 0 ); 
        }

    }
    if ( $Do_data_eu eq "y" ) {
        our $msg = "eu\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " eu ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/eu", "eu", $dynamicLegend, $resmsg, $data_eu, "", 0 ); 
        }

    }
    if ( $Do_data_oc eq "y" ) {    
        our $msg = "oc\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " oc ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/oc", "oc", $dynamicLegend, $resmsg, $data_oc, "", 0 ); 
        }

    }
    if ( $Do_data_ou eq "y" ) { 
        our $msg = "ou\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " ou ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/ou", "ou", $dynamicLegend, $resmsg, $data_ou, "", 0 ); 
        }

    }
    if ( $Do_data_pc eq "y" ) { 
        our $msg = "pc\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " pc ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/pc", "pc", $dynamicLegend, $resmsg, $data_pc, "", 0 ); 
        }

    }
    if ( $Do_data_pu eq "y" ) { 
        our $msg = "pu\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " pu ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/pu", "pu", $dynamicLegend, $resmsg, $data_pu, "", 0 ); 
        }

    }
    if ( $Do_data_ygc eq "y" ) { 
        our $msg = "ygc\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " ygc ", "", "UNIX_JavaGarbageCollectormonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/ygc", "ygc", $dynamicLegend, $resmsg, $data_ygc, "", 0 ); 
        }

    }
    if ( $Do_data_ygct eq "y" ) { 
        our $msg = "ygct\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " ygct ", "", "UNIX_JavaGarbageCollectorMonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/ygct", "ygct", $dynamicLegend, $resmsg, $data_ygct, "", 0 ); 
        }

    }
    if ( $Do_data_fgc eq "y" ) { 
        our $msg = "fgc\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " fgc ", "", "UNIX_JavaGarbageCollectorMonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/fgc", "fgc", $dynamicLegend, $resmsg, $data_fgc, "", 0 ); 
        }
    }
    if ( $Do_data_fgct eq "y" ) {
        our $msg = "fgct\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " fgct ", "", "UNIX_JavaGarbageCollectorMonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/fgct", "fgct", $dynamicLegend, $resmsg, $data_fgct, "", 0 ); 
        }
    }
    if ( $Do_data_gct eq "y" ) { 
        our $msg = "gct\n";
        my $dynamicLegend = "";
        if ( $useNQACUtil == 1 ) {
            my $ref_dynamicLegend = NetIQ::NQACUtil::NQDynamicLegend->new();
            $ref_dynamicLegend->Initialize( " gct ", "", "UNIX_JavaGarbageCollectorMonitor", "UNIX", $resmsg, "", "", "" );
            $dynamicLegend = $ref_dynamicLegend->AsXML();
            NetIQ::Nqext::CreateData("Java/gct", "gct", $dynamicLegend, $resmsg, $data_gct, "", 0 ); 
        }
    }
}

get_jstats(); 

]]>
</Script>
</ScriptDef>

