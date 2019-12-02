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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Projects/RTC_2/rtl_ds1302.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );


static void work_a_4104738314_1312034610_p_0(char *t0)
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

LAB0:    xsi_set_current_line(75, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = (0 - 7);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 9792);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast(t8);

LAB2:    t13 = (t0 + 9552);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4104738314_1312034610_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    int t12;

LAB0:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9568);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 9856);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = 0;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 9920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 4872U);
    t5 = *((char **)t2);
    t9 = *((int *)t5);
    t4 = (t9 == 100);
    if (t4 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 4872U);
    t2 = *((char **)t1);
    t9 = *((int *)t2);
    t12 = (t9 + 1);
    t1 = (t0 + 9856);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((int *)t8) = t12;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t10 = (t0 + 9856);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);

LAB8:    goto LAB3;

LAB7:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 9856);
    t6 = (t2 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    *((int *)t10) = 0;
    xsi_driver_first_trans_delta(t2, 0U, 1, 1000LL);
    t11 = (t0 + 9856);
    xsi_driver_intertial_reject(t11, 1000LL, 1000LL);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 4712U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t3);
    t1 = (t0 + 9920);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t4;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t10 = (t0 + 9920);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    goto LAB8;

}

static void work_a_4104738314_1312034610_p_2(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(94, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB3;

LAB4:
LAB2:    t11 = (t0 + 9584);
    *((int *)t11) = 1;

LAB1:    return;
LAB3:    t3 = (t0 + 4712U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t3 = (t0 + 9984);
    t6 = (t3 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t5;
    xsi_driver_first_trans_delta(t3, 0U, 1, 1000LL);
    t10 = (t0 + 9984);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    goto LAB2;

}

static void work_a_4104738314_1312034610_p_3(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB3;

LAB4:
LAB2:    t15 = (t0 + 9600);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t3 = (t0 + 4072U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t5);
    t3 = (t0 + 4712U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t6, t8);
    t3 = (t0 + 10048);
    t10 = (t3 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_delta(t3, 0U, 1, 1000LL);
    t14 = (t0 + 10048);
    xsi_driver_intertial_reject(t14, 1000LL, 1000LL);
    goto LAB2;

}

static void work_a_4104738314_1312034610_p_4(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(96, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB3;

LAB4:
LAB2:    t15 = (t0 + 9616);
    *((int *)t15) = 1;

LAB1:    return;
LAB3:    t3 = (t0 + 4712U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t5);
    t3 = (t0 + 4072U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t6, t8);
    t3 = (t0 + 10112);
    t10 = (t3 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t9;
    xsi_driver_first_trans_delta(t3, 0U, 1, 1000LL);
    t14 = (t0 + 10112);
    xsi_driver_intertial_reject(t14, 1000LL, 1000LL);
    goto LAB2;

}

static void work_a_4104738314_1312034610_p_5(char *t0)
{
    char t17[16];
    char t18[16];
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
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    unsigned char t26;
    static char *nl0[] = {&&LAB8, &&LAB9, &&LAB14, &&LAB23, &&LAB10, &&LAB11, &&LAB13, &&LAB12, &&LAB15, &&LAB16, &&LAB17, &&LAB18, &&LAB19, &&LAB20, &&LAB21, &&LAB22};

LAB0:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t3 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    t1 = (t0 + 9632);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 15055);
    t6 = (t0 + 10176);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast(t6);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 10240);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 10304);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 10368);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 10432);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 10496);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 15059);
    t5 = (t0 + 10560);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 15067);
    t5 = (t0 + 10624);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 15075);
    t5 = (t0 + 10688);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 10752);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_fast(t1);
    goto LAB3;

LAB5:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 3112U);
    t5 = *((char **)t2);
    t4 = *((unsigned char *)t5);
    t2 = (char *)((nl0) + t4);
    goto **((char **)t2);

LAB7:    goto LAB3;

LAB8:    xsi_set_current_line(116, ng0);
    t6 = (t0 + 10752);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = (unsigned char)2;
    xsi_driver_first_trans_delta(t6, 0U, 1, 1000LL);
    t11 = (t0 + 10752);
    xsi_driver_intertial_reject(t11, 1000LL, 1000LL);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 10432);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10432);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 10368);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10368);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB24;

