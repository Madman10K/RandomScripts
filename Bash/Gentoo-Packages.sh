#!/bin/bash
pack=$(ls -d /var/db/pkg/*/* | wc -l)
echo "$pack"
