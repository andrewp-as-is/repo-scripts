#!/usr/bin/env python
import datetime
import os
import sys
import requests

name = os.path.basename(os.getcwd()).replace('.py','')
version = datetime.datetime.now().strftime('%y-%m-%d')
url="https://pypi.org/pypi/%s/json" % name
r = requests.get(url)
if r.status_code==200:
    version = r.json()['info']['version']

code = """
import setuptools

# PRODUCTION setup.py: name, version, install_requires, packages only
setuptools.setup(
    name='{name}',
    version='{version}',
    install_requires=open('requirements.txt').read().splitlines(),
    packages=setuptools.find_packages()
)
""".format(name=name,version=version).strip()
if not os.path.exists('requirements.txt'):
    code = """
import setuptools

# PRODUCTION setup.py: name, version, packages only
setuptools.setup(
    name='{name}',
    version='{version}',
    packages=setuptools.find_packages()
)
""".format(name=name,version=version).strip()
open('setup.py','w').write(code)