LAB26:
LAB25:    xsi_set_current_line(122, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB27;

LAB29:
LAB28:    goto LAB7;

LAB9:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB30;

LAB32:
LAB31:    goto LAB7;

LAB10:    xsi_set_current_line(135, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB33;

LAB35:
LAB34:    goto LAB7;

LAB11:    xsi_set_current_line(141, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB36;

LAB38:
LAB37:    goto LAB7;

LAB12:    xsi_set_current_line(146, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB39;

LAB41:
LAB40:    goto LAB7;

LAB13:    xsi_set_current_line(157, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB49;

LAB51:
LAB50:    goto LAB7;

LAB14:    xsi_set_current_line(162, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB52;

LAB54:
LAB53:    goto LAB7;

LAB15:    xsi_set_current_line(180, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB60;

LAB62:
LAB61:    goto LAB7;

LAB16:    xsi_set_current_line(185, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB63;

LAB65:
LAB64:    goto LAB7;

LAB17:    xsi_set_current_line(190, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB66;

LAB68:
LAB67:    goto LAB7;

LAB18:    xsi_set_current_line(202, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB76;

LAB78:
LAB77:    goto LAB7;

LAB19:    xsi_set_current_line(207, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB79;

LAB81:
LAB80:    xsi_set_current_line(211, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB82;

LAB84:
LAB83:    goto LAB7;

LAB20:    xsi_set_current_line(215, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB87;

LAB89:
LAB88:    goto LAB7;

LAB21:    xsi_set_current_line(226, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB95;

LAB97:
LAB96:    goto LAB7;

LAB22:    xsi_set_current_line(231, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB98;

LAB100:
LAB99:    xsi_set_current_line(238, ng0);
    t1 = (t0 + 3912U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB101;

LAB103:
LAB102:    goto LAB7;

LAB23:    xsi_set_current_line(243, ng0);
    goto LAB7;

LAB24:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 10816);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)1;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10816);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    goto LAB25;

LAB27:    xsi_set_current_line(123, ng0);
    t1 = (t0 + 10496);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10496);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    goto LAB28;

LAB30:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(128, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 10560);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_delta(t1, 0U, 8U, 1000LL);
    t9 = (t0 + 10560);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(129, ng0);
    t1 = (t0 + 10496);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10496);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(130, ng0);
    t1 = (t0 + 15083);
    t5 = (t0 + 10176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t5, 0U, 4U, 1000LL);
    t10 = (t0 + 10176);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(131, ng0);
    t1 = (t0 + 10432);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10432);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(132, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB31;

LAB33:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t12 = (0 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t16 = *((unsigned char *)t1);
    t6 = (t0 + 10304);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t16;
    xsi_driver_first_trans_delta(t6, 0U, 1, 1000LL);
    t11 = (t0 + 10304);
    xsi_driver_intertial_reject(t11, 1000LL, 1000LL);
    xsi_set_current_line(137, ng0);
    t1 = (t0 + 10368);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10368);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(138, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)5;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB34;

LAB36:    xsi_set_current_line(142, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(143, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)7;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB37;

LAB39:    xsi_set_current_line(147, ng0);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t13 = (7 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t18 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 7;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t12 = (1 - 7);
    t19 = (t12 * -1);
    t19 = (t19 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t19;
    t6 = xsi_base_array_concat(t6, t17, t7, (char)99, (unsigned char)2, (char)97, t1, t18, (char)101);
    t19 = (1U + 7U);
    t16 = (8U != t19);
    if (t16 == 1)
        goto LAB42;

LAB43:    t9 = (t0 + 10560);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t20 = (t11 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 8U);
    xsi_driver_first_trans_delta(t9, 0U, 8U, 1000LL);
    t22 = (t0 + 10560);
    xsi_driver_intertial_reject(t22, 1000LL, 1000LL);
    xsi_set_current_line(148, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t12 = (3 - 3);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB44;

LAB46:    xsi_set_current_line(152, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10368);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10368);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(153, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);

LAB45:    goto LAB40;

LAB42:    xsi_size_not_matching(8U, t19, 0);
    goto LAB43;

LAB44:    xsi_set_current_line(149, ng0);
    t5 = (t0 + 4232U);
    t6 = *((char **)t5);
    t5 = (t0 + 14916U);
    t7 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t17, t6, t5, (unsigned char)3);
    t8 = (t17 + 12U);
    t19 = *((unsigned int *)t8);
    t23 = (1U * t19);
    t16 = (4U != t23);
    if (t16 == 1)
        goto LAB47;

LAB48:    t9 = (t0 + 10176);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t20 = (t11 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t7, 4U);
    xsi_driver_first_trans_delta(t9, 0U, 4U, 1000LL);
    t22 = (t0 + 10176);
    xsi_driver_intertial_reject(t22, 1000LL, 1000LL);
    xsi_set_current_line(150, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)6;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB45;

LAB47:    xsi_size_not_matching(4U, t23, 0);
    goto LAB48;

LAB49:    xsi_set_current_line(158, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(159, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)4;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB50;

LAB52:    xsi_set_current_line(163, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(164, ng0);
    t1 = (t0 + 5032U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB55;

LAB57:    xsi_set_current_line(170, ng0);
    t1 = (t0 + 15099);
    t5 = (t0 + 10560);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 1000LL);
    t10 = (t0 + 10560);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(171, ng0);
    t1 = (t0 + 15107);
    t5 = (t0 + 10176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t5, 0U, 4U, 1000LL);
    t10 = (t0 + 10176);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(172, ng0);
    t1 = (t0 + 10304);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10304);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(174, ng0);
    t1 = (t0 + 5192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4552U);
    t5 = *((char **)t1);
    t13 = (7 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t18 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 7;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t12 = (1 - 7);
    t19 = (t12 * -1);
    t19 = (t19 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t19;
    t6 = xsi_base_array_concat(t6, t17, t7, (char)99, t3, (char)97, t1, t18, (char)101);
    t19 = (1U + 7U);
    t4 = (8U != t19);
    if (t4 == 1)
        goto LAB58;

LAB59:    t9 = (t0 + 10624);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t20 = (t11 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 8U);
    xsi_driver_first_trans_delta(t9, 0U, 8U, 1000LL);
    t22 = (t0 + 10624);
    xsi_driver_intertial_reject(t22, 1000LL, 1000LL);
    xsi_set_current_line(175, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)12;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);

LAB56:    goto LAB53;

LAB55:    xsi_set_current_line(165, ng0);
    t1 = (t0 + 1672U);
    t5 = *((char **)t1);
    t1 = (t0 + 10560);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 8U);
    xsi_driver_first_trans_delta(t1, 0U, 8U, 1000LL);
    t10 = (t0 + 10560);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(166, ng0);
    t1 = (t0 + 15087);
    t5 = (t0 + 10624);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 1000LL);
    t10 = (t0 + 10624);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(167, ng0);
    t1 = (t0 + 15095);
    t5 = (t0 + 10176);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 4U);
    xsi_driver_first_trans_delta(t5, 0U, 4U, 1000LL);
    t10 = (t0 + 10176);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(168, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB56;

LAB58:    xsi_size_not_matching(8U, t19, 0);
    goto LAB59;

LAB60:    xsi_set_current_line(181, ng0);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t12 = (0 - 7);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t16 = *((unsigned char *)t1);
    t6 = (t0 + 10304);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t16;
    xsi_driver_first_trans_delta(t6, 0U, 1, 1000LL);
    t11 = (t0 + 10304);
    xsi_driver_intertial_reject(t11, 1000LL, 1000LL);
    xsi_set_current_line(182, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)9;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB61;

LAB63:    xsi_set_current_line(186, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(187, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)10;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB64;

LAB66:    xsi_set_current_line(191, ng0);
    t1 = (t0 + 4392U);
    t5 = *((char **)t1);
    t13 = (7 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t7 = ((IEEE_P_2592010699) + 4024);
    t8 = (t18 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 7;
    t9 = (t8 + 4U);
    *((int *)t9) = 1;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t12 = (1 - 7);
    t19 = (t12 * -1);
    t19 = (t19 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t19;
    t6 = xsi_base_array_concat(t6, t17, t7, (char)99, (unsigned char)2, (char)97, t1, t18, (char)101);
    t19 = (1U + 7U);
    t16 = (8U != t19);
    if (t16 == 1)
        goto LAB69;

LAB70:    t9 = (t0 + 10560);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t20 = (t11 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t6, 8U);
    xsi_driver_first_trans_delta(t9, 0U, 8U, 1000LL);
    t22 = (t0 + 10560);
    xsi_driver_intertial_reject(t22, 1000LL, 1000LL);
    xsi_set_current_line(192, ng0);
    t1 = (t0 + 4232U);
    t2 = *((char **)t1);
    t12 = (3 - 3);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t2 + t15);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB71;

LAB73:    xsi_set_current_line(197, ng0);
    t1 = (t0 + 10368);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10368);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(198, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)15;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);

LAB72:    goto LAB67;

LAB69:    xsi_size_not_matching(8U, t19, 0);
    goto LAB70;

LAB71:    xsi_set_current_line(193, ng0);
    t5 = (t0 + 4232U);
    t6 = *((char **)t5);
    t5 = (t0 + 14916U);
    t7 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t17, t6, t5, (unsigned char)3);
    t8 = (t17 + 12U);
    t19 = *((unsigned int *)t8);
    t23 = (1U * t19);
    t16 = (4U != t23);
    if (t16 == 1)
        goto LAB74;

LAB75:    t9 = (t0 + 10176);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t20 = (t11 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t7, 4U);
    xsi_driver_first_trans_delta(t9, 0U, 4U, 1000LL);
    t22 = (t0 + 10176);
    xsi_driver_intertial_reject(t22, 1000LL, 1000LL);
    xsi_set_current_line(194, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)11;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB72;

LAB74:    xsi_size_not_matching(4U, t23, 0);
    goto LAB75;

LAB76:    xsi_set_current_line(203, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(204, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB77;

LAB79:    xsi_set_current_line(208, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(209, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)13;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB80;

LAB82:    xsi_set_current_line(212, ng0);
    t1 = (t0 + 5192U);
    t5 = *((char **)t1);
    t16 = *((unsigned char *)t5);
    t1 = (t0 + 4552U);
    t6 = *((char **)t1);
    t13 = (7 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t6 + t15);
    t8 = ((IEEE_P_2592010699) + 4024);
    t9 = (t18 + 0U);
    t10 = (t9 + 0U);
    *((int *)t10) = 7;
    t10 = (t9 + 4U);
    *((int *)t10) = 1;
    t10 = (t9 + 8U);
    *((int *)t10) = -1;
    t12 = (1 - 7);
    t19 = (t12 * -1);
    t19 = (t19 + 1);
    t10 = (t9 + 12U);
    *((unsigned int *)t10) = t19;
    t7 = xsi_base_array_concat(t7, t17, t8, (char)99, t16, (char)97, t1, t18, (char)101);
    t19 = (1U + 7U);
    t24 = (8U != t19);
    if (t24 == 1)
        goto LAB85;

LAB86:    t10 = (t0 + 10624);
    t11 = (t10 + 56U);
    t20 = *((char **)t11);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t7, 8U);
    xsi_driver_first_trans_delta(t10, 0U, 8U, 1000LL);
    t25 = (t0 + 10624);
    xsi_driver_intertial_reject(t25, 1000LL, 1000LL);
    goto LAB83;

LAB85:    xsi_size_not_matching(8U, t19, 0);
    goto LAB86;

LAB87:    xsi_set_current_line(217, ng0);
    t1 = (t0 + 4232U);
    t5 = *((char **)t1);
    t12 = (3 - 3);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t1 = (t5 + t15);
    t16 = *((unsigned char *)t1);
    t24 = (t16 == (unsigned char)2);
    if (t24 != 0)
        goto LAB90;

LAB92:    xsi_set_current_line(222, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)15;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);

LAB91:    goto LAB88;

LAB90:    xsi_set_current_line(218, ng0);
    t6 = (t0 + 4232U);
    t7 = *((char **)t6);
    t6 = (t0 + 14916U);
    t8 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t17, t7, t6, (unsigned char)3);
    t9 = (t17 + 12U);
    t19 = *((unsigned int *)t9);
    t23 = (1U * t19);
    t26 = (4U != t23);
    if (t26 == 1)
        goto LAB93;

LAB94:    t10 = (t0 + 10176);
    t11 = (t10 + 56U);
    t20 = *((char **)t11);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t8, 4U);
    xsi_driver_first_trans_delta(t10, 0U, 4U, 1000LL);
    t25 = (t0 + 10176);
    xsi_driver_intertial_reject(t25, 1000LL, 1000LL);
    xsi_set_current_line(219, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)14;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB91;

LAB93:    xsi_size_not_matching(4U, t23, 0);
    goto LAB94;

LAB95:    xsi_set_current_line(227, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(228, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)12;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB96;

LAB98:    xsi_set_current_line(232, ng0);
    t1 = (t0 + 10240);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10240);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(233, ng0);
    t1 = (t0 + 15111);
    t5 = (t0 + 10560);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 1000LL);
    t10 = (t0 + 10560);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(234, ng0);
    t1 = (t0 + 15119);
    t5 = (t0 + 10624);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 8U);
    xsi_driver_first_trans_delta(t5, 0U, 8U, 1000LL);
    t10 = (t0 + 10624);
    xsi_driver_intertial_reject(t10, 1000LL, 1000LL);
    xsi_set_current_line(235, ng0);
    t1 = (t0 + 4552U);
    t2 = *((char **)t1);
    t1 = (t0 + 10688);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 8U);
    xsi_driver_first_trans_delta(t1, 0U, 8U, 1000LL);
    t9 = (t0 + 10688);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    goto LAB99;

LAB101:    xsi_set_current_line(239, ng0);
    t1 = (t0 + 10752);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t9 = (t0 + 10752);
    xsi_driver_intertial_reject(t9, 1000LL, 1000LL);
    xsi_set_current_line(240, ng0);
    t1 = (t0 + 10368);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10368);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    xsi_set_current_line(241, ng0);
    t1 = (t0 + 10816);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)0;
    xsi_driver_first_trans_delta(t1, 0U, 1, 1000LL);
    t8 = (t0 + 10816);
    xsi_driver_intertial_reject(t8, 1000LL, 1000LL);
    goto LAB102;

}

static void work_a_4104738314_1312034610_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(248, ng0);

LAB3:    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10880);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9648);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4104738314_1312034610_p_7(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(249, ng0);

LAB3:    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10944);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast(t1);

LAB2:    t8 = (t0 + 9664);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4104738314_1312034610_p_8(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(250, ng0);

LAB3:    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11008);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9680);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4104738314_1312034610_p_9(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(251, ng0);

LAB3:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11072);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9696);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_4104738314_1312034610_p_10(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(252, ng0);

LAB3:    t1 = (t0 + 3592U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 11136);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 9712);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_4104738314_1312034610_init()
{
	static char *pe[] = {(void *)work_a_4104738314_1312034610_p_0,(void *)work_a_4104738314_1312034610_p_1,(void *)work_a_4104738314_1312034610_p_2,(void *)work_a_4104738314_1312034610_p_3,(void *)work_a_4104738314_1312034610_p_4,(void *)work_a_4104738314_1312034610_p_5,(void *)work_a_4104738314_1312034610_p_6,(void *)work_a_4104738314_1312034610_p_7,(void *)work_a_4104738314_1312034610_p_8,(void *)work_a_4104738314_1312034610_p_9,(void *)work_a_4104738314_1312034610_p_10};
	xsi_register_didat("work_a_4104738314_1312034610", "isim/TB_top_isim_beh.exe.sim/work/a_4104738314_1312034610.didat");
	xsi_register_executes(pe);
}
