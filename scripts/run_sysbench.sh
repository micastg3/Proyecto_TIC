#!/bin/bash
# Ejecuta pruebas OLTP read/write de sysbench contra MySQL
set -e
MODE=$1            # docker | vm
DURATION=${2:-60}  # segundos por fase

if [[ "$MODE" != "docker" && "$MODE" != "vm" ]]; then
  echo "Uso: $0 [docker|vm] [duration]"; exit 1; fi

if [[ "$MODE" == "docker" ]]; then
  HOST=127.0.0.1
else
  HOST=127.0.0.1
fi

echo "🔄 Preparando tablas…"
sysbench \
  /usr/share/sysbench/oltp_read_write.lua \
  --mysql-host=$HOST \
  --mysql-user=bench --mysql-password=benchpass \
  --mysql-db=bench_db \
  --tables=4 --table-size=200000 \
  prepare

echo "🚴 Ejecutando benchmark ($DURATION s)…"
sysbench \
  /usr/share/sysbench/oltp_read_write.lua \
  --time=$DURATION \
  --threads=8 \
  --report-interval=10 \
  --mysql-host=$HOST \
  --mysql-user=bench --mysql-password=benchpass \
  --mysql-db=bench_db \
  --tables=4 --table-size=200000 \
  run | tee "../results/${MODE}_$(date +%Y%m%d_%H%M%S).log"

echo "🧹 Limpiando…"
sysbench \
  /usr/share/sysbench/oltp_read_write.lua \
  --mysql-host=$HOST \
  --mysql-user=bench --mysql-password=benchpass \
  --mysql-db=bench_db \
  --tables=4 --table-size=200000 \
  cleanup
