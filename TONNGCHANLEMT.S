	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD START_CODE
ARNUM
	DCD 1,2,5
	DCD 0,4,5
	DCD 8,4,1

	AREA HUNGPT777, CODE, READONLY
		ENTRY
		
START_CODE
MAX EQU 9
	MOV R0,#0
	MOV R1,#0
	LDR R2,=ARNUM
	LDR R3,=MAX
	MOV R4,#1
	
CHECK
	LDR R5,[R2]
	CMP R5,#1
	BEQ LE
	BGT GAN
	B TIEPTUC
GAN
	MOV R6,R5
SODUONG
	SUB R6,#2
	CMP R6,#2
	BGE SODUONG
	CMP R6,#0
	BEQ CHAN
	B LE

LE
	ADD R1,R5
	B TIEPTUC
	
CHAN
	ADD R0,R5
	B TIEPTUC
	
TIEPTUC
	ADD R2,#4
	ADD R4,#1
	CMP R4,R3
	BLE CHECK
STOP	
	END