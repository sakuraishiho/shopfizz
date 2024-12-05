#!/bin/bash
# エラー発生時にスクリプトを中断
set -e

# サーバー PID ファイルを削除
rm -f /app/tmp/pids/server.pid

# 指定されたコマンドを実行
exec "$@"