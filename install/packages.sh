#!/bin/bash

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $(cat /install/*packages | tr "\n" " ")
rm -rf /var/lib/apt/lists/*