Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB27A6D5B90
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Apr 2023 11:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbjDDJJI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Apr 2023 05:09:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234359AbjDDJIk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Apr 2023 05:08:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DED14359A;
        Tue,  4 Apr 2023 02:08:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,317,1673881200"; 
   d="scan'208";a="154821097"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Apr 2023 18:08:29 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E89A6424B436;
        Tue,  4 Apr 2023 18:08:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/3] Add Versa3 clock generator support
Date:   Tue,  4 Apr 2023 10:08:20 +0100
Message-Id: <20230404090823.148226-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=3.0 required=5.0 tests=AC_FROM_MANY_DOTS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The 5P35023 is a VersaClock programmable clock generator and
it provides 6 clk outputs {diff2, diff1, se3, se2, se1 and refin}.

It has an internal OTP memory allows the user to store the configuration
in the device. After power up, the user can change the device register
settings through the I2C interface when I2C mode is selected.

This driver is for overriding OTP default values during boot based on
a full register map from DT, and also minimal support to change the
parent of a output clock.

The motivation for developing this driver is for supporting 48KHz
playback/record with audio codec on RZ/G2L SMARC EVK.

On RZ/G2L SMARC EVK, By default audio mclk is connected to
11.2896 MHz clk which is multiple of 44.1KHz.

Please see the below default OTP configuration of Dividers connected to
output clocks.

DIV3 12.2880 MHz   DIFF2--> Audio clk2
DIV5 11.2896 MHz   SE1  --> Audio clk1
DIV5 11.2896 MHz   SE2  --> Audio mck
DIV4 12      MHz   SE3  --> This clk Not used
DIV1 25 MHz        DIFF1-->Ethernet clk
Ref1-> 24MHz

With this setup, we won't be able to do 48KHz playback/record on audio codec,
as mck is always connected to 11.2896MHz clk.

But by programming the i2c, we can make use of DIV4 to generate 12.2880 MHz
and make that as parent of SE2 and there by supporting 48KHz playback/record.

A block diagram with modification can be find here[1]
[1]https://paste.pics/a253ce7cdc8720c3b5eb6953b97b25ff

DIV3 12.2880 MHz   DIFF2--> Audio clk2
DIV5 11.2896 MHz   SE1  --> Audio clk1
DIV5 11.2896 MHz | SE2  --> Audio mck
DIV4 12.2880 MHz |
DIV2 12      MHz   SE3  --> This clk Not used
DIV1 25 MHz        DIFF1--> Ethernet clk
Ref1-> 24MHz

The driver can read a full register map from the DT, and will use that
register map to initialize the clk generator when the system
boots.
and later, based on sampling rate, it switches the parent of SE2 and
support both 44.1 and 48 KHz playback/record at run time.

v3->v4:
 * Fixed the warning reported by  kernel test robot.
 * Added error check for devm_clk_hw_register_fixed_factor_* in probe().
v2->v3:
 * Added Rb tag from Krzysztof Kozlowski
 * Removed | from Link to data sheet.
 * Dropped stray blank line from example.
 * Updated example section for assigned-clocks to mach same alignment
   with assigned-clock-rates. This is trivial change so retained the
   Rb tag.
 * Updated copy right information.
 * Removed .name from parent data and started using index or struct clk_hw.
 * Dropped vc3_clk_out_ops  and started using fixed factor clocks for
   output clk.
 * Dropped vc3_divider_type_parse_dt function.
 * Dropped struct vc3_driver_data
 * Updated the dtsi changes for RZ/G2LC and RZ/G2{UL, Five}.
RFC->v2:
 * Renamed the filename to match with compatible
 * Added maintainers entry after title
 * Removed the wrapping for the link to data sheet.
 * Removed reg description
 * Removed clock names
 * Replaced minItems->maxItems in renesas,settings property
 * Dropped assigned-clocks, assigned-clock-rates
 * Dropped renesas,clock-divider-read-only and renesas,clock-flags
 * Drooped clock handle part from example
 * Dropped reg from example.
 * Dropped consumer example
 * Dropped header file <linux/clk.h> and removed all
   consumer api's
 * struct clk_parent_data used for assigning the parent names.
 * Replaced initpointer->const init pointer in vc3_clk_register
 * Replaced of_clk_add_hw_provider with devm_clk_add_hw_provider
 * Dropped vc3_remove() callback.

