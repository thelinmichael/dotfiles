#!/usr/bin/env python3

from subprocess import run
from sys import exit
from re import search

def get_connection_status():
    status_res = run(["globalprotect","show","--status"], capture_output=True, check=True)
    regex_result = search(r"GlobalProtect status\: (Connected|disabled|Connecting...)", str(status_res.stdout))
    if regex_result is None:
        raise ValueError("Failed to read status (ERR: No match in Regex status")
    if len(regex_result.groups()) != 1:
        raise ValueError("Failed to read status (ERR: No groups in Regex status")
    return regex_result.group(1).lower()

def get_connection_type():
    status_res = run(["globalprotect","show","--details"], capture_output=True, check=True)
    regex_result = search(r".*Description\: ([a-zA-Z ]+)", str(status_res.stdout))
    if regex_result is None:
        raise ValueError("Failed to read type (ERR: No match in Regex status")
    if len(regex_result.groups()) != 1:
        raise ValueError("Failed to read type (ERR: No groups in Regex status")
    return regex_result.group(1)

try:
    con_status = get_connection_status()
    if con_status != "connected":
        print(f"VPN: {con_status.capitalize()}")
        exit(0)
    connection_type = get_connection_type()
    print("VPN: " + connection_type)
    exit(0)
except:
    exit(1)
