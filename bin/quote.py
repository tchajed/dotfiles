#!/usr/bin/env python3

def add_quotes_if_necessary(s):
    if " " in s:
        return '"' + s + '"'
    return s

def quote(path):
    components = path.split("/")
    components = [add_quotes_if_necessary(c) for c in components]
    return "/".join(components)

import sys

for line in map(str.rstrip, sys.stdin):
    print(quote(line))