Logs:
root@smarc-rzg2l:~# /audio_test.sh
                                 enable  prepare  protect                                duty  hardware
   clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
 xtal                                 0        0        0    24000000          0     0  50000         Y
    ref                               0        0        0    24000000          0     0  50000         Y
    pfd1                              0        0        0    24000000          0     0  50000         Y
       pll1                           0        0        0   600000000          0     0  50000         Y
          div2                        0        0        0    12000000          0     0  50000         Y
             se3_mux                  0        0        0    12000000          0     0  50000         Y
                se3                   0        0        0    12000000          0     0  50000         Y
          div1_mux                    0        0        0   600000000          0     0  50000         Y
             div1                     0        0        0    25000000          0     0  50000         Y
                diff1_mux             0        0        0    25000000          0     0  50000         Y
                   diff1              0        0        0    25000000          0     0  50000         Y
    pfd3_mux                          0        0        0    24000000          0     0  50000         Y
       pfd3                           0        0        0      960000          0     0  50000         Y
          pll3                        0        0        0   564480000          0     0  50000         Y
             div5                     0        0        0    11289600          0     0  50000         Y
                se1_mux               0        0        0    11289600          0     0  50000         Y
                   se1                0        0        0    11289600          0     0  50000         Y
                se2_mux               0        0        0    11289600          0     0  50000         Y
                   se2                0        0        0    11289600          0     0  50000         Y
    pfd2_mux                          0        0        0    24000000          0     0  50000         Y
       pfd2                           0        0        0    24000000          0     0  50000         Y
          pll2                        0        0        0   491519897          0     0  50000         Y
             div4_mux                 0        0        0   491519897          0     0  50000         Y
                div4                  0        0        0    12287998          0     0  50000         Y
             div3_mux                 0        0        0   491519897          0     0  50000         Y
                div3                  0        0        0    12287998          0     0  50000         Y
                   diff2_mux          0        0        0    12287998          0     0  50000         Y
                      diff2           0        0        0    12287998          0     0  50000         Y
 extal-clk                            4        4        0    24000000          0     0  50000         Y
    .pll5_foutpostdiv                 0        0        0    24000000          0     0  50000         Y
       M1                             0        0        0    24000000          0     0  50000         Y
          dsi_pll_clk                 0        0        0    24000000          0     0  50000         N
       .sel_pll5_4                    0        0        0    24000000          0     0  50000         Y
          DSI_DIV                     0        0        0    24000000          0     0  50000         Y
             M3                       0        0        0    24000000          0     0  50000         Y
                lcdc_clk_d            0        0        0    24000000          0     0  50000         N
                dsi_vclk              0        0        0    24000000          0     0  50000         N
       .pll5_fout1ph0                 0        0        0    12000000          0     0  50000         Y
    .pll6                             2        2        0   500000000          0     0  50000         Y
       .sel_gpu2                      1        1        0   500000000          0     0  50000         Y
          G                           1        1        0    62500000          0     0  50000         Y
             gpu_clk                  1        2        0    62500000          0     0  50000         Y
       .pll6_250                      1        1        0   250000000          0     0  50000         Y
          HP                          2        2        0   250000000          0     0  50000         Y
    .pll5                             0        0        0  3000000000          0     0  50000         Y
       .pll5_fout3                    0        0        0   500000000          0     0  50000         Y
          .pll5_250                   0        0        0   250000000          0     0  50000         Y
    .pll3                             1        2        0  1600000000          0     0  50000         Y
       .pll3_div2                     1        1        0   800000000          0     0  50000         Y
          .pll3_div2_4                3        3        0   200000000          0     0  50000         Y
             M0                       2        2        0   200000000          0     0  50000         Y
                eth1_axi              1        1        0   200000000          0     0  50000         Y
                eth0_axi              1        1        0   200000000          0     0  50000         Y
                lcdc_a                0        0        0   200000000          0     0  50000         N
                cru_aclk              0        0        0   200000000          0     0  50000         N
             P1                      11       12        0   200000000          0     0  50000         Y
                usb_pclk              8       12        0   200000000          0     0  50000         Y
                usb0_func             1        1        0   200000000          0     0  50000         Y
                usb1_host             3        5        0   200000000          0     0  50000         Y
                usb0_host             3        5        0   200000000          0     0  50000         Y
                dsi_aclk              0        0        0   200000000          0     0  50000         N
                gpu_ace_clk           0        1        0   200000000          0     0  50000         N
                gpu_axi_clk           1        2        0   200000000          0     0  50000         Y
                sdhi1_aclk            1        1        0   200000000          0     0  50000         Y
                sdhi0_aclk            1        1        0   200000000          0     0  50000         Y
                dmac_aclk             2        2        0   200000000          0     0  50000         Y
                ia55_clk              2        2        0   200000000          0     0  50000         Y
                gic                   1        1        0   200000000          0     0  50000         Y
                P1_DIV2               1        1        0   100000000          0     0  50000         Y
                   dmac_pclk          1        1        0   100000000          0     0  50000         Y
             .pll3_div2_4_2           2        2        0   100000000          0     0  50000         Y
                ZT                    2        2        0   100000000          0     0  50000         Y
                   eth1_chi           1        1        0   100000000          0     0  50000         Y
                   eth0_chi           1        1        0   100000000          0     0  50000         Y
                   lcdc_p             0        0        0   100000000          0     0  50000         N
                   cru_pclk           0        0        0   100000000          0     0  50000         N
                P2                    1        1        0   100000000          0     0  50000         Y
                   dsi_pclk           0        0        0   100000000          0     0  50000         N
                   ia55_pclk          1        1        0   100000000          0     0  50000         Y
          .pll3_div2_2                0        0        0   400000000          0     0  50000         Y
       .pll3_533                      0        1        0   533333333          0     0  50000         Y
          M2                          0        0        0   266666666          0     0  50000         Y
             cru_vclk                 0        0        0   266666666          0     0  50000         N
             M2_DIV2                  0        0        0   133333333          0     0  50000         Y
                dsi_sys_clk           0        0        0   133333333          0     0  50000         N
                cru_sysclk            0        0        0   133333333          0     0  50000         N
          .sel_pll3_3                 0        1        0   533333333          0     0  50000         Y
             divpl3c                  0        2        0   266666667          0     0  50000         Y
                SPI1                  0        1        0    66666666          0     0  50000         Y
                   spi_clk2           0        1        0    66666666          0     0  50000         N
                SPI0                  0        1        0   133333333          0     0  50000         Y
                   spi_clk            0        1        0   133333333          0     0  50000         N
       .pll3_400                      0        0        0   400000000          0     0  50000         Y
    .pll2                             2        2        0  1600000000          0     0  50000         Y
       .clk_533                       2        2        0   533333333          0     0  50000         Y
          sd1                         2        2        0   533333333          0     0  50000         Y
             sdhi1_clk_hs             1        1        0   533333333          0     0  50000         Y
             SD1_DIV4                 2        2        0   133333333          0     0  50000         Y
                sdhi1_imclk2          2        2        0   133333333          0     0  50000         Y
                sdhi1_imclk           1        1        0   133333333          0     0  50000         Y
          sd0                         2        2        0   533333333          0     0  50000         Y
             sdhi0_clk_hs             1        1        0   533333333          0     0  50000         Y
             SD0_DIV4                 2        2        0   133333333          0     0  50000         Y
                sdhi0_imclk2          2        2        0   133333333          0     0  50000         Y
                sdhi0_imclk           1        1        0   133333333          0     0  50000         Y
          .clk_266                    0        0        0   266666666          0     0  50000         Y
       .clk_800                       0        0        0   800000000          0     0  50000         Y
          .clk_400                    0        0        0   400000000          0     0  50000         Y
       .pll2_div2                     2        2        0   800000000          0     0  50000         Y
          .pll2_div2_10               1        1        0    80000000          0     0  50000         Y
             TSU                      1        2        0    80000000          0     0  50000         Y
                tsu_pclk              1        1        0    80000000          0     0  50000         Y
                adc_adclk             0        1        0    80000000          0     0  50000         N
          .pll2_div2_8                1        1        0   100000000          0     0  50000         Y
             P0                       6       14        0   100000000          0     0  50000         Y
                adc_pclk              0        1        0   100000000          0     0  50000         N
                canfd                 1        2        0   100000000          0     0  50000         Y
                rspi2                 0        0        0   100000000          0     0  50000         N
                rspi1                 0        1        0   100000000          0     0  50000         N
                rspi0                 0        0        0   100000000          0     0  50000         N
                sci1                  0        0        0   100000000          0     0  50000         N
                sci0                  0        0        0   100000000          0     0  50000         N
                scif4                 0        0        0   100000000          0     0  50000         N
                scif3                 0        0        0   100000000          0     0  50000         N
                scif2                 0        1        0   100000000          0     0  50000         N
                scif1                 0        0        0   100000000          0     0  50000         N
                scif0                 2        2        0   100000000          0     0  50000         Y
                i2c3                  0        1        0   100000000          0     0  50000         N
                i2c2                  0        0        0   100000000          0     0  50000         N
                i2c1                  0        1        0   100000000          0     0  50000         N
                i2c0                  0        1        0   100000000          0     0  50000         N
                ssi3_sfr              0        0        0   100000000          0     0  50000         N
                ssi3_pclk             0        0        0   100000000          0     0  50000         N
                ssi2_sfr              0        0        0   100000000          0     0  50000         N
                ssi2_pclk             0        0        0   100000000          0     0  50000         N
                ssi1_sfr              0        0        0   100000000          0     0  50000         N
                ssi1_pclk             0        0        0   100000000          0     0  50000         N
                ssi0_sfr              1        1        0   100000000          0     0  50000         Y
                ssi0_pclk             1        1        0   100000000          0     0  50000         Y
                wdt1_pclk             0        1        0   100000000          0     0  50000         N
                wdt0_pclk             0        1        0   100000000          0     0  50000         N
                poeg_d_clkp           0        0        0   100000000          0     0  50000         N
                poeg_c_clkp           0        0        0   100000000          0     0  50000         N
                poeg_b_clkp           0        0        0   100000000          0     0  50000         N
                poeg_a_clkp           0        0        0   100000000          0     0  50000         N
                gpt_pclk              0        0        0   100000000          0     0  50000         N
                mtu_x_mck             0        0        0   100000000          0     0  50000         N
                ostm2_pclk            1        2        0   100000000          0     0  50000         Y
                ostm1_pclk            1        2        0   100000000          0     0  50000         Y
                ostm0_pclk            0        0        0   100000000          0     0  50000         N
                P0_DIV2               0        0        0    50000000          0     0  50000         Y
       .pll2_533                      0        0        0   533333333          0     0  50000         Y
          .pll2_533_div2              0        0        0   266666666          0     0  50000         Y
             .div_dsi_lpclk           0        0        0    16666667          0     0  50000         Y
                M4                    0        0        0    16666667          0     0  50000         Y
                   dsi_lpclk          0        0        0    16666667          0     0  50000         N
    .pll1                             0        0        0  1200000000          0     0  50000         Y
       I                              0        0        0  1200000000          0     0  50000         Y
    .osc_div1000                      0        0        0       24000          0     0  50000         Y
    .osc                              1        3        0    24000000          0     0  50000         Y
       gpio                           1        2        0    24000000          0     0  50000         Y
       wdt1_clk                       0        1        0    24000000          0     0  50000         N
       wdt0_clk                       0        1        0    24000000          0     0  50000         N
 can-clk                              0        0        0           0          0     0  50000         Y
 audio2-clk                           0        0        0    12288000          0     0  50000         Y
 audio1-clk                           0        0        0    11289600          0     0  50000         Y
