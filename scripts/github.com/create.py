#!/usr/bin/env python
import json
import os
import requests

if os.getcwd().split('/')[-2]!='git': # ~/git
    raise ValueError(os.getcwd())

NAME = os.getcwd().split('/')[-1]
URL = 'https://api.github.com/user/repos'
headers = {
    "Authorization": "Bearer %s" % os.getenv("GITHUB_TOKEN"),
}
payload = {'name':NAME}
r = requests.post(URL,headers=headers,data=json.dumps(payload))
if r.status_code not in [201,422]:
    r.raise_for_status()
