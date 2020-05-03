Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDA51C2FD4
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 May 2020 23:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729198AbgECVrU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 3 May 2020 17:47:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:15735 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729104AbgECVrT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 3 May 2020 17:47:19 -0400
X-IronPort-AV: E=Sophos;i="5.73,349,1583161200"; 
   d="scan'208";a="46019248"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 May 2020 06:47:17 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 28D5D40083D1;
        Mon,  4 May 2020 06:47:13 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 02/10] pinctrl: sh-pfc: r8a7790: Add r8a7742 PFC support
Date:   Sun,  3 May 2020 22:46:46 +0100
Message-Id: <1588542414-14826-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588542414-14826-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1588542414-14826-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Renesas RZ/G1H (R8A7742) is pin compatible with R-Car H2 (R8A7790),
however it doesn't have several automotive specific peripherals. Add
a r8a7790 specific pin groups/functions along with common pin
groups/functions for supporting both r8a7790 and r8a7742 SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/Kconfig       |   4 +
 drivers/pinctrl/sh-pfc/Makefile      |   1 +
 drivers/pinctrl/sh-pfc/core.c        |   6 +
 drivers/pinctrl/sh-pfc/pfc-r8a7790.c | 744 ++++++++++++++-------------
 drivers/pinctrl/sh-pfc/sh_pfc.h      |   1 +
 5 files changed, 404 insertions(+), 352 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
index 9552851b96f1..c461a2f1927a 100644
--- a/drivers/pinctrl/sh-pfc/Kconfig
+++ b/drivers/pinctrl/sh-pfc/Kconfig
@@ -12,6 +12,7 @@ config PINCTRL_SH_PFC
 	select PINCTRL_PFC_EMEV2 if ARCH_EMEV2
 	select PINCTRL_PFC_R8A73A4 if ARCH_R8A73A4
 	select PINCTRL_PFC_R8A7740 if ARCH_R8A7740
+	select PINCTRL_PFC_R8A7742 if ARCH_R8A7742
 	select PINCTRL_PFC_R8A7743 if ARCH_R8A7743
 	select PINCTRL_PFC_R8A7744 if ARCH_R8A7744
 	select PINCTRL_PFC_R8A7745 if ARCH_R8A7745
@@ -74,6 +75,9 @@ config PINCTRL_PFC_R8A7740
 	bool "R-Mobile A1 pin control support" if COMPILE_TEST
 	select PINCTRL_SH_PFC_GPIO
 
+config PINCTRL_PFC_R8A7742
+	bool "RZ/G1H pin control support" if COMPILE_TEST
+
 config PINCTRL_PFC_R8A7743
 	bool "RZ/G1M pin control support" if COMPILE_TEST
 
diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
index 9ebe321d24c4..3855d82069c9 100644
--- a/drivers/pinctrl/sh-pfc/Makefile
+++ b/drivers/pinctrl/sh-pfc/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PINCTRL_SH_PFC_GPIO)	+= gpio.o
 obj-$(CONFIG_PINCTRL_PFC_EMEV2)	+= pfc-emev2.o
 obj-$(CONFIG_PINCTRL_PFC_R8A73A4)	+= pfc-r8a73a4.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7740)	+= pfc-r8a7740.o
+obj-$(CONFIG_PINCTRL_PFC_R8A7742)	+= pfc-r8a7790.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7743)	+= pfc-r8a7791.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7744)	+= pfc-r8a7791.o
 obj-$(CONFIG_PINCTRL_PFC_R8A7745)	+= pfc-r8a7794.o
diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index a2e19efa26e3..f368383cba61 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -485,6 +485,12 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.data = &r8a7740_pinmux_info,
 	},
 #endif
