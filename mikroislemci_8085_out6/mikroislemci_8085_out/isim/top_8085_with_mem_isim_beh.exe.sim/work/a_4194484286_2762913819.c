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
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_2763492388968962707_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_3488768496604610246_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_4194484286_2762913819_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    int t15;
    int t16;
    int t17;
    int t18;
    int t19;
    int t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned char t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(1061, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 3792);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(1062, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t5 = t1;
    memset(t5, (unsigned char)2, 5U);
    t6 = (t0 + 3888);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(1064, ng0);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (t0 + 2248U);
    t6 = *((char **)t2);
    t11 = (0 - 4);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t2 = (t6 + t14);
    *((unsigned char *)t2) = t4;
    xsi_set_current_line(1066, ng0);
    t1 = (t0 + 6402);
    *((int *)t1) = 1;
    t2 = (t0 + 6406);
    *((int *)t2) = 4;
    t11 = 1;
    t15 = 4;

LAB7:    if (t11 <= t15)
        goto LAB8;

LAB10:    xsi_set_current_line(1070, ng0);
    t1 = (t0 + 6410);
    *((int *)t1) = 0;
    t2 = (t0 + 6414);
    *((int *)t2) = 4;
    t11 = 0;
    t15 = 4;

LAB12:    if (t11 <= t15)
        goto LAB13;

LAB15:    xsi_set_current_line(1075, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB20;

LAB22:
LAB21:    goto LAB3;

LAB8:    xsi_set_current_line(1067, ng0);
    t5 = (t0 + 2248U);
    t6 = *((char **)t5);
    t5 = (t0 + 6402);
    t16 = *((int *)t5);
    t17 = (t16 - 1);
    t18 = (t17 - 4);
    t12 = (t18 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, t17);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t7 = (t6 + t14);
    t3 = *((unsigned char *)t7);
    t8 = (t0 + 1832U);
    t9 = *((char **)t8);
    t8 = (t0 + 6402);
    t19 = *((int *)t8);
    t20 = (t19 - 1);
    t21 = (t20 - 4);
    t22 = (t21 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, t20);
    t23 = (1U * t22);
    t24 = (0 + t23);
    t10 = (t9 + t24);
    t4 = *((unsigned char *)t10);
    t25 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t3, t4);
    t26 = (t0 + 2248U);
    t27 = *((char **)t26);
    t26 = (t0 + 6402);
    t28 = *((int *)t26);
    t29 = (t28 - 4);
    t30 = (t29 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t26));
    t31 = (1U * t30);
    t32 = (0 + t31);
    t33 = (t27 + t32);
    *((unsigned char *)t33) = t25;

LAB9:    t1 = (t0 + 6402);
    t11 = *((int *)t1);
    t2 = (t0 + 6406);
    t15 = *((int *)t2);
    if (t11 == t15)
        goto LAB10;

LAB11:    t16 = (t11 + 1);
    t11 = t16;
    t5 = (t0 + 6402);
    *((int *)t5) = t11;
    goto LAB7;

LAB13:    xsi_set_current_line(1071, ng0);
    t5 = (t0 + 2248U);
    t6 = *((char **)t5);
    t5 = (t0 + 6410);
    t16 = *((int *)t5);
    t17 = (t16 - 4);
    t12 = (t17 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t5));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t7 = (t6 + t14);
    t3 = *((unsigned char *)t7);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB16;

LAB18:
LAB17:
LAB14:    t1 = (t0 + 6410);
    t11 = *((int *)t1);
    t2 = (t0 + 6414);
    t15 = *((int *)t2);
    if (t11 == t15)
        goto LAB15;

LAB19:    t16 = (t11 + 1);
    t11 = t16;
    t5 = (t0 + 6410);
    *((int *)t5) = t11;
    goto LAB12;

LAB16:    xsi_set_current_line(1072, ng0);
    t8 = (t0 + 1832U);
    t9 = *((char **)t8);
    t8 = (t0 + 6410);
    t18 = *((int *)t8);
    t19 = (t18 - 4);
    t22 = (t19 * -1);
    xsi_vhdl_check_range_of_index(4, 0, -1, *((int *)t8));
    t23 = (1U * t22);
    t24 = (0 + t23);
    t10 = (t9 + t24);
    t25 = *((unsigned char *)t10);
    t34 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t25);
    t26 = (t0 + 6410);
    t20 = *((int *)t26);
    t21 = (t20 - 4);
    t30 = (t21 * -1);
    t31 = (1 * t30);
    t32 = (0U + t31);
    t27 = (t0 + 3888);
    t33 = (t27 + 56U);
    t35 = *((char **)t33);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    *((unsigned char *)t37) = t34;
    xsi_driver_first_trans_delta(t27, t32, 1, 0LL);
    goto LAB17;

LAB20:    xsi_set_current_line(1076, ng0);
    t1 = xsi_get_transient_memory(5U);
    memset(t1, 0, 5U);
    t5 = t1;
    memset(t5, (unsigned char)2, 5U);
    t6 = (t0 + 3888);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 5U);
    xsi_driver_first_trans_fast(t6);
    goto LAB21;

}

static void work_a_4194484286_2762913819_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(1080, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3952);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 5U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3808);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4194484286_2762913819_init()
{
	static char *pe[] = {(void *)work_a_4194484286_2762913819_p_0,(void *)work_a_4194484286_2762913819_p_1};
	xsi_register_didat("work_a_4194484286_2762913819", "isim/top_8085_with_mem_isim_beh.exe.sim/work/a_4194484286_2762913819.didat");
	xsi_register_executes(pe);
}