playback 48000 kHz sample

speaker-test 1.2.1

Playback device is hw:0,0
Stream parameters are 48000Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 48000Hz (requested 48000Hz)
Buffer size range from 8 to 8192
Period size range from 8 to 2048
Using max buffer size 8192
Periods = 4
was set period_size = 2048
was set buffer_size = 8192
 0 - Front Left
00: 80
01: 00
02: 11
03: 19
04: 4c
05: 02
06: 23
07: 7f
08: 83
09: 19
0a: 08
0b: a9
0c: 5f
0d: 25
0e: 24
0f: bf
10: 00
11: 14
12: 7a
13: e1
14: 00
15: 00
16: 00
17: 00
18: 01
19: 55
1a: 59
1b: bb
1c: 3f
1d: 30
1e: 90
1f: f6
20: 80
21: b0
22: 45
23: c4
24: 95
Read at address  0x10049C00 (0xffff9a615c00): 0x300B4022
       pfd2                           1        1        0    24000000          0     0  50000         Y
          pll2                        1        1        0   491519897          0     0  50000         Y
             div4_mux                 1        1        0   491519897          0     0  50000         Y
                div4                  1        1        0    12287998          0     0  50000         Y
                   se2_mux            1        1        0    12287998          0     0  50000         Y
                      se2             1        1        0    12287998          0     0  50000         Y
 1 - Front Right
