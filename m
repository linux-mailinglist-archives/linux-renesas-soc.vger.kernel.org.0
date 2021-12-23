Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAF447E4D0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Dec 2021 15:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348905AbhLWOm1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 Dec 2021 09:42:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348907AbhLWOmQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Dec 2021 09:42:16 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE54C06175B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Dec 2021 06:42:16 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:a9f6:6306:a80a:fe6a])
        by baptiste.telenet-ops.be with bizsmtp
        id ZqiE2600h1rdBcm01qiEMs; Thu, 23 Dec 2021 15:42:14 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIL-006a9K-DK; Thu, 23 Dec 2021 15:42:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n0PIK-003raM-A9; Thu, 23 Dec 2021 15:42:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 19/60] pinctrl: renesas: r8a7791: Share MMC pin group data
Date:   Thu, 23 Dec 2021 15:41:29 +0100
Message-Id: <be1f11c87e51224e043291f4d8e28b620811ac76.1640269757.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640269757.git.geert+renesas@glider.be>
References: <cover.1640269757.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Pin groups mmc_data[14] are subsets of mmc_data8.

Treat mmc_data8_b the same for consistency.  Note that there is no need
to define 1-bit and 4-bit wide subsets for the b-variant, as they're
identical to the normal variants.

This reduces kernel size by 40 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a7791.c | 31 +++++++--------------------
 1 file changed, 8 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/renesas/pfc-r8a7791.c b/drivers/pinctrl/renesas/pfc-r8a7791.c
index c3aa794a09e51b80..38900f07738a878f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a7791.c
+++ b/drivers/pinctrl/renesas/pfc-r8a7791.c
@@ -2592,40 +2592,25 @@ static const unsigned int mlb_3pin_mux[] = {
 #endif /* CONFIG_PINCTRL_PFC_R8A7791 || CONFIG_PINCTRL_PFC_R8A7793 */
 
 /* - MMCIF ------------------------------------------------------------------ */
-static const unsigned int mmc_data1_pins[] = {
-	/* D[0] */
-	RCAR_GP_PIN(6, 18),
-};
-static const unsigned int mmc_data1_mux[] = {
-	MMC_D0_MARK,
-};
-static const unsigned int mmc_data4_pins[] = {
-	/* D[0:3] */
-	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
-	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
-};
-static const unsigned int mmc_data4_mux[] = {
-	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
-};
-static const unsigned int mmc_data8_pins[] = {
+static const unsigned int mmc_data_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
 	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
 	RCAR_GP_PIN(6, 22), RCAR_GP_PIN(6, 23),
 	RCAR_GP_PIN(6, 28), RCAR_GP_PIN(6, 29),
 };
-static const unsigned int mmc_data8_mux[] = {
+static const unsigned int mmc_data_mux[] = {
 	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK, MMC_D6_MARK, MMC_D7_MARK,
 };
-static const unsigned int mmc_data8_b_pins[] = {
+static const unsigned int mmc_data_b_pins[] = {
 	/* D[0:7] */
 	RCAR_GP_PIN(6, 18), RCAR_GP_PIN(6, 19),
 	RCAR_GP_PIN(6, 20), RCAR_GP_PIN(6, 21),
 	RCAR_GP_PIN(6, 22), RCAR_GP_PIN(6, 23),
 	RCAR_GP_PIN(6, 6), RCAR_GP_PIN(6, 7),
 };
-static const unsigned int mmc_data8_b_mux[] = {
+static const unsigned int mmc_data_b_mux[] = {
 	MMC_D0_MARK, MMC_D1_MARK, MMC_D2_MARK, MMC_D3_MARK,
 	MMC_D4_MARK, MMC_D5_MARK, MMC_D6_B_MARK, MMC_D7_B_MARK,
 };
@@ -4576,10 +4561,10 @@ static const struct {
 		SH_PFC_PIN_GROUP(intc_irq1),
 		SH_PFC_PIN_GROUP(intc_irq2),
 		SH_PFC_PIN_GROUP(intc_irq3),
-		SH_PFC_PIN_GROUP(mmc_data1),
-		SH_PFC_PIN_GROUP(mmc_data4),
-		SH_PFC_PIN_GROUP(mmc_data8),
-		SH_PFC_PIN_GROUP(mmc_data8_b),
+		BUS_DATA_PIN_GROUP(mmc_data, 1),
+		BUS_DATA_PIN_GROUP(mmc_data, 4),
+		BUS_DATA_PIN_GROUP(mmc_data, 8),
+		BUS_DATA_PIN_GROUP(mmc_data, 8, _b),
 		SH_PFC_PIN_GROUP(mmc_ctrl),
 		SH_PFC_PIN_GROUP(msiof0_clk),
 		SH_PFC_PIN_GROUP(msiof0_sync),
-- 
2.25.1

