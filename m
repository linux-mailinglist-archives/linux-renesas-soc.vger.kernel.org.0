Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47ACB4DE077
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Mar 2022 18:52:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235895AbiCRRwt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Mar 2022 13:52:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239967AbiCRRws (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Mar 2022 13:52:48 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D12D418FAF7;
        Fri, 18 Mar 2022 10:51:19 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,192,1643641200"; 
   d="scan'208";a="115031006"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Mar 2022 02:51:18 +0900
Received: from localhost.localdomain (unknown [10.226.93.159])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 037E140165BF;
        Sat, 19 Mar 2022 02:51:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/9] Add RZ/G2L Display clock support
Date:   Fri, 18 Mar 2022 17:51:04 +0000
Message-Id: <20220318175113.8956-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add display clock support on RZ/G2L SMARC
EVK platform. The output from DSI is connected to ADV7535.

Implementation details:-

PLL5 generates 2 clock sources, FOUTPOSTDIV and FOUT1PH0 and vclk is
sourced through DSI divider which is connected to a mux with the above
clock sources.

Pll5-->Mux->DSI divider--> vclk.

DSI mode and DPI mode needs different set of PLL5 parameters for
generating the video clock. Currently we support only DSI mode.
later plan to extend this support to DPI mode.

RFC->V1:
 * Replaced LUT with an equation for computing pll5 parameters for generating vclk.
 * Replaced magic numbers with macros.
 * Added Rb tag from Geert.
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-2-biju.das.jz@bp.renesas.com/
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-3-biju.das.jz@bp.renesas.com/

Logs:-

Clock tree output with monitor connected at 1080p@60Hz:
root@smarc-rzg2l:~# cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect                                duty  hardware
   clock                          count    count    count        rate   accuracy phase  cycle    enable
