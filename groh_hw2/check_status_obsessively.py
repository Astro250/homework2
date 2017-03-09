#!/usr/bin/env python

import time
import os

try:
    while True:
        os.system("squeue -u jgroh")
        time.sleep(2)

except KeyboardInterrupt:
    pass
