#!/bin/bash
echo -e "Failed password for know user : "
journalctl -u ssh | grep "`date +%b" "%d`" | grep "Failed password"
echo -e "Failed password for invalid user (unknow user(s))"
journalctl -u ssh | grep "`date +%b" "%d`" | grep "Failed password for invalid"
