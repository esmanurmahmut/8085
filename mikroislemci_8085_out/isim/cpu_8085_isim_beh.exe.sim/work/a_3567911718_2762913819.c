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
static const char *ng0 = "/home/ise/ISEshared/mikroislemci_8085_out6/mikroislemci_8085_out/cpu_8085.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_2592010699_sub_207919886985903570_503743352(char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_3488546069778340532_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768496604610246_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768497506413324_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );
int ieee_p_3620187407_sub_5109402382352621412_3965413181(char *, char *, char *);


static void work_a_3567911718_2762913819_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(416, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 8368);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 8192);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3567911718_2762913819_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(417, ng0);

LAB3:    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 8432);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast(t1);

LAB2:    t7 = (t0 + 8208);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3567911718_2762913819_p_2(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(418, ng0);

LAB3:    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 13696U);
    t4 = ieee_p_2592010699_sub_207919886985903570_503743352(IEEE_P_2592010699, t1, t3, t2);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t7 = (1U * t6);
    t8 = (8U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 8496);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 8224);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t7, 0);
    goto LAB6;

}

static void work_a_3567911718_2762913819_p_3(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(419, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 13680U);
    t4 = ieee_p_2592010699_sub_207919886985903570_503743352(IEEE_P_2592010699, t1, t3, t2);
    t5 = (t1 + 12U);
    t6 = *((unsigned int *)t5);
    t7 = (1U * t6);
    t8 = (8U != t7);
    if (t8 == 1)
        goto LAB5;

LAB6:    t9 = (t0 + 8560);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t4, 8U);
    xsi_driver_first_trans_fast(t9);

LAB2:    t14 = (t0 + 8240);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(8U, t7, 0);
    goto LAB6;

}

