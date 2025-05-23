Name "Tic Tac Toe"
Org 100h
.DATA   
	MANG DB '1','2','3'  	
         DB '4','5','6'
         DB '7','8','9'
    T1 DB 4, 4, 4, 4, 4, 32, 4, 32, 4, 4, 4, 4, 32, 32, 32, 4, 4, 4, 4, 4, 32, 32, 4, 4, 32, 32, 4, 4, 4, 4, 32, 32, 32, 4, 4, 4, 4, 4, 32, 32, 4, 4, 32, 32, 4, 4, 4, 4, '$'
    T2 DB 32, 32, 4, 32, 32, 32, 4, 32, 4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32, 4, 32, 32, 4, 32, 4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32, 4, 32, 32, 4, 32, 4, '$'
    T3 DB 32, 32, 4, 32, 32, 32, 4, 32, 4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32, 4, 4, 4, 4, 32, 4, 32, 32, 32, 32, 32, 32, 32, 32, 4, 32, 32, 32, 4, 32, 32, 4, 32, 4, 4, 4, 4, '$' 
    T4 DB 32, 32, 4, 32, 32, 32, 4, 32, 4, 4, 4, 4, 32, 4, 32, 32, 32, 4, 32, 32, 32, 4, 32, 32, 4, 32, 4, 4, 4, 4, 32, 4, 32, 32, 32, 4, 32, 32, 32, 32, 4, 4, 32, 32, 4, 4, 4, 4, '$'
    PAK DB 'Press any key to continue...$'
	PLAYER DB ?  						
	WELCOME DB 'Welcome to Tic Tac Toe! $'			
	INPUT DB 'Enter Position Number, PLAYER Turn is: $' 	
	DRAW DB 'DRAW! $' 					
	WIN DB 'PLAYER WIN: $' 					

.CODE    
main:    
    call PRINT_WELCOME
	mov cx,9    		
x:   
    call XOA_MAN_HINH  	
	call PRINT_MANG    	
	mov bx, cx        	
	and bx, 1          
	cmp bx, 0        	
	je isEven          
	mov PLAYER, 'x'    	
	jmp endif		
isEven:
	mov PLAYER, 'o'    	
endif:
    NOT_VALID:
	    call IN_DONG_MOI 	
	    call IN_NHAP	 	
	    call NHAP   		      
	    push cx           
	    mov cx, 9          
	    mov bx, 0          
y:
	cmp MANG[bx], al  	
	je UPDATE          
	jmp CONTINUE     	
UPDATE:
	mov dl, PLAYER     	
	mov MANG[bx], dl  	
CONTINUE:
	inc bx            	
	loop y            	
	pop cx            	
	call CHECKWIN     	        
	loop x                  
	call PRINT_DRAW       
programEnd:   
	mov ax, 4C00h
    int 21h
          	
ret                      		
	    
PRINT_MANG:
    lea dx, WELCOME
    mov ah, 9
    int 21h         			
	push cx           
	mov bx,0         		
	mov cx,3          		
	x1:
        call IN_DONG_MOI 	
        push cx          	
        mov cx, 3       	
	x2:
	    mov dl, MANG[bx] 		
	    mov ah, 2h   			
	    int 21h       
	    call PRINT_Space 		
	    inc bx       			
	    loop x2          		
	    pop cx          		
	    loop x1              		
	    pop cx               		
	    call IN_DONG_MOI    		
ret                      					
        
IN_DONG_MOI:            		
	mov dl, 0ah     		
	mov ah, 2       		
	int 21h         		
	mov dl, 13          		 		
	mov ah, 2       		
	int 21h         		
ret                     			 		
        
PRINT_Space:            		
	mov dl, 32          		
	mov ah, 2            		
	int 21h              		
ret       
              		 			
NHAP:  				        

	mov ah, 1        		
	int 21h               	 	
	cmp al, '1'                     
	je VALID
	cmp al, '2'
	je VALID
	cmp al, '3'
	je VALID
	cmp al, '4'
	je VALID
	cmp al, '5'
	je VALID
	cmp al, '6'
	je VALID
	cmp al, '7'
	je VALID
	cmp al, '8'
	je VALID
	cmp al, '9'
	je VALID
	jmp NOT_VALID                   
	VALID:                          
