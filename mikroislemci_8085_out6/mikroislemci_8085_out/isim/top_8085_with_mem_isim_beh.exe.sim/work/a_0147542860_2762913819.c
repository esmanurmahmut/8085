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
unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768496604610246_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_0147542860_2762913819_p_0(char *t0)
{
    char t47[16];
    char t48[16];
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
    unsigned char t35;
    unsigned char t36;
    unsigned char t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t49;

LAB0:    xsi_set_current_line(644, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(646, ng0);
    t1 = (t0 + 1152U);
    t3 = ieee_p_2592010699_sub_2763492388968962707_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:
LAB3:    t1 = (t0 + 4640);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(645, ng0);
    t1 = (t0 + 7960);
    t6 = (t0 + 4752);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 16U);
    xsi_driver_first_trans_fast(t6);
    goto LAB3;

LAB5:    xsi_set_current_line(647, ng0);
    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (t0 + 2608U);
    t6 = *((char **)t2);
    t11 = (0 - 15);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t2 = (t6 + t14);
    *((unsigned char *)t2) = t4;
    xsi_set_current_line(648, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 2728U);
    t5 = *((char **)t1);
    t11 = (0 - 15);
    t12 = (t11 * -1);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t1 = (t5 + t14);
    *((unsigned char *)t1) = t3;
    xsi_set_current_line(649, ng0);
    t1 = (t0 + 7976);
    *((int *)t1) = 1;
    t2 = (t0 + 7980);
    *((int *)t2) = 15;
    t11 = 1;
    t15 = 15;

LAB8:    if (t11 <= t15)
        goto LAB9;

LAB11:    xsi_set_current_line(654, ng0);
    t1 = (t0 + 7984);
    *((int *)t1) = 0;
    t2 = (t0 + 7988);
    *((int *)t2) = 15;
    t11 = 0;
    t15 = 15;

LAB13:    if (t11 <= t15)
        goto LAB14;

LAB16:    xsi_set_current_line(659, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t4 = *((unsigned char *)t5);
    t6 = ((IEEE_P_2592010699) + 4000);
    t1 = xsi_base_array_concat(t1, t47, t6, (char)99, t3, (char)99, t4, (char)101);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t25 = *((unsigned char *)t8);
    t9 = ((IEEE_P_2592010699) + 4000);
    t7 = xsi_base_array_concat(t7, t48, t9, (char)97, t1, t47, (char)99, t25, (char)101);
    t10 = (t0 + 2848U);
    t26 = *((char **)t10);
    t10 = (t26 + 0);
    t12 = (1U + 1U);
    t13 = (t12 + 1U);
    memcpy(t10, t7, t13);
    xsi_set_current_line(660, ng0);
    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    t1 = (t0 + 7992);
    t11 = xsi_mem_cmp(t1, t2, 3U);
    if (t11 == 1)
        goto LAB25;

LAB29:    t6 = (t0 + 7995);
    t15 = xsi_mem_cmp(t6, t2, 3U);
    if (t15 == 1)
        goto LAB26;

LAB30:    t8 = (t0 + 7998);
    t16 = xsi_mem_cmp(t8, t2, 3U);
    if (t16 == 1)
        goto LAB27;

LAB31:
LAB28:    xsi_set_current_line(674, ng0);

LAB24:    goto LAB6;

LAB9:    xsi_set_current_line(650, ng0);
    t5 = (t0 + 2608U);
    t6 = *((char **)t5);
    t5 = (t0 + 7976);
    t16 = *((int *)t5);
    t17 = (t16 - 1);
    t18 = (t17 - 15);
    t12 = (t18 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t17);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t7 = (t6 + t14);
    t3 = *((unsigned char *)t7);
    t8 = (t0 + 2312U);
    t9 = *((char **)t8);
    t8 = (t0 + 7976);
    t19 = *((int *)t8);
    t20 = (t19 - 1);
    t21 = (t20 - 15);
    t22 = (t21 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t20);
    t23 = (1U * t22);
    t24 = (0 + t23);
    t10 = (t9 + t24);
    t4 = *((unsigned char *)t10);
    t25 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t3, t4);
    t26 = (t0 + 2608U);
    t27 = *((char **)t26);
    t26 = (t0 + 7976);
    t28 = *((int *)t26);
    t29 = (t28 - 15);
    t30 = (t29 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t26));
    t31 = (1U * t30);
    t32 = (0 + t31);
    t33 = (t27 + t32);
    *((unsigned char *)t33) = t25;
    xsi_set_current_line(651, ng0);
    t1 = (t0 + 2728U);
    t2 = *((char **)t1);
    t1 = (t0 + 7976);
    t16 = *((int *)t1);
    t17 = (t16 - 1);
    t18 = (t17 - 15);
    t12 = (t18 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t17);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t5 = (t2 + t14);
    t3 = *((unsigned char *)t5);
    t6 = (t0 + 2312U);
    t7 = *((char **)t6);
    t6 = (t0 + 7976);
    t19 = *((int *)t6);
    t20 = (t19 - 1);
    t21 = (t20 - 15);
    t22 = (t21 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t20);
    t23 = (1U * t22);
    t24 = (0 + t23);
    t8 = (t7 + t24);
    t4 = *((unsigned char *)t8);
    t25 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t3, t4);
    t9 = (t0 + 2728U);
    t10 = *((char **)t9);
    t9 = (t0 + 7976);
    t28 = *((int *)t9);
    t29 = (t28 - 15);
    t30 = (t29 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t9));
    t31 = (1U * t30);
    t32 = (0 + t31);
    t26 = (t10 + t32);
    *((unsigned char *)t26) = t25;

