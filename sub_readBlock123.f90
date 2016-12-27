    subroutine sub_readBlock123(inFileID, TIME_SEGMENT, EOF_FLAG)    
    
    use datatype
    use block1
    use block2
    use block3
    implicit none
    
    integer(I4B),intent(in) :: inFileID
    integer(I4B),intent(in):: TIME_SEGMENT
    integer(I2B),intent(out):: EOF_FLAG  !/* End Of File Flag
    
    character(len=255) :: infilename
    integer(I4B), parameter:: outFileID = 10
    character(len=255) :: outBlock123
    
    
    inquire(inFileID, name = infilename)
    outBlock123 = infilename(1:len_trim(infilename)-4)//'_'//num2str(TIME_SEGMENT)//'Block123.txt'
    open(outFileID, file = outBlock123, action = 'write')
    
    !/*****************************************************************/
    !/*         Read Common Block 1, Block 2 and Block 3.             */
    !/*****************************************************************/
    !/* Read Block 1 */
    write(outFileID,'(A)')'## ========================================================='
    write(outFileID,'(A)')'## =================--- Block 1 ---========================='
    write(outFileID,'(A)')'## ========================================================='
    
    !/* inquire(inFileID,pos=i)
    !/* write(*,'(2X,A,I10/)')"The position (No.byte) of reading: ",i
    
    write(outFileID,'(A)') '## /* Standard CCSDS date */'
    read(inFileID, IOSTAT = EOF_Flag)iTemp    
    IF( EOF_Flag < 0 ) THEN
        print*,'END OF FILE while READING', infilename
        return
    ENDIF
    
    
    pField = ISHFT(iTemp,-24)
        write(outFileID,'("## P field =",/,I3)'), pField
        !write(*,'(1X,"P field = 0x",Z2.2)'), pField
    nDateFrom1950 = IAND(iTemp,16777215)    !// 'FFFFFF'
        write(outFileID,'(A,/,i12)')'## Number of days from 01/01/1950:', nDateFrom1950
    read(inFileID)nMillisecond
        write(outFileID,'(A,/,i12)')'## Number of Milliseconds in the day:', nMillisecond
    
    write(outFileID,'(/,A)') '## /* Time and orbit information */'
    read(inFileID)UTfirstPoint
        write(outFileID,'(A,/,2X,I4,5I3.2,I4.3)') &
            '## UT time (year-month-day-hour-minute-second-millisecond):', &
            UTfirstPoint
    read(inFileID)nOrbit, subOrbit
        write(outFileID,'(A,/,i12)')'## Orbit number:',nOrbit
        write(outFileID,'(A,/,i2)')'## Sub-Orbit (0: downward, 1: upward ):', subOrbit
    read(inFileID)TelemetryStation
        write(outFileID,'(A,/,A)')"## Telemetry Station's name : ",TelemetryStation
    
    write(outFileID,'(/,A)') '## /* Code and Calibration versions */'
    read(inFileID)SoftVer, SoftSubVer
    read(inFileID)CaliVer, CaliSubVer
        write(outFileID,'("## Soft Version = ",/,I1,".",I1)')SoftVer,SoftSubVer
        write(outFileID,'("## Calibration Version = ",/,I1,".",I1,/)')CaliVer,CaliSubVer
    

    !/* Read Block 2 */
    write(outFileID,'(A)')'## ========================================================='
    write(outFileID,'(A)')'## =================--- Block 2 ---========================='
    write(outFileID,'(A)')'## ========================================================='
    
    !/* inquire(inFileID,pos=i)
    !/* write(*,'(2X,A,I10/)')"The position (No.byte) of reading: ",i
    
    write(outFileID,'(A)') '## /* Obital parameters */'
    read(inFileID)GeocentricLat, GeocentricLon, Alti
    read(inFileID)LTFirstPoint
        write(outFileID, "(A,/,2G12.5)") &
            '## Geocentric Position of Orbit (lat, lon) = ', &
            GeocentricLat, GeocentricLon
        write(outFileID, '(A,/,G12.4)')'## Orbit Altitude (km) = ',Alti
        Write(outFileID,'(A,/,G12.5)') &
            '## Local Time of the first point of the data array (0 to 24 hour):', &
            LTFirstPoint
    
    write(outFileID,'(/,A)')'## /* Geomagnetic parameters */'
    read(inFileID)GeomagLat, GeomagLon
    read(inFileID)MagnetLTFirstPoint
        write(outFileID, "(A,/,2G12.5)") &
            '## Position (lat, lon) in Geomagnetic coordination  =', &
            GeomagLat, GeomagLon
        write(outFileID,'(A,/,G12.5)') '## Magnetic local time of the first point = ',&
            MagnetLTfirstPoint
        
    read(inFileID)InvarLat
    read(inFileID)McIIwainL
        write(outFileID,'(A,/,G12.5)') '## Invariant latitude (-90, +90) = ',InvarLat
        write(outFileID,'(A,/,G12.6)') '## Mc IIwain parameter L (-90, +90) = ', McIIwainL
    read(inFileID) ConjGeocenLat, ConjGeocenLon
    read(inFileID) NorthConjGeocenLat, NorthConjGeocenLon
    read(inFileID) SouthConjGeocenLat, SouthConjGeocenLon
    write(outFileID,"(A,/,2G12.5)") &
        '## Geocentric poistion (lat, lon) of the conjugate point =', &
        ConjGeocenLat, ConjGeocenLon
    write(outFileID,"(A,/,2G12.5)") &
        '## Geocentric poistion (lat, lon) of the North conjugate point at altitute 110 km =', &
        NorthConjGeocenLat, NorthConjGeocenLon
    write(outFileID,"(A,/,2G12.5)") &
        '## Geocentric poistion (lat, lon) of the South conjugate point at altitute 110 km =', &
        SouthConjGeocenLat, SouthConjGeocenLon
    
    read(inFileID)MagModel
        write(outFileID,"(A,/,3G16.4)") &
    "## Components of the magnetic field model at the satellite point (geographic coordinate system), (Bx,By,Bz) =", &
            MagModel(1),MagModel(2),MagModel(3)
    read(inFileID) ProtonGyrofreq
        write(outFileID,'(A,/,G12.4)')'## Proton gyrofrequency at satellite point = ',ProtonGyrofreq
    
    write(outFileID,'(/,A)')'## /* Solar parameters */'
    read(inFileID)SolarPos
        write(outFileID,"(A,/,3G16.7)")  &
            '## Solar position (Xs, Ys, Zs) in the geographic coordinate system: (Xs,Ys,Zs) =', &
            SolarPos(1),SolarPos(2),SolarPos(3)
    
    write(outFileID,'(/,A)') '## /* Code version */'
    read(inFileID)SoftVer, SoftSubVer
        write(outFileID,'("## Soft Version = ",/,I1,".",I1,/)')SoftVer,SoftSubVer
        
    !/* Read Block 3 */
    write(outFileID,'(A)')'## ========================================================='
    write(outFileID,'(A)')'## =================--- Block 3 ---========================='
    write(outFileID,'(A)')'## ========================================================='
    
    !/* inquire(inFileID,pos=i)
    !/* write(*,'(2X,A,I10/)')"The position (No.byte) of reading: ",i 
    write(outFileID,'(A)')'## /* Attitude Parameters */'
    read(inFileID) Msat2geo, Mgeo2lgm
    write(outFileID,'(A,/,A)')'## Matrix from satellite coordinate system to geographic coordinate system, Msat2geo = '
    write(outFileID,'(3G16.7)')Msat2geo
    write(outFileID,'(A,/,A)')'## Matrix from geographic coordinate system to local geomagnetic coordinate system, Mgeo2lgm = '
    write(outFileID,'(3G16.7)')Mgeo2lgm
    read(inFileID) Quality
    write(outFileID,'(A,/,I3)')'## Quality index of attitude parameters = ',Quality
    
    write(outFileID,'(/,A)')'## /* Code Version */'
    read(inFileID)SoftVer, SoftSubVer
        write(outFileID,'("## Soft Version = ",/,I1,".",I1)')SoftVer,SoftSubVer
          
    
    close(outFileID)
    write(*,'(A,/,A,/)')'===> The Contents in Block1, Block2, and Block3 were output into the file:', &
        trim(outBlock123)
    end subroutine sub_readBlock123
