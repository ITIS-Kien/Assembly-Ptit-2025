.MODEL SMALL   ; Xác định mô hình bộ nhớ nhỏ
.STACK 100H    ; Cấp phát bộ nhớ stack 256 byte

.DATA          ; Khai báo vùng dữ liệu
HEADER DB "BO CAU HOI CO BAN"     ; Tiêu đề của chương trình
       DB 10, 13, ""              ; Xuống dòng
       DB 10, 13, "$"             ; Ký tự kết thúc chuỗi

NOTICE DB 10, 13, "CHU Y : TAT UNIKEY TRUOC KHI SU DUNG $" ; Lưu ý
       DB 10, 13, ""              ; Xuống dòng
       DB 10, 13, "$"             ; Ký tự kết thúc chuỗi

COMNAM DB 10, 13, ""              ; Xuống dòng
       DB 10, 13, "NHAP THONG TIN : $" ; Yêu cầu nhập tên
SUR DB 10, 13, "HO : $"                ; Nhập họ
INPUTSUR DB 21                         ; Bộ đệm nhập họ
INPUTS DB 21 DUP("$")                  ; Bộ đệm lưu họ

FIR DB " TEN : $"                      ; Nhập tên
INPUTFIR DB 21                         ; Bộ đệm nhập tên
INPUTF DB 21 DUP("$")                  ; Bộ đệm lưu tên

MI DB " ID: $"                         ; Nhập ID
INPUTMI DB 21                          ; Bộ đệm nhập ID
INPUTM DB 21 DUP("$")                  ; Bộ đệm lưu ID

CORRECT DB 10, 13, "DAP AN DUNG! $"    ; Thông báo khi đáp án đúng

PAR1 DB 10, 13, ""
     DB 10, 13, "PHAN I $"
DIRECM DB 10, 13, "CHON DAP AN DUNG. $"
MESSAGE1 DB 10, 13, ""
         DB 10, 13, ""
         DB "NHAN PHIM ENTER DE BAT DAU QUIZ: $"
         DB 10, 13, ""
         DB 10, 13, "$"

QUIZ1 DB 10, 13, ""
      DB 10, 13, "1. 2 + 5 = ?"
      DB 10, 13, "A. 3      B. 8        C. 7"
      DB 10, 13, "DAP AN: $"
WR1 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA C$"

QUIZ2 DB 10, 13, ""
      DB 10, 13, "2. 7 - 4 = ?"
      DB 10, 13, "A. 2      B. 3        C. 1"
      DB 10, 13, "DAP AN: $"
WR2 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA B$"
    
QUIZ3 DB 10, 13, ""
      DB 10, 13, "3. 3 * 4 = ?"
      DB 10, 13, "A. 12     B. 13       C. 11"
      DB 10, 13, "DAP AN: $"
WR3 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA A$"

QUIZ4 DB 10, 13, ""
      DB 10, 13, "4. 36 / 4 = ?"
      DB 10, 13, "A. 9      B. 8        C. 7"
      DB 10, 13, "DAP AN: $"
WR4 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA A$"  
    
QUIZ5 DB 10, 13, ""
      DB 10, 13, "5. (3 + 2) * 4 / 10 = ?"
      DB 10, 13, "A. 6      B. 1        C. 2"
      DB 10, 13, "DAP AN: $"
WR5 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA C$"      
    
PAR2 DB 10, 13, ""
     DB 10, 13, "PHAN II $" 
DIRECTF DB 10, 13, "TRA LOI DUNG/SAI (D/S). $"
QUIZ6  DB 10, 13, ""
       DB 10, 13, "6. SO 2 LA MOT SO NGUYEN TO."
       DB 10, 13, "DAP AN: $"
WR6 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA DUNG$"
    
QUIZ7  DB 10, 13, ""
       DB 10, 13, "7. SO 7 CHIA HET CHO SO 5."
       DB 10, 13, "DAP AN: $"
WR7 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA SAI$"
    
QUIZ8  DB 10, 13, ""
       DB 10, 13, "8. SO CHIA HET CHO 5 CO TAN CUNG LA 0 VA 4."
       DB 10, 13, "DAP AN: $"
WR8 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA SAI$"
    
