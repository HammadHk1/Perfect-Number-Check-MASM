# Perfect-Number-Check-MASM
## Introduction:
The provided code is written in x86 assembly language and is designed to find whether a given number is a perfect number or not. A perfect number is a positive integer that is equal to the sum of its proper divisors (excluding the number itself). The code takes input from the user, calculates the sum of proper divisors, and then checks if it is equal to the original number to determine if it is perfect or not. It uses DOS interrupts to display messages on the screen.

![image](https://github.com/HammadHk1/Perfect-Number-Check-MASM/assets/117303560/fb8fdb25-118c-4940-b520-a948ff4412c0)

## Flow of Code:
- The code starts with the data section, where variables and messages are defined.
- The 'start' label is defined, and it jumps to the 'MAIN' procedure.
- Inside the 'MAIN' procedure, the data segment is set up, and the message "Enter Number:" is displayed.
- The user input loop begins, taking input character by character and converting it to a numeric value.
- The input loop continues until the user presses the Enter key.
- After input is obtained, the 'FIND_PERFECT' procedure is called.'
- Inside the 'FIND_PERFECT' procedure, the 'factorial' loop is initiated to find the factors of the input number.
- The factors are displayed on the screen using the 'DISPLAY' routine.
- The 'PERFECT' loop calculates the sum of proper divisors and checks if it is equal to the input number.
- Finally, the result (whether the number is perfect or not) is displayed on the screen, and the program terminates.
## Note: 
The provided code is written in an older assembly language syntax and is specific to DOS-based systems. It may not run directly on modern operating systems without modifications.
##  Execution:
You have Download MASM 8086 to execute this code. After Download link your Dosbox with Bin Folder of Masm and put Code.asm file bin and run on Dosbox.
Do following Task to Mount
```
mount c C:\path\to\directory
```
```
C:
```
```
masm Code.asm;
```
```
link filename.obj;
```
```
filename.exe
```  
