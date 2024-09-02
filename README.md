# READ ME

### Workflow

- Fork the repository 
- Clone the forked repository
- Pull request
- Review by the team

### Project Requirements Team Knowledge Base
---

Create a script name shift_sched.sh

```
User Input
    Enter name:
    Select shift:
    Select team:
```
WHERE:
---

`shift` 

- Morning (6am - 3pm)
- Mid     (2pm - 11pm)
- Evening (10pm - 7am)

`team`

- A1
- A2
- B1
- B2
- B3

Condition: 
--- 

- max 6 person per team
- max 2 person per shift
- Total Person = 30
- should keep on running until 
    - error  
        - Error Handling
            - Max User Per Team
            - Shift / Team Input
    - `print` inputed in name
        - `print` in name: should print out the succesfully *ENCODED DATA*:

### Sample Output
---
```
Enter Name: print
A1:
  Bob, Morning, 6am - 3pm
  Marley, Morning, 6am - 3pm
A2:
B1:
B2:
B3: 
  Luffy, Mid, 2pm - 11pm