QUIZ9  DB 10, 13, ""
       DB 10, 13, "9. SO 9 LA MOT SO CHINH PHUONG."
       DB 10, 13, "DAP AN: $"
WR9 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA DUNG$"

QUIZ10 DB 10, 13, ""
       DB 10, 13, "10. 6 / 3 = 2."
       DB 10, 13, "DAP AN: $"
WR10 DB 10, 13, "DAP AN SAI!!!"
     DB 10, 13, "DAP AN LA DUNG$"
        
PQUIZ DB 10, 13, "BAN DA HOAN THANH XONG BAI QUIZ"
      DB 10, 13, ""
PQUIZ_END DB 0
CONG DB 10, 13, "CHUC MUNG "
CONG_END DB 0
MESSAGE2 DB 13, 10, ""
         DB 13, 10, "SO CAU TRA LOI DUNG CUA BAN LA: $"
MESSAGE3 DB 13, 10, ""
         DB 13, 10, "NHAN PHIM 1 DE LAM LAI HOAC 0 DE THOAT: $"
MESSAGE4 DB 13, 10, ""
         DB 13, 10, "                    *** CAM ON ***"
         DB 13, 10, ""
         DB 13, 10, "                    *** NHOM 3 ***"
         DB 13, 10, ""
         DB 13, 10, "CAC THANH VIEN GOM :    NGUYEN TU KIEN"
         DB 13, 10, ""
         DB 13, 10, "                       TRAN THI ANH DUONG"
         DB 13, 10, ""
         DB 13, 10, "                       VUONG QUOC HUNG"
         DB 13, 10, ""
         DB 13, 10, "                       BUI HUY HOANG$"

.CODE          ; KHAI BÁO PHẦN CODE
MAIN PROC      ; ĐỂM HÀM CHÍNH
    MOV AX, @DATA   ; Nạp phần dữ liệu vào thanh ghi
    MOV DS, AX      ; Chuyền dữ liệu vào DS
    
    LEA DX, HEADER  ; Tải tiêu đề
    MOV AH, 9       ; Hiển thị chuỗi
    INT 21H

    LEA DX, NOTICE  ; Tải thông báo
    MOV AH, 9
    INT 21H
    
    LEA DX, COMNAM  ; Yêu cầu nhập tên
    MOV AH, 9
    INT 21H
    
    LEA DX, SUR     ; Nhập họ
    MOV AH, 9
    INT 21H
    LEA DX, INPUTSUR  ; Lấy dữ liệu họ
    MOV AH, 0AH
    INT 21H
    
    LEA DX, FIR     ; Nhập tên
    MOV AH, 9
    INT 21H
    LEA DX, INPUTFIR  ; Lấy dữ liệu tên
    MOV AH, 0AH
    INT 21H
    
    LEA DX, MI      ; Nhập ID
    MOV AH, 9
    INT 21H
    LEA DX, INPUTMI  ; Lấy dữ liệu ID
    MOV AH, 0AH
    INT 21H


START:  ; Bắt đầu làm quiz
    MOV BL, 0  ; Thanh ghi BL lưu điểm

    LEA DX, MESSAGE1  ; Hiển thị thông báo bắt đầu quiz
    MOV AH, 9
    INT 21H
    
    MOV AH, 1  ; Nhập 1 ký tự từ bàn phím (Phím Enter)
    INT 21H    ; Chờ người dùng nhập
    
    CMP AL, 0DH  ; So sánh ký tự vừa nhập với ODH (Ký tự xuống dòng)
    JE PART1    ; Nếu đúng thì chuyển đến phần 1
    JNE START   ; Nếu sai thì nhập lại

PART1:
    LEA DX, PAR1  ; Hiển thị phần 1
    MOV AH, 9
    INT 21H 
    LEA DX, DIRECM  ; Hiển thị hướng dẫn
    MOV AH, 9
    INT 21H

    
QUESTION1:
    LEA DX, QUIZ1  ; Hiển thị câu hỏi 1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1  ; Nhập câu trả lời từ bàn phím
    INT 21H
    CMP AL, 43H  ; So sánh với ‘C’
    JE QC1
    CMP AL, 63H  ; So sánh với ‘c’
    JE QC1     ; Nếu đúng nhảy đến QC1
    JMP QW1    ; Nếu sai nhảy đến QW1
    
