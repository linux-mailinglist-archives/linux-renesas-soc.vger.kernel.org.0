Return-Path: <linux-renesas-soc+bounces-17846-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB690ACE179
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 17:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5C1B179185
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 15:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4CE519CC0A;
	Wed,  4 Jun 2025 15:29:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39218DF8D
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Jun 2025 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050998; cv=none; b=RozZ0ikj47jU+0ctV7CaBm2ZIUNRjHrtOdwqotcI3y+3jX3lUbtniooNmGms85iYdUwq6OaEg0Bvs/nJv582EtPRExvHYpMDj6RNOv7YFoE8BXNwafWLk9j5kmY/VBpfTMz0iLC+fV/2MDHk6DJRyREVYqfsHQl4F/dqQo8sTt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050998; c=relaxed/simple;
	bh=k+akaXBsDYZ0ZRUCYIxLWE+vi0OFP66FDZ6bPAIeUC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gR8wmS5ZSbRwHdNeJvQ7GRByyMyyZp0sHxBuXu0rkQVyYo4NS0IVV4Vh0KFMh++vYyedFbRy3TJc9lXjXxyaghAorQiNxIaSQQiwDNAdPoAveIivvuUeB3vuTzYp0mGjULrNqLpgvYQKuVX+2br06UfNVPBhFdqUqZiuRWQIdSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2F5C4CEED;
	Wed,  4 Jun 2025 15:29:57 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 2/6] pinctrl: renesas: r8a77980: Add R-Car V3H2 support