static void work_a_3567911718_2762913819_p_4(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    char *t4;
    char *t5;
    int t6;
    int t7;
    int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    int t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned char t32;
    unsigned char t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned char t37;
    unsigned char t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned char t42;
    unsigned char t43;
    char *t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned char t48;
    unsigned char t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned char t55;
    unsigned char t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    unsigned char t63;
    char *t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;

LAB0:    xsi_set_current_line(438, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 13728U);
    t3 = ieee_p_3620187407_sub_5109402382352621412_3965413181(IEEE_P_3620187407, t2, t1);
    t4 = (t0 + 5408U);
    t5 = *((char **)t4);
    t4 = (t5 + 0);
    *((int *)t4) = t3;
    xsi_set_current_line(440, ng0);
    t1 = (t0 + 14172);
    *((int *)t1) = 7;
    t2 = (t0 + 14176);
    *((int *)t2) = 0;
    t3 = 7;
    t6 = 0;

LAB2:    if (t3 >= t6)
        goto LAB3;

LAB5:    xsi_set_current_line(444, ng0);
    t3 = (7 - 1);
    t1 = (t0 + 14180);
    *((int *)t1) = t3;
    t2 = (t0 + 14184);
    *((int *)t2) = 0;
    t6 = t3;
    t7 = 0;

LAB7:    if (t6 >= t7)
        goto LAB8;

LAB10:    xsi_set_current_line(447, ng0);
    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    t3 = (7 - 7);
    t9 = (t3 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t1 = (t2 + t11);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(449, ng0);
    t1 = (t0 + 14188);
    *((int *)t1) = 7;
    t2 = (t0 + 14192);
    *((int *)t2) = 0;
    t3 = 7;
    t6 = 0;

LAB12:    if (t3 >= t6)
        goto LAB13;

LAB15:    xsi_set_current_line(453, ng0);
    t1 = (t0 + 14196);
    *((int *)t1) = 7;
    t2 = (t0 + 14200);
    *((int *)t2) = 0;
    t3 = 7;
    t6 = 0;

LAB17:    if (t3 >= t6)
        goto LAB18;

LAB20:    xsi_set_current_line(457, ng0);
    t1 = (t0 + 14204);
    *((int *)t1) = 7;
    t2 = (t0 + 14208);
    *((int *)t2) = 0;
    t3 = 7;
    t6 = 0;

LAB22:    if (t3 >= t6)
        goto LAB23;

LAB25:    xsi_set_current_line(461, ng0);
    t1 = (t0 + 14212);
    *((int *)t1) = 7;
    t2 = (t0 + 14216);
    *((int *)t2) = 0;
    t3 = 7;
    t6 = 0;

LAB27:    if (t3 >= t6)
        goto LAB28;

LAB30:    xsi_set_current_line(465, ng0);
    t1 = (t0 + 14220);
    *((int *)t1) = 7;
    t2 = (t0 + 14224);
    *((int *)t2) = 0;
    t3 = 7;
    t6 = 0;

LAB32:    if (t3 >= t6)
        goto LAB33;

LAB35:    xsi_set_current_line(467, ng0);
    t1 = (t0 + 5288U);
    t2 = *((char **)t1);
    t1 = (t0 + 8624);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t12 = (t5 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(468, ng0);
    t1 = (t0 + 5288U);
    t2 = *((char **)t1);
    t3 = (0 - 7);
    t9 = (t3 * -1);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t1 = (t2 + t11);
    t13 = *((unsigned char *)t1);
    t4 = (t0 + 5288U);
    t5 = *((char **)t4);
    t6 = (1 - 7);
    t18 = (t6 * -1);
    t19 = (1U * t18);
    t20 = (0 + t19);
    t4 = (t5 + t20);
    t22 = *((unsigned char *)t4);
    t23 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t13, t22);
    t12 = (t0 + 5288U);
    t14 = *((char **)t12);
    t7 = (2 - 7);
    t28 = (t7 * -1);
    t29 = (1U * t28);
    t30 = (0 + t29);
    t12 = (t14 + t30);
    t32 = *((unsigned char *)t12);
    t33 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t23, t32);
    t15 = (t0 + 5288U);
    t21 = *((char **)t15);
    t8 = (3 - 7);
    t34 = (t8 * -1);
    t35 = (1U * t34);
    t36 = (0 + t35);
    t15 = (t21 + t36);
    t37 = *((unsigned char *)t15);
    t38 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t33, t37);
    t24 = (t0 + 5288U);
    t25 = *((char **)t24);
    t16 = (4 - 7);
    t39 = (t16 * -1);
    t40 = (1U * t39);
    t41 = (0 + t40);
    t24 = (t25 + t41);
    t42 = *((unsigned char *)t24);
    t43 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t38, t42);
    t31 = (t0 + 5288U);
    t44 = *((char **)t31);
    t17 = (5 - 7);
    t45 = (t17 * -1);
    t46 = (1U * t45);
    t47 = (0 + t46);
    t31 = (t44 + t47);
    t48 = *((unsigned char *)t31);
    t49 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t43, t48);
    t50 = (t0 + 5288U);
    t51 = *((char **)t50);
    t26 = (6 - 7);
    t52 = (t26 * -1);
    t53 = (1U * t52);
    t54 = (0 + t53);
    t50 = (t51 + t54);
    t55 = *((unsigned char *)t50);
    t56 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t49, t55);
    t57 = (t0 + 5288U);
    t58 = *((char **)t57);
    t27 = (7 - 7);
    t59 = (t27 * -1);
    t60 = (1U * t59);
    t61 = (0 + t60);
    t57 = (t58 + t61);
    t62 = *((unsigned char *)t57);
    t63 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t56, t62);
    t64 = (t0 + 8688);
    t65 = (t64 + 56U);
    t66 = *((char **)t65);
    t67 = (t66 + 56U);
    t68 = *((char **)t67);
    *((unsigned char *)t68) = t63;
    xsi_driver_first_trans_fast_port(t64);
    xsi_set_current_line(469, ng0);
    t1 = (t0 + 5288U);
    t2 = *((char **)t1);
    t1 = (t0 + 8752);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t12 = (t5 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t2, 8U);
    xsi_driver_first_trans_fast(t1);
    t1 = (t0 + 8256);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(441, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14172);
    t7 = *((int *)t4);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t4));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 14172);
    t16 = *((int *)t14);
    t17 = (t16 - 7);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t13, t22);
    t24 = (t0 + 4448U);
    t25 = *((char **)t24);
    t24 = (t0 + 14172);
    t26 = *((int *)t24);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t24));
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t25 + t30);
    *((unsigned char *)t31) = t23;

LAB4:    t1 = (t0 + 14172);
    t3 = *((int *)t1);
    t2 = (t0 + 14176);
    t6 = *((int *)t2);
    if (t3 == t6)
        goto LAB5;

LAB6:    t7 = (t3 + -1);
    t3 = t7;
    t4 = (t0 + 14172);
    *((int *)t4) = t3;
    goto LAB2;

LAB8:    xsi_set_current_line(445, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14180);
    t8 = *((int *)t4);
    t16 = (t8 + 1);
    t17 = (t16 - 7);
    t9 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, t16);
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 4568U);
    t15 = *((char **)t14);
    t14 = (t0 + 14180);
    t26 = *((int *)t14);
    t27 = (t26 - 7);
    t18 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    *((unsigned char *)t21) = t13;

