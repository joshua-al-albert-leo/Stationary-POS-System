.model small
.stack 100
.data
	;strings;
	logo1 db "============================= __    __    __    __ =============================$"
	logo2 db "=============================|  |  |  |  |  |  |  |=============================$"
	logo3 db "=============================|  |__|  |  |  |__|  |=============================$"
	logo4 db "=============================|   __STATIONERY__   |=============================$"
	logo5 db "=============================|__|  |__|  |__|  |__|=============================$"
	strw  db "========================== Welcome to HH Stationery ===========================$"
	strn     db "Enter customer's name(type @ if there's none): $"
	cfm      db "Do you confirm? (y/n): $"
	strpw    db "Enter Staff ID: $"
	notyn    db "Invalid input$"
	notpw    db "Wrong Staff ID$"
	strm     db "1. Menu$"
	strs     db "2. Summary$"
	strq     db "3. Exit$"
	choose   db "Enter your choice(1/2/3): $"
	other    db "Wrong Input$"
	strc     db " Code | Product:            | Price:$"
	strd	 db "------------------------------------$"
	str1     db " 1    | Pencil              | RM1$"
	str2     db " 2    | Eraser              | RM1$"
	str3     db " 3    | Ruler               | RM1$"
	str4     db " 4    | Black Pen           | RM2$"
	str5     db " 5    | Blue Pen            | RM2$"
	str6     db " 6    | Red Pen             | RM2$"
	str7     db " 7    | Pencil Case         | RM4$"
	str8     db " 8    | Correction Tape     | RM4$"
	str9     db " 9    | Note Book           | RM4$"
	buy      db "What do you want to purchase?(1-9): $  "
	itemamt  db "Enter quantity [max: 99 per item] [Enter Same Item Code to Edit Amount]$"
	addon    db "Do you want to add more (y/n)?: $"
	guideamt db "[ 0 = remove from cart]: $"
	elseamt  db "Invalid Code, Please Re-enter$"
	storename db "                                HH Stationery$"
	rec      db "                                   RECEIPT $"
	line     db "--------------------------------------------------------------------------------$"
	header 	 db "Item		Quantity     			Price$"
	nextcus  db "Continue to the Next Customer? (y/n):$"
	sales    db "Total Sales(Exit to Reset): RM$"
	space    db "   			$"
	pencil   db "Pencil(s)         $"
	eraser   db "Eraser(s)         $"
	ruler    db  "Ruler(s)          $"
	bla      db    "Black Pen(s)      $"
	blu      db  "Blue Pen(s)       $"
	red      db  "Red Pen(s)        $"
	case     db  "Pencil Case(s)    $"
	tape     db  "Correction Tape(s)$"
	book     db "Note Book(s)      $"
	RM       db "RM$"
	totalis  db "Total  :RM $"
	customer db "Customer name : $"
	customeramt db "Total Customers(Exit to Reset):$"
	proceedpay db "Proceed to Payment? (y/n): $"
	payment  db "Payment(max 4 digits): $"
	paidis   db "Paid   :RM $"
	balanceis db "Balance:RM $"
	thanks   db "Thank you$"
	noreceipt db "No Item Therefore Unable to Display Receipt$"
	timestr  db "Time: 00:00:00$"
	datestr  db "Date: 00-00-0000$"
	;input strings;
	inname   label byte
	maxn     db 50
	actn     db ?
	outname  db 52 dup('$')

	inpw     label byte
	maxn2    db 8
	actn2    db ?
	outpw    db 8 dup ('$')

	inpaid   label byte
	maxn3    db 5
	actn3    db ?
	outpaid  db 5 dup ('$')
	;password;
	pw       db "7070$"
	;fixed value;
	ten      dw 10
	hun      dw 100
	thou     dw 1000
	tendb    db 10
	;arrays;
	onetotal  dw 20 dup(?)
	paidamt db 20 dup(?)
	totalamt db 20 dup(?)
	balamt db 20 dup(?)
	amt1 db 20 dup(?)
	amt2 db 20 dup(?)
	item db 20 dup(?)
	;3 main;
	paid dw 0
	total dw 0
	balance dw 0
	;unknown;
	choice db ?
	yn db ?
	yn2 db ?
	yn3 db ?
	cxdb dw ?
	;counter;
	grandtotal dw 0
	customercount dw 0
	rcount dw 0
	;newline;
	nl db 13, 10, "$"
