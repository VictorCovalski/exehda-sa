import requests
import sys

with open(sys.argv[2]) as f:
    logs = f.readlines()
    while True:
        for log in logs:
            requests.post(sys.argv[1],log)