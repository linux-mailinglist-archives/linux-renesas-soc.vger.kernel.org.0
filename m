Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81CFD2F3677
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405262AbhALRCx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:53 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.173]:34965 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391647AbhALRCw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470790;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=7VaaFd1u6AaQA4Ln/0PE8hT+OgjVHkaAN5hR2+sxOz0=;
        b=mItEamOPnLOHlX6HNp03McbL4eP43r5yGNt1/jFClblttGO5Xh3eoQTohmJZvNoQF7
        /9fWlN5ofMVEU3FvnubQftTgEwYT2HEvBwzYhTIvK/avs71OkTHHENx1nvmekNr8Nli1
        UPhj08aXXEYbBBkDEC+PrF25KjNVV9XL0M4oJ7tWL7AC8xDmC/D4+rrLvLaR+8EE/g0P
        7c4poMW6Zp+RT8R93UiMMTe+KykguDseA+ZGTMAS5eEQBZyGCXOHbCLnFOXtrh2aRRng
        N9FFbX9gC0jW0Cen2l6BjdRG/Ptj0uRA00/9y5hqJjVsqmGGcvbr/a1orKfaPgpT0P1X
        C1Sw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxhNUZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:43 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 07/12] pinctrl: renesas: r8a779a0: Add MMC pins, groups and functions
Date:   Tue, 12 Jan 2021 17:59:24 +0100
Message-Id: <20210112165929.31002-8-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165929.31002-1-uli+renesas@fpond.eu>
References: <20210112165929.31002-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds MMC pins, groups and functions to R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 79 ++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 78235c242867..e73d9ad70aa4 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2009,6 +2009,65 @@ static const unsigned int intc_ex_irq5_mux[] = {
 	IRQ5_MARK,
 };
 
+/* - MMC -------------------------------------------------------------------- */
+static const unsigned int mmc_data1_pins[] = {
+	/* MMC_SD_D0 */
+	RCAR_GP_PIN(0, 19),
+};
+static const unsigned int mmc_data1_mux[] = {
+	MMC_SD_D0_MARK,
+};
+static const unsigned int mmc_data4_pins[] = {
+	/* MMC_SD_D[0:3] */
+	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
+	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
+};
+static const unsigned int mmc_data4_mux[] = {
+	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
+	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
+};
+static const unsigned int mmc_data8_pins[] = {
+	/* MMC_SD_D[0:3], MMC_D[4:7] */
+	RCAR_GP_PIN(0, 19), RCAR_GP_PIN(0, 20),
+	RCAR_GP_PIN(0, 21), RCAR_GP_PIN(0, 22),
+	RCAR_GP_PIN(0, 24), RCAR_GP_PIN(0, 25),
+	RCAR_GP_PIN(0, 26), RCAR_GP_PIN(0, 27),
+};
+static const unsigned int mmc_data8_mux[] = {
+	MMC_SD_D0_MARK, MMC_SD_D1_MARK,
+	MMC_SD_D2_MARK, MMC_SD_D3_MARK,
+	MMC_D4_MARK, MMC_D5_MARK,
+	MMC_D6_MARK, MMC_D7_MARK,
+};
+static const unsigned int mmc_ctrl_pins[] = {
+	/* MMC_SD_CLK, MMC_SD_CMD */
+	RCAR_GP_PIN(0, 23), RCAR_GP_PIN(0, 18),
+};
+static const unsigned int mmc_ctrl_mux[] = {
+	MMC_SD_CLK_MARK, MMC_SD_CMD_MARK,
+};
+static const unsigned int mmc_cd_pins[] = {
+	/* SD_CD */
+	RCAR_GP_PIN(0, 16),
+};
+static const unsigned int mmc_cd_mux[] = {
+	SD_CD_MARK,
+};
+static const unsigned int mmc_wp_pins[] = {
+	/* SD_WP */
+	RCAR_GP_PIN(0, 15),
+};
+static const unsigned int mmc_wp_mux[] = {
+	SD_WP_MARK,
+};
+static const unsigned int mmc_ds_pins[] = {
+	/* MMC_DS */
+	RCAR_GP_PIN(0, 17),
+};
+static const unsigned int mmc_ds_mux[] = {
+	MMC_DS_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2221,6 +2280,14 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(intc_ex_irq4),
 	SH_PFC_PIN_GROUP(intc_ex_irq5),
 
+	SH_PFC_PIN_GROUP(mmc_data1),
+	SH_PFC_PIN_GROUP(mmc_data4),
+	SH_PFC_PIN_GROUP(mmc_data8),
+	SH_PFC_PIN_GROUP(mmc_ctrl),
+	SH_PFC_PIN_GROUP(mmc_cd),
+	SH_PFC_PIN_GROUP(mmc_wp),
+	SH_PFC_PIN_GROUP(mmc_ds),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2413,6 +2480,16 @@ static const char * const intc_ex_groups[] = {
 	"intc_ex_irq5",
 };
 
+static const char * const mmc_groups[] = {
+	"mmc_data1",
+	"mmc_data4",
+	"mmc_data8",
+	"mmc_ctrl",
+	"mmc_cd",
+	"mmc_wp",
+	"mmc_ds",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2477,6 +2554,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(intc_ex),
 
+	SH_PFC_FUNCTION(mmc),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