LAB9:    t1 = (t0 + 14180);
    t6 = *((int *)t1);
    t2 = (t0 + 14184);
    t7 = *((int *)t2);
    if (t6 == t7)
        goto LAB10;

LAB11:    t3 = (t6 + -1);
    t6 = t3;
    t4 = (t0 + 14180);
    *((int *)t4) = t6;
    goto LAB7;

LAB13:    xsi_set_current_line(450, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14188);
    t7 = *((int *)t4);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t4));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 14188);
    t16 = *((int *)t14);
    t17 = (t16 - 7);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_3488768497506413324_503743352(IEEE_P_2592010699, t13, t22);
    t32 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t23);
    t24 = (t0 + 4688U);
    t25 = *((char **)t24);
    t24 = (t0 + 14188);
    t26 = *((int *)t24);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t24));
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t25 + t30);
    *((unsigned char *)t31) = t32;

LAB14:    t1 = (t0 + 14188);
    t3 = *((int *)t1);
    t2 = (t0 + 14192);
    t6 = *((int *)t2);
    if (t3 == t6)
        goto LAB15;

LAB16:    t7 = (t3 + -1);
    t3 = t7;
    t4 = (t0 + 14188);
    *((int *)t4) = t3;
    goto LAB12;

LAB18:    xsi_set_current_line(454, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14196);
    t7 = *((int *)t4);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t4));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 14196);
    t16 = *((int *)t14);
    t17 = (t16 - 7);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t13, t22);
    t24 = (t0 + 4808U);
    t25 = *((char **)t24);
    t24 = (t0 + 14196);
    t26 = *((int *)t24);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t24));
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t25 + t30);
    *((unsigned char *)t31) = t23;

LAB19:    t1 = (t0 + 14196);
    t3 = *((int *)t1);
    t2 = (t0 + 14200);
    t6 = *((int *)t2);
    if (t3 == t6)
        goto LAB20;

LAB21:    t7 = (t3 + -1);
    t3 = t7;
    t4 = (t0 + 14196);
    *((int *)t4) = t3;
    goto LAB17;

LAB23:    xsi_set_current_line(458, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14204);
    t7 = *((int *)t4);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t4));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 14204);
    t16 = *((int *)t14);
    t17 = (t16 - 7);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t13, t22);
    t32 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t23);
    t24 = (t0 + 4928U);
    t25 = *((char **)t24);
    t24 = (t0 + 14204);
    t26 = *((int *)t24);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t24));
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t25 + t30);
    *((unsigned char *)t31) = t32;

LAB24:    t1 = (t0 + 14204);
    t3 = *((int *)t1);
    t2 = (t0 + 14208);
    t6 = *((int *)t2);
    if (t3 == t6)
        goto LAB25;

LAB26:    t7 = (t3 + -1);
    t3 = t7;
    t4 = (t0 + 14204);
    *((int *)t4) = t3;
    goto LAB22;

LAB28:    xsi_set_current_line(462, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14212);
    t7 = *((int *)t4);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t4));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 14212);
    t16 = *((int *)t14);
    t17 = (t16 - 7);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t13, t22);
    t24 = (t0 + 5048U);
    t25 = *((char **)t24);
    t24 = (t0 + 14212);
    t26 = *((int *)t24);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t24));
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t25 + t30);
    *((unsigned char *)t31) = t23;

LAB29:    t1 = (t0 + 14212);
    t3 = *((int *)t1);
    t2 = (t0 + 14216);
    t6 = *((int *)t2);
    if (t3 == t6)
        goto LAB30;

LAB31:    t7 = (t3 + -1);
    t3 = t7;
    t4 = (t0 + 14212);
    *((int *)t4) = t3;
    goto LAB27;

LAB33:    xsi_set_current_line(466, ng0);
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t4 = (t0 + 14220);
    t7 = *((int *)t4);
    t8 = (t7 - 7);
    t9 = (t8 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t4));
    t10 = (1U * t9);
    t11 = (0 + t10);
    t12 = (t5 + t11);
    t13 = *((unsigned char *)t12);
    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 14220);
    t16 = *((int *)t14);
    t17 = (t16 - 7);
    t18 = (t17 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t14));
    t19 = (1U * t18);
    t20 = (0 + t19);
    t21 = (t15 + t20);
    t22 = *((unsigned char *)t21);
    t23 = ieee_p_2592010699_sub_3488546069778340532_503743352(IEEE_P_2592010699, t13, t22);
    t32 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t23);
    t24 = (t0 + 5168U);
    t25 = *((char **)t24);
    t24 = (t0 + 14220);
    t26 = *((int *)t24);
    t27 = (t26 - 7);
    t28 = (t27 * -1);
    xsi_vhdl_check_range_of_index(7, 0, -1, *((int *)t24));
    t29 = (1U * t28);
    t30 = (0 + t29);
    t31 = (t25 + t30);
    *((unsigned char *)t31) = t32;

