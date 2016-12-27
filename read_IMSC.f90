    program read_IMSC
    
    !/* windows system command module within ifort compilier*/
    !use ifport

    use datatype
    implicit none
    
    !/* Variables */
    character(len=255) :: inFileName
    integer(I4B), parameter:: inFileID = 9
    integer(I2B) :: EOF_FLAG = 0 
    character(len=4) :: payloadID
    integer(I4B) :: i, j=1
    

    !/* Body of read_IMSC */
    !inFileName = &
    !"G:\Data_DEMETER\20080101_0623\186920_N1\DMT_N1_1135_186920_20080101_001132_20080101_002959.DAT"
    !"G:\Data_DEMETER\20080101_0623\186921_N1\1135\DMT_N1_1135_186921_20080101_012702_20080101_012859.DAT"
    !"..\..\N1Data\DMT_N1_1135_20100402_173200_20100403_010000.DAT"
    !"..\..\N1Data\DMT_N1_1135_20100402_173200_20100403_010000_B0FIELD.DAT"

    
    !/* Read input Filename from the standard-io */
    write(*,*)"Please Enter the IMSC-1135/1136/1137 N1 Data File's Name:"
    read(*,*)inFilename
    
    
    !/* Extract Payload ID */
    i = INDEX(inFileName,DMT_N1)+len(DMT_N1)
    payloadID  = inFileName( i : i+4 )
    write(*,*) payloadID
    
    open(inFileID,file=inFileName,status='old',action='read', &
           access='stream',form='unformatted',convert='big_endian')
    
    
    TIME_SEGMENT: DO 

    !/*****************************************************************/
    !/*         Read Common Block 1, Block 2 and Block 3.             */
    !/*****************************************************************/
    call sub_readBlock123(inFileID, j, EOF_FLAG)
    
    IF( EOF_Flag < 0 ) EXIT TIME_SEGMENT

    !/*****************************************************************/
    !/*             Read Specific Block 4 for IMSC.                   */
    !/*              (APID = 1135, 1136, or 1137)                     */
    !/*****************************************************************/
    if(payloadID == '1135') then
        write(*,*)'Payload ID = ',payloadID
        call sub_readIMSC1135(inFileID, j)
    elseif(payloadID == '1136') then
        write(*,*)'Payload ID = ',payloadID
        call sub_readIMSC1136(inFileID, j)
    elseif(payloadID == '1137') then
        write(*,*)'Payload ID = ',payloadID
        call sub_readIMSC1137(inFileID, j)
    else
        write(*,*)'Payload ID = ', payloadID
        write(*,*)'No this Payload ID exists.'
        close(inFileID)
        stop
    endif
    
    !/*****************************************************************/
    !/*                            END                                */
    !/*****************************************************************/    
        j = j+1
        PRINT*, 'TIME_SEGMENT = ', j
    ENDDO TIME_SEGMENT
    
    close(inFileID)
    
    !pause('EOF') !/* PAUSE is an old feature deleted by GNU-Fortran.
    
    !i = system("move DMT_N1_1135_*_B0FIELD_*Block4.txt 1135Block4")
    !i = system("move DMT_N1_1135_*_B0FIELD_*Block123.txt 1135Block123")
    !i = system("move DMT_N1_1135_*_B0FIELD_*Bx.dat 1135Bx")
    !i = system("move DMT_N1_1135_*_B0FIELD_*By.dat 1135By")
    !i = system("move DMT_N1_1135_*_B0FIELD_*Bz.dat 1135Bz")
    
    !i = system("move DMT_N1_1135_*Block4.txt 1135Block4")
    !i = system("move DMT_N1_1135_*Block123.txt 1135Block123")
    !i = system("move DMT_N1_1135_*Bx.dat 1135Bx")
    !i = system("move DMT_N1_1135_*By.dat 1135By")
    !i = system("move DMT_N1_1135_*Bz.dat 1135Bz")
    
    !write(*,*)'system',i
    !i = system("mkdir 1135")
    !i = system("move DMT_N1_1135_* 1135\")
    
    end program read_IMSC
    
    
