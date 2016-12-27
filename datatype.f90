module datatype
	INTEGER, PARAMETER :: I4B = SELECTED_INT_KIND(9)
	INTEGER, PARAMETER :: I2B = SELECTED_INT_KIND(4)
	INTEGER, PARAMETER :: I1B = SELECTED_INT_KIND(2)
	INTEGER, PARAMETER :: SP  = KIND(1.0)
	INTEGER, PARAMETER :: DP  = KIND(1.0D0)
	INTEGER, PARAMETER :: SPC = KIND((1.0,1.0))
	INTEGER, PARAMETER :: DPC = KIND((1.0D0,1.0D0))
	INTEGER, PARAMETER :: LGT = KIND(.true.)
	REAL(SP), PARAMETER :: PI=3.141592653589793238462643383279502884197_sp
	REAL(SP), PARAMETER :: PIO2=1.57079632679489661923132169163975144209858_sp
	REAL(SP), PARAMETER :: TWOPI=6.283185307179586476925286766559005768394_sp
	REAL(SP), PARAMETER :: SQRT2=1.41421356237309504880168872420969807856967_sp
	REAL(SP), PARAMETER :: EULER=0.5772156649015328606065120900824024310422_sp
	REAL(DP), PARAMETER :: PI_D=3.141592653589793238462643383279502884197_dp
	REAL(DP), PARAMETER :: PIO2_D=1.57079632679489661923132169163975144209858_dp
	REAL(DP), PARAMETER :: TWOPI_D=6.283185307179586476925286766559005768394_dp
    
    !/* Code and calibration versions */
    integer(I1B) :: SoftVer, SoftSubVer
    integer(I1B) :: CaliVer, CaliSubVer
    
    !/* Payload ID */
    character(len=7), parameter :: IMSC1135ELFWAV = 'N1_1135'
    character(len=7), parameter :: IMSC1135VLFWAV = 'N1_1136'
    character(len=7), parameter :: IMSC1135VLFPSD = 'N1_1137'
    character(len=7), parameter :: DMT_N1 = 'DMT_N1_'
    character(len=7), parameter :: B0FIELD = 'B0FEILD'
    
    
CONTAINS
    function num2str(intNum)
    integer,intent(in) :: intNum
    character(len=:),allocatable:: num2str
    character(len=255):: tmpstr
    write(tmpstr,*)intNum
    allocate(character(len=len_trim(adjustl(tmpstr)))::num2str)
    num2str = trim(adjustl(tmpstr))
    end function num2str
    
!    function num2strN(intNum,n)
!    integer,intent(in) :: intNum,n
!    character(len=:),allocatable:: num2strN
!    character(len=255):: tmpstr
!    write(tmpstr,1)intNum
!1   format(i<n>.<n>)  !/* This feature needs specific compiler support. */
!    allocate(character(len=len_trim(adjustl(tmpstr)))::num2strN)
!    num2strN = trim(adjustl(tmpstr))
!    end function num2strN
    
end module datatype
