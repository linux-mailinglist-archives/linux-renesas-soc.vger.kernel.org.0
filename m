Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B347869CBCC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Feb 2023 14:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjBTNN1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Feb 2023 08:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjBTNNR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2023 08:13:17 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BCDD9B466;
        Mon, 20 Feb 2023 05:13:15 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,312,1669042800"; 
   d="scan'208";a="150197341"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Feb 2023 22:13:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3635F400546E;
        Mon, 20 Feb 2023 22:13:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
        alsa-devel@alsa-project.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 0/3] Add Versa3 clock generator support
Date:   Mon, 20 Feb 2023 13:13:04 +0000
Message-Id: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
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

48KHz playback
1f: f6 --> setting Div4 as clock source for se2 
Read at address  0x10049C00 : 0x300B4022 --> Setting Audio clk2 in SSI
       pfd2                           1        1        0    24000000 
          pll2                        1        1        0   491519897 
             div4_mux                 1        1        0   491519897
                div4                  1        1        0    12287998
                   se2_mux            1        1        0    12287998
                      se2             1        1        0    12287998
					  
44.1KHz playback
1f: b6 --> setting Div5 as clock source for se2 
Read at address  0x10049C00: 0x700B4022--> Setting Audio clk1 in SSI
    pfd3_mux                          1        1        0    24000000
       pfd3                           1        1        0      960000
          pll3                        1        1        0   564480000
             div5                     1        1        0    11289600
                se2_mux               1        1        0    11289600
                   se2                1        1        0    11289600
				   
Please provide your valuable comment for this patch series.

Biju Das (3):
  dt-bindings: clock: Add Renesas versa3 clock generator bindings
  drivers: clk: Add support for versa3 clock driver
  arm64: dts: renesas: rzg2l-smarc: Use versa3 clk for audio mclk

 .../bindings/clock/renesas,versaclock3.yaml   |  135 ++
 .../boot/dts/renesas/rz-smarc-common.dtsi     |    7 -
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |   35 +
 drivers/clk/Kconfig                           |    9 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/clk-versaclock3.c                 | 1134 +++++++++++++++++
 6 files changed, 1314 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
 create mode 100644 drivers/clk/clk-versaclock3.c

-- 
2.25.1

