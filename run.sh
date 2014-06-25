#!/bin/bash

vagrant up
vagrant ssh -c "bash benchmark.sh"