.code
main proc  
	mov ax,@data
	mov ds,ax

enterpassword:
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov di,79
	mov cx,80
logo_1:						;DISPLAY LOGO
	mov al,logo1[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_1
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov di,79
	mov cx,80
logo_2:
	mov al,logo2[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_2
	
	mov ah,09h
	lea dx,nl
	int 21h
		
	mov di,79
	mov cx,80
logo_3:
	mov al,logo2[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_3
	
	mov ah,09h
	lea dx,nl
	int 21h
			
	mov di,79
	mov cx,80
logo_4:
	mov al,logo3[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_4
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov di,79
	mov cx,80
logo_5:
	mov al,logo4[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_5

	mov ah,09h
	lea dx,nl
	int 21h
	
	mov di,79
	mov cx,80
logo_6:
	mov al,logo2[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_6
	
	mov ah,09h
	lea dx,nl
	int 21h
		
	mov di,79
	mov cx,80
logo_7:
	mov al,logo2[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_7
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov di,79
	mov cx,80
logo_8:
	mov al,logo5[di]
	mov ah,09h
	mov bx,0
	mov bl,05h
	int 10h
	dec di
loop logo_8
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx, strpw					;ENTER STAFF ID
	int 21h

mov si,0
mov actn2,0
hide_pw:

	
    mov ah,07h
	int 21h
									;HIDE INPUT STAFF ID WITH *
	cmp al,13
	je before_check_Password
	cmp al,8h
	je backspace_pw
	mov outpw[si], al
	
	mov ah, 02h
    mov dl, '*'
    int 21h
	inc actn2
	inc si
	
jmp hide_pw

backspace_pw:
	cmp si,0
	je hide_pw
	
	dec si
    dec actn2
									;ALLOW USER TO BACKSPACE STAFF ID SO
									;WITHOUT THIS, BACKSPACE COUNT AS A STAFF ID INPUT
    mov ah, 02h
    mov dl, 8h
    int 21h

    mov dl, ' '
    int 21h

    mov dl, 8h
    int 21h

	jmp hide_pw
before_check_Password:

cmp actn2, 4
jne wrongpw

xor si, si
mov cx, 4
checkpassword:
	mov bl, pw[si]
	cmp outpw[si], bl
	jne wrongpw						;COMPARE IF STAFF ID VALID OR INVALID
	inc si
loop checkpassword
xor si, si
jmp login

wrongpw:
	mov ah,06h
	mov al,00h
	mov bh,00h
	mov cx,0000h
	mov dx,184fh
	int 10h
	
	mov ah, 09h						;PROMPT FOR INVALID PASSWORD
    lea dx, nl
    int 21h
  
	mov ah,09h
	lea dx, notpw
	int 21h
	
	mov ah, 09h
    lea dx, nl
    int 21h
	jmp enterpassword
next_customer:

	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah, 09h
    lea dx, nl
    int 21h
	
	mov si,0
	
	mov ah,09h
	lea dx, nextcus				;PROMPT FOR " CONTINUE TO NEXT CUSTOMER?"
	int 21h
	
	mov ah,01h
	int 21h
	mov yn3, al

	mov ah, 09h
	lea dx, nl
	int 21h

	cmp yn3, 'Y'
	je reset_cus
	cmp yn3, 'y'
	je reset_cus
	cmp yn3, 'N'
	jne small_N
	jmp menuquit
small_N:
	cmp yn3, 'n'
	jne redo2
	jmp menuquit
redo2:
	mov ah, 09h
	lea dx, notyn
	int 21h
								;IF INPUT IS NOT Y OR N
	mov ah, 09h
	lea dx, nl
	int 21h
	jmp next_customer

reset_cus:
	mov cx, 10
	mov si, 0
clear_loop:
	mov item[si], 0
	mov amt1[si], 0
	mov amt2[si], 0
	mov onetotal[si], 0			;EMPTY PREVIOUS ORDER FOR NEXT CUSTOMER ;IF NEXT CUSTOMER INPUT IS Y
	mov totalamt[si],0
	mov balamt[si],0
	inc si
loop clear_loop
	mov paid,0
	mov balance,0
	mov total, 0
	mov rcount, 0
	mov yn2,0
	mov yn3,0
	
	mov ah,06h
	mov al,00h
	mov bh,00h
	mov cx,0000h
	mov dx,184fh
	int 10h
	
login:						;ENTER CUSTOMER NAME
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah, 09h
	lea dx, strw
	int 21h

	mov ah, 09h
	lea dx, nl
	int 21h

	mov ah, 09h
	lea dx, nl
	int 21h

	mov ah, 09h
	lea dx, strn
	int 21h

	mov ah, 0Ah
	lea dx, inname
	int 21h

	mov ah, 09h
	lea dx, nl
	int 21h
	
	cmp actn,1
	jne confirmmsg
	cmp outname[0], "@"
	je menuquit
	
confirmmsg:  
	mov ah, 09h
	lea dx, cfm
	int 21h

	mov ah,01h					;CONFIRM MESSAGE
	int 21h
	mov yn, al

	mov ah, 09h
	lea dx, nl
	int 21h

	cmp yn, 'N'
	je login
	cmp yn, 'n'
	je login
	cmp yn, 'Y'
	je menuquit
	cmp yn, 'y'
	je menuquit

	mov ah, 09h
	lea dx, notyn
	int 21h

	mov ah, 09h
	lea dx, nl
	int 21h
	jmp confirmmsg

menuquit:
	mov balance,0
	mov total,0
	mov paid,0
	
	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ah, 09h
	lea dx, nl
	int 21h
		
	mov ah,09h
	lea dx, strm
	int 21h
	
	mov ah, 09h					;DISPLAY HOMEPAGE
	lea dx, nl
	int 21h
	 
	mov ah,09h
	lea dx, strs
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ah,09h
	lea dx,strq
	int 21h
	 
	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ah, 09h
	lea dx, choose
	int 21h
	 
	mov ah, 01h
	int 21h
	mov choice, al
	jmp cmp_choice
	
	mov ah,09h
	lea dx,nl
	int 21h
	
storage:
	mov ah,06h
	mov al,00h
	mov bh,00h
	mov cx,0000h
	mov dx,184fh
	int 10h
	
	mov ah,09h
	lea dx,nl
	int 21h							; SUMMARY
	
	mov ah,09h
	lea dx, customeramt
	int 21h
	
	cmp customercount,0
	jne loop_customer
	
	mov ah, 02h
    mov dl,'0'
    int 21h
	jmp goto_menuquit
	

loop_customer:	
	cmp customercount,10
	jb cx__1
	cmp customercount,100
	jae cx__3
	mov cxdb, 2
	jmp loop_push_cus
cx__1:
	mov cxdb, 1
	jmp loop_push_cus
cx__3:
	mov cxdb, 3
loop_push_cus:
   	mov ax, customercount
	MOV CX,cxdb
push_customer:
	MOV DX,0
	DIV TEN
	PUSH DX
	LOOP push_customer
	
display_customer:	
    MOV CX,cxdb
	pop_customer:
	    POP BX
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
	LOOP pop_customer
	
goto_menuquit:
	mov ah,09h
	lea dx,nl
	int 21h
	mov ah,09h
	lea dx,sales
	int 21h
	
	cmp grandtotal,0
	jne loop_sales
	mov ah, 02h
    mov dl,'0'
    int 21h
	jmp menuquit
	
loop_sales:	
	cmp grandtotal,10
	jb cx_1
	cmp grandtotal,100
	jae cx_3
	mov cxdb, 2
	jmp loop_push_sales
cx_1:
	mov cxdb, 1
	jmp loop_push_sales
cx_3:
	mov cxdb, 3
loop_push_sales:
	mov ax, grandtotal
	mov cx,cxdb
push_sales:
	MOV DX,0
	DIV TEN
	PUSH DX
	LOOP push_sales
	
display_sales:	
    MOV CX,cxdb
	pop_sales:
	    POP BX
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
	LOOP pop_sales
	jmp menuquit
cmp_choice:
	cmp choice, '1'
	je before_menu
	cmp choice, '2'
	jne cmp_choice2
	jmp storage
cmp_choice2:
	cmp choice, '3'
    jne redo
	jmp fin
redo:
	mov ah,09h
	lea dx, nl
	int 21h
	
	mov ah,09h
	lea dx, other
	int 21h
	jmp menuquit
  
before_menu: 
	cmp yn3, "N"
	je before_menu2
	cmp yn3, "n"
	je before_menu2
	cmp actn,1
	jne menu
	cmp outname[0], "@"
	jne menu
	jmp login
before_menu2:
	cmp yn2, "Y"
	je help_reset
	cmp yn2, "y"
	jne menu
help_reset:
	jmp reset_cus
menu:
	
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ah,09h
	lea dx,strd
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, strc
	int 21h 
		
	mov ah, 09h
	lea dx, nl				;MENU
	int 21h
	
	mov ah,09h
	lea dx,strd
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str1
	int 21h 
	
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah, 09h
	lea dx, str2
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str3
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str4
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str5
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str6
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str7
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str8
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah,09h
	lea dx, str9
	int 21h 
		
	mov ah, 09h
	lea dx, nl
	int 21h 
	
	mov ah,09h
	lea dx,strd
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h
	
purchase:
	mov si, rcount
	mov ah, 09h
	lea dx, nl
	int 21h
	 
	mov ah, 09h
	lea dx, buy
	int 21h				;PICK AN ITEM TO BUY
	  
	mov ah, 01h
	int 21h
	sub al,30h
	mov item[si], al
	
	cmp al, 0
	jle not_amount
	cmp al, 9
	jg not_amount	

xor di, di
check_item:
    cmp di, rcount
    je increase_count
    cmp item[di], al
    je same_item			;CHECK IF ITEM PREVIOUSLY ORDERED BY THE CUSTOMER
    inc di
    jmp check_item
	
same_item:
	mov si,di
	jmp amount			;IF YES, REPLACE THE OLD QUANTITY WITH NEW
	
increase_count:
	mov si, rcount
	mov item[si], al		;INCREASE COUNTER
	inc rcount
	jmp amount 


not_amount:  
	mov ah, 09h
	lea dx, nl
	int 21h
		  
	mov ah, 09h
	lea dx, elseamt			;INVALID INPUT WHILE PICKING ITEM
	int 21h
		  
	mov ah, 09h
	lea dx, nl
	int 21h
		  
	jmp purchase

amount:
	mov ah, 09h
	lea dx, nl
	int 21h

	mov ah, 09h
	lea dx, itemamt		;TYPE QUANTITY
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah, 09h
	lea dx, guideamt
	int 21h	

get_amt1:
    mov ah, 01h
    int 21h
	cmp al,8h
	je get_amt1
    sub al, 30h
    mov amt1[si], al  
	
get_amt2:
    mov ah, 01h
    int 21h
	cmp al,8h
	je get_amt1
	cmp al, 13
	je single_digit
	sub al, 30h
    mov amt2[si], al
	jmp compare_amt
single_digit:
	mov ax,0
	mov al,amt1[si]
	mov amt2[si],al
	mov amt1[si],0
compare_amt:		
	cmp amt1[si], 0
    jb outrange
	cmp amt1[si], 9
    ja outrange
    cmp amt2[si], 0
    jb outrange
	cmp amt2[si], 9
	ja outrange
	cmp amt1[si],0
	jne adding
	cmp amt2[si],0
	je remove_item
	jmp adding
outrange:
	mov ah,09h
	lea dx, nl
	int 21h
	
	mov ah,09h
	lea dx, other
	int 21h
	jmp amount

remove_item:
	mov item[si],0  ;IF QUANTITY 0, REMOVE ITEM FROM CART
adding:
	
	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ah, 09h
	lea dx, addon  ;ASK IF USER WANT TO ADD
	int 21h
	
	mov ah,01h
	int 21h  
	mov yn, al
	

	cmp yn, 'N'
	je receipt
	cmp yn, 'n'
	je receipt
	cmp yn, 'Y'
	jne small_Y
	jmp menu
small_Y:
	cmp yn, 'y'
	jne wrong1
	jmp menu
	
wrong1:	
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah, 09h
	lea dx, other
	int 21h
	jmp adding
	
	
receipt:
	mov si,0
	mov cx,rcount
check_empty:
    mov al, item[si]
	cmp al,0
	jne display_receipt   ;RECEIPT
	inc si
loop check_empty

	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov ah,09h
	lea dx,noreceipt
	int 21h
	
	jmp next_customer
	
display_receipt:
	mov ah,06h
	mov al,00h
	mov bh,00h
	mov cx,0000h
	mov dx,184fh
	int 10h
	
    mov ah, 09h
    lea dx, nl
    int 21h	
	
	
	mov ah,09h
	lea dx, storename
	int 21h

    mov ah, 09h
    lea dx, nl
    int 21h

    mov ah, 09h
    lea dx, rec
    int 21h

    mov ah, 09h
    lea dx, nl
    int 21h
	
	mov ah, 09h
    lea dx, line
    int 21h
	
	mov ah, 09h
	lea dx, nl
	int 21h
	
	
;time;	
	mov ah, 2ch
	int 21h


	mov al, ch
	mov ah, 0
	div tendb
	add al, 30h
	add ah, 30h
	mov timestr[6], al
	mov timestr[7], ah


	mov al, cl
	mov ah, 0
	div tendb
	add al, 30h
	add ah, 30h
	mov timestr[9], al 
	mov timestr[10], ah

	mov al, dh
	mov ah, 0
	div tendb
	add al, 30h
	add ah, 30h
	mov timestr[12], al 
	mov timestr[13], ah


	;date;
	mov ah,2ah
	int 21h

	mov al, dl
	mov ah, 0
	div tendb
	add al, 30h
	add ah, 30h
	mov datestr[6], al
	mov datestr[7], ah


	mov al, dh
	mov ah, 0
	div tendb
	add al, 30h
	add ah, 30h
	mov datestr[9], al 
	mov datestr[10], ah
	
	mov ax,cx
	xor dx, dx
    div thou              
    add al, 30h         
    mov datestr[12], al        
    mov ax, dx            

    xor dx, dx
    div hun
    add al,30h
    mov datestr[13], al
    mov ax, dx

    xor dx, dx
    div ten
    add al,30h
    mov datestr[14], al

    add dl, 30h
    mov datestr[15], dl

	mov ah, 09h
	lea dx, timestr
	int 21h

	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ah, 09h
	lea dx, datestr
	int 21h

	mov ah, 09h
	lea dx, nl
	int 21h

    mov ah, 09h				;HEADER AND CUSTOMER NAME
    lea dx, customer
    int 21h

    mov ah, 09h
    lea dx, outname
    int 21h
	
	mov ah, 09h
    lea dx, nl
    int 21h
	
	mov ah, 09h
    lea dx, nl
    int 21h
	
	mov ah,09h
	lea dx, header
	int 21h
	
	mov ah, 09h
    lea dx, nl
    int 21h
	
	jmp before_next_item
display_balance:
	
	mov ah,09h
	lea dx, nl
	int 21h
	inc customercount
								;DISPLAY BALANCE
	mov di,6
	mov cx, 7
red_balance:
	mov al,balanceis[di]
	mov ah,09h
	mov bx,0
	mov bl,04h
	int 10h
	dec di
loop red_balance
	mov ah,09h
	lea dx, balanceis
	int 21h
	
	cmp balance,10
	jb looping1
	cmp balance, 1000
	jae looping4
	cmp balance,100
	jae looping3
	mov cxdb,2 
	jmp loop_push_balance
looping4:
	mov cxdb, 4
	jmp loop_push_balance
looping1:
	mov cxdb, 1
	jmp loop_push_balance
looping3:
	mov cxdb, 3
loop_push_balance:
   	mov ax, balance
	MOV CX,cxdb
push_balance:
	MOV DX,0
	DIV TEN
	PUSH DX
	LOOP push_balance
	
    MOV CX,cxdb
	pop_balance:
	POP BX
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
	LOOP pop_balance
	
	mov ax,total
	add grandtotal, ax
jmp next_customer

get_balance:
	mov ah,09h
	lea dx,nl
	int 21h
	
	mov di,0
	mov ch,0
	mov cl,actn3				;DISPLAY PAID
convert_digit:
	mov al,outpaid[di]
	sub al,30h
	mov outpaid[di],al
	inc di
loop convert_digit

mov di,0
mov ch,0
mov cl,actn3
store_paid:
	mov ax,paid
	mul ten
	mov paid, ax
	mov ah,0
	mov al, outpaid[di]
	add paid,ax
	inc di
loop store_paid
	
	mov ax,total
	cmp ax, paid
	jbe calculation
	jmp not_digits

calculation:

	mov di,3
	mov cx,4
green_paid:
	mov al,paidIS[DI]
	mov ah,09h
	mov bx,0
	mov bl,02h
	int 10h
	dec di
loop green_paid

	mov ah,09h
	lea dx, paidis
	int 21h
	
	mov ax, paid
	
   	cmp paid,10
	jb loop_1
	cmp paid, 1000
	jae loop_4
	cmp paid,100
	jae loop_3
	mov cxdb,2 
	jmp loop_push_paid
loop_4:
	mov cxdb, 4
	jmp loop_push_paid
loop_1:
	mov cxdb, 1
	jmp loop_push_paid
loop_3:
	mov cxdb, 3
loop_push_paid:
   	mov ax, paid
	MOV CX,cxdb
push_paid:
	MOV DX,0
	DIV TEN
	PUSH DX
	LOOP push_paid
	
display_paid:	
    MOV CX,cxdb
	pop_paid:
	    POP BX
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
	LOOP pop_paid

	mov ax,0
	mov ax, paid			;CALCULATE BALANCE
	sub ax, total
	add balance, ax
	jmp display_balance
	
payornot:
	mov ah,09h
	lea dx, nl
	int 21h
if_yn2_wrong:
	mov ah,09h
	lea dx, nl
	int 21h
	
	mov ah,09h
	lea dx, proceedpay
	int 21h              ;ASK IF WANT TO PROCEED TO PAYMENT
	
	mov ah,01h
	int 21h
	mov yn2, al

	mov ah, 02h
	mov bh, 0
	mov dh, 23
	mov dl, 0
	int 10h
	
	mov ah, 06h
	mov al, 00h
	mov bh, 07h
	mov cx, 1700h
	mov dx, 184fh
	int 10h

	cmp yn2, 'Y'
	je enterpaid
	cmp yn2, 'y'
	je enterpaid
	cmp yn2, 'N'
	je cancel_order
	cmp yn2, 'n'
	je cancel_order
	
	mov ah,09h
	lea dx, notyn
	int 21h
	jmp if_yn2_wrong
cancel_order:
	jmp next_customer
enterpaid:
	mov di,0

	mov ah,09h
	lea dx, payment
	int 21h				;ENTER PAID AMOUNT

	mov ah,0ah
	lea dx, inpaid
	int 21h
	
	mov ah, 02h
	mov bh, 0
	mov dh, 22
	mov dl, 0
	int 10h
	
	mov ah, 06h
	mov al, 00h
	mov bh, 07h
	mov cx, 1700h
	mov dx, 184fh
	int 10h
	
	cmp actn3, 0
	je pre_not_digits
	cmp actn3, 4
	ja not_digits

mov ch,0	
mov cl,actn3
cmp_digits:
	mov al,outpaid[di]
	cmp al,"0"				;MAKING SURE PAYMENT AMOUNT IS IN DIGITS
	jb pre_not_digits
	cmp al,"9"
	ja pre_not_digits
	inc di
loop cmp_digits
jmp get_balance
pre_not_digits:
	mov ah,09h
	lea dx, nl
	int 21h
not_digits:
	
	mov paid,0
	
	mov ah,09h
	lea dx, notyn
	int 21h
	
	mov ah,09h
	lea dx, nl
	int 21h
	
	jmp enterpaid
	

display_total:
	cmp total,10
	jb loop1
	cmp total, 1000
	jae loop4
	cmp total,100
	jae loop3
	mov cxdb,2 
	jmp loop_push_total
loop4:
	mov cxdb, 4				;DISPLAY TOTAL
	jmp loop_push_total
loop1:
	mov cxdb, 1
	jmp loop_push_total
loop3:
	mov cxdb, 3
loop_push_total:
   	mov ax, total
	MOV CX,cxdb
push_total:
	MOV DX,0
	DIV TEN
	PUSH DX
	LOOP push_total
	
    MOV CX,cxdb
	pop_total:
	    POP BX
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
	LOOP pop_total
	jmp payornot
totaltotal:
	mov di,4
	mov cx,5
cyan_total:
	mov al,totalis[di]
	mov ah,09h
	mov bx,0
	mov bl,03h
	int 10h
	dec di
loop cyan_total	

	mov ah,09h
	lea dx,totalis
	int 21h 
	jmp display_total
before_next_item:	
mov si, 0
next_item:
	cmp si, rcount
	je totaltotal
    mov al, item[si]

    cmp al, 1
    je print_pencil
    cmp al, 2
    je print_eraser
    cmp al, 3
    je print_ruler
    cmp al, 4
    je print_bpen
    cmp al, 5
    je print_blu
    cmp al, 6				;PRINT RECEIPT CONTENT
    je print_red
    cmp al, 7
    je print_case
    cmp al, 8
    je print_tape
    cmp al, 9
    je print_book
	jmp skip_item
print_pencil:
    mov ah, 09h
    lea dx, pencil
    int 21h
    jmp show_qty

print_eraser:
    mov ah, 09h
    lea dx, eraser
    int 21h
    jmp show_qty

print_ruler:
    mov ah, 09h
    lea dx, ruler
    int 21h
    jmp show_qty

print_bpen:
    mov ah, 09h
    lea dx, bla
    int 21h
    jmp show_qty

print_blu:
    mov ah, 09h
    lea dx, blu
    int 21h
    jmp show_qty

print_red:
    mov ah, 09h
    lea dx, red
    int 21h
    jmp show_qty

print_case:
    mov ah, 09h
    lea dx, case
    int 21h
    jmp show_qty

print_tape:
    mov ah, 09h
    lea dx, tape
    int 21h
    jmp show_qty

print_book:
    mov ah, 09h
    lea dx, book
    int 21h
    jmp show_qty

show_qty:
    mov ah, 02h
    mov dl,'x'
    int 21h
	
show_qty2:
    mov ah, 02h
    mov dl, amt1[si]
    add dl, 30h
    int 21h

    mov ah, 02h
    mov dl, amt2[si]
    add dl, 30h
    int 21h

    mov ah,09h
	lea dx, space
	int 21h
	
	mov onetotal[si],0
	mov ax,0
	mov al,amt1[si]
	mul ten
	add onetotal[si],ax

	mov ax,0
	mov al,amt2[si]
	add onetotal[si],ax
	jmp compare_money
  
 
compare_money:
  cmp item[si], 3
  jbe rm1
  cmp item[si], 6
  jbe rm2
  cmp item[si], 7
  jae rm4 
  
rm4:
    shl onetotal[si], 1
rm2:
    shl onetotal[si], 1
rm1:
	cmp onetotal[si],10
	jb cx1
	cmp onetotal[si],100
	jae cx3
	mov cxdb, 2
	jmp loop_this
cx1:
	mov cxdb, 1
	jmp loop_this
cx3:
	mov cxdb, 3
loop_this:	
   	mov ax, onetotal[si]
	MOV CX,cxdb
	L1:
	  MOV DX,0
	  DIV TEN
	  PUSH DX
	LOOP L1
	
increase_total:	
	mov ah, 09h
    lea dx, RM
    int 21h
	
    MOV CX,cxdb
	L2:
	    POP BX
		MOV AH,02H
		MOV DL,BL
		ADD DL,30H
		INT 21H
	LOOP L2

    mov ah, 09h
    lea dx, nl
    int 21h
	
	mov ah,09h
	lea dx, nl
	int 21h
	
	
	mov ax,onetotal[si]
	add total,ax
	mov ax, total
	
	xor dx, dx
    div thou              
    add al, 30h         
    mov totalamt[0], al        
    mov ax, dx            

    xor dx, dx
    div hun
    add al,30h
    mov totalamt[1], al
    mov ax, dx

    xor dx, dx
    div ten
    add al,30h
    mov totalamt[2], al

    add dl, 30h
    mov totalamt[3], dl
	
skip_item:
	inc si
	jmp next_item
	
fin:
	mov ah,09h
	lea dx, nl		;QUIT PROGRAM
	int 21h
	
	mov ah,09h
	lea dx, cfm
	int 21h
	
	mov ah,01h
	int 21h
	mov yn, al
	
	cmp yn,"y"
	je logout 
	cmp yn,"Y"
	je logout
	cmp yn,"n"
	jne big_N
    jmp menuquit
big_N:
    cmp yn,"N"
	jne errorinput
	jmp menuquit
	
errorinput:
	mov ah,09h
	lea dx, nl
	int 21h
	
	mov ah,09h
	lea dx, other
	int 21h
	jmp fin
logout:
	mov ah, 09h
	lea dx, nl
	int 21h
	mov ah,09h
	lea dx, strpw
	int 21h

	mov actn2,0
	mov si,0
hide_pw2:
    mov ah,07h
	int 21h
	cmp al,13
	je before_check_Password2
	cmp al,8
	je backspace_pw2
	mov al,outpw[si]

	mov ah, 02h
    mov dl, '*'
    int 21h

	inc si
    inc actn2
jmp hide_pw2

backspace_pw2:
	cmp si,0
	je hide_pw2
	
	dec si
    dec actn2
	
    mov ah, 02h
    mov dl, 8h
    int 21h

    mov dl, ' '
    int 21h

    mov dl, 8h
    int 21h

	jmp hide_pw2
before_check_Password2:
	cmp actn2, 4
	jne wrongpw2

	xor si, si
	mov cx, 4
checkpassword2:
	mov bl, pw[si]
	cmp outpw[si], bl
	jne wrongpw2
	inc si
	loop checkpassword2
	xor si, si
	jmp quit

wrongpw2:
	mov ah, 09h
    lea dx, nl
    int 21h
  
	mov ah,09h
	lea dx, notpw
	int 21h
	
	mov ah, 09h
    lea dx, nl
    int 21h
	jmp fin
quit:	
	mov ah, 09h
	lea dx, nl
	int 21h
	  
	mov ah, 09h
	lea dx, nl
	int 21h

	mov ah,09h
	lea dx, thanks
	int 21h
	
	mov ah, 09h
	lea dx, nl
	int 21h
	
	mov ax, 4c00h
	int 21h
main endp
end main
