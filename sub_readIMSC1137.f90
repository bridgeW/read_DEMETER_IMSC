    subroutine sub_readIMSC1137(inFileID, TIME_SEGMENT)    
    
    use datatype
    use block4_1137
    
    implicit none
    
    integer(I4B),intent(in):: inFileID
    integer(I4B),intent(in):: TIME_SEGMENT
    
    character(len=255) :: infilename
    integer(I4B), parameter:: outFileID = 10
    character(len=255) :: outBlock4head, outBlock4data
    integer(I4B) :: i, j
    integer(I2B) :: EOF_FLAG  !/* End Of File Flag   
    
    
    inquire(inFileID, name = infilename)
    
    outBlock4head = infilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//'Block4.txt'
    open(outFileID, file = outBlock4head, action = 'write')
    
    !/* Read Block 4-1137, Power Spectrum of VLF field of IMSC. */
    write(outFileID,'(A)')'## ========================================================='
    write(outFileID,'(A)')'## =================--- Block 4-1137 ---===================='
    write(outFileID,'(A)')'## ========================================================='  
 
    !/* inquire(inFileID,pos=i)
    !/* write(*,'(2X,A,I10/)')"The position (No.byte) of reading: ",i 
    
    write(outFileID,'(A)')'## /* Data Header */'
    
    read(inFileID, IOSTAT = EOF_Flag)Dtype
    
    IF( EOF_Flag < 0 ) THEN
        print*,'END OF FILE while READING', infilename
        return
    ENDIF
    
    
        write(outFileID,'(A,/,A)')'## Data Type = ',Dtype
    read(inFileID)Housekeep
        write(outFileID,'(A,/,16Z3.2,/,16Z3.2)')'## House keeping and status =',Housekeep
    read(inFileID)DCoord
        write(outFileID,'(A,/,A)')"## Data coordinate system ( Sensor , Satellite or B0field ) = ",DCoord
    read(inFileID)Component
        write(outFileID,'(A,/,A)')'## Component name = ', Component
        write(outFileID,'(A,/,"##",11X,A)')"## /* Note: 'B1,B2,B3' in sensor coordinate system,", &
            "'Bx,By,Bz' in the other coordinate system. */"
    read(inFileID)DUnit
        write(outFileID,'(A,/,A)')'## Data Unit = ', DUnit
    read(inFileID)ConsecutiveSpectrNum
        write(outFileID,'(A,/,I3)')'## Number of Consecutive Spectra (Nb): (2 or 8)', &
            ConsecutiveSpectrNum
    read(inFileID)SpectrFreqNum
        write(outFileID,'(A,/,I5)')'## Number of Spectrum Frequencies (Nbf): (1024 or 256)', &
            SpectrFreqNum
    read(inFileID)TDuration
        write(outFileID,'(A,/,3G12.4)')'## Time Duration of Nb spectra: (16.384, 4.96 or 1.024)', TDuration
    read(inFileID)FreqResolution
        write(outFileID,'(A,/,G12.5)')'## Frequency resolution: (19.53125 or 78.125)', FreqResolution
    read(inFileID)FreqRange
        write(outFileID,'(A,/,2G16.6)')'## sFrequency range: [19.53125 or 78.125 ~ 20000]', FreqRange
    read(inFileID)UTime1Spectr
        write(outFileID,'(A,/,I4,5I3.2,I4.3)') &
            '## UT time of the first spectrum as year-month-day-hour-minute-second-millisecond:', &
            UTime1Spectr
    
    close(outFileID)
    write(*,'(A,/,A,/)')'===> The Data Header of Block4 were output into the file:', &
            trim(outBlock4head)
        
    !/* Reading VLF bandwidth Power Spectrum */
    allocate( NbPowerSpectra(SpectrFreqNum,ConsecutiveSpectrNum) )
    read(inFileID)NbPowerSpectra
    !write(*,'(2X,A,/,5G16.6/,5G16.6)')'10 example PSD values of the first Frequency:', &
    !    NbPowerSpectra(1:10,1)
    
        outBlock4data = inFilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//trim(Component)//'.dat'
        open(outFileID,file=outBlock4data, action='write')
        write(outFileID,'(G16.6)')( (NbPowerSpectra(i,j),i=1,size(NbPowerSpectra,1)),&
                                                  j=1,size(NbPowerSpectra,2) )
        close(outFileID)
        write(*,'(1X,4A,/)')'==>>> ',trim(Dtype),' '//trim(Component),' Science Data Output Completed!'
    deallocate(NbPowerSpectra)
    
    end subroutine sub_readIMSC1137
