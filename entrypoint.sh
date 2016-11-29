#!/bin/bash

sleep 1 # to avoid width=0 problem with Docker
rlwrap sqlplus "$@"