playback 44100 kHz sample

speaker-test 1.2.1

Playback device is hw:0,0
Stream parameters are 44100Hz, S16_LE, 2 channels
Using 16 octaves of pink noise
Rate set to 44100Hz (requested 44100Hz)
Buffer size range from 8 to 8192
Period size range from 8 to 2048
Using max buffer size 8192
Periods = 4
was set period_size = 2048
was set buffer_size = 8192
 0 - Front Left
/audio_test.sh: line 2:   187 Killed                  speaker-test -D hw:0,0 -c 2 -r $1
00: 80
01: 00
02: 11
03: 19
04: 4c
05: 02
06: 23
07: 7f
08: 83
09: 19
0a: 08
0b: a9
0c: 5f
0d: 25
0e: 24
0f: bf
10: 00
11: 14
12: 7a
13: e1
14: 00
15: 00
16: 00
17: 00
18: 01
19: 55
1a: 59
1b: bb
1c: 3f
1d: 30
1e: 90
1f: b6
20: 80
21: b0
22: 45
23: c4
24: 95
Read at address  0x10049C00 (0xffffb7957c00): 0x700B4022
    pfd3_mux                          1        1        0    24000000          0     0  50000         Y
       pfd3                           1        1        0      960000          0     0  50000         Y
          pll3                        1        1        0   564480000          0     0  50000         Y
             div5                     1        1        0    11289600          0     0  50000         Y
                se2_mux               1        1        0    11289600          0     0  50000         Y
                   se2                1        1        0    11289600          0     0  50000         Y

Biju Das (3):
  dt-bindings: clock: Add Renesas versa3 clock generator bindings
  drivers: clk: Add support for versa3 clock driver
  arm64: dts: renesas: rzg2l-smarc: Use versa3 clk for audio mclk

 .../bindings/clock/renesas,5p35023.yaml       |   86 ++
 .../boot/dts/renesas/rz-smarc-common.dtsi     |   13 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   23 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi |   23 +
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi |   25 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-versaclock3.c                 | 1141 +++++++++++++++++
 8 files changed, 1314 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
 create mode 100644 drivers/clk/clk-versaclock3.c


base-commit: 1bd575707d704530a52d5dd320c29d79e9cff42d
-- 
2.25.1