LAB10:    t1 = (t0 + 7976);
    t11 = *((int *)t1);
    t2 = (t0 + 7980);
    t15 = *((int *)t2);
    if (t11 == t15)
        goto LAB11;

LAB12:    t16 = (t11 + 1);
    t11 = t16;
    t5 = (t0 + 7976);
    *((int *)t5) = t11;
    goto LAB8;

LAB14:    xsi_set_current_line(655, ng0);
    t5 = (t0 + 2608U);
    t6 = *((char **)t5);
    t5 = (t0 + 7984);
    t16 = *((int *)t5);
    t17 = (t16 - 15);
    t12 = (t17 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t5));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t7 = (t6 + t14);
    t4 = *((unsigned char *)t7);
    t25 = (t4 == (unsigned char)3);
    if (t25 == 1)
        goto LAB20;

LAB21:    t8 = (t0 + 2728U);
    t9 = *((char **)t8);
    t8 = (t0 + 7984);
    t18 = *((int *)t8);
    t19 = (t18 - 15);
    t22 = (t19 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t8));
    t23 = (1U * t22);
    t24 = (0 + t23);
    t10 = (t9 + t24);
    t34 = *((unsigned char *)t10);
    t35 = (t34 == (unsigned char)2);
    t3 = t35;

LAB22:    if (t3 != 0)
        goto LAB17;

LAB19:
LAB18:
LAB15:    t1 = (t0 + 7984);
    t11 = *((int *)t1);
    t2 = (t0 + 7988);
    t15 = *((int *)t2);
    if (t11 == t15)
        goto LAB16;

LAB23:    t16 = (t11 + 1);
    t11 = t16;
    t5 = (t0 + 7984);
    *((int *)t5) = t11;
    goto LAB13;

LAB17:    xsi_set_current_line(656, ng0);
    t26 = (t0 + 2312U);
    t27 = *((char **)t26);
    t26 = (t0 + 7984);
    t20 = *((int *)t26);
    t21 = (t20 - 15);
    t30 = (t21 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t26));
    t31 = (1U * t30);
    t32 = (0 + t31);
    t33 = (t27 + t32);
    t36 = *((unsigned char *)t33);
    t37 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t36);
    t38 = (t0 + 7984);
    t28 = *((int *)t38);
    t29 = (t28 - 15);
    t39 = (t29 * -1);
    t40 = (1 * t39);
    t41 = (0U + t40);
    t42 = (t0 + 4752);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    *((unsigned char *)t46) = t37;
    xsi_driver_first_trans_delta(t42, t41, 1, 0LL);
    goto LAB18;

LAB20:    t3 = (unsigned char)1;
    goto LAB22;

LAB25:    xsi_set_current_line(662, ng0);
    t10 = (t0 + 8001);
    *((int *)t10) = 7;
    t26 = (t0 + 8005);
    *((int *)t26) = 0;
    t17 = 7;
    t18 = 0;

LAB33:    if (t17 >= t18)
        goto LAB34;

LAB36:    goto LAB24;

