.MODEL SMALL   ; Xác định mô hình bộ nhớ nhỏ (dùng chung segment cho code và data)
.STACK 100H    ; Cấp phát vùng nhớ stack 256 byte (100H = 256)

.DATA          ; Bắt đầu khai báo vùng dữ liệu (data segment)

HEADER DB "BO CAU HOI CO BAN$"     
; Tiêu đề của chương trình. Kết thúc chuỗi bằng ký tự '$' để dùng với INT 21H, AH=09H

NOTICE DB 10, 13, "-------------------------------------" 
       DB 10, 13, "CHU Y : TAT UNIKEY TRUOC KHI SU DUNG$"
; Dòng thông báo lưu ý, xuống dòng bằng CR (13) + LF (10)

COMNAM DB 10, 13, "-------------------------------------"   
       DB 10, 13, "NHAP THONG TIN : $"  
; Dòng giới thiệu phần nhập thông tin người dùng

SUR DB 10, 13, ""
    DB 10, 13, "HO  : $"
; Yêu cầu nhập họ

INPUTSUR DB 21              ; Số ký tự tối đa được nhập
         DB ?               ; Sẽ được BIOS điền: số ký tự thực tế người dùng nhập
         DB 21 DUP("$")     ; Vùng lưu trữ chuỗi nhập vào (21 ký tự, mỗi ký tự là '$')

FIR DB 10, 13, "TEN : $"    
; Yêu cầu nhập tên

INPUTFIR DB 21              ; Tối đa 21 ký tự nhập
          DB ?              ; Sẽ lưu số ký tự người dùng nhập
          DB 21 DUP("$")    ; Bộ đệm để lưu tên

MI DB 10, 13, "ID  : $"     
; Yêu cầu nhập ID

INPUTMI DB 21               ; Tối đa 21 ký tự nhập
          DB ?              ; Sẽ lưu số ký tự người dùng nhập
          DB 21 DUP("$")    ; Bộ đệm để lưu ID

CORRECT DB 10, 13, "DAP AN DUNG! $"    
; Thông báo khi người dùng trả lời đúng

PAR1 DB 10, 13, "-------------------------------------"
     DB 10, 13, "PHAN I :$"
; Phần 1 của bài quiz

DIRECM DB "CHON DAP AN DUNG. $"
; Hướng dẫn chọn đáp án

MESSAGE1 DB 10, 13, ""
         DB 10, 13, ""
         DB "NHAN PHIM ENTER DE BAT DAU QUIZ: $"
         DB 10, 13, ""
         DB 10, 13, "$"
; Thông báo khởi đầu quiz, yêu cầu nhấn Enter

; Các câu hỏi từ 1 đến 5 (trắc nghiệm A/B/C)

QUIZ1 DB 10, 13, ""
      DB 10, 13, "1. 2 + 5 = ?"
      DB 10, 13, "A. 3      B. 8        C. 7"
      DB 10, 13, "DAP AN: $"
WR1 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA C$"
; Câu hỏi 1, đáp án đúng là C

QUIZ2 DB 10, 13, ""
      DB 10, 13, "2. 7 - 4 = ?"
      DB 10, 13, "A. 2      B. 3        C. 1"
      DB 10, 13, "DAP AN: $"
WR2 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA B$"
; Câu hỏi 2, đáp án đúng là B

QUIZ3 DB 10, 13, ""
      DB 10, 13, "3. 3 * 4 = ?"
      DB 10, 13, "A. 12     B. 13       C. 11"
      DB 10, 13, "DAP AN: $"
WR3 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA A$"
; Câu hỏi 3, đáp án đúng là A

QUIZ4 DB 10, 13, ""
      DB 10, 13, "4. 36 / 4 = ?"
      DB 10, 13, "A. 9      B. 8        C. 7"
      DB 10, 13, "DAP AN: $"
WR4 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA A$"
; Câu hỏi 4, đáp án đúng là A

QUIZ5 DB 10, 13, ""
      DB 10, 13, "5. (3 + 2) * 4 / 10 = ?"
      DB 10, 13, "A. 6      B. 1        C. 2"
      DB 10, 13, "DAP AN: $"
