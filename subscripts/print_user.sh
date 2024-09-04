#!/bin/bash
echo "[+] Printing user data..."

print_user() {
    for team in "A1" "A2" "B1" "B2" "B3"; do
        echo "$team:"
        grep ", $team" ./data/team_shift.txt | while IFS=, read -r name shift time _; do
            echo "  $name, $shift, $time"
        done
    done
}

print_user