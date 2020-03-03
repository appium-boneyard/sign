#!/bin/bash

set -x

tmpfile=$(mktemp /tmp/out.XXXXXX)
apksigner verify --print-certs "./tests/assets/tiny.apk" > "$tmpfile"
if ! grep -q '4e84d0bf009af0d829f795812c933a4cbb94fe9bd7076b72c032232ae9b49a93' "$tmpfile"; then
  exit 1
fi
java -jar ./target/sign*.jar "./tests/assets/tiny.apk"
apksigner verify --print-certs "./tests/assets/tiny.s.apk" > "$tmpfile"
if ! grep -q 'a40da80a59d170caa950cf15c18c454d47a39b26989d8b640ecd745ba71bf5dc' "$tmpfile"; then
  exit 1
fi