WR5 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN DUNG LA C$"
; Câu hỏi 5, đáp án đúng là C

; Phần II: câu hỏi đúng/sai

PAR2 DB 10, 13, ""
     DB 10, 13, "PHAN II :$"
; Phần 2 của bài quiz

DIRECTF DB "TRA LOI DUNG/SAI (D/S). $"
; Hướng dẫn trả lời dạng đúng/sai

QUIZ6 DB 10, 13, ""
      DB 10, 13, "6. SO 2 LA MOT SO NGUYEN TO."
      DB 10, 13, "DAP AN: $"
WR6 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA DUNG$"
; Câu hỏi 6, đáp án đúng là Đúng

QUIZ7 DB 10, 13, ""
      DB 10, 13, "7. SO 7 CHIA HET CHO SO 5."
      DB 10, 13, "DAP AN: $"
WR7 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA SAI$"
; Câu hỏi 7, đáp án đúng là Sai

QUIZ8 DB 10, 13, ""
      DB 10, 13, "8. SO CHIA HET CHO 5 CO TAN CUNG LA 0 VA 4."
      DB 10, 13, "DAP AN: $"
WR8 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA SAI$"
; Câu hỏi 8, đáp án đúng là Sai

QUIZ9 DB 10, 13, ""
      DB 10, 13, "9. SO 9 LA MOT SO CHINH PHUONG."
      DB 10, 13, "DAP AN: $"
WR9 DB 10, 13, "DAP AN SAI!!!"
    DB 10, 13, "DAP AN LA DUNG$"
; Câu hỏi 9, đáp án đúng là Đúng

QUIZ10 DB 10, 13, ""
        DB 10, 13, "10. 6 / 3 = 2."
        DB 10, 13, "DAP AN: $"    
WR10 DB 10, 13, "DAP AN SAI!!!"
     DB 10, 13, "DAP AN LA DUNG$"
; Câu hỏi 10, đáp án đúng là Đúng

; Kết thúc bài quiz

CONG DB 10, 10, "-------------------------------------"
     DB 10, 13, "CHUC MUNG $"
; Dòng chúc mừng

PQUIZ DB 10, 13, ""  
      DB 10, 13, "BAN DA HOAN THANH XONG BAI QUIZ$"
; Thông báo hoàn thành bài quiz

FSCORE DB "10$"
; Số điểm tối đa có thể đạt

MESSAGE2 DB 13, 10, ""
          DB 13, 10, "SO CAU TRA LOI DUNG CUA BAN LA: $"
; Thông báo hiển thị số câu đúng

MESSAGE3 DB 13, 10, "-------------------------------------"
          DB 13, 10, "NHAN PHIM 1 DE LAM LAI HOAC 0 DE THOAT: $"
; Hướng dẫn chọn tiếp tục hoặc thoát

MESSAGE4 DB 13, 10, "-------------------------------------"
          DB 13, 10, "                    *** CAM ON ***"
          DB 13, 10, ""
          DB 13, 10, "                    *** NHOM 3 ***"
          DB 13, 10, ""
          DB 13, 10, "CAC THANH VIEN GOM :    NGUYEN TU KIEN"
          DB 13, 10, ""
          DB 13, 10, "                        TRAN THI ANH DUONG"
          DB 13, 10, ""
          DB 13, 10, "                        VUONG QUOC HUNG"
          DB 13, 10, ""
          DB 13, 10, "                        BUI HUY HOANG$"
; Lời cảm ơn và danh sách thành viên nhóm

