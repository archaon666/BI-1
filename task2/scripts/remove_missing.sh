#!/bin/bash
cat $1 | grep -v "?" > $2
