#!/bin/bash
gfortran -c datatype.f90 mod_block1.f90 mod_block2.f90 mod_block3.f90
gfortran  datatype.f90 mod_block4_1135.f90 mod_Block4_1136.f90 mod_Block4_1137.f90 \
	    mod_block1.f90 mod_block2.f90 mod_block3.f90  \
	    sub_readBlock123.f90 sub_readIMSC1135.f90 sub_readIMSC1136.f90 sub_readIMSC1137.f90 \
	    read_IMSC.f90 -o readIMSC.out

rm *.mod *.o
