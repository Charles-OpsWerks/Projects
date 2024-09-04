#!/bin/bash
echo "[+] Saving user data..."

save_user() {
    echo "$name, $shift, $time, $team" >> ./data/team_shift.txt
    echo "[+] User data saved successfully."
}

save_user