.CODE                  ; Bắt đầu phần mã chương trình
MAIN PROC              ; Khai báo thủ tục chính (hàm MAIN)
    MOV AX, @DATA      ; Nạp địa chỉ đoạn dữ liệu vào thanh ghi AX
    MOV DS, AX         ; Gán giá trị AX vào thanh ghi DS (thiết lập DS trỏ đến DATA)
    
    LEA DX, HEADER     ; Tải địa chỉ chuỗi HEADER vào DX
    MOV AH, 9          ; Dịch vụ DOS 09h: hiển thị chuỗi kết thúc bằng $
    INT 21H            ; Gọi ngắt để hiển thị HEADER

    LEA DX, NOTICE     ; Hiển thị chuỗi NOTICE
    MOV AH, 9
    INT 21H
    
    LEA DX, COMNAM     ; Hiển thị chuỗi COMNAM (Yêu cầu nhập tên)
    MOV AH, 9
    INT 21H
    
    LEA DX, SUR        ; Hiển thị yêu cầu nhập họ
    MOV AH, 9
    INT 21H
    LEA DX, INPUTSUR   ; Đọc họ người dùng (sử dụng input có độ dài tối đa)
    MOV AH, 0AH        ; Dịch vụ DOS 0Ah: nhập chuỗi từ bàn phím
    INT 21H
    
    LEA DX, FIR        ; Hiển thị yêu cầu nhập tên
    MOV AH, 9
    INT 21H
    LEA DX, INPUTFIR   ; Đọc tên người dùng
    MOV AH, 0AH
    INT 21H
    
    LEA DX, MI         ; Hiển thị yêu cầu nhập ID
    MOV AH, 9
    INT 21H
    LEA DX, INPUTMI    ; Đọc ID người dùng
    MOV AH, 0AH
    INT 21H

START:                ; Bắt đầu làm bài quiz
    MOV BL, 0          ; Đặt điểm ban đầu = 0 (lưu trong thanh ghi BL)

    LEA DX, MESSAGE1   ; Hiển thị thông báo bắt đầu làm bài
    MOV AH, 9
    INT 21H
    
    MOV AH, 1          ; Dịch vụ 01h: đọc 1 ký tự từ bàn phím
    INT 21H            ; Chờ người dùng nhấn Enter
    
    CMP AL, 0DH        ; So sánh ký tự nhập vào với mã Enter (0DH)
    JE PART1           ; Nếu đúng, chuyển đến phần PART1
    JNE START          ; Nếu sai, yêu cầu nhập lại (lặp lại)

PART1:                ; Phần 1 của quiz
    LEA DX, PAR1       ; Hiển thị tiêu đề phần 1
    MOV AH, 9
    INT 21H 
    LEA DX, DIRECM     ; Hiển thị hướng dẫn
    MOV AH, 9
    INT 21H

QUESTION1:            ; Câu hỏi 1
    LEA DX, QUIZ1
    MOV AH, 9
    INT 21H
    
    MOV AH, 1          ; Nhập câu trả lời từ người dùng
    INT 21H
    CMP AL, 43H        ; So sánh với 'C'
    JE QC1
    CMP AL, 63H        ; So sánh với 'c'
    JE QC1
    JMP QW1            ; Nếu sai, đến phần trả lời sai

QC1:                  ; Trả lời đúng câu 1
    LEA DX, CORRECT
    INC BL             ; Tăng điểm
    MOV AH, 9
    INT 21H
    CALL QUESTION2     ; Gọi tiếp sang câu 2

QW1:                  ; Trả lời sai câu 1
    LEA DX, WR1
    MOV AH, 9
    INT 21H

QUESTION2:            ; Câu hỏi 2
    LEA DX, QUIZ2
    MOV AH, 9
    INT 21H
    
    MOV AH, 1
    INT 21H
    CMP AL, 42H        ; 'B'
    JE QC2
    CMP AL, 62H        ; 'b'
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
    CMP AL, 41H        ; 'A'
    JE QC3
    CMP AL, 61H        ; 'a'
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
    CALL PART2         ; Chuyển sang phần 2

QW5:
    LEA DX, WR5
    MOV AH, 9
    INT 21H

PART2:                ; Phần 2 của quiz
    LEA DX, PAR2
    MOV AH, 9
    INT 21H
    LEA DX, DIRECTF    ; Hiển thị hướng dẫn phần 2
    MOV AH, 9
    INT 21H

QUESTION6:
    LEA DX, QUIZ6
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    CMP AL, 44H        ; 'D'
    JE QC6
    CMP AL, 64H        ; 'd'
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
    CMP AL, 53H        ; 'S'
    JE QC7
    CMP AL, 73H        ; 's'
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
    CALL END_QUIZ      ; Gọi thủ tục kết thúc quiz

QW10:
    LEA DX, WR10
    MOV AH, 9
    INT 21H
    CALL END_QUIZ      ; Gọi thủ tục kết thúc quiz nếu trả lời sai