QC1:
    LEA DX, CORRECT  ; Hiển thị thông báo đúng
    INC BL  ; Tăng điểm
    MOV AH, 9
    INT 21H
    CALL QUESTION2  ; Chuyển sang câu hỏi 2

QW1:
    LEA DX, WR1  ; Hiển thị thông báo 2
    MOV AH, 9
    INT 21H

QUESTION2:
    LEA DX, QUIZ2  
    MOV AH, 9
    INT 21H
    
    MOV AH, 1  
    INT 21H
    CMP AL, 42H  
    JE QC2
    CMP AL, 62H  
    JE QC2
    JMP QW2  

QC2:
    INC BL  
    LEA DX, CORRECT  
    MOV AH, 9
    INT 21H
    CALL QUESTION3  

QW2:
    LEA DX, WR2  
    MOV AH, 9
    INT 21H

    
QUESTION3:
    LEA DX, QUIZ3  
    MOV AH, 9
    INT 21H
    
    MOV AH, 1  
    INT 21H
    CMP AL, 41H  
    JE QC3
    CMP AL, 61H  
    JE QC3
    JMP QW3

QC3:
    INC BL   
    LEA DX, CORRECT  
    MOV AH, 9
    INT 21H
    CALL QUESTION4  

QW3:
    LEA DX, WR3  
    MOV AH, 9
    INT 21H
    
QUESTION4:
    LEA DX, QUIZ4  
    MOV AH, 9
    INT 21H
    
    MOV AH, 1  
    INT 21H
    CMP AL, 41H  
    JE QC4
    CMP AL, 61H  
    JE QC4    
    JMP QW4

QC4:
    INC BL  
    LEA DX, CORRECT  
    MOV AH, 9
    INT 21H
    CALL QUESTION5 

QW4:
    LEA DX, WR4  
    MOV AH, 9
    INT 21H    
    
QUESTION5:
    LEA DX, QUIZ5  
    MOV AH, 9
    INT 21H
    
    MOV AH, 1 
    INT 21H
    CMP AL, 43H  
    JE QC5
    CMP AL, 63H  
    JE QC5
    JMP QW5

QC5:
    INC BL 
    LEA DX, CORRECT 
    MOV AH, 9
    INT 21H
    CALL PART2  

QW5:
    LEA DX, WR5  
    MOV AH, 9
    INT 21H  
    
PART2:
    LEA DX, PAR2 
    MOV AH, 9
    INT 21H
    LEA DX, DIRECTF 
    MOV AH, 9
    INT 21H

QUESTION6:
    LEA DX, QUIZ6
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    CMP AL, 44H
    JE QC6
    CMP AL, 64H
    JE QC6
    JMP QW6

QC6:
    INC BL
    LEA DX, CORRECT
    MOV AH, 9
    INT 21H
    CALL QUESTION7

QW6:
    LEA DX, WR6
    MOV AH, 9
    INT 21H
    
QUESTION7:
    LEA DX, QUIZ7
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    CMP AL, 53H
    JE QC7
    CMP AL, 73H
    JE QC7
    JMP QW7

QC7:
    INC BL
    LEA DX, CORRECT
    MOV AH, 9
    INT 21H
    CALL QUESTION8

QW7:
    LEA DX, WR7
    MOV AH, 9
    INT 21H
    
QUESTION8:
    LEA DX, QUIZ8
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    CMP AL, 53H
    JE QC8
    CMP AL, 73H
    JE QC8
    JMP QW8

QC8:
    INC BL
    LEA DX, CORRECT
    MOV AH, 9
    INT 21H
    CALL QUESTION9

QW8:
    LEA DX, WR8
    MOV AH, 9
    INT 21H

QUESTION9:
    LEA DX, QUIZ9
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    CMP AL, 44H
    JE QC9
    CMP AL, 64H
    JE QC9
    JMP QW9

QC9:
    INC BL
    LEA DX, CORRECT
    MOV AH, 9
    INT 21H
    CALL QUESTION10

QW9:
    LEA DX, WR9
    MOV AH, 9
    INT 21H
        