+#ifdef CONFIG_PINCTRL_PFC_R8A7742
+	{
+		.compatible = "renesas,pfc-r8a7742",
+		.data = &r8a7742_pinmux_info,
+	},
+#endif
 #ifdef CONFIG_PINCTRL_PFC_R8A7743
 	{
 		.compatible = "renesas,pfc-r8a7743",
diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
index 3366ed561cce..5b120549c6e9 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7790.c
@@ -3938,297 +3938,304 @@ static const unsigned int vin3_clk_mux[] = {
 	VI3_CLK_MARK,
 };
 
-static const struct sh_pfc_pin_group pinmux_groups[] = {
-	SH_PFC_PIN_GROUP(audio_clk_a),
-	SH_PFC_PIN_GROUP(audio_clk_b),
-	SH_PFC_PIN_GROUP(audio_clk_c),
-	SH_PFC_PIN_GROUP(audio_clkout),
-	SH_PFC_PIN_GROUP(audio_clkout_b),
-	SH_PFC_PIN_GROUP(audio_clkout_c),
-	SH_PFC_PIN_GROUP(audio_clkout_d),
-	SH_PFC_PIN_GROUP(avb_link),
-	SH_PFC_PIN_GROUP(avb_magic),
-	SH_PFC_PIN_GROUP(avb_phy_int),
-	SH_PFC_PIN_GROUP(avb_mdio),
-	SH_PFC_PIN_GROUP(avb_mii),
-	SH_PFC_PIN_GROUP(avb_gmii),
-	SH_PFC_PIN_GROUP(du_rgb666),
-	SH_PFC_PIN_GROUP(du_rgb888),
-	SH_PFC_PIN_GROUP(du_clk_out_0),
-	SH_PFC_PIN_GROUP(du_clk_out_1),
-	SH_PFC_PIN_GROUP(du_sync_0),
-	SH_PFC_PIN_GROUP(du_sync_1),
-	SH_PFC_PIN_GROUP(du_cde),
-	SH_PFC_PIN_GROUP(du0_clk_in),
-	SH_PFC_PIN_GROUP(du1_clk_in),
-	SH_PFC_PIN_GROUP(du2_clk_in),
-	SH_PFC_PIN_GROUP(eth_link),
-	SH_PFC_PIN_GROUP(eth_magic),
-	SH_PFC_PIN_GROUP(eth_mdio),
-	SH_PFC_PIN_GROUP(eth_rmii),
-	SH_PFC_PIN_GROUP(hscif0_data),
-	SH_PFC_PIN_GROUP(hscif0_clk),
-	SH_PFC_PIN_GROUP(hscif0_ctrl),
-	SH_PFC_PIN_GROUP(hscif0_data_b),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_b),
-	SH_PFC_PIN_GROUP(hscif0_data_c),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_c),
-	SH_PFC_PIN_GROUP(hscif0_data_d),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_d),
-	SH_PFC_PIN_GROUP(hscif0_data_e),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_e),
-	SH_PFC_PIN_GROUP(hscif0_data_f),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_f),
-	SH_PFC_PIN_GROUP(hscif1_data),
-	SH_PFC_PIN_GROUP(hscif1_clk),
-	SH_PFC_PIN_GROUP(hscif1_ctrl),
-	SH_PFC_PIN_GROUP(hscif1_data_b),
-	SH_PFC_PIN_GROUP(hscif1_clk_b),
-	SH_PFC_PIN_GROUP(hscif1_ctrl_b),
-	SH_PFC_PIN_GROUP(i2c0),
-	SH_PFC_PIN_GROUP(i2c1),
-	SH_PFC_PIN_GROUP(i2c1_b),
-	SH_PFC_PIN_GROUP(i2c1_c),
-	SH_PFC_PIN_GROUP(i2c2),
-	SH_PFC_PIN_GROUP(i2c2_b),
-	SH_PFC_PIN_GROUP(i2c2_c),
-	SH_PFC_PIN_GROUP(i2c2_d),
-	SH_PFC_PIN_GROUP(i2c2_e),
-	SH_PFC_PIN_GROUP(i2c3),
-	SH_PFC_PIN_GROUP(iic0),
-	SH_PFC_PIN_GROUP(iic1),
-	SH_PFC_PIN_GROUP(iic1_b),
-	SH_PFC_PIN_GROUP(iic1_c),
-	SH_PFC_PIN_GROUP(iic2),
-	SH_PFC_PIN_GROUP(iic2_b),
-	SH_PFC_PIN_GROUP(iic2_c),
-	SH_PFC_PIN_GROUP(iic2_d),
-	SH_PFC_PIN_GROUP(iic2_e),
-	SH_PFC_PIN_GROUP(iic3),
-	SH_PFC_PIN_GROUP(intc_irq0),
-	SH_PFC_PIN_GROUP(intc_irq1),
-	SH_PFC_PIN_GROUP(intc_irq2),
-	SH_PFC_PIN_GROUP(intc_irq3),
-	SH_PFC_PIN_GROUP(mlb_3pin),
-	SH_PFC_PIN_GROUP(mmc0_data1),
-	SH_PFC_PIN_GROUP(mmc0_data4),
-	SH_PFC_PIN_GROUP(mmc0_data8),
-	SH_PFC_PIN_GROUP(mmc0_ctrl),
-	SH_PFC_PIN_GROUP(mmc1_data1),
-	SH_PFC_PIN_GROUP(mmc1_data4),
-	SH_PFC_PIN_GROUP(mmc1_data8),
-	SH_PFC_PIN_GROUP(mmc1_ctrl),
-	SH_PFC_PIN_GROUP(msiof0_clk),
-	SH_PFC_PIN_GROUP(msiof0_sync),
-	SH_PFC_PIN_GROUP(msiof0_ss1),
-	SH_PFC_PIN_GROUP(msiof0_ss2),
-	SH_PFC_PIN_GROUP(msiof0_rx),
-	SH_PFC_PIN_GROUP(msiof0_tx),
-	SH_PFC_PIN_GROUP(msiof0_clk_b),
-	SH_PFC_PIN_GROUP(msiof0_ss1_b),
-	SH_PFC_PIN_GROUP(msiof0_ss2_b),
-	SH_PFC_PIN_GROUP(msiof0_rx_b),
-	SH_PFC_PIN_GROUP(msiof0_tx_b),
-	SH_PFC_PIN_GROUP(msiof1_clk),
-	SH_PFC_PIN_GROUP(msiof1_sync),
-	SH_PFC_PIN_GROUP(msiof1_ss1),
-	SH_PFC_PIN_GROUP(msiof1_ss2),
-	SH_PFC_PIN_GROUP(msiof1_rx),
-	SH_PFC_PIN_GROUP(msiof1_tx),
-	SH_PFC_PIN_GROUP(msiof1_clk_b),
-	SH_PFC_PIN_GROUP(msiof1_ss1_b),
-	SH_PFC_PIN_GROUP(msiof1_ss2_b),
-	SH_PFC_PIN_GROUP(msiof1_rx_b),
-	SH_PFC_PIN_GROUP(msiof1_tx_b),
-	SH_PFC_PIN_GROUP(msiof2_clk),
-	SH_PFC_PIN_GROUP(msiof2_sync),
-	SH_PFC_PIN_GROUP(msiof2_ss1),
-	SH_PFC_PIN_GROUP(msiof2_ss2),
-	SH_PFC_PIN_GROUP(msiof2_rx),
-	SH_PFC_PIN_GROUP(msiof2_tx),
-	SH_PFC_PIN_GROUP(msiof3_clk),
-	SH_PFC_PIN_GROUP(msiof3_sync),
-	SH_PFC_PIN_GROUP(msiof3_ss1),
-	SH_PFC_PIN_GROUP(msiof3_ss2),
-	SH_PFC_PIN_GROUP(msiof3_rx),
-	SH_PFC_PIN_GROUP(msiof3_tx),
-	SH_PFC_PIN_GROUP(msiof3_clk_b),
-	SH_PFC_PIN_GROUP(msiof3_sync_b),
-	SH_PFC_PIN_GROUP(msiof3_rx_b),
-	SH_PFC_PIN_GROUP(msiof3_tx_b),
-	SH_PFC_PIN_GROUP(pwm0),
-	SH_PFC_PIN_GROUP(pwm0_b),
-	SH_PFC_PIN_GROUP(pwm1),
-	SH_PFC_PIN_GROUP(pwm1_b),
-	SH_PFC_PIN_GROUP(pwm2),
-	SH_PFC_PIN_GROUP(pwm3),
-	SH_PFC_PIN_GROUP(pwm4),
-	SH_PFC_PIN_GROUP(pwm5),
-	SH_PFC_PIN_GROUP(pwm6),
-	SH_PFC_PIN_GROUP(qspi_ctrl),
-	SH_PFC_PIN_GROUP(qspi_data2),
-	SH_PFC_PIN_GROUP(qspi_data4),
-	SH_PFC_PIN_GROUP(scif0_data),
-	SH_PFC_PIN_GROUP(scif0_clk),
-	SH_PFC_PIN_GROUP(scif0_ctrl),
-	SH_PFC_PIN_GROUP(scif0_data_b),
-	SH_PFC_PIN_GROUP(scif1_data),
-	SH_PFC_PIN_GROUP(scif1_clk),
-	SH_PFC_PIN_GROUP(scif1_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_b),
-	SH_PFC_PIN_GROUP(scif1_data_c),
-	SH_PFC_PIN_GROUP(scif1_data_d),
-	SH_PFC_PIN_GROUP(scif1_clk_d),
-	SH_PFC_PIN_GROUP(scif1_data_e),
-	SH_PFC_PIN_GROUP(scif1_clk_e),
-	SH_PFC_PIN_GROUP(scif2_data),
-	SH_PFC_PIN_GROUP(scif2_clk),
-	SH_PFC_PIN_GROUP(scif2_data_b),
-	SH_PFC_PIN_GROUP(scifa0_data),
-	SH_PFC_PIN_GROUP(scifa0_clk),
-	SH_PFC_PIN_GROUP(scifa0_ctrl),
-	SH_PFC_PIN_GROUP(scifa0_data_b),
-	SH_PFC_PIN_GROUP(scifa0_clk_b),
-	SH_PFC_PIN_GROUP(scifa0_ctrl_b),
-	SH_PFC_PIN_GROUP(scifa1_data),
-	SH_PFC_PIN_GROUP(scifa1_clk),
-	SH_PFC_PIN_GROUP(scifa1_ctrl),
-	SH_PFC_PIN_GROUP(scifa1_data_b),
-	SH_PFC_PIN_GROUP(scifa1_clk_b),
-	SH_PFC_PIN_GROUP(scifa1_ctrl_b),
-	SH_PFC_PIN_GROUP(scifa1_data_c),
-	SH_PFC_PIN_GROUP(scifa1_clk_c),
-	SH_PFC_PIN_GROUP(scifa1_ctrl_c),
-	SH_PFC_PIN_GROUP(scifa1_data_d),
-	SH_PFC_PIN_GROUP(scifa1_clk_d),
-	SH_PFC_PIN_GROUP(scifa1_ctrl_d),
-	SH_PFC_PIN_GROUP(scifa2_data),
-	SH_PFC_PIN_GROUP(scifa2_clk),
-	SH_PFC_PIN_GROUP(scifa2_ctrl),
-	SH_PFC_PIN_GROUP(scifa2_data_b),
-	SH_PFC_PIN_GROUP(scifa2_data_c),
-	SH_PFC_PIN_GROUP(scifa2_clk_c),
-	SH_PFC_PIN_GROUP(scifb0_data),
-	SH_PFC_PIN_GROUP(scifb0_clk),
-	SH_PFC_PIN_GROUP(scifb0_ctrl),
-	SH_PFC_PIN_GROUP(scifb0_data_b),
-	SH_PFC_PIN_GROUP(scifb0_clk_b),
-	SH_PFC_PIN_GROUP(scifb0_ctrl_b),
-	SH_PFC_PIN_GROUP(scifb0_data_c),
-	SH_PFC_PIN_GROUP(scifb1_data),
-	SH_PFC_PIN_GROUP(scifb1_clk),
-	SH_PFC_PIN_GROUP(scifb1_ctrl),
-	SH_PFC_PIN_GROUP(scifb1_data_b),
-	SH_PFC_PIN_GROUP(scifb1_clk_b),
-	SH_PFC_PIN_GROUP(scifb1_ctrl_b),
-	SH_PFC_PIN_GROUP(scifb1_data_c),
-	SH_PFC_PIN_GROUP(scifb1_data_d),
-	SH_PFC_PIN_GROUP(scifb1_data_e),
-	SH_PFC_PIN_GROUP(scifb1_clk_e),
-	SH_PFC_PIN_GROUP(scifb1_data_f),
-	SH_PFC_PIN_GROUP(scifb1_data_g),
-	SH_PFC_PIN_GROUP(scifb1_clk_g),
-	SH_PFC_PIN_GROUP(scifb2_data),
-	SH_PFC_PIN_GROUP(scifb2_clk),
-	SH_PFC_PIN_GROUP(scifb2_ctrl),
-	SH_PFC_PIN_GROUP(scifb2_data_b),
-	SH_PFC_PIN_GROUP(scifb2_clk_b),
-	SH_PFC_PIN_GROUP(scifb2_ctrl_b),
-	SH_PFC_PIN_GROUP(scifb2_data_c),
-	SH_PFC_PIN_GROUP(scif_clk),
-	SH_PFC_PIN_GROUP(scif_clk_b),
-	SH_PFC_PIN_GROUP(sdhi0_data1),
-	SH_PFC_PIN_GROUP(sdhi0_data4),
-	SH_PFC_PIN_GROUP(sdhi0_ctrl),
-	SH_PFC_PIN_GROUP(sdhi0_cd),
-	SH_PFC_PIN_GROUP(sdhi0_wp),
-	SH_PFC_PIN_GROUP(sdhi1_data1),
-	SH_PFC_PIN_GROUP(sdhi1_data4),
-	SH_PFC_PIN_GROUP(sdhi1_ctrl),
-	SH_PFC_PIN_GROUP(sdhi1_cd),
-	SH_PFC_PIN_GROUP(sdhi1_wp),
-	SH_PFC_PIN_GROUP(sdhi2_data1),
-	SH_PFC_PIN_GROUP(sdhi2_data4),
-	SH_PFC_PIN_GROUP(sdhi2_ctrl),
-	SH_PFC_PIN_GROUP(sdhi2_cd),
-	SH_PFC_PIN_GROUP(sdhi2_wp),
-	SH_PFC_PIN_GROUP(sdhi3_data1),
-	SH_PFC_PIN_GROUP(sdhi3_data4),
-	SH_PFC_PIN_GROUP(sdhi3_ctrl),
-	SH_PFC_PIN_GROUP(sdhi3_cd),
-	SH_PFC_PIN_GROUP(sdhi3_wp),
-	SH_PFC_PIN_GROUP(ssi0_data),
-	SH_PFC_PIN_GROUP(ssi0129_ctrl),
-	SH_PFC_PIN_GROUP(ssi1_data),
-	SH_PFC_PIN_GROUP(ssi1_ctrl),
-	SH_PFC_PIN_GROUP(ssi2_data),
-	SH_PFC_PIN_GROUP(ssi2_ctrl),
-	SH_PFC_PIN_GROUP(ssi3_data),
-	SH_PFC_PIN_GROUP(ssi34_ctrl),
-	SH_PFC_PIN_GROUP(ssi4_data),
-	SH_PFC_PIN_GROUP(ssi4_ctrl),
-	SH_PFC_PIN_GROUP(ssi5),
-	SH_PFC_PIN_GROUP(ssi5_b),
-	SH_PFC_PIN_GROUP(ssi5_c),
-	SH_PFC_PIN_GROUP(ssi6),
-	SH_PFC_PIN_GROUP(ssi6_b),
-	SH_PFC_PIN_GROUP(ssi7_data),
-	SH_PFC_PIN_GROUP(ssi7_b_data),
-	SH_PFC_PIN_GROUP(ssi7_c_data),
-	SH_PFC_PIN_GROUP(ssi78_ctrl),
-	SH_PFC_PIN_GROUP(ssi78_b_ctrl),
-	SH_PFC_PIN_GROUP(ssi78_c_ctrl),
-	SH_PFC_PIN_GROUP(ssi8_data),
-	SH_PFC_PIN_GROUP(ssi8_b_data),
-	SH_PFC_PIN_GROUP(ssi8_c_data),
-	SH_PFC_PIN_GROUP(ssi9_data),
-	SH_PFC_PIN_GROUP(ssi9_ctrl),
-	SH_PFC_PIN_GROUP(tpu0_to0),
-	SH_PFC_PIN_GROUP(tpu0_to1),
-	SH_PFC_PIN_GROUP(tpu0_to2),
-	SH_PFC_PIN_GROUP(tpu0_to3),
-	SH_PFC_PIN_GROUP(usb0),
-	SH_PFC_PIN_GROUP(usb0_ovc_vbus),
-	SH_PFC_PIN_GROUP(usb1),
-	SH_PFC_PIN_GROUP(usb2),
-	VIN_DATA_PIN_GROUP(vin0_data, 24),
-	VIN_DATA_PIN_GROUP(vin0_data, 20),
-	SH_PFC_PIN_GROUP(vin0_data18),
-	VIN_DATA_PIN_GROUP(vin0_data, 16),
-	VIN_DATA_PIN_GROUP(vin0_data, 12),
-	VIN_DATA_PIN_GROUP(vin0_data, 10),
-	VIN_DATA_PIN_GROUP(vin0_data, 8),
-	VIN_DATA_PIN_GROUP(vin0_data, 4),
-	SH_PFC_PIN_GROUP(vin0_sync),
-	SH_PFC_PIN_GROUP(vin0_field),
-	SH_PFC_PIN_GROUP(vin0_clkenb),
-	SH_PFC_PIN_GROUP(vin0_clk),
-	VIN_DATA_PIN_GROUP(vin1_data, 24),
-	VIN_DATA_PIN_GROUP(vin1_data, 20),
-	SH_PFC_PIN_GROUP(vin1_data18),
-	VIN_DATA_PIN_GROUP(vin1_data, 16),
-	VIN_DATA_PIN_GROUP(vin1_data, 12),
-	VIN_DATA_PIN_GROUP(vin1_data, 10),
-	VIN_DATA_PIN_GROUP(vin1_data, 8),
-	VIN_DATA_PIN_GROUP(vin1_data, 4),
-	SH_PFC_PIN_GROUP(vin1_sync),
-	SH_PFC_PIN_GROUP(vin1_field),
-	SH_PFC_PIN_GROUP(vin1_clkenb),
-	SH_PFC_PIN_GROUP(vin1_clk),
-	VIN_DATA_PIN_GROUP(vin2_data, 24),
-	SH_PFC_PIN_GROUP(vin2_data18),
-	VIN_DATA_PIN_GROUP(vin2_data, 16),
-	VIN_DATA_PIN_GROUP(vin2_data, 8),
-	VIN_DATA_PIN_GROUP(vin2_data, 4),
-	SH_PFC_PIN_GROUP(vin2_sync),
-	SH_PFC_PIN_GROUP(vin2_field),
-	SH_PFC_PIN_GROUP(vin2_clkenb),
-	SH_PFC_PIN_GROUP(vin2_clk),
-	SH_PFC_PIN_GROUP(vin3_data8),
-	SH_PFC_PIN_GROUP(vin3_sync),
-	SH_PFC_PIN_GROUP(vin3_field),
-	SH_PFC_PIN_GROUP(vin3_clkenb),
-	SH_PFC_PIN_GROUP(vin3_clk),
+static const struct {
+	struct sh_pfc_pin_group common[289];
+	struct sh_pfc_pin_group automotive[1];
+} pinmux_groups = {
+	.common = {
+		SH_PFC_PIN_GROUP(audio_clk_a),
+		SH_PFC_PIN_GROUP(audio_clk_b),
+		SH_PFC_PIN_GROUP(audio_clk_c),
+		SH_PFC_PIN_GROUP(audio_clkout),
+		SH_PFC_PIN_GROUP(audio_clkout_b),
+		SH_PFC_PIN_GROUP(audio_clkout_c),
+		SH_PFC_PIN_GROUP(audio_clkout_d),
+		SH_PFC_PIN_GROUP(avb_link),
+		SH_PFC_PIN_GROUP(avb_magic),
+		SH_PFC_PIN_GROUP(avb_phy_int),
+		SH_PFC_PIN_GROUP(avb_mdio),
+		SH_PFC_PIN_GROUP(avb_mii),
+		SH_PFC_PIN_GROUP(avb_gmii),
+		SH_PFC_PIN_GROUP(du_rgb666),
+		SH_PFC_PIN_GROUP(du_rgb888),
+		SH_PFC_PIN_GROUP(du_clk_out_0),
+		SH_PFC_PIN_GROUP(du_clk_out_1),
+		SH_PFC_PIN_GROUP(du_sync_0),
+		SH_PFC_PIN_GROUP(du_sync_1),
+		SH_PFC_PIN_GROUP(du_cde),
+		SH_PFC_PIN_GROUP(du0_clk_in),
+		SH_PFC_PIN_GROUP(du1_clk_in),
+		SH_PFC_PIN_GROUP(du2_clk_in),
+		SH_PFC_PIN_GROUP(eth_link),
+		SH_PFC_PIN_GROUP(eth_magic),
+		SH_PFC_PIN_GROUP(eth_mdio),
+		SH_PFC_PIN_GROUP(eth_rmii),
+		SH_PFC_PIN_GROUP(hscif0_data),
+		SH_PFC_PIN_GROUP(hscif0_clk),
+		SH_PFC_PIN_GROUP(hscif0_ctrl),
+		SH_PFC_PIN_GROUP(hscif0_data_b),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_b),
+		SH_PFC_PIN_GROUP(hscif0_data_c),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_c),
+		SH_PFC_PIN_GROUP(hscif0_data_d),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_d),
+		SH_PFC_PIN_GROUP(hscif0_data_e),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_e),
+		SH_PFC_PIN_GROUP(hscif0_data_f),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_f),
+		SH_PFC_PIN_GROUP(hscif1_data),
+		SH_PFC_PIN_GROUP(hscif1_clk),
+		SH_PFC_PIN_GROUP(hscif1_ctrl),
+		SH_PFC_PIN_GROUP(hscif1_data_b),
+		SH_PFC_PIN_GROUP(hscif1_clk_b),
+		SH_PFC_PIN_GROUP(hscif1_ctrl_b),
+		SH_PFC_PIN_GROUP(i2c0),
+		SH_PFC_PIN_GROUP(i2c1),
+		SH_PFC_PIN_GROUP(i2c1_b),
+		SH_PFC_PIN_GROUP(i2c1_c),
+		SH_PFC_PIN_GROUP(i2c2),
+		SH_PFC_PIN_GROUP(i2c2_b),
+		SH_PFC_PIN_GROUP(i2c2_c),
+		SH_PFC_PIN_GROUP(i2c2_d),
+		SH_PFC_PIN_GROUP(i2c2_e),
+		SH_PFC_PIN_GROUP(i2c3),
+		SH_PFC_PIN_GROUP(iic0),
+		SH_PFC_PIN_GROUP(iic1),
+		SH_PFC_PIN_GROUP(iic1_b),
+		SH_PFC_PIN_GROUP(iic1_c),
+		SH_PFC_PIN_GROUP(iic2),
+		SH_PFC_PIN_GROUP(iic2_b),
+		SH_PFC_PIN_GROUP(iic2_c),
+		SH_PFC_PIN_GROUP(iic2_d),
+		SH_PFC_PIN_GROUP(iic2_e),
+		SH_PFC_PIN_GROUP(iic3),
+		SH_PFC_PIN_GROUP(intc_irq0),
+		SH_PFC_PIN_GROUP(intc_irq1),
+		SH_PFC_PIN_GROUP(intc_irq2),
+		SH_PFC_PIN_GROUP(intc_irq3),
+		SH_PFC_PIN_GROUP(mmc0_data1),
+		SH_PFC_PIN_GROUP(mmc0_data4),
+		SH_PFC_PIN_GROUP(mmc0_data8),
+		SH_PFC_PIN_GROUP(mmc0_ctrl),
+		SH_PFC_PIN_GROUP(mmc1_data1),
+		SH_PFC_PIN_GROUP(mmc1_data4),
+		SH_PFC_PIN_GROUP(mmc1_data8),
+		SH_PFC_PIN_GROUP(mmc1_ctrl),
+		SH_PFC_PIN_GROUP(msiof0_clk),
+		SH_PFC_PIN_GROUP(msiof0_sync),
+		SH_PFC_PIN_GROUP(msiof0_ss1),
+		SH_PFC_PIN_GROUP(msiof0_ss2),
+		SH_PFC_PIN_GROUP(msiof0_rx),
+		SH_PFC_PIN_GROUP(msiof0_tx),
+		SH_PFC_PIN_GROUP(msiof0_clk_b),
+		SH_PFC_PIN_GROUP(msiof0_ss1_b),
+		SH_PFC_PIN_GROUP(msiof0_ss2_b),
+		SH_PFC_PIN_GROUP(msiof0_rx_b),
+		SH_PFC_PIN_GROUP(msiof0_tx_b),
+		SH_PFC_PIN_GROUP(msiof1_clk),
+		SH_PFC_PIN_GROUP(msiof1_sync),
+		SH_PFC_PIN_GROUP(msiof1_ss1),
+		SH_PFC_PIN_GROUP(msiof1_ss2),
+		SH_PFC_PIN_GROUP(msiof1_rx),
+		SH_PFC_PIN_GROUP(msiof1_tx),
+		SH_PFC_PIN_GROUP(msiof1_clk_b),
+		SH_PFC_PIN_GROUP(msiof1_ss1_b),
+		SH_PFC_PIN_GROUP(msiof1_ss2_b),
+		SH_PFC_PIN_GROUP(msiof1_rx_b),
+		SH_PFC_PIN_GROUP(msiof1_tx_b),
+		SH_PFC_PIN_GROUP(msiof2_clk),
+		SH_PFC_PIN_GROUP(msiof2_sync),
+		SH_PFC_PIN_GROUP(msiof2_ss1),
+		SH_PFC_PIN_GROUP(msiof2_ss2),
+		SH_PFC_PIN_GROUP(msiof2_rx),
+		SH_PFC_PIN_GROUP(msiof2_tx),
+		SH_PFC_PIN_GROUP(msiof3_clk),
+		SH_PFC_PIN_GROUP(msiof3_sync),
+		SH_PFC_PIN_GROUP(msiof3_ss1),
+		SH_PFC_PIN_GROUP(msiof3_ss2),
+		SH_PFC_PIN_GROUP(msiof3_rx),
+		SH_PFC_PIN_GROUP(msiof3_tx),
+		SH_PFC_PIN_GROUP(msiof3_clk_b),
+		SH_PFC_PIN_GROUP(msiof3_sync_b),
+		SH_PFC_PIN_GROUP(msiof3_rx_b),
+		SH_PFC_PIN_GROUP(msiof3_tx_b),
+		SH_PFC_PIN_GROUP(pwm0),
+		SH_PFC_PIN_GROUP(pwm0_b),
+		SH_PFC_PIN_GROUP(pwm1),
+		SH_PFC_PIN_GROUP(pwm1_b),
+		SH_PFC_PIN_GROUP(pwm2),
+		SH_PFC_PIN_GROUP(pwm3),
+		SH_PFC_PIN_GROUP(pwm4),
+		SH_PFC_PIN_GROUP(pwm5),
+		SH_PFC_PIN_GROUP(pwm6),
+		SH_PFC_PIN_GROUP(qspi_ctrl),
+		SH_PFC_PIN_GROUP(qspi_data2),
+		SH_PFC_PIN_GROUP(qspi_data4),
+		SH_PFC_PIN_GROUP(scif0_data),
+		SH_PFC_PIN_GROUP(scif0_clk),
+		SH_PFC_PIN_GROUP(scif0_ctrl),
+		SH_PFC_PIN_GROUP(scif0_data_b),
+		SH_PFC_PIN_GROUP(scif1_data),
+		SH_PFC_PIN_GROUP(scif1_clk),
+		SH_PFC_PIN_GROUP(scif1_ctrl),
+		SH_PFC_PIN_GROUP(scif1_data_b),
+		SH_PFC_PIN_GROUP(scif1_data_c),
+		SH_PFC_PIN_GROUP(scif1_data_d),
+		SH_PFC_PIN_GROUP(scif1_clk_d),
+		SH_PFC_PIN_GROUP(scif1_data_e),
+		SH_PFC_PIN_GROUP(scif1_clk_e),
+		SH_PFC_PIN_GROUP(scif2_data),
+		SH_PFC_PIN_GROUP(scif2_clk),
+		SH_PFC_PIN_GROUP(scif2_data_b),
+		SH_PFC_PIN_GROUP(scifa0_data),
+		SH_PFC_PIN_GROUP(scifa0_clk),
+		SH_PFC_PIN_GROUP(scifa0_ctrl),
+		SH_PFC_PIN_GROUP(scifa0_data_b),
+		SH_PFC_PIN_GROUP(scifa0_clk_b),
+		SH_PFC_PIN_GROUP(scifa0_ctrl_b),
+		SH_PFC_PIN_GROUP(scifa1_data),
+		SH_PFC_PIN_GROUP(scifa1_clk),
+		SH_PFC_PIN_GROUP(scifa1_ctrl),
+		SH_PFC_PIN_GROUP(scifa1_data_b),
+		SH_PFC_PIN_GROUP(scifa1_clk_b),
+		SH_PFC_PIN_GROUP(scifa1_ctrl_b),
+		SH_PFC_PIN_GROUP(scifa1_data_c),
+		SH_PFC_PIN_GROUP(scifa1_clk_c),
+		SH_PFC_PIN_GROUP(scifa1_ctrl_c),
+		SH_PFC_PIN_GROUP(scifa1_data_d),
+		SH_PFC_PIN_GROUP(scifa1_clk_d),
+		SH_PFC_PIN_GROUP(scifa1_ctrl_d),
+		SH_PFC_PIN_GROUP(scifa2_data),
+		SH_PFC_PIN_GROUP(scifa2_clk),
+		SH_PFC_PIN_GROUP(scifa2_ctrl),
+		SH_PFC_PIN_GROUP(scifa2_data_b),
+		SH_PFC_PIN_GROUP(scifa2_data_c),
+		SH_PFC_PIN_GROUP(scifa2_clk_c),
+		SH_PFC_PIN_GROUP(scifb0_data),
+		SH_PFC_PIN_GROUP(scifb0_clk),
+		SH_PFC_PIN_GROUP(scifb0_ctrl),
+		SH_PFC_PIN_GROUP(scifb0_data_b),
+		SH_PFC_PIN_GROUP(scifb0_clk_b),
+		SH_PFC_PIN_GROUP(scifb0_ctrl_b),
+		SH_PFC_PIN_GROUP(scifb0_data_c),
+		SH_PFC_PIN_GROUP(scifb1_data),
+		SH_PFC_PIN_GROUP(scifb1_clk),
+		SH_PFC_PIN_GROUP(scifb1_ctrl),
+		SH_PFC_PIN_GROUP(scifb1_data_b),
+		SH_PFC_PIN_GROUP(scifb1_clk_b),
+		SH_PFC_PIN_GROUP(scifb1_ctrl_b),
+		SH_PFC_PIN_GROUP(scifb1_data_c),
+		SH_PFC_PIN_GROUP(scifb1_data_d),
+		SH_PFC_PIN_GROUP(scifb1_data_e),
+		SH_PFC_PIN_GROUP(scifb1_clk_e),
+		SH_PFC_PIN_GROUP(scifb1_data_f),
+		SH_PFC_PIN_GROUP(scifb1_data_g),
+		SH_PFC_PIN_GROUP(scifb1_clk_g),
+		SH_PFC_PIN_GROUP(scifb2_data),
+		SH_PFC_PIN_GROUP(scifb2_clk),
+		SH_PFC_PIN_GROUP(scifb2_ctrl),
+		SH_PFC_PIN_GROUP(scifb2_data_b),
+		SH_PFC_PIN_GROUP(scifb2_clk_b),
+		SH_PFC_PIN_GROUP(scifb2_ctrl_b),
+		SH_PFC_PIN_GROUP(scifb2_data_c),
+		SH_PFC_PIN_GROUP(scif_clk),
+		SH_PFC_PIN_GROUP(scif_clk_b),
+		SH_PFC_PIN_GROUP(sdhi0_data1),
+		SH_PFC_PIN_GROUP(sdhi0_data4),
+		SH_PFC_PIN_GROUP(sdhi0_ctrl),
+		SH_PFC_PIN_GROUP(sdhi0_cd),
+		SH_PFC_PIN_GROUP(sdhi0_wp),
+		SH_PFC_PIN_GROUP(sdhi1_data1),
+		SH_PFC_PIN_GROUP(sdhi1_data4),
+		SH_PFC_PIN_GROUP(sdhi1_ctrl),
+		SH_PFC_PIN_GROUP(sdhi1_cd),
+		SH_PFC_PIN_GROUP(sdhi1_wp),
+		SH_PFC_PIN_GROUP(sdhi2_data1),
+		SH_PFC_PIN_GROUP(sdhi2_data4),
+		SH_PFC_PIN_GROUP(sdhi2_ctrl),
+		SH_PFC_PIN_GROUP(sdhi2_cd),
+		SH_PFC_PIN_GROUP(sdhi2_wp),
+		SH_PFC_PIN_GROUP(sdhi3_data1),
+		SH_PFC_PIN_GROUP(sdhi3_data4),
+		SH_PFC_PIN_GROUP(sdhi3_ctrl),
+		SH_PFC_PIN_GROUP(sdhi3_cd),
+		SH_PFC_PIN_GROUP(sdhi3_wp),
+		SH_PFC_PIN_GROUP(ssi0_data),
+		SH_PFC_PIN_GROUP(ssi0129_ctrl),
+		SH_PFC_PIN_GROUP(ssi1_data),
+		SH_PFC_PIN_GROUP(ssi1_ctrl),
+		SH_PFC_PIN_GROUP(ssi2_data),
+		SH_PFC_PIN_GROUP(ssi2_ctrl),
+		SH_PFC_PIN_GROUP(ssi3_data),
+		SH_PFC_PIN_GROUP(ssi34_ctrl),
+		SH_PFC_PIN_GROUP(ssi4_data),
+		SH_PFC_PIN_GROUP(ssi4_ctrl),
+		SH_PFC_PIN_GROUP(ssi5),
+		SH_PFC_PIN_GROUP(ssi5_b),
+		SH_PFC_PIN_GROUP(ssi5_c),
+		SH_PFC_PIN_GROUP(ssi6),
+		SH_PFC_PIN_GROUP(ssi6_b),
+		SH_PFC_PIN_GROUP(ssi7_data),
+		SH_PFC_PIN_GROUP(ssi7_b_data),
+		SH_PFC_PIN_GROUP(ssi7_c_data),
+		SH_PFC_PIN_GROUP(ssi78_ctrl),
+		SH_PFC_PIN_GROUP(ssi78_b_ctrl),
+		SH_PFC_PIN_GROUP(ssi78_c_ctrl),
+		SH_PFC_PIN_GROUP(ssi8_data),
+		SH_PFC_PIN_GROUP(ssi8_b_data),
+		SH_PFC_PIN_GROUP(ssi8_c_data),
+		SH_PFC_PIN_GROUP(ssi9_data),
+		SH_PFC_PIN_GROUP(ssi9_ctrl),
+		SH_PFC_PIN_GROUP(tpu0_to0),
+		SH_PFC_PIN_GROUP(tpu0_to1),
+		SH_PFC_PIN_GROUP(tpu0_to2),
+		SH_PFC_PIN_GROUP(tpu0_to3),
+		SH_PFC_PIN_GROUP(usb0),
+		SH_PFC_PIN_GROUP(usb0_ovc_vbus),
+		SH_PFC_PIN_GROUP(usb1),
+		SH_PFC_PIN_GROUP(usb2),
+		VIN_DATA_PIN_GROUP(vin0_data, 24),
+		VIN_DATA_PIN_GROUP(vin0_data, 20),
+		SH_PFC_PIN_GROUP(vin0_data18),
+		VIN_DATA_PIN_GROUP(vin0_data, 16),
+		VIN_DATA_PIN_GROUP(vin0_data, 12),
+		VIN_DATA_PIN_GROUP(vin0_data, 10),
+		VIN_DATA_PIN_GROUP(vin0_data, 8),
+		VIN_DATA_PIN_GROUP(vin0_data, 4),
+		SH_PFC_PIN_GROUP(vin0_sync),
+		SH_PFC_PIN_GROUP(vin0_field),
+		SH_PFC_PIN_GROUP(vin0_clkenb),
+		SH_PFC_PIN_GROUP(vin0_clk),
+		VIN_DATA_PIN_GROUP(vin1_data, 24),
+		VIN_DATA_PIN_GROUP(vin1_data, 20),
+		SH_PFC_PIN_GROUP(vin1_data18),
+		VIN_DATA_PIN_GROUP(vin1_data, 16),
+		VIN_DATA_PIN_GROUP(vin1_data, 12),
+		VIN_DATA_PIN_GROUP(vin1_data, 10),
+		VIN_DATA_PIN_GROUP(vin1_data, 8),
+		VIN_DATA_PIN_GROUP(vin1_data, 4),
+		SH_PFC_PIN_GROUP(vin1_sync),
+		SH_PFC_PIN_GROUP(vin1_field),
+		SH_PFC_PIN_GROUP(vin1_clkenb),
+		SH_PFC_PIN_GROUP(vin1_clk),
+		VIN_DATA_PIN_GROUP(vin2_data, 24),
+		SH_PFC_PIN_GROUP(vin2_data18),
+		VIN_DATA_PIN_GROUP(vin2_data, 16),
+		VIN_DATA_PIN_GROUP(vin2_data, 8),
+		VIN_DATA_PIN_GROUP(vin2_data, 4),
+		SH_PFC_PIN_GROUP(vin2_sync),
+		SH_PFC_PIN_GROUP(vin2_field),
+		SH_PFC_PIN_GROUP(vin2_clkenb),
+		SH_PFC_PIN_GROUP(vin2_clk),
+		SH_PFC_PIN_GROUP(vin3_data8),
+		SH_PFC_PIN_GROUP(vin3_sync),
+		SH_PFC_PIN_GROUP(vin3_field),
+		SH_PFC_PIN_GROUP(vin3_clkenb),
+		SH_PFC_PIN_GROUP(vin3_clk),
+	},
+	.automotive = {
+		SH_PFC_PIN_GROUP(mlb_3pin),
+	}
 };
 
 static const char * const audio_clk_groups[] = {
@@ -4689,63 +4696,70 @@ static const char * const vin3_groups[] = {
 	"vin3_clk",
 };
 
-static const struct sh_pfc_function pinmux_functions[] = {
-	SH_PFC_FUNCTION(audio_clk),
-	SH_PFC_FUNCTION(avb),
-	SH_PFC_FUNCTION(du),
-	SH_PFC_FUNCTION(du0),
-	SH_PFC_FUNCTION(du1),
-	SH_PFC_FUNCTION(du2),
-	SH_PFC_FUNCTION(eth),
-	SH_PFC_FUNCTION(hscif0),
-	SH_PFC_FUNCTION(hscif1),
-	SH_PFC_FUNCTION(i2c0),
-	SH_PFC_FUNCTION(i2c1),
-	SH_PFC_FUNCTION(i2c2),
-	SH_PFC_FUNCTION(i2c3),
-	SH_PFC_FUNCTION(iic0),
-	SH_PFC_FUNCTION(iic1),
-	SH_PFC_FUNCTION(iic2),
-	SH_PFC_FUNCTION(iic3),
-	SH_PFC_FUNCTION(intc),
-	SH_PFC_FUNCTION(mlb),
-	SH_PFC_FUNCTION(mmc0),
-	SH_PFC_FUNCTION(mmc1),
-	SH_PFC_FUNCTION(msiof0),
-	SH_PFC_FUNCTION(msiof1),
-	SH_PFC_FUNCTION(msiof2),
-	SH_PFC_FUNCTION(msiof3),
-	SH_PFC_FUNCTION(pwm0),
-	SH_PFC_FUNCTION(pwm1),
-	SH_PFC_FUNCTION(pwm2),
-	SH_PFC_FUNCTION(pwm3),
-	SH_PFC_FUNCTION(pwm4),
-	SH_PFC_FUNCTION(pwm5),
-	SH_PFC_FUNCTION(pwm6),
-	SH_PFC_FUNCTION(qspi),
-	SH_PFC_FUNCTION(scif0),
-	SH_PFC_FUNCTION(scif1),
-	SH_PFC_FUNCTION(scif2),
-	SH_PFC_FUNCTION(scifa0),
-	SH_PFC_FUNCTION(scifa1),
-	SH_PFC_FUNCTION(scifa2),
-	SH_PFC_FUNCTION(scifb0),
-	SH_PFC_FUNCTION(scifb1),
-	SH_PFC_FUNCTION(scifb2),
-	SH_PFC_FUNCTION(scif_clk),
-	SH_PFC_FUNCTION(sdhi0),
-	SH_PFC_FUNCTION(sdhi1),
-	SH_PFC_FUNCTION(sdhi2),
-	SH_PFC_FUNCTION(sdhi3),
-	SH_PFC_FUNCTION(ssi),
-	SH_PFC_FUNCTION(tpu0),
-	SH_PFC_FUNCTION(usb0),
-	SH_PFC_FUNCTION(usb1),
-	SH_PFC_FUNCTION(usb2),
-	SH_PFC_FUNCTION(vin0),
-	SH_PFC_FUNCTION(vin1),
-	SH_PFC_FUNCTION(vin2),
-	SH_PFC_FUNCTION(vin3),
+static const struct {
+	struct sh_pfc_function common[55];
+	struct sh_pfc_function automotive[1];
+} pinmux_functions = {
+	.common = {
+		SH_PFC_FUNCTION(audio_clk),
+		SH_PFC_FUNCTION(avb),
+		SH_PFC_FUNCTION(du),
+		SH_PFC_FUNCTION(du0),
+		SH_PFC_FUNCTION(du1),
+		SH_PFC_FUNCTION(du2),
+		SH_PFC_FUNCTION(eth),
+		SH_PFC_FUNCTION(hscif0),
+		SH_PFC_FUNCTION(hscif1),
+		SH_PFC_FUNCTION(i2c0),
+		SH_PFC_FUNCTION(i2c1),
+		SH_PFC_FUNCTION(i2c2),
+		SH_PFC_FUNCTION(i2c3),
+		SH_PFC_FUNCTION(iic0),
+		SH_PFC_FUNCTION(iic1),
+		SH_PFC_FUNCTION(iic2),
+		SH_PFC_FUNCTION(iic3),
+		SH_PFC_FUNCTION(intc),
+		SH_PFC_FUNCTION(mmc0),
+		SH_PFC_FUNCTION(mmc1),
+		SH_PFC_FUNCTION(msiof0),
+		SH_PFC_FUNCTION(msiof1),
+		SH_PFC_FUNCTION(msiof2),
+		SH_PFC_FUNCTION(msiof3),
+		SH_PFC_FUNCTION(pwm0),
+		SH_PFC_FUNCTION(pwm1),
+		SH_PFC_FUNCTION(pwm2),
+		SH_PFC_FUNCTION(pwm3),
+		SH_PFC_FUNCTION(pwm4),
+		SH_PFC_FUNCTION(pwm5),
+		SH_PFC_FUNCTION(pwm6),
+		SH_PFC_FUNCTION(qspi),
+		SH_PFC_FUNCTION(scif0),
+		SH_PFC_FUNCTION(scif1),
+		SH_PFC_FUNCTION(scif2),
+		SH_PFC_FUNCTION(scifa0),
+		SH_PFC_FUNCTION(scifa1),
+		SH_PFC_FUNCTION(scifa2),
+		SH_PFC_FUNCTION(scifb0),
+		SH_PFC_FUNCTION(scifb1),
+		SH_PFC_FUNCTION(scifb2),
+		SH_PFC_FUNCTION(scif_clk),
+		SH_PFC_FUNCTION(sdhi0),
+		SH_PFC_FUNCTION(sdhi1),
+		SH_PFC_FUNCTION(sdhi2),
+		SH_PFC_FUNCTION(sdhi3),
+		SH_PFC_FUNCTION(ssi),
+		SH_PFC_FUNCTION(tpu0),
+		SH_PFC_FUNCTION(usb0),
+		SH_PFC_FUNCTION(usb1),
+		SH_PFC_FUNCTION(usb2),
+		SH_PFC_FUNCTION(vin0),
+		SH_PFC_FUNCTION(vin1),
+		SH_PFC_FUNCTION(vin2),
+		SH_PFC_FUNCTION(vin3),
+	},
+	.automotive = {
+		SH_PFC_FUNCTION(mlb),
+	}
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
@@ -5736,6 +5750,7 @@ static const struct sh_pfc_soc_operations r8a7790_pinmux_ops = {
 	.pin_to_pocctrl = r8a7790_pin_to_pocctrl,
 };
 
+#ifdef CONFIG_PINCTRL_PFC_R8A7790
 const struct sh_pfc_soc_info r8a7790_pinmux_info = {
 	.name = "r8a77900_pfc",
 	.ops = &r8a7790_pinmux_ops,
@@ -5745,13 +5760,38 @@ const struct sh_pfc_soc_info r8a7790_pinmux_info = {
 
 	.pins = pinmux_pins,
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
-	.groups = pinmux_groups,
-	.nr_groups = ARRAY_SIZE(pinmux_groups),
-	.functions = pinmux_functions,
-	.nr_functions = ARRAY_SIZE(pinmux_functions),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
+		ARRAY_SIZE(pinmux_groups.automotive),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
+		ARRAY_SIZE(pinmux_functions.automotive),
+
+	.cfg_regs = pinmux_config_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
+#endif
+
+#ifdef CONFIG_PINCTRL_PFC_R8A7742
+const struct sh_pfc_soc_info r8a7742_pinmux_info = {
+	.name = "r8a77420_pfc",
+	.ops = &r8a7790_pinmux_ops,
+	.unlock_reg = 0xe6060000, /* PMMR */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
 
 	.cfg_regs = pinmux_config_regs,
 
 	.pinmux_data = pinmux_data,
 	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
 };
+#endif
diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index d57e633e99c0..0f013827baf9 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -304,6 +304,7 @@ struct sh_pfc_soc_info {
 extern const struct sh_pfc_soc_info emev2_pinmux_info;
 extern const struct sh_pfc_soc_info r8a73a4_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7740_pinmux_info;
+extern const struct sh_pfc_soc_info r8a7742_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7743_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7744_pinmux_info;
 extern const struct sh_pfc_soc_info r8a7745_pinmux_info;
-- 
2.17.1

