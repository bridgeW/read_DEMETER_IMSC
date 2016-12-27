    subroutine sub_readIMSC1135(inFileID, TIME_SEGMENT)    
    
    use datatype
    use block4_1135
    
    implicit none
    
    integer(I4B),intent(in):: inFileID
    integer(I4B),intent(in):: TIME_SEGMENT
    
    
    character(len=255) :: infilename
    integer(I4B), parameter:: outFileID = 10
    character(len=255) :: outBlock4head, outBlock4data
    integer(I4B) :: i
    integer(I2B) :: EOF_FLAG  !/* End Of File Flag
    
    inquire(inFileID, name = infilename)
    
    outBlock4head = infilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//'Block4.txt'
    open(outFileID, file = outBlock4head, action = 'write')
    
    !/* Read Block 4-1135, Waveform of ELF field of IMSC. */
    write(outFileID,'(A)')'## ========================================================='
    write(outFileID,'(A)')'## =================--- Block 4-1135 ---===================='
    write(outFileID,'(A)')'## ========================================================='
    
    !/* inquire(inFileID,pos=i)
    !/* write(*,'(2X,A,I10/)')"The position (No.byte) of reading: ",i 

        
    !/* Read Data Header */
    write(outFileID,'(A)')'## /* Data Header */'
    read(inFileID, IOSTAT = EOF_Flag)Dtype
    
    IF( EOF_Flag < 0 ) THEN
        print*,'END OF FILE while READING', infilename
        return
    ENDIF
        
        write(outFileID,'(A,/,A)')'## Date Type = ',Dtype
    read(inFileID)Housekeep
        write(outFileID,'(A,/,16Z3.2,/,16Z3.2)')'## House keeping and status =',Housekeep
    read(inFileID)DCoord
        write(outFileID,'(A,/,A)')"## Data coordinate system ( Senesor , Satellite or B0field ) = ",DCoord
    
    read(inFileID)Msen2sat
        Write(outFileID,'(A)')'## Msen2sat = '
        write(outFileID,'(3F16.7)') Msen2sat
    read(inFileID)DUnit
        write(outFileID,'(A,/,A)')'## Data Unit = ', DUnit
    read(inFileID)SampFreq, SampNum
        write(outFileID,'(A,/,G16.4)')'## Sample Frequency = ', SampFreq
        write(outFileID,'(A,/,I8)')'## Sample data number per component = ', SampNum
        
    read(inFileID)TDuration
        write(outFileID,'(A,/,G16.6)')'## Time Duration of one data array = ', TDuration
    
    close(outFileID)
    write(*,'(A,/,A,/)')'===> The Data Header of Block4 were output into the file:', &
            trim(outBlock4head)
    
    !/* Reading ELF bandwidth waveform */
    write(*,'(/,1X,A)') '/* First Component Waveform */ '
    write(*,'(1X,A,/,10X,A)')"/* Note: 'B1,B2,B3' in sensor coordinate system,", &
            "'Bx,By,Bz' in the other coordinate system. */"
    read(inFileID)Component1, Waveform1
        write(*,*)'First Component name = ', Component1
        !write(*,'(2X,A,/,5G16.6/,5G16.6)')'10 example values of first component:',&
        !    Waveform1(1:10)
        outBlock4data = inFilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//trim(Component1)//'.dat'
        open(outFileID,file=outBlock4data,action='write')
        write(outFileID,'(G16.6)')(Waveform1(i),i=1,size(Waveform1))
        close(outFileID)
        write(*,'(1X,3A,/)')'==>>> ',Component1,'Science Data output completed!'
        
    write(*,'(/,1X,A)') '/* Second Component Waveform */ '
    read(inFileID)Component2, Waveform2
        write(*,*)'Second Component name = ', Component2
        !write(*,'(2X,A,/,5G16.6/,5G16.6)')'10 example values of Second component:',&
        !    Waveform2(1:10)
        outBlock4data = inFilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//trim(Component2)//'.dat'
        open(outFileID,file=outBlock4data,action='write')
        write(outFileID,'(G16.6)')(Waveform2(i),i=1,size(Waveform2))
        close(outFileID)
        write(*,'(1X,3A,/)')'==>>> ',Component2,'Science Data output completed!'
        
    write(*,'(/,1X,A)') '/* Third Component Waveform */ '
    read(inFileID)Component3, Waveform3
        write(*,*)'Third Component name = ', Component3
        !write(*,'(2X,A,/,5G16.6/,5G16.6)')'10 example values of Third component:',&
        !    Waveform3(1:10)
        outBlock4data = inFilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//trim(Component3)//'.dat'
        open(outFileID,file=outBlock4data,action='write')
        write(outFileID,'(G16.6)')(Waveform3(i),i=1,size(Waveform3))
        close(outFileID)
        write(*,'(1X,4A,/)')'==>>> ',trim(Dtype), ' '//Component3,' Science Data Output Completed!'
        
    

    
    end subroutine sub_readIMSC1135
