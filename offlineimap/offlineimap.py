import subprocess

def mailpasswd(pass_key):
    return subprocess.check_output(["pass", pass_key]).strip()