-------------------------------------------------------------------------------------------------------
 audio_mclock                         0        0        0    11289600          0     0  50000         Y
 extal                                5        5        0    24000000          0     0  50000         Y
    .pll5_foutpostdiv                 2        2        0   888000000          0     0  50000         Y
       M1                             1        1        0   888000000          0     0  50000         Y
          dsi_pll_clk                 1        1        0   888000000          0     0  50000         Y
       .pll5_fout1ph0                 1        1        0   444000000          0     0  50000         Y
          .sel_pll5_4                 1        1        0   444000000          0     0  50000         Y
             DSI_DIV                  1        1        0   148500000          0     0  50000         Y
                M3                    2        2        0   148500000          0     0  50000         Y
                   lcdc_clk_d         3        4        0   148500000          0     0  50000         Y
                   dsi_vclk           1        1        0   148500000          0     0  50000         Y
    .pll6                             2        2        0   500000000          0     0  50000         Y
       .sel_gpu2                      1        1        0   500000000          0     0  50000         Y
          G                           1        1        0    62500000          0     0  50000         Y
             gpu_clk                  1        2        0    62500000          0     0  50000         Y
       .pll6_250                      1        1        0   250000000          0     0  50000         Y
          HP                          2        2        0   250000000          0     0  50000         Y
    .pll5                             0        0        0  3000000000          0     0  50000         Y
       .pll5_fout3                    0        0        0   500000000          0     0  50000         Y
          .pll5_250                   0        0        0   250000000          0     0  50000         Y
    .pll3                             2        2        0  1600000000          0     0  50000         Y
       .pll3_div2                     1        1        0   800000000          0     0  50000         Y
          .pll3_div2_4                3        3        0   200000000          0     0  50000         Y
             M0                       3        3        0   200000000          0     0  50000         Y
                eth1_axi              1        1        0   200000000          0     0  50000         Y
                eth0_axi              1        1        0   200000000          0     0  50000         Y
                lcdc_a                3        4        0   200000000          0     0  50000         Y
             P1                      12       13        0   200000000          0     0  50000         Y
                usb_pclk              8       12        0   200000000          0     0  50000         Y
                usb0_func             1        1        0   200000000          0     0  50000         Y
                usb1_host             3        5        0   200000000          0     0  50000         Y
                usb0_host             3        5        0   200000000          0     0  50000         Y
                dsi_aclk              1        1        0   200000000          0     0  50000         Y
                gpu_ace_clk           0        1        0   200000000          0     0  50000         N
                gpu_axi_clk           1        2        0   200000000          0     0  50000         Y
                sdhi1_aclk            1        1        0   200000000          0     0  50000         Y
                sdhi0_aclk            1        1        0   200000000          0     0  50000         Y
                dmac_aclk             2        2        0   200000000          0     0  50000         Y
                ia55_clk              1        1        0   200000000          0     0  50000         Y
                gic                   1        1        0   200000000          0     0  50000         Y
                P1_DIV2               1        1        0   100000000          0     0  50000         Y
                   dmac_pclk          1        1        0   100000000          0     0  50000         Y
             .pll3_div2_4_2           2        2        0   100000000          0     0  50000         Y
                ZT                    3        3        0   100000000          0     0  50000         Y
                   eth1_chi           1        1        0   100000000          0     0  50000         Y
                   eth0_chi           1        1        0   100000000          0     0  50000         Y
                   lcdc_p             2        3        0   100000000          0     0  50000         Y
                P2                    1        1        0   100000000          0     0  50000         Y
                   dsi_pclk           1        1        0   100000000          0     0  50000         Y
                   ia55_pclk          0        0        0   100000000          0     0  50000         N
          .pll3_div2_2                0        0        0   400000000          0     0  50000         Y
       .pll3_533                      1        2        0   533333333          0     0  50000         Y
          M2                          1        1        0   266666666          0     0  50000         Y
             M2_DIV2                  1        1        0   133333333          0     0  50000         Y
                dsi_sys_clk           1        1        0   133333333          0     0  50000         Y
          .sel_pll3_3                 0        1        0   533333333          0     0  50000         Y
             divpl3c                  0        2        0   266666667          0     0  50000         Y
                SPI1                  0        1        0    66666666          0     0  50000         Y
                   spi_clk2           0        1        0    66666666          0     0  50000         N
                SPI0                  0        1        0   133333333          0     0  50000         Y
                   spi_clk            0        1        0   133333333          0     0  50000         N
       .pll3_400                      0        0        0   400000000          0     0  50000         Y
    .pll2                             3        3        0  1600000000          0     0  50000         Y
       .clk_533                       0        0        0   533333333          0     0  50000         Y
          .clk_266                    0        0        0   266666666          0     0  50000         Y
       .clk_800                       1        1        0   800000000          0     0  50000         Y
          .clk_400                    2        2        0   400000000          0     0  50000         Y
             sd1                      2        2        0   400000000          0     0  50000         Y
                sdhi1_clk_hs          1        1        0   400000000          0     0  50000         Y
                SD1_DIV4              2        2        0   100000000          0     0  50000         Y
                   sdhi1_imclk2       2        2        0   100000000          0     0  50000         Y
                   sdhi1_imclk        1        1        0   100000000          0     0  50000         Y
             sd0                      2        2        0   400000000          0     0  50000         Y
                sdhi0_clk_hs          1        1        0   400000000          0     0  50000         Y
                SD0_DIV4              2        2        0   100000000          0     0  50000         Y
                   sdhi0_imclk2       2        2        0   100000000          0     0  50000         Y
                   sdhi0_imclk        1        1        0   100000000          0     0  50000         Y
       .pll2_div2                     2        2        0   800000000          0     0  50000         Y
          .pll2_div2_10               1        1        0    80000000          0     0  50000         Y
             TSU                      1        2        0    80000000          0     0  50000         Y
                tsu_pclk              1        1        0    80000000          0     0  50000         Y
                adc_adclk             0        1        0    80000000          0     0  50000         N
          .pll2_div2_8                1        1        0   100000000          0     0  50000         Y
             P0                       6       15        0   100000000          0     0  50000         Y
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
                wdt2_pclk             0        1        0   100000000          0     0  50000         N
                wdt1_pclk             0        1        0   100000000          0     0  50000         N
                wdt0_pclk             0        1        0   100000000          0     0  50000         N
                ostm2_pclk            1        2        0   100000000          0     0  50000         Y
                ostm1_clk             1        2        0   100000000          0     0  50000         Y
                ostm0_pclk            0        0        0   100000000          0     0  50000         N
                P0_DIV2               0        0        0    50000000          0     0  50000         Y
       .pll2_533                      1        1        0   533333333          0     0  50000         Y
          .pll2_533_div2              1        1        0   266666666          0     0  50000         Y
             .div_dsi_lpclk           1        1        0    16666667          0     0  50000         Y
                M4                    1        1        0    16666667          0     0  50000         Y
                   dsi_lpclk          1        1        0    16666667          0     0  50000         Y
    .pll1                             0        0        0  1200000000          0     0  50000         Y
       I                              0        0        0  1200000000          0     0  50000         Y
    .osc_div1000                      0        0        0       24000          0     0  50000         Y
    .osc                              1        4        0    24000000          0     0  50000         Y
       gpio                           1        2        0    24000000          0     0  50000         Y
       wdt2_clk                       0        1        0    24000000          0     0  50000         N
       wdt1_clk                       0        1        0    24000000          0     0  50000         N
       wdt0_clk                       0        1        0    24000000          0     0  50000         N
 can                                  0        0        0           0          0     0  50000         Y
 audio_clk2                           0        0        0    12288000          0     0  50000         Y
 audio_clk1                           0        0        0    11289600          0     0  50000         Y
root@smarc-rzg2l:~#

Biju Das (9):
  clk: renesas: rzg2l: Add FOUTPOSTDIV clk support
  clk: renesas: rzg2l: Add PLL5_4 clk mux support
  clk: renesas: rzg2l: Add DSI divider clk support
  clk: renesas: r9a07g044: Add M1 clock support
  clk: renesas: r9a07g044: Add {M2, M2_DIV2} Clocks support
  clk: renesas: r9a07g044: Add M3 Clock support
  clk: renesas: r9a07g044: Add M4 Clock support
  clk: renesas: r9a07g044: Add LCDC clock and reset entries
  clk: renesas: r9a07g044: Add DSI clock and reset entries

 drivers/clk/renesas/r9a07g044-cpg.c |  58 ++++-
 drivers/clk/renesas/rzg2l-cpg.c     | 338 ++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h     |  43 ++++
 3 files changed, 437 insertions(+), 2 deletions(-)

-- 
2.17.1

