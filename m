Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E752F3671
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388731AbhALRCk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:40 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:12007 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391377AbhALRCk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470787;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=JBmFSk56HvRTXgr6ZyZf29PCrBeClKu2szft3lqB79U=;
        b=rrbU+ZGJKeHjG3TfF9dYGklg1OEYMpHwSFKyrMkwoIjNJd03Rb6iHyy2i9tjvE7q5P
        wkMqNTRE2xjSvWcnnyDWeSMkS5Aok02IRWNuWVGRfrQ5kL3xKwXQHC4Fe+IC+n4nhSIf
        il/JeFHtf+QUBSDkSpKnxn5he61sYjvJxszFWcVzYYJ9fVjZN9zJlBPy2DmEvgMT62uZ
        S3zpvx9NeXc+twYIMM6UxUwL2VMGqS261W68yJFQ5wbLNdZzCxvsbfiGITukA4TUNgk5
        SG6UbBg4PSFJudbp63kdp8V+GgP8LUPbcxGkGWcwEXhoB4LxJP6T1AGUMl0orjqysrig
        su3Q==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxfNUV
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:41 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 04/12] pinctrl: renesas: r8a779a0: Add DU pins, groups and function
Date:   Tue, 12 Jan 2021 17:59:21 +0100
Message-Id: <20210112165929.31002-5-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165929.31002-1-uli+renesas@fpond.eu>
References: <20210112165929.31002-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds DU pins, groups and function for the R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 54 ++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 2ef5ab19f6ed..36fb53753f8c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1770,6 +1770,46 @@ static const unsigned int can_clk_mux[] = {
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
+static const unsigned int du_sync_pins[] = {
+	/* DU_HSYNC, DU_VSYNC */
+	RCAR_GP_PIN(1, 25), RCAR_GP_PIN(1, 26),
+};
+static const unsigned int du_sync_mux[] = {
+	DU_HSYNC_MARK, DU_VSYNC_MARK,
+};
+static const unsigned int du_oddf_pins[] = {
+	/* DU_EXODDF/DU_ODDF/DISP/CDE */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int du_oddf_mux[] = {
+	DU_ODDF_DISP_CDE_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SDA0, SCL0 */
@@ -2012,6 +2052,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(canfd7_data),
 	SH_PFC_PIN_GROUP(can_clk),
 
+	SH_PFC_PIN_GROUP(du_rgb888),
+	SH_PFC_PIN_GROUP(du_clk_out),
+	SH_PFC_PIN_GROUP(du_sync),
+	SH_PFC_PIN_GROUP(du_oddf),
+
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2),
@@ -2144,6 +2189,13 @@ static const char * const can_clk_groups[] = {
 	"can_clk",
 };
 
+static const char * const du_groups[] = {
+	"du_rgb888",
+	"du_clk_out",
+	"du_sync",
+	"du_oddf",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -2219,6 +2271,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(canfd7),
 	SH_PFC_FUNCTION(can_clk),
 
+	SH_PFC_FUNCTION(du),
+
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.20.1

