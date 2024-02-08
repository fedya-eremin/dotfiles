#!/usr/bin/env fish

set avail $(df -h | grep /home | awk '{print $4}')
echo $avail
