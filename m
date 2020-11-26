Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C112C5A8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404147AbgKZR2E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:28:04 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:36550 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726677AbgKZR2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411682;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Ttit0N0/z8Wj4oY2cmg9r8oZypuhbulbYvLqQcA3QUw=;
        b=XT4mEIvM2w6au+USs/nGHSyO0c7SkTTCmvLQXEKaquD9YvVZYP387nRVqzrpv4JkiL
        YBmU1/sO2qr4AVTeTwLdQduAzpgA2Gcy9syMgJvc03l2Kg9dHdjaA8cOnegjJ6MG1t+k
        YRqG2CckLEwT7E5TBCfpNvGv0b9QNCAnybCQLrGJ4CP/mgxWlpp8aSQ4gofCXXjppzwT
        pc+j4E1FFVxda9Z1rQJbf9oWNDdrqG6RXOuUQsaMYDrBwRd9/7vjjke7ZKD5CiLeaq4I
        lqh4h5D3qYftBAVGjgu4dCJuT1tVbV/VhGe528bQvYqoACvqcq/NC/+OIWncMhHCrq7D
        A4VA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHM1Mpg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:22:01 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 03/11] pinctrl: renesas: r8a779a0: Add DU pins, groups and function
Date:   Thu, 26 Nov 2020 18:21:46 +0100
Message-Id: <20201126172154.25625-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds DU pins, groups and function for the R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 725d6b58bb4d..9b1f140372fd 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1736,6 +1736,53 @@ static const unsigned int canfd_clk_mux[] = {
 	CAN_CLK_MARK,
 };
 
+/* - DU --------------------------------------------------------------------- */
+static const unsigned int du_rgb888_pins[] = {
+	/* DU_DR[7:2], DU_DG[7:2], DU_DB[7:2] */
+	RCAR_GP_PIN(1, 11), RCAR_GP_PIN(1, 10), RCAR_GP_PIN(1, 9),
+	RCAR_GP_PIN(1, 8), RCAR_GP_PIN(1, 7), RCAR_GP_PIN(1, 6),
+	RCAR_GP_PIN(1, 17), RCAR_GP_PIN(1, 16), RCAR_GP_PIN(1, 15),
+	RCAR_GP_PIN(1, 14), RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 12),
+	RCAR_GP_PIN(1, 23), RCAR_GP_PIN(1, 22), RCAR_GP_PIN(1, 21),
+	RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19), RCAR_GP_PIN(1, 18),
+};
+static const unsigned int du_rgb888_mux[] = {
+	DU_DR7_MARK, DU_DR6_MARK, DU_DR5_MARK,
+	DU_DR4_MARK, DU_DR3_MARK, DU_DR2_MARK,
+	DU_DG7_MARK, DU_DG6_MARK, DU_DG5_MARK,
+	DU_DG4_MARK, DU_DG3_MARK, DU_DG2_MARK,
+	DU_DB7_MARK, DU_DB6_MARK, DU_DB5_MARK,
+	DU_DB4_MARK, DU_DB3_MARK, DU_DB2_MARK,
+};
+static const unsigned int du_clk_out_pins[] = {
+	/* DU_DOTCLKOUT */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int du_clk_out_mux[] = {
+	DU_DOTCLKOUT_MARK,
+};
+static const unsigned int du_oddf_pins[] = {
+	/* DU_EXODDF/DU_ODDF/DISP/CDE */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int du_oddf_mux[] = {
+	DU_ODDF_DISP_CDE_MARK,
+};
+static const unsigned int du_cde_pins[] = {
+	/* DU_CDE */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int du_cde_mux[] = {
+	DU_ODDF_DISP_CDE_MARK,
+};
+static const unsigned int du_disp_pins[] = {
+	/* DU_DISP */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int du_disp_mux[] = {
+	DU_ODDF_DISP_CDE_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 
 static const unsigned int i2c0_pins[] = {
@@ -1972,6 +2019,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(canfd7_data),
 	SH_PFC_PIN_GROUP(canfd_clk),
 
+	SH_PFC_PIN_GROUP(du_rgb888),
+	SH_PFC_PIN_GROUP(du_clk_out),
+	SH_PFC_PIN_GROUP(du_oddf),
+	SH_PFC_PIN_GROUP(du_cde),
+	SH_PFC_PIN_GROUP(du_disp),
+
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2),
@@ -2103,6 +2156,15 @@ static const char * const canfd_clk_groups[] = {
 	"canfd_clk",
 };
 
+static const char * const du_groups[] = {
+	"du_rgb888",
+	"du_clk_out",
+	"du_sync",
+	"du_oddf",
+	"du_cde",
+	"du_disp",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -2177,6 +2239,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(canfd7),
 	SH_PFC_FUNCTION(canfd_clk),
 
+	SH_PFC_FUNCTION(du),
+
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.20.1