LAB26:    xsi_set_current_line(667, ng0);
    t1 = (t0 + 8009);
    *((int *)t1) = 7;
    t2 = (t0 + 8013);
    *((int *)t2) = 0;
    t11 = 7;
    t15 = 0;

LAB38:    if (t11 >= t15)
        goto LAB39;

LAB41:    goto LAB24;

LAB27:    xsi_set_current_line(672, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 4752);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast(t1);
    goto LAB24;

LAB32:;
LAB34:    xsi_set_current_line(663, ng0);
    t27 = (t0 + 1832U);
    t33 = *((char **)t27);
    t27 = (t0 + 8001);
    t19 = *((int *)t27);
    t20 = (t19 - 7);
    t12 = (t20 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t27));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t38 = (t33 + t14);
    t3 = *((unsigned char *)t38);
    t42 = (t0 + 8001);
    t21 = *((int *)t42);
    t28 = (t21 - 15);
    t22 = (t28 * -1);
    t23 = (1 * t22);
    t24 = (0U + t23);
    t43 = (t0 + 4752);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    t46 = (t45 + 56U);
    t49 = *((char **)t46);
    *((unsigned char *)t49) = t3;
    xsi_driver_first_trans_delta(t43, t24, 1, 0LL);
    xsi_set_current_line(664, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 8001);
    t11 = *((int *)t1);
    t15 = (t11 + 8);
    t16 = (t15 - 15);
    t12 = (t16 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, t15);
    t13 = (1U * t12);
    t14 = (0 + t13);
    t5 = (t2 + t14);
    t3 = *((unsigned char *)t5);
    t6 = (t0 + 8001);
    t19 = *((int *)t6);
    t20 = (t19 + 8);
    t21 = (t20 - 15);
    t22 = (t21 * -1);
    t23 = (1 * t22);
    t24 = (0U + t23);
    t7 = (t0 + 4752);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t26 = *((char **)t10);
    *((unsigned char *)t26) = t3;
    xsi_driver_first_trans_delta(t7, t24, 1, 0LL);

LAB35:    t1 = (t0 + 8001);
    t17 = *((int *)t1);
    t2 = (t0 + 8005);
    t18 = *((int *)t2);
    if (t17 == t18)
        goto LAB36;

LAB37:    t11 = (t17 + -1);
    t17 = t11;
    t5 = (t0 + 8001);
    *((int *)t5) = t17;
    goto LAB33;

LAB39:    xsi_set_current_line(668, ng0);
    t5 = (t0 + 1832U);
    t6 = *((char **)t5);
    t5 = (t0 + 8009);
    t16 = *((int *)t5);
    t17 = (t16 - 7);
    t12 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t5));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t7 = (t6 + t14);
    t3 = *((unsigned char *)t7);
    t8 = (t0 + 8009);
    t18 = *((int *)t8);
    t19 = (t18 + 8);
    t20 = (t19 - 15);
    t22 = (t20 * -1);
    t23 = (1 * t22);
    t24 = (0U + t23);
    t9 = (t0 + 4752);
    t10 = (t9 + 56U);
    t26 = *((char **)t10);
    t27 = (t26 + 56U);
    t33 = *((char **)t27);
    *((unsigned char *)t33) = t3;
    xsi_driver_first_trans_delta(t9, t24, 1, 0LL);
    xsi_set_current_line(669, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 8009);
    t16 = *((int *)t1);
    t17 = (t16 - 15);
    t12 = (t17 * -1);
    xsi_vhdl_check_range_of_index(15, 0, -1, *((int *)t1));
    t13 = (1U * t12);
    t14 = (0 + t13);
    t5 = (t2 + t14);
    t3 = *((unsigned char *)t5);
    t6 = (t0 + 8009);
    t18 = *((int *)t6);
    t19 = (t18 - 15);
    t22 = (t19 * -1);
    t23 = (1 * t22);
    t24 = (0U + t23);
    t7 = (t0 + 4752);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t26 = *((char **)t10);
    *((unsigned char *)t26) = t3;
    xsi_driver_first_trans_delta(t7, t24, 1, 0LL);

LAB40:    t1 = (t0 + 8009);
    t11 = *((int *)t1);
    t2 = (t0 + 8013);
    t15 = *((int *)t2);
    if (t11 == t15)
        goto LAB41;

LAB42:    t16 = (t11 + -1);
    t11 = t16;
    t5 = (t0 + 8009);
    *((int *)t5) = t11;
    goto LAB38;

}

