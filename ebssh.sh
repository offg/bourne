#!/bin/sh
expect -c "
  set timeout 3
  spawn ssh eb@20.48.54.107
  expect \"eb@20.48.54.107's password:\"
  send \"sfsngttsdd;98q2\n\"
  interact
"
