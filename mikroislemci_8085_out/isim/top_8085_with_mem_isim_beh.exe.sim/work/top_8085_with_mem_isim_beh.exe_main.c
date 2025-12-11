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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_0539625172_2762913819_init();
    work_a_4194484286_2762913819_init();
    work_a_3920088003_2762913819_init();
    work_a_0113526993_2762913819_init();
    work_a_1501351449_2762913819_init();
    work_a_1451365183_3708392848_init();
    work_a_3567911718_2762913819_init();
    work_a_0147542860_2762913819_init();
    work_a_1056879995_2762913819_init();
    work_a_2376023135_3708392848_init();
    work_a_2015337119_3708392848_init();
    work_a_3445406481_2762913819_init();
    work_a_4087167051_2762913819_init();
    work_a_1537726388_2762913819_init();
    work_a_2632754755_2762913819_init();
    work_a_1732087895_2762913819_init();
    work_a_4114684520_1516540902_init();
    work_a_1141560963_1516540902_init();
    work_a_2879206681_3212880686_init();
    work_a_3326785112_1516540902_init();


    xsi_register_tops("work_a_3326785112_1516540902");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
