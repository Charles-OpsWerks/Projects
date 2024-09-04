#!/bin/bash
echo "[+] Validating capacity..."

validate_capacity() {
    
    shift_count=$(grep "$shift" ./data/team_shift.txt | grep -c "$team")
    
    if [[ $shift_count -ge 2 ]]; then
        echo "[!] Error: Shift $shift is already full for team $team. Exiting"
        exit 1
    fi

}

validate_capacity