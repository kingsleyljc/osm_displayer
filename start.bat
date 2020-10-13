@echo off
start cmd /k "python server.py"
start cmd /k "cd frontEnd && npm run dev"
exit