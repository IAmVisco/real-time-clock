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

char *IEEE_P_3499444699;
char *IEEE_P_1242562249;
char *STD_STANDARD;
char *IEEE_P_3620187407;
char *IEEE_P_2592010699;
char *WORK_P_0502911677;
char *UNISIM_P_0947159679;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    unisim_p_0947159679_init();
    work_p_0502911677_init();
    ieee_p_1242562249_init();
    work_a_3205567637_3742876191_init();
    work_a_4104738314_1312034610_init();
    work_a_0087429842_3171904890_init();
    unisim_a_0193039582_1428675764_init();
    work_a_0424969107_3041088647_init();
    work_a_3622719947_2372691052_init();


    xsi_register_tops("work_a_3622719947_2372691052");

    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    WORK_P_0502911677 = xsi_get_engine_memory("work_p_0502911677");
    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");

    return xsi_run_simulation(argc, argv);

}
