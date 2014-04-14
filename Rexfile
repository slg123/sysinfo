user "root";
password "";
pass_auth;

group all_servers   => "aix7lp2.houqe.lab", "om.houqe.lab", "houdvam302.nqeng.lab", "houdvam303.nqeng.lab", 
                       "houdvam304.nqeng.lab", "houdvam305.nqeng.lab", "hpx721.houqe.lab", "uxt2000.houqe.lab";
group provo_servers => "houdvam302.nqeng.lab", "houdvam303.nqeng.lab";
group aix_servers   => "aix7lp2.houqe.lab";
group hpux_servers  => "hpx721.houqe.lab";
group sun_servers   => "uxt2000.houqe.lab";

desc "Get the uptime of all servers";
task "uptime", group => "all_servers", sub {
    my $output = run "uptime";
    say $output;
};

desc "See who is logged in on all systems";
task "who", group => "all_servers", sub {
    my $output = run "who";
    say $output;
};

desc "Check and see if httpd is running...";
task "httpd_check", group => "all_servers", sub {
    service "httpd" => "status";
};

desc "Restart httpd";
task "httpd_restart", group => "all_servers", sub {
    my $output = run "service httpd restart";
    say $output;
};

desc "Check and see if iptables is running...";
task "iptables_check", group => "all_servers", sub {
    my $output = run "iptables --list";
    say $output;
};

desc "Lay down the correct resolv.conf file on Provo systems.";
task "correct_resolver", group => "provo_servers", sub {
    file "/etc/resolv.conf",
    source => "files/etc/resolv.conf";
};

desc "See if bos.adt fileset is installed on AIX servers.";
task "confirm_bos_adt", group => "aix_servers", sub {
    my $output = run "lslpp -l bos.adt.*";
    say $output;
};

desc "Show all logfiles...";
task "show_all_logfiles", group => "all_servers", sub {
    my $output = run "cat /var/log/messages";
    say $output;
};

desc "Show resolv.conf file on all systems.";
task "show_resolv_conf", group => "all_servers", sub {
    say cat "/etc/resolv.conf";
};
