/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/ISEshared/8085/8085/mikroislemci_8085_out6/mikroislemci_8085_out/cpu_8085.vhd";



static void work_a_1537726388_2762913819_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(1086, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(1089, ng0);
    t1 = (t0 + 4977);
    t5 = (t0 + 1648U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 8U);

LAB3:    xsi_set_current_line(1091, ng0);
    t1 = (t0 + 1648U);
    t2 = *((char **)t1);
    t1 = (t0 + 3024);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 2944);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(1087, ng0);
    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 1648U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t5, 8U);
    goto LAB3;

}


extern void work_a_1537726388_2762913819_init()
{
	static char *pe[] = {(void *)work_a_1537726388_2762913819_p_0};
	xsi_register_didat("work_a_1537726388_2762913819", "isim/top_8085_with_mem_isim_beh.exe.sim/work/a_1537726388_2762913819.didat");
	xsi_register_executes(pe);
}
