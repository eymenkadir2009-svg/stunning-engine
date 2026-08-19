#!/bin/sh

# 9Router'ı başlat
9router &

# Konteynerin kapanmasını engellemek için süreci açık tut
exec tail -f /dev/null