LAB34:    t1 = (t0 + 14220);
    t3 = *((int *)t1);
    t2 = (t0 + 14224);
    t6 = *((int *)t2);
    if (t3 == t6)
        goto LAB35;

LAB36:    t7 = (t3 + -1);
    t3 = t7;
    t4 = (t0 + 14220);
    *((int *)t4) = t3;
    goto LAB32;

}

static void work_a_3567911718_2762913819_p_5(char *t0)
{
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
    unsigned char t15;
    char *t16;
    char *t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned char t22;
    unsigned char t23;
    char *t24;
    char *t25;
    int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned char t30;
    unsigned char t31;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned char t38;
    unsigned char t39;
    char *t40;
    char *t41;
    int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned char t46;
    unsigned char t47;
    char *t48;
    char *t49;
    int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned char t54;
    unsigned char t55;
    char *t56;
    char *t57;
    int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned char t62;
    unsigned char t63;
    unsigned char t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;

LAB0:    xsi_set_current_line(471, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = (0 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 2632U);
    t9 = *((char **)t8);
    t10 = (1 - 7);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t7, t14);
    t16 = (t0 + 2632U);
    t17 = *((char **)t16);
    t18 = (2 - 7);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t16 = (t17 + t21);
    t22 = *((unsigned char *)t16);
    t23 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t15, t22);
    t24 = (t0 + 2632U);
    t25 = *((char **)t24);
    t26 = (3 - 7);
    t27 = (t26 * -1);
    t28 = (1U * t27);
    t29 = (0 + t28);
    t24 = (t25 + t29);
    t30 = *((unsigned char *)t24);
    t31 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t23, t30);
    t32 = (t0 + 2632U);
    t33 = *((char **)t32);
    t34 = (4 - 7);
    t35 = (t34 * -1);
    t36 = (1U * t35);
    t37 = (0 + t36);
    t32 = (t33 + t37);
    t38 = *((unsigned char *)t32);
    t39 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t31, t38);
    t40 = (t0 + 2632U);
    t41 = *((char **)t40);
    t42 = (5 - 7);
    t43 = (t42 * -1);
    t44 = (1U * t43);
    t45 = (0 + t44);
    t40 = (t41 + t45);
    t46 = *((unsigned char *)t40);
    t47 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t39, t46);
    t48 = (t0 + 2632U);
    t49 = *((char **)t48);
    t50 = (6 - 7);
    t51 = (t50 * -1);
    t52 = (1U * t51);
    t53 = (0 + t52);
    t48 = (t49 + t53);
    t54 = *((unsigned char *)t48);
    t55 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t47, t54);
    t56 = (t0 + 2632U);
    t57 = *((char **)t56);
    t58 = (7 - 7);
    t59 = (t58 * -1);
    t60 = (1U * t59);
    t61 = (0 + t60);
    t56 = (t57 + t61);
    t62 = *((unsigned char *)t56);
    t63 = ieee_p_2592010699_sub_3488768496604610246_503743352(IEEE_P_2592010699, t55, t62);
    t64 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t63);
    t65 = (t0 + 8816);
    t66 = (t65 + 56U);
    t67 = *((char **)t66);
    t68 = (t67 + 56U);
    t69 = *((char **)t68);
    *((unsigned char *)t69) = t64;
    xsi_driver_first_trans_fast_port(t65);

LAB2:    t70 = (t0 + 8272);
    *((int *)t70) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3567911718_2762913819_p_6(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(472, ng0);

LAB3:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = (7 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 8880);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 8288);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3567911718_2762913819_init()
{
	static char *pe[] = {(void *)work_a_3567911718_2762913819_p_0,(void *)work_a_3567911718_2762913819_p_1,(void *)work_a_3567911718_2762913819_p_2,(void *)work_a_3567911718_2762913819_p_3,(void *)work_a_3567911718_2762913819_p_4,(void *)work_a_3567911718_2762913819_p_5,(void *)work_a_3567911718_2762913819_p_6};
	xsi_register_didat("work_a_3567911718_2762913819", "isim/cpu_8085_isim_beh.exe.sim/work/a_3567911718_2762913819.didat");
	xsi_register_executes(pe);
}