Date: Wed,  4 Jun 2025 17:29:47 +0200
Message-ID: <b4ae0fb64f7ab5f2369adfb979efc8b871ab6315.1749048734.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1749048734.git.geert+renesas@glider.be>
References: <cover.1749048734.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Pin Function Controller in the Renesas R-Car V3H2
(R8A77980A) SoC, which contains a third CAN-FD pin group.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/core.c         |   4 +
 drivers/pinctrl/renesas/pfc-r8a77980.c | 457 ++++++++++++++-----------
 drivers/pinctrl/renesas/sh_pfc.h       |   1 +
 3 files changed, 261 insertions(+), 201 deletions(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 96d6040a8871419b..b5e7952907a54d22 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -607,6 +607,10 @@ static const struct of_device_id sh_pfc_of_table[] = {
 		.compatible = "renesas,pfc-r8a77980",
 		.data = &r8a77980_pinmux_info,
 	},
+	{
+		.compatible = "renesas,pfc-r8a77980a",
+		.data = &r8a77980a_pinmux_info,
+	},
 #endif
 #ifdef CONFIG_PINCTRL_PFC_R8A77990
 	{
diff --git a/drivers/pinctrl/renesas/pfc-r8a77980.c b/drivers/pinctrl/renesas/pfc-r8a77980.c
index 877134d78c7e50c6..e5c6b7704fb67dee 100644
--- a/drivers/pinctrl/renesas/pfc-r8a77980.c
+++ b/drivers/pinctrl/renesas/pfc-r8a77980.c
@@ -258,8 +258,8 @@
 #define IP7_19_16	FM(SDA1)			F_(0, 0)		FM(TPU0TO3)		FM(WE0_N)	FM(RTS0_N)	FM(HRTS0_N_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_23_20	FM(SCL2)			F_(0, 0)		F_(0, 0)		FM(WE1_N)	FM(RX0)		FM(HRX0_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP7_27_24	FM(SDA2)			F_(0, 0)		F_(0, 0)		FM(EX_WAIT0)	FM(TX0)		FM(HTX0_B)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP7_31_28	FM(AVB_AVTP_MATCH)		FM(TPU0TO0)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
-#define IP8_3_0		FM(AVB_AVTP_CAPTURE)		FM(TPU0TO1)		F_(0, 0)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP7_31_28	FM(AVB_AVTP_MATCH)		FM(TPU0TO0)		FM(CANFD2_TX)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
+#define IP8_3_0		FM(AVB_AVTP_CAPTURE)		FM(TPU0TO1)		FM(CANFD2_RX)		F_(0, 0)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_7_4		FM(CANFD0_TX_A)			FM(FXR_TXDA)		FM(PWM0_B)		FM(DU_DISP)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_11_8	FM(CANFD0_RX_A)			FM(RXDA_EXTFXR)		FM(PWM1_B)		FM(DU_CDE)	F_(0, 0)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
 #define IP8_15_12	FM(CANFD1_TX)			FM(FXR_TXDB)		FM(PWM2_B)		FM(TCLK1_B)	FM(TX1_B)	F_(0, 0)	F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0) F_(0, 0)
@@ -752,10 +752,12 @@ static const u16 pinmux_data[] = {
 
 	PINMUX_IPSR_GPSR(IP7_31_28,	AVB_AVTP_MATCH),
 	PINMUX_IPSR_GPSR(IP7_31_28,	TPU0TO0),
+	PINMUX_IPSR_GPSR(IP7_31_28,	CANFD2_TX),
 
 	/* IPSR8 */
 	PINMUX_IPSR_GPSR(IP8_3_0,	AVB_AVTP_CAPTURE),
 	PINMUX_IPSR_GPSR(IP8_3_0,	TPU0TO1),
+	PINMUX_IPSR_GPSR(IP8_3_0,	CANFD2_RX),
 
 	PINMUX_IPSR_MSEL(IP8_7_4,	CANFD0_TX_A, SEL_CANFD0_0),
 	PINMUX_IPSR_GPSR(IP8_7_4,	FXR_TXDA),
@@ -954,6 +956,15 @@ static const unsigned int canfd1_data_mux[] = {
 	CANFD1_TX_MARK, CANFD1_RX_MARK,
 };
 
+/* - CANFD2 ----------------------------------------------------------------- */
+static const unsigned int canfd2_data_pins[] = {
+	/* CANFD2_TX, CANFD2_RX */
+	RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 20),
+};
+static const unsigned int canfd2_data_mux[] = {
+	CANFD2_TX_MARK, CANFD2_RX_MARK,
+};
+
 /* - CANFD Clock ------------------------------------------------------------ */
 static const unsigned int canfd_clk_a_pins[] = {
 	/* CANFD_CLK */
@@ -2033,161 +2044,169 @@ static const unsigned int vin1_clk_mux[] = {
 	VI1_CLK_MARK,
 };
 
-static const struct sh_pfc_pin_group pinmux_groups[] = {
-	SH_PFC_PIN_GROUP(avb_link),
-	SH_PFC_PIN_GROUP(avb_magic),
-	SH_PFC_PIN_GROUP(avb_phy_int),
-	SH_PFC_PIN_GROUP(avb_mdio),
-	SH_PFC_PIN_GROUP(avb_rgmii),
-	SH_PFC_PIN_GROUP(avb_txcrefclk),
-	SH_PFC_PIN_GROUP(avb_avtp_pps),
-	SH_PFC_PIN_GROUP(avb_avtp_capture),
-	SH_PFC_PIN_GROUP(avb_avtp_match),
-	SH_PFC_PIN_GROUP(canfd0_data_a),
-	SH_PFC_PIN_GROUP(canfd0_data_b),
-	SH_PFC_PIN_GROUP(canfd1_data),
-	SH_PFC_PIN_GROUP(canfd_clk_a),
-	SH_PFC_PIN_GROUP(canfd_clk_b),
-	SH_PFC_PIN_GROUP(du_rgb666),
-	SH_PFC_PIN_GROUP(du_rgb888),
-	SH_PFC_PIN_GROUP(du_clk_out),
-	SH_PFC_PIN_GROUP(du_sync),
-	SH_PFC_PIN_GROUP(du_oddf),
-	SH_PFC_PIN_GROUP(du_cde),
-	SH_PFC_PIN_GROUP(du_disp),
-	SH_PFC_PIN_GROUP(gether_link_a),
-	SH_PFC_PIN_GROUP(gether_phy_int_a),
-	SH_PFC_PIN_GROUP(gether_mdio_a),
-	SH_PFC_PIN_GROUP(gether_link_b),
-	SH_PFC_PIN_GROUP(gether_phy_int_b),
-	SH_PFC_PIN_GROUP(gether_mdio_b),
-	SH_PFC_PIN_GROUP(gether_magic),
-	SH_PFC_PIN_GROUP(gether_rgmii),
-	SH_PFC_PIN_GROUP(gether_txcrefclk),
-	SH_PFC_PIN_GROUP(gether_txcrefclk_mega),
-	SH_PFC_PIN_GROUP(gether_rmii),
-	SH_PFC_PIN_GROUP(hscif0_data_a),
-	SH_PFC_PIN_GROUP(hscif0_clk_a),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_a),
-	SH_PFC_PIN_GROUP(hscif0_data_b),
-	SH_PFC_PIN_GROUP(hscif0_clk_b),
-	SH_PFC_PIN_GROUP(hscif0_ctrl_b),
-	SH_PFC_PIN_GROUP(hscif1_data),
-	SH_PFC_PIN_GROUP(hscif1_clk),
-	SH_PFC_PIN_GROUP(hscif1_ctrl),
-	SH_PFC_PIN_GROUP(hscif2_data),
-	SH_PFC_PIN_GROUP(hscif2_clk),
-	SH_PFC_PIN_GROUP(hscif2_ctrl),
-	SH_PFC_PIN_GROUP(hscif3_data),
-	SH_PFC_PIN_GROUP(hscif3_clk),
-	SH_PFC_PIN_GROUP(hscif3_ctrl),
-	SH_PFC_PIN_GROUP(i2c0),
-	SH_PFC_PIN_GROUP(i2c1),
-	SH_PFC_PIN_GROUP(i2c2),
-	SH_PFC_PIN_GROUP(i2c3),
-	SH_PFC_PIN_GROUP(i2c4),
-	SH_PFC_PIN_GROUP(i2c5),
-	SH_PFC_PIN_GROUP(intc_ex_irq0),
-	SH_PFC_PIN_GROUP(intc_ex_irq1),
-	SH_PFC_PIN_GROUP(intc_ex_irq2),
-	SH_PFC_PIN_GROUP(intc_ex_irq3),
-	SH_PFC_PIN_GROUP(intc_ex_irq4),
-	SH_PFC_PIN_GROUP(intc_ex_irq5),
-	BUS_DATA_PIN_GROUP(mmc_data, 1),
-	BUS_DATA_PIN_GROUP(mmc_data, 4),
-	BUS_DATA_PIN_GROUP(mmc_data, 8),
-	SH_PFC_PIN_GROUP(mmc_ctrl),
-	SH_PFC_PIN_GROUP(mmc_cd),
-	SH_PFC_PIN_GROUP(mmc_wp),
-	SH_PFC_PIN_GROUP(mmc_ds),
-	SH_PFC_PIN_GROUP(msiof0_clk),
-	SH_PFC_PIN_GROUP(msiof0_sync),
-	SH_PFC_PIN_GROUP(msiof0_ss1),
-	SH_PFC_PIN_GROUP(msiof0_ss2),
-	SH_PFC_PIN_GROUP(msiof0_txd),
-	SH_PFC_PIN_GROUP(msiof0_rxd),
-	SH_PFC_PIN_GROUP(msiof1_clk),
-	SH_PFC_PIN_GROUP(msiof1_sync),
-	SH_PFC_PIN_GROUP(msiof1_ss1),
-	SH_PFC_PIN_GROUP(msiof1_ss2),
-	SH_PFC_PIN_GROUP(msiof1_txd),
-	SH_PFC_PIN_GROUP(msiof1_rxd),
-	SH_PFC_PIN_GROUP(msiof2_clk),
-	SH_PFC_PIN_GROUP(msiof2_sync),
-	SH_PFC_PIN_GROUP(msiof2_ss1),
-	SH_PFC_PIN_GROUP(msiof2_ss2),
-	SH_PFC_PIN_GROUP(msiof2_txd),
-	SH_PFC_PIN_GROUP(msiof2_rxd),
-	SH_PFC_PIN_GROUP(msiof3_clk),
-	SH_PFC_PIN_GROUP(msiof3_sync),
-	SH_PFC_PIN_GROUP(msiof3_ss1),
-	SH_PFC_PIN_GROUP(msiof3_ss2),
-	SH_PFC_PIN_GROUP(msiof3_txd),
-	SH_PFC_PIN_GROUP(msiof3_rxd),
-	SH_PFC_PIN_GROUP(pwm0_a),
-	SH_PFC_PIN_GROUP(pwm0_b),
-	SH_PFC_PIN_GROUP(pwm1_a),
-	SH_PFC_PIN_GROUP(pwm1_b),
-	SH_PFC_PIN_GROUP(pwm2_a),
-	SH_PFC_PIN_GROUP(pwm2_b),
-	SH_PFC_PIN_GROUP(pwm3_a),
-	SH_PFC_PIN_GROUP(pwm3_b),
-	SH_PFC_PIN_GROUP(pwm4_a),
-	SH_PFC_PIN_GROUP(pwm4_b),
-	SH_PFC_PIN_GROUP(qspi0_ctrl),
-	SH_PFC_PIN_GROUP_SUBSET(qspi0_data2, rpc_data, 0, 2),
-	SH_PFC_PIN_GROUP_SUBSET(qspi0_data4, rpc_data, 0, 4),
-	SH_PFC_PIN_GROUP(qspi1_ctrl),
-	SH_PFC_PIN_GROUP_SUBSET(qspi1_data2, rpc_data, 4, 2),
-	SH_PFC_PIN_GROUP_SUBSET(qspi1_data4, rpc_data, 4, 4),
-	BUS_DATA_PIN_GROUP(rpc_clk, 1),
-	BUS_DATA_PIN_GROUP(rpc_clk, 2),
-	SH_PFC_PIN_GROUP(rpc_ctrl),
-	SH_PFC_PIN_GROUP(rpc_data),
-	SH_PFC_PIN_GROUP(rpc_reset),
-	SH_PFC_PIN_GROUP(rpc_int),
-	SH_PFC_PIN_GROUP(rpc_wp),
-	SH_PFC_PIN_GROUP(scif0_data),
-	SH_PFC_PIN_GROUP(scif0_clk),
-	SH_PFC_PIN_GROUP(scif0_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_a),
-	SH_PFC_PIN_GROUP(scif1_clk),
-	SH_PFC_PIN_GROUP(scif1_ctrl),
-	SH_PFC_PIN_GROUP(scif1_data_b),
-	SH_PFC_PIN_GROUP(scif3_data),
-	SH_PFC_PIN_GROUP(scif3_clk),
-	SH_PFC_PIN_GROUP(scif3_ctrl),
-	SH_PFC_PIN_GROUP(scif4_data),
-	SH_PFC_PIN_GROUP(scif4_clk),
-	SH_PFC_PIN_GROUP(scif4_ctrl),
-	SH_PFC_PIN_GROUP(scif_clk_a),
-	SH_PFC_PIN_GROUP(scif_clk_b),
-	SH_PFC_PIN_GROUP(tmu_tclk1_a),
-	SH_PFC_PIN_GROUP(tmu_tclk1_b),
-	SH_PFC_PIN_GROUP(tmu_tclk2_a),
-	SH_PFC_PIN_GROUP(tmu_tclk2_b),
-	SH_PFC_PIN_GROUP(tpu_to0),
-	SH_PFC_PIN_GROUP(tpu_to1),
-	SH_PFC_PIN_GROUP(tpu_to2),
-	SH_PFC_PIN_GROUP(tpu_to3),
-	BUS_DATA_PIN_GROUP(vin0_data, 8),
-	BUS_DATA_PIN_GROUP(vin0_data, 10),
-	BUS_DATA_PIN_GROUP(vin0_data, 12),
-	BUS_DATA_PIN_GROUP(vin0_data, 16),
-	SH_PFC_PIN_GROUP(vin0_data18),
-	BUS_DATA_PIN_GROUP(vin0_data, 20),
-	BUS_DATA_PIN_GROUP(vin0_data, 24),
-	SH_PFC_PIN_GROUP(vin0_sync),
-	SH_PFC_PIN_GROUP(vin0_field),
-	SH_PFC_PIN_GROUP(vin0_clkenb),
-	SH_PFC_PIN_GROUP(vin0_clk),
-	BUS_DATA_PIN_GROUP(vin1_data, 8),
-	BUS_DATA_PIN_GROUP(vin1_data, 10),
-	BUS_DATA_PIN_GROUP(vin1_data, 12),
-	SH_PFC_PIN_GROUP(vin1_sync),
-	SH_PFC_PIN_GROUP(vin1_field),
-	SH_PFC_PIN_GROUP(vin1_clkenb),
-	SH_PFC_PIN_GROUP(vin1_clk),
+static const struct {
+	struct sh_pfc_pin_group common[154];
+	struct sh_pfc_pin_group r8a77980a[1];
+} pinmux_groups = {
+	.common = {
+		SH_PFC_PIN_GROUP(avb_link),
+		SH_PFC_PIN_GROUP(avb_magic),
+		SH_PFC_PIN_GROUP(avb_phy_int),
+		SH_PFC_PIN_GROUP(avb_mdio),
+		SH_PFC_PIN_GROUP(avb_rgmii),
+		SH_PFC_PIN_GROUP(avb_txcrefclk),
+		SH_PFC_PIN_GROUP(avb_avtp_pps),
+		SH_PFC_PIN_GROUP(avb_avtp_capture),
+		SH_PFC_PIN_GROUP(avb_avtp_match),
+		SH_PFC_PIN_GROUP(canfd0_data_a),
+		SH_PFC_PIN_GROUP(canfd0_data_b),
+		SH_PFC_PIN_GROUP(canfd1_data),
+		SH_PFC_PIN_GROUP(canfd_clk_a),
+		SH_PFC_PIN_GROUP(canfd_clk_b),
+		SH_PFC_PIN_GROUP(du_rgb666),
+		SH_PFC_PIN_GROUP(du_rgb888),
+		SH_PFC_PIN_GROUP(du_clk_out),
+		SH_PFC_PIN_GROUP(du_sync),
+		SH_PFC_PIN_GROUP(du_oddf),
+		SH_PFC_PIN_GROUP(du_cde),
+		SH_PFC_PIN_GROUP(du_disp),
+		SH_PFC_PIN_GROUP(gether_link_a),
+		SH_PFC_PIN_GROUP(gether_phy_int_a),
+		SH_PFC_PIN_GROUP(gether_mdio_a),
+		SH_PFC_PIN_GROUP(gether_link_b),
+		SH_PFC_PIN_GROUP(gether_phy_int_b),
+		SH_PFC_PIN_GROUP(gether_mdio_b),
+		SH_PFC_PIN_GROUP(gether_magic),
+		SH_PFC_PIN_GROUP(gether_rgmii),
+		SH_PFC_PIN_GROUP(gether_txcrefclk),
+		SH_PFC_PIN_GROUP(gether_txcrefclk_mega),
+		SH_PFC_PIN_GROUP(gether_rmii),
+		SH_PFC_PIN_GROUP(hscif0_data_a),
+		SH_PFC_PIN_GROUP(hscif0_clk_a),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_a),
+		SH_PFC_PIN_GROUP(hscif0_data_b),
+		SH_PFC_PIN_GROUP(hscif0_clk_b),
+		SH_PFC_PIN_GROUP(hscif0_ctrl_b),
+		SH_PFC_PIN_GROUP(hscif1_data),
+		SH_PFC_PIN_GROUP(hscif1_clk),
+		SH_PFC_PIN_GROUP(hscif1_ctrl),
+		SH_PFC_PIN_GROUP(hscif2_data),
+		SH_PFC_PIN_GROUP(hscif2_clk),
+		SH_PFC_PIN_GROUP(hscif2_ctrl),
+		SH_PFC_PIN_GROUP(hscif3_data),
+		SH_PFC_PIN_GROUP(hscif3_clk),
+		SH_PFC_PIN_GROUP(hscif3_ctrl),
+		SH_PFC_PIN_GROUP(i2c0),
+		SH_PFC_PIN_GROUP(i2c1),
+		SH_PFC_PIN_GROUP(i2c2),
+		SH_PFC_PIN_GROUP(i2c3),
+		SH_PFC_PIN_GROUP(i2c4),
+		SH_PFC_PIN_GROUP(i2c5),
+		SH_PFC_PIN_GROUP(intc_ex_irq0),
+		SH_PFC_PIN_GROUP(intc_ex_irq1),
+		SH_PFC_PIN_GROUP(intc_ex_irq2),
+		SH_PFC_PIN_GROUP(intc_ex_irq3),
+		SH_PFC_PIN_GROUP(intc_ex_irq4),
+		SH_PFC_PIN_GROUP(intc_ex_irq5),
+		BUS_DATA_PIN_GROUP(mmc_data, 1),
+		BUS_DATA_PIN_GROUP(mmc_data, 4),
+		BUS_DATA_PIN_GROUP(mmc_data, 8),
+		SH_PFC_PIN_GROUP(mmc_ctrl),
+		SH_PFC_PIN_GROUP(mmc_cd),
+		SH_PFC_PIN_GROUP(mmc_wp),
+		SH_PFC_PIN_GROUP(mmc_ds),
+		SH_PFC_PIN_GROUP(msiof0_clk),
+		SH_PFC_PIN_GROUP(msiof0_sync),
+		SH_PFC_PIN_GROUP(msiof0_ss1),
+		SH_PFC_PIN_GROUP(msiof0_ss2),
+		SH_PFC_PIN_GROUP(msiof0_txd),
+		SH_PFC_PIN_GROUP(msiof0_rxd),
+		SH_PFC_PIN_GROUP(msiof1_clk),
+		SH_PFC_PIN_GROUP(msiof1_sync),
+		SH_PFC_PIN_GROUP(msiof1_ss1),
+		SH_PFC_PIN_GROUP(msiof1_ss2),
+		SH_PFC_PIN_GROUP(msiof1_txd),
+		SH_PFC_PIN_GROUP(msiof1_rxd),
+		SH_PFC_PIN_GROUP(msiof2_clk),
+		SH_PFC_PIN_GROUP(msiof2_sync),
+		SH_PFC_PIN_GROUP(msiof2_ss1),
+		SH_PFC_PIN_GROUP(msiof2_ss2),
+		SH_PFC_PIN_GROUP(msiof2_txd),
+		SH_PFC_PIN_GROUP(msiof2_rxd),
+		SH_PFC_PIN_GROUP(msiof3_clk),
+		SH_PFC_PIN_GROUP(msiof3_sync),
+		SH_PFC_PIN_GROUP(msiof3_ss1),
+		SH_PFC_PIN_GROUP(msiof3_ss2),
+		SH_PFC_PIN_GROUP(msiof3_txd),
+		SH_PFC_PIN_GROUP(msiof3_rxd),
+		SH_PFC_PIN_GROUP(pwm0_a),
+		SH_PFC_PIN_GROUP(pwm0_b),
+		SH_PFC_PIN_GROUP(pwm1_a),
+		SH_PFC_PIN_GROUP(pwm1_b),
+		SH_PFC_PIN_GROUP(pwm2_a),
+		SH_PFC_PIN_GROUP(pwm2_b),
+		SH_PFC_PIN_GROUP(pwm3_a),
+		SH_PFC_PIN_GROUP(pwm3_b),
+		SH_PFC_PIN_GROUP(pwm4_a),
+		SH_PFC_PIN_GROUP(pwm4_b),
+		SH_PFC_PIN_GROUP(qspi0_ctrl),
+		SH_PFC_PIN_GROUP_SUBSET(qspi0_data2, rpc_data, 0, 2),
+		SH_PFC_PIN_GROUP_SUBSET(qspi0_data4, rpc_data, 0, 4),
+		SH_PFC_PIN_GROUP(qspi1_ctrl),
+		SH_PFC_PIN_GROUP_SUBSET(qspi1_data2, rpc_data, 4, 2),
+		SH_PFC_PIN_GROUP_SUBSET(qspi1_data4, rpc_data, 4, 4),
+		BUS_DATA_PIN_GROUP(rpc_clk, 1),
+		BUS_DATA_PIN_GROUP(rpc_clk, 2),
+		SH_PFC_PIN_GROUP(rpc_ctrl),
+		SH_PFC_PIN_GROUP(rpc_data),
+		SH_PFC_PIN_GROUP(rpc_reset),
+		SH_PFC_PIN_GROUP(rpc_int),
+		SH_PFC_PIN_GROUP(rpc_wp),
+		SH_PFC_PIN_GROUP(scif0_data),
+		SH_PFC_PIN_GROUP(scif0_clk),
+		SH_PFC_PIN_GROUP(scif0_ctrl),
+		SH_PFC_PIN_GROUP(scif1_data_a),
+		SH_PFC_PIN_GROUP(scif1_clk),
+		SH_PFC_PIN_GROUP(scif1_ctrl),
+		SH_PFC_PIN_GROUP(scif1_data_b),
+		SH_PFC_PIN_GROUP(scif3_data),
+		SH_PFC_PIN_GROUP(scif3_clk),
+		SH_PFC_PIN_GROUP(scif3_ctrl),
+		SH_PFC_PIN_GROUP(scif4_data),
+		SH_PFC_PIN_GROUP(scif4_clk),
+		SH_PFC_PIN_GROUP(scif4_ctrl),
+		SH_PFC_PIN_GROUP(scif_clk_a),
+		SH_PFC_PIN_GROUP(scif_clk_b),
+		SH_PFC_PIN_GROUP(tmu_tclk1_a),
+		SH_PFC_PIN_GROUP(tmu_tclk1_b),
+		SH_PFC_PIN_GROUP(tmu_tclk2_a),
+		SH_PFC_PIN_GROUP(tmu_tclk2_b),
+		SH_PFC_PIN_GROUP(tpu_to0),
+		SH_PFC_PIN_GROUP(tpu_to1),
+		SH_PFC_PIN_GROUP(tpu_to2),
+		SH_PFC_PIN_GROUP(tpu_to3),
+		BUS_DATA_PIN_GROUP(vin0_data, 8),
+		BUS_DATA_PIN_GROUP(vin0_data, 10),
+		BUS_DATA_PIN_GROUP(vin0_data, 12),
+		BUS_DATA_PIN_GROUP(vin0_data, 16),
+		SH_PFC_PIN_GROUP(vin0_data18),
+		BUS_DATA_PIN_GROUP(vin0_data, 20),
+		BUS_DATA_PIN_GROUP(vin0_data, 24),
+		SH_PFC_PIN_GROUP(vin0_sync),
+		SH_PFC_PIN_GROUP(vin0_field),
+		SH_PFC_PIN_GROUP(vin0_clkenb),
+		SH_PFC_PIN_GROUP(vin0_clk),
+		BUS_DATA_PIN_GROUP(vin1_data, 8),
+		BUS_DATA_PIN_GROUP(vin1_data, 10),
+		BUS_DATA_PIN_GROUP(vin1_data, 12),
+		SH_PFC_PIN_GROUP(vin1_sync),
+		SH_PFC_PIN_GROUP(vin1_field),
+		SH_PFC_PIN_GROUP(vin1_clkenb),
+		SH_PFC_PIN_GROUP(vin1_clk),
+	},
+	.r8a77980a = {
+		SH_PFC_PIN_GROUP(canfd2_data),
+	},
 };
 
 static const char * const avb_groups[] = {
@@ -2211,6 +2230,10 @@ static const char * const canfd1_groups[] = {
 	"canfd1_data",
 };
 
+static const char * const canfd2_groups[] = {
+	"canfd2_data",
+};
+
 static const char * const canfd_clk_groups[] = {
 	"canfd_clk_a",
 	"canfd_clk_b",
@@ -2461,46 +2484,54 @@ static const char * const vin1_groups[] = {
 	"vin1_clk",
 };
 
-static const struct sh_pfc_function pinmux_functions[] = {
-	SH_PFC_FUNCTION(avb),
-	SH_PFC_FUNCTION(canfd0),
-	SH_PFC_FUNCTION(canfd1),
-	SH_PFC_FUNCTION(canfd_clk),
-	SH_PFC_FUNCTION(du),
-	SH_PFC_FUNCTION(gether),
-	SH_PFC_FUNCTION(hscif0),
-	SH_PFC_FUNCTION(hscif1),
-	SH_PFC_FUNCTION(hscif2),
-	SH_PFC_FUNCTION(hscif3),
-	SH_PFC_FUNCTION(i2c0),
-	SH_PFC_FUNCTION(i2c1),
-	SH_PFC_FUNCTION(i2c2),
-	SH_PFC_FUNCTION(i2c3),
-	SH_PFC_FUNCTION(i2c4),
-	SH_PFC_FUNCTION(i2c5),
-	SH_PFC_FUNCTION(intc_ex),
-	SH_PFC_FUNCTION(mmc),
-	SH_PFC_FUNCTION(msiof0),
-	SH_PFC_FUNCTION(msiof1),
-	SH_PFC_FUNCTION(msiof2),
-	SH_PFC_FUNCTION(msiof3),
-	SH_PFC_FUNCTION(pwm0),
-	SH_PFC_FUNCTION(pwm1),
-	SH_PFC_FUNCTION(pwm2),
-	SH_PFC_FUNCTION(pwm3),
-	SH_PFC_FUNCTION(pwm4),
-	SH_PFC_FUNCTION(qspi0),
-	SH_PFC_FUNCTION(qspi1),
-	SH_PFC_FUNCTION(rpc),
-	SH_PFC_FUNCTION(scif0),
-	SH_PFC_FUNCTION(scif1),
-	SH_PFC_FUNCTION(scif3),
-	SH_PFC_FUNCTION(scif4),
-	SH_PFC_FUNCTION(scif_clk),
-	SH_PFC_FUNCTION(tmu),
-	SH_PFC_FUNCTION(tpu),
-	SH_PFC_FUNCTION(vin0),
-	SH_PFC_FUNCTION(vin1),
+static const struct {
+	struct sh_pfc_function common[39];
+	struct sh_pfc_function r8a77980a[1];
+} pinmux_functions = {
+	.common = {
+		SH_PFC_FUNCTION(avb),
+		SH_PFC_FUNCTION(canfd0),
+		SH_PFC_FUNCTION(canfd1),
+		SH_PFC_FUNCTION(canfd_clk),
+		SH_PFC_FUNCTION(du),
+		SH_PFC_FUNCTION(gether),
+		SH_PFC_FUNCTION(hscif0),
+		SH_PFC_FUNCTION(hscif1),
+		SH_PFC_FUNCTION(hscif2),
+		SH_PFC_FUNCTION(hscif3),
+		SH_PFC_FUNCTION(i2c0),
+		SH_PFC_FUNCTION(i2c1),
+		SH_PFC_FUNCTION(i2c2),
+		SH_PFC_FUNCTION(i2c3),
+		SH_PFC_FUNCTION(i2c4),
+		SH_PFC_FUNCTION(i2c5),
+		SH_PFC_FUNCTION(intc_ex),
+		SH_PFC_FUNCTION(mmc),
+		SH_PFC_FUNCTION(msiof0),
+		SH_PFC_FUNCTION(msiof1),
+		SH_PFC_FUNCTION(msiof2),
+		SH_PFC_FUNCTION(msiof3),
+		SH_PFC_FUNCTION(pwm0),
+		SH_PFC_FUNCTION(pwm1),
+		SH_PFC_FUNCTION(pwm2),
+		SH_PFC_FUNCTION(pwm3),
+		SH_PFC_FUNCTION(pwm4),
+		SH_PFC_FUNCTION(qspi0),
+		SH_PFC_FUNCTION(qspi1),
+		SH_PFC_FUNCTION(rpc),
+		SH_PFC_FUNCTION(scif0),
+		SH_PFC_FUNCTION(scif1),
+		SH_PFC_FUNCTION(scif3),
+		SH_PFC_FUNCTION(scif4),
+		SH_PFC_FUNCTION(scif_clk),
+		SH_PFC_FUNCTION(tmu),
+		SH_PFC_FUNCTION(tpu),
+		SH_PFC_FUNCTION(vin0),
+		SH_PFC_FUNCTION(vin1),
+	},
+	.r8a77980a = {
+		SH_PFC_FUNCTION(canfd2),
+	},
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
@@ -3063,10 +3094,34 @@ const struct sh_pfc_soc_info r8a77980_pinmux_info = {
 
 	.pins = pinmux_pins,
 	.nr_pins = ARRAY_SIZE(pinmux_pins),
-	.groups = pinmux_groups,
-	.nr_groups = ARRAY_SIZE(pinmux_groups),
-	.functions = pinmux_functions,
-	.nr_functions = ARRAY_SIZE(pinmux_functions),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common),
+
+	.cfg_regs = pinmux_config_regs,
+	.bias_regs = pinmux_bias_regs,
+	.ioctrl_regs = pinmux_ioctrl_regs,
+
+	.pinmux_data = pinmux_data,
+	.pinmux_data_size = ARRAY_SIZE(pinmux_data),
+};
+
+const struct sh_pfc_soc_info r8a77980a_pinmux_info = {
+	.name = "r8a77980a_pfc",
+	.ops = &r8a77980_pfc_ops,
+	.unlock_reg = 0xe6060000, /* PMMR */
+
+	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
+
+	.pins = pinmux_pins,
+	.nr_pins = ARRAY_SIZE(pinmux_pins),
+	.groups = pinmux_groups.common,
+	.nr_groups = ARRAY_SIZE(pinmux_groups.common) +
+		     ARRAY_SIZE(pinmux_groups.r8a77980a),
+	.functions = pinmux_functions.common,
+	.nr_functions = ARRAY_SIZE(pinmux_functions.common) +
+			ARRAY_SIZE(pinmux_functions.r8a77980a),
 
 	.cfg_regs = pinmux_config_regs,
 	.bias_regs = pinmux_bias_regs,
diff --git a/drivers/pinctrl/renesas/sh_pfc.h b/drivers/pinctrl/renesas/sh_pfc.h
index 0061e96400598e49..9c09d44d025e1efe 100644
--- a/drivers/pinctrl/renesas/sh_pfc.h
+++ b/drivers/pinctrl/renesas/sh_pfc.h
@@ -317,6 +317,7 @@ extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77970_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77980_pinmux_info;
+extern const struct sh_pfc_soc_info r8a77980a_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77990_pinmux_info;
 extern const struct sh_pfc_soc_info r8a77995_pinmux_info;
 extern const struct sh_pfc_soc_info r8a779a0_pinmux_info;
-- 
2.43.0


