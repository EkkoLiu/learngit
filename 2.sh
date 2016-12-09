#!/bin/bash
PASSWD='rocket007'
cd /etc/openldap/slapd.d/cn\=config
/usr/bin/expect <<-EOF
set time 5
spawn ldapadd -x -D cn=Manager,dc=ldap,dc=com -W -H ldap://192.168.29.130 -f /tmp/3.ldif
expect {
"*sword:" { send "$PASSWD\r" }
}
interact
expect eof
EOF
