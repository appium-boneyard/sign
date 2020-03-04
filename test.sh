#!/bin/bash

set -x

tmpfile=$(mktemp /tmp/out.XXXXXX)
jarsigner -verify -verbose "./tests/assets/tiny.apk" > "$tmpfile"
if grep -q 'jar verified' "$tmpfile"; then
  exit 1
fi
java -jar ./target/sign*.jar "./tests/assets/tiny.apk"
jarsigner -verify -verbose "./tests/assets/tiny.s.apk" > "$tmpfile"
if ! grep -q 'jar verified' "$tmpfile"; then
  exit 1
fi
