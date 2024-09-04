#!/bin/bash
#Main Script

source ./subscripts/header.sh


while true; do
    source ./subscripts/get_user.sh
    source ./subscripts/validate_capacity.sh
    source ./subscripts/save_user.sh
done