#!/bin/sh
expect -c "
  set timeout 3
  spawn ssh EBDC
  expect \"yuhattor@'s password:\"
  send \"\n\"
  interact
"