QUESTION10:
    LEA DX, QUIZ10
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    CMP AL, 44H
    JE QC10
    CMP AL, 64H
    JE QC10
    JMP QW10

QC10:
    INC BL
    LEA DX, CORRECT
    MOV AH, 9
    INT 21H
    CALL END_QUIZ    ; Gọi hàm kết thúc quiz

QW10:
    LEA DX, WR10
    MOV AH, 9
    INT 21H   
    CALL END_QUIZ 

END_QUIZ:
    MOV SI, OFFSET CONG  ; Trỏ đến chuỗi "CHÚC MỪNG"
    MOV CX, OFFSET CONG_END - OFFSET CONG  ; Độ dài chuỗi
    
P1:
    MOV DL, [SI]  ; Lấy ký tự từ chuỗi
    MOV AH, 5
    INT 21H
    INC SI
    LOOP P1  ; Lặp cho đến khi hết chuỗi
    
    MOV SI, OFFSET INPUTSUR  ; Lấy họ
    MOV CL, [INPUTSUR+1]  ; Số ký tự thực tế nhập vào
    XOR CH, CH  ; Đặt CH = 0 để CX chứa giá trị đúng

P2:
    MOV DL, [SI+2]  ; Bỏ qua 1 byte đầu tiên
    MOV AH, 5
    INT 21H
    INC SI
    LOOP P2

    MOV DL, ' '  ; In khoảng trắng
    MOV AH, 5
    INT 21H

    MOV SI, OFFSET INPUTFIR  ; Lấy tên
    MOV CL, [INPUTFIR+1]  ; Số ký tự thực tế nhập vào
    XOR CH, CH  ; Đặt CH = 0 để CX chứa giá trị đúng

P3:
    MOV DL, [SI+2]  ; Bỏ qua 1 byte đầu tiên
    MOV AH, 5
    INT 21H
    INC SI
    LOOP P3
    
    MOV SI, OFFSET PQUIZ  ; Hiển thị thông báo hoàn thành quiz
    MOV CX, OFFSET PQUIZ_END - OFFSET PQUIZ  ; Độ dài chuỗi
    
P4:
    MOV DL, [SI]
    MOV AH, 5
    INT 21H
    INC SI
    LOOP P4
    
    MOV DL, 10  ; Xuống dòng
    INT 21H
    MOV DL, 13
    INT 21H
    
    LEA DX, MESSAGE2  ; Hiển thị thông báo nhấn phím
    MOV AH, 9
    INT 21H
    
    ADD BL, 48  ; Chuyển điểm từ số sang mã ASCII ('0' = 48)
    CMP BL, 57  ; Kiểm tra xem số điểm có 1 hay 2 chữ số ('9' = 57)
    JG TEN  ; Nếu lớn hơn, chuyển sang xử lý 2 chữ số (10 điểm)

    MOV AH, 2  ; Chức năng in 1 ký tự
    MOV DL, BL  ; Đưa số điểm vào DL để in ra
    INT 21H  ; In ra số điểm
    CALL EXIT  ; Kết thúc chương trình

TEN:  ; Hàm xử lý số có 2 chữ số
    MOV AH, 2  ; Gọi chức năng hiển thị ký tự
    MOV DL, '1'  ; Truyền ký tự '1' để in
    INT 21H  

    MOV AH, 2
    MOV DL, '0'  ; In ký tự '0'
    INT 21H
    CALL EXIT

EXIT:  ; Hàm kết thúc chương trình
    LEA DX, MESSAGE3  ; Hiển thị thông báo điểm
    MOV AH, 9
    INT 21H
    
    MOV AH, 1  ; Đọc 1 ký tự từ người dùng
    INT 21H
    
    CMP AL, '1'  ; Nếu là '1' thì restart
    JE START
    
    CMP AL, '0'  ; nếu là '0' thì kết thúc chương trình
    JE FINISH 
    JMP EXIT    ; Nếu không thì cho nhập lại

FINISH: 
    LEA DX, MESSAGE4  ; Hiển thị thông báo thoát
    MOV AH, 9
    INT 21H
    
    MOV AH, 4CH  ; gọi hàm 4CH để thoát chương trình
    INT 21H

MAIN ENDP
END MAIN

     
    
      