END_QUIZ:
    LEA DX, CONG               ; Nạp địa chỉ chuỗi chúc mừng vào DX
    MOV AH, 9                  ; AH = 9: dịch vụ in chuỗi kết thúc bằng ký tự '$'
    INT 21H                    ; Gọi hàm DOS để in chuỗi "CHÚC MỪNG"

    MOV SI, OFFSET INPUTSUR+2 ; Bỏ qua 2 byte đầu để trỏ tới dữ liệu họ (tên đệm)
    MOV CL, [INPUTSUR+1]      ; CL = số ký tự thực tế nhập vào
    XOR CH, CH                ; CH = 0 để CX là số vòng lặp (CX = CL)

P1:
    MOV DL, [SI]              ; Lấy từng ký tự họ vào DL
    MOV AH, 2                 ; AH = 2: in một ký tự trong DL
    INT 21H                   ; Gọi DOS để in ký tự
    INC SI                    ; Tăng con trỏ đến ký tự tiếp theo
    LOOP P1                   ; Lặp cho đến khi CX = 0

    MOV DL, ' '               ; DL = khoảng trắng
    MOV AH, 2                 ; In một ký tự
    INT 21H                   ; In khoảng trắng giữa họ và tên

    MOV SI, OFFSET INPUTFIR+2 ; Trỏ đến phần tên (sau 2 byte đầu)
    MOV CL, [INPUTFIR+1]      ; CL = số ký tự tên thực tế nhập vào
    XOR CH, CH                ; CH = 0 để CX đúng

P2:
    MOV DL, [SI]              ; Lấy từng ký tự tên vào DL
    MOV AH, 2                 ; In ký tự
    INT 21H
    INC SI
    LOOP P2                   ; Lặp cho đến khi CX = 0

    LEA DX, PQUIZ             ; Nạp địa chỉ chuỗi thông báo hoàn thành quiz
    MOV AH, 9
    INT 21H                   ; In thông báo "Bạn đã hoàn thành quiz!"

    LEA DX, MESSAGE2          ; Nạp địa chỉ thông báo yêu cầu nhấn phím
    MOV AH, 9
    INT 21H                   ; In thông báo "Nhấn phím để xem điểm"

    ADD BL, 48                ; BL chứa điểm (0–10), chuyển sang mã ASCII ('0' = 48)
    CMP BL, 57                ; So sánh với '9' (ASCII)
    JG TEN                    ; Nếu > 9 (tức là điểm 10), nhảy đến TEN để in "10"

    MOV AH, 2                 ; AH = 2: in ký tự
    MOV DL, BL                ; DL = mã ASCII của điểm
    INT 21H                   ; In điểm 1 chữ số
    CALL EXIT                 ; Gọi EXIT để xử lý tiếp theo

TEN:                          ; Trường hợp điểm là 10
    LEA DX, FSCORE            ; Nạp địa chỉ chuỗi "10"
    MOV AH, 9
    INT 21H                   ; In chuỗi "10"
    CALL EXIT                 ; Gọi EXIT để tiếp tục

EXIT:                         ; Xử lý hiển thị điểm và cho phép chơi lại
    LEA DX, MESSAGE3          ; Nạp địa chỉ thông báo "Bạn muốn chơi lại?"
    MOV AH, 9
    INT 21H                   ; In thông báo

    MOV AH, 1                 ; AH = 1: đọc 1 ký tự từ bàn phím
    INT 21H                   ; AL chứa ký tự nhập

    CMP AL, '1'               ; Nếu người dùng nhấn '1' => chơi lại
    JE START

    CMP AL, '0'               ; Nếu nhấn '0' => kết thúc
    JE FINISH

    JMP EXIT                  ; Nếu nhập sai, hỏi lại

FINISH:                       ; Kết thúc chương trình
    LEA DX, MESSAGE4          ; Nạp địa chỉ thông báo "Thoát chương trình"
    MOV AH, 9
    INT 21H                   ; In thông báo thoát

    MOV AH, 4CH               ; AH = 4Ch: dịch vụ kết thúc chương trình
    INT 21H                   ; Kết thúc chương trình

MAIN ENDP
END MAIN