ret                       					
        
PRINT_WELCOME:          	 	
	mov ah, 2
    mov bh, 0
    mov dh, 6
    mov dl, 14
    int 10h 
    
    lea dx, T1
    mov ah, 9
    int 21h 
    
    mov ah, 2
    mov dh, 7
    mov dl, 14
    int 10h  
    
    lea dx, T2
    mov ah, 9
    int 21h  
    
    mov ah, 2
    mov dh, 8
    mov dl, 14
    int 10h 
    
    lea dx, T3
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dh, 9
    mov dl, 14
    int 10h
    
    lea dx, T2
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dh, 10
    mov dl, 14
    int 10h
    
    lea dx, T4
    mov ah, 9
    int 21h
    
    mov ah, 2
    mov dh, 13
    mov dl, 24
    int 10h
    
    lea dx, PAK
    mov ah, 9
    int 21h
    mov ah, 7
    int 21h
    
    mov ax,0600h
    mov bh,07h
    mov cx,0000h
    mov dx,184fh
    int 10h
    
    mov ah, 2
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    
    lea dx, WELCOME
    mov ah, 9
    int 21h         		
ret                       					
        
PRINT_DRAW:                  		
	call IN_DONG_MOI       		
	lea dx, DRAW            	
	mov ah, 9                	
	int 21h                   	
ret                         		 			
        
PRINT_WIN:                     		
	call IN_DONG_MOI       	 	
	call PRINT_MANG           	
	lea dx, WIN               	
	mov ah, 9                 	
	int 21h                    	
	mov dl, PLAYER            	
	mov ah, 2h                 	
	int 21h                    	
	jmp programEnd            	
ret                            				
        
IN_NHAP:                 		
	lea dx, INPUT            	
	mov ah, 9                   	
	int 21h                       	
	mov dl, PLAYER               	
	mov ah, 2h                     	
	int 21h                       	
	call PRINT_Space                
ret                                				
        
CHECKWIN:                      		
	mov bl, MANG[0]                 
	cmp bl, MANG[1]          	
	jne skip1                	
	cmp bl, MANG[2]          	
	jne skip1                	
	call PRINT_WIN            	

skip1:                            
	mov bl, MANG[3]          	
	cmp bl, MANG[4]          	
	jne skip2                	
	cmp bl, MANG[5]          	
	jne skip2                	
	call PRINT_WIN            	

skip2:                            
	mov bl, MANG[6]          	
	cmp bl, MANG[7]          	
	jne skip3                	
	cmp bl, MANG[8]          	
	jne skip3                	
	call PRINT_WIN            

skip3:                            
	mov bl, MANG[0]          	
	cmp bl, MANG[3]          	
	jne skip4                	
	cmp bl, MANG[6]          	
	jne skip4               	
	call PRINT_WIN            

skip4:                            
	mov bl, MANG[1]          	
	cmp bl, MANG[4]          	
	jne skip5                	
	cmp bl, MANG[7]          	
	jne skip5                	
	call PRINT_WIN            

skip5:                                
	mov bl, MANG[2]          	
	cmp bl, MANG[5]          	
	jne skip6                	
	cmp bl, MANG[8]          	
	jne skip6                	
	call PRINT_WIN            	

skip6:                            
    mov bl, MANG[0]      	
    cmp bl, MANG[4]      	
    jne skip7            	
    cmp bl, MANG[8]      	
    jne skip7            	
    call PRINT_WIN        

skip7:               		 	
	mov bl, MANG[2]          	
	cmp bl, MANG[4]          	
	jne skip8                	
	cmp bl, MANG[6]          	
	jne skip8                	
	call PRINT_WIN            

skip8:                            
    ret                                                                 	 
        
XOA_MAN_HINH:                    	
	mov ax, 3                	
	int 10h                  	
ret   
                                                         	
end main                         