static void work_a_0147542860_2762913819_p_1(char *t0)
{
    char t16[16];
    char t26[16];
    char t36[16];
    char t46[16];
    char t56[16];
    char t66[16];
    char t76[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned char t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned char t44;
    char *t45;
    char *t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    char *t55;
    char *t57;
    char *t58;
    char *t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned char t64;
    char *t65;
    char *t67;
    char *t68;
    char *t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned char t74;
    char *t75;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned char t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;

LAB0:    xsi_set_current_line(679, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = (7 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 2312U);
    t9 = *((char **)t8);
    t10 = (6 - 15);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t17 = ((IEEE_P_2592010699) + 4000);
    t15 = xsi_base_array_concat(t15, t16, t17, (char)99, t7, (char)99, t14, (char)101);
    t18 = (t0 + 2312U);
    t19 = *((char **)t18);
    t20 = (5 - 15);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t18 = (t19 + t23);
    t24 = *((unsigned char *)t18);
    t27 = ((IEEE_P_2592010699) + 4000);
    t25 = xsi_base_array_concat(t25, t26, t27, (char)97, t15, t16, (char)99, t24, (char)101);
    t28 = (t0 + 2312U);
    t29 = *((char **)t28);
    t30 = (4 - 15);
    t31 = (t30 * -1);
    t32 = (1U * t31);
    t33 = (0 + t32);
    t28 = (t29 + t33);
    t34 = *((unsigned char *)t28);
    t37 = ((IEEE_P_2592010699) + 4000);
    t35 = xsi_base_array_concat(t35, t36, t37, (char)97, t25, t26, (char)99, t34, (char)101);
    t38 = (t0 + 2312U);
    t39 = *((char **)t38);
    t40 = (3 - 15);
    t41 = (t40 * -1);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t38 = (t39 + t43);
    t44 = *((unsigned char *)t38);
    t47 = ((IEEE_P_2592010699) + 4000);
    t45 = xsi_base_array_concat(t45, t46, t47, (char)97, t35, t36, (char)99, t44, (char)101);
    t48 = (t0 + 2312U);
    t49 = *((char **)t48);
    t50 = (2 - 15);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t57 = ((IEEE_P_2592010699) + 4000);
    t55 = xsi_base_array_concat(t55, t56, t57, (char)97, t45, t46, (char)99, t54, (char)101);
    t58 = (t0 + 2312U);
    t59 = *((char **)t58);
    t60 = (1 - 15);
    t61 = (t60 * -1);
    t62 = (1U * t61);
    t63 = (0 + t62);
    t58 = (t59 + t63);
    t64 = *((unsigned char *)t58);
    t67 = ((IEEE_P_2592010699) + 4000);
    t65 = xsi_base_array_concat(t65, t66, t67, (char)97, t55, t56, (char)99, t64, (char)101);
    t68 = (t0 + 2312U);
    t69 = *((char **)t68);
    t70 = (0 - 15);
    t71 = (t70 * -1);
    t72 = (1U * t71);
    t73 = (0 + t72);
    t68 = (t69 + t73);
    t74 = *((unsigned char *)t68);
    t77 = ((IEEE_P_2592010699) + 4000);
    t75 = xsi_base_array_concat(t75, t76, t77, (char)97, t65, t66, (char)99, t74, (char)101);
    t78 = (1U + 1U);
    t79 = (t78 + 1U);
    t80 = (t79 + 1U);
    t81 = (t80 + 1U);
    t82 = (t81 + 1U);
    t83 = (t82 + 1U);
    t84 = (t83 + 1U);
    t85 = (8U != t84);
    if (t85 == 1)
        goto LAB5;

LAB6:    t86 = (t0 + 4816);
    t87 = (t86 + 56U);
    t88 = *((char **)t87);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    memcpy(t90, t75, 8U);
    xsi_driver_first_trans_fast_port(t86);

LAB2:    t91 = (t0 + 4656);
    *((int *)t91) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t84, 0);
    goto LAB6;

}

static void work_a_0147542860_2762913819_p_2(char *t0)
{
    char t16[16];
    char t26[16];
    char t36[16];
    char t46[16];
    char t56[16];
    char t66[16];
    char t76[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t27;
    char *t28;
    char *t29;
    int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned char t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned char t44;
    char *t45;
    char *t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    char *t55;
    char *t57;
    char *t58;
    char *t59;
    int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned char t64;
    char *t65;
    char *t67;
    char *t68;
    char *t69;
    int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned char t74;
    char *t75;
    char *t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned char t85;
    char *t86;
    char *t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;

LAB0:    xsi_set_current_line(680, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = (15 - 15);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 2312U);
    t9 = *((char **)t8);
    t10 = (14 - 15);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t17 = ((IEEE_P_2592010699) + 4000);
    t15 = xsi_base_array_concat(t15, t16, t17, (char)99, t7, (char)99, t14, (char)101);
    t18 = (t0 + 2312U);
    t19 = *((char **)t18);
    t20 = (13 - 15);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t23 = (0 + t22);
    t18 = (t19 + t23);
    t24 = *((unsigned char *)t18);
    t27 = ((IEEE_P_2592010699) + 4000);
    t25 = xsi_base_array_concat(t25, t26, t27, (char)97, t15, t16, (char)99, t24, (char)101);
    t28 = (t0 + 2312U);
    t29 = *((char **)t28);
    t30 = (12 - 15);
    t31 = (t30 * -1);
    t32 = (1U * t31);
    t33 = (0 + t32);
    t28 = (t29 + t33);
    t34 = *((unsigned char *)t28);
    t37 = ((IEEE_P_2592010699) + 4000);
    t35 = xsi_base_array_concat(t35, t36, t37, (char)97, t25, t26, (char)99, t34, (char)101);
    t38 = (t0 + 2312U);
    t39 = *((char **)t38);
    t40 = (11 - 15);
    t41 = (t40 * -1);
    t42 = (1U * t41);
    t43 = (0 + t42);
    t38 = (t39 + t43);
    t44 = *((unsigned char *)t38);
    t47 = ((IEEE_P_2592010699) + 4000);
    t45 = xsi_base_array_concat(t45, t46, t47, (char)97, t35, t36, (char)99, t44, (char)101);
    t48 = (t0 + 2312U);
    t49 = *((char **)t48);
    t50 = (10 - 15);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t57 = ((IEEE_P_2592010699) + 4000);
    t55 = xsi_base_array_concat(t55, t56, t57, (char)97, t45, t46, (char)99, t54, (char)101);
    t58 = (t0 + 2312U);
    t59 = *((char **)t58);
    t60 = (9 - 15);
    t61 = (t60 * -1);
    t62 = (1U * t61);
    t63 = (0 + t62);
    t58 = (t59 + t63);
    t64 = *((unsigned char *)t58);
    t67 = ((IEEE_P_2592010699) + 4000);
    t65 = xsi_base_array_concat(t65, t66, t67, (char)97, t55, t56, (char)99, t64, (char)101);
    t68 = (t0 + 2312U);
    t69 = *((char **)t68);
    t70 = (8 - 15);
    t71 = (t70 * -1);
    t72 = (1U * t71);
    t73 = (0 + t72);
    t68 = (t69 + t73);
    t74 = *((unsigned char *)t68);
    t77 = ((IEEE_P_2592010699) + 4000);
    t75 = xsi_base_array_concat(t75, t76, t77, (char)97, t65, t66, (char)99, t74, (char)101);
    t78 = (1U + 1U);
    t79 = (t78 + 1U);
    t80 = (t79 + 1U);
    t81 = (t80 + 1U);
    t82 = (t81 + 1U);
    t83 = (t82 + 1U);
    t84 = (t83 + 1U);
    t85 = (8U != t84);
    if (t85 == 1)
        goto LAB5;

LAB6:    t86 = (t0 + 4880);
    t87 = (t86 + 56U);
    t88 = *((char **)t87);
    t89 = (t88 + 56U);
    t90 = *((char **)t89);
    memcpy(t90, t75, 8U);
    xsi_driver_first_trans_fast_port(t86);

LAB2:    t91 = (t0 + 4672);
    *((int *)t91) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t84, 0);
    goto LAB6;

}


extern void work_a_0147542860_2762913819_init()
{
	static char *pe[] = {(void *)work_a_0147542860_2762913819_p_0,(void *)work_a_0147542860_2762913819_p_1,(void *)work_a_0147542860_2762913819_p_2};
	xsi_register_didat("work_a_0147542860_2762913819", "isim/top_8085_with_mem_isim_beh.exe.sim/work/a_0147542860_2762913819.didat");
	xsi_register_executes(pe);
}
