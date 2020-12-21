Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D50C42DFE6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:59:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726167AbgLUQ6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:47 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:24045 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726190AbgLUQ6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569753;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=revfVQbyaW+3UmJtNJIp2NWXnVJR5XMM/Mki/z3QDQA=;
        b=pUYbEDWl2xlS8x5xUnA9amyLwgQOrO8RIHejwLqV7X20nJBNQ8SBMUBm6LDmYnVJN2
        sFd2487F1/hmIW4LNevr8ZYe1RFFMmlnLGQfz1rN730iuWkDRrXQpTWUb2KUCFJ/yhpl
        0PuAemT5AhNRcHOcaEOTDJJa1WgRm8bXdnZbWrM+OsA67abGQBaUQQl48hB/vUGFCwhR
        gmdEkIMFHwyson4CX7qSNkzhJErhcSHMhZZQnAwzM9S4SxtWthoYcqiglowyF34M6ZKw
        IjzKg+r/qTgLasNRQS/KxvL+WU0W7NuVN5FI+twPqi7gf/iBgBt1koKyI4QztUoNVVGG
        /K5w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGtm0KS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:48 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/12] pinctrl: renesas: r8a779a0: Add HSCIF pins, groups and functions
Date:   Mon, 21 Dec 2020 17:55:34 +0100
Message-Id: <20201221165541.27679-6-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165541.27679-1-uli+renesas@fpond.eu>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds HSCIF0-3 pins, groups and functions to the R8A779A0
(V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 134 +++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index b395ea17a0d9..be8afb13cce6 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1810,6 +1810,98 @@ static const unsigned int du_oddf_mux[] = {
 	DU_ODDF_DISP_CDE_MARK,
 };
 
+/* - HSCIF0 ----------------------------------------------------------------- */
+static const unsigned int hscif0_data_pins[] = {
+	/* HRX0, HTX0 */
+	RCAR_GP_PIN(1, 1), RCAR_GP_PIN(1, 5),
+};
+static const unsigned int hscif0_data_mux[] = {
+	HRX0_MARK, HTX0_MARK,
+};
+static const unsigned int hscif0_clk_pins[] = {
+	/* HSCK0 */
+	RCAR_GP_PIN(1, 2),
+};
+static const unsigned int hscif0_clk_mux[] = {
+	HSCK0_MARK,
+};
+static const unsigned int hscif0_ctrl_pins[] = {
+	/* HRTS0#, HCTS0# */
+	RCAR_GP_PIN(1, 3), RCAR_GP_PIN(1, 4),
+};
+static const unsigned int hscif0_ctrl_mux[] = {
+	HRTS0_N_MARK, HCTS0_N_MARK,
+};
+
+/* - HSCIF1 ----------------------------------------------------------------- */
+static const unsigned int hscif1_data_pins[] = {
+	/* HRX1, HTX1 */
+	RCAR_GP_PIN(1, 21), RCAR_GP_PIN(1, 22),
+};
+static const unsigned int hscif1_data_mux[] = {
+	HRX1_MARK, HTX1_MARK,
+};
+static const unsigned int hscif1_clk_pins[] = {
+	/* HSCK1 */
+	RCAR_GP_PIN(1, 18),
+};
+static const unsigned int hscif1_clk_mux[] = {
+	HSCK1_MARK,
+};
+static const unsigned int hscif1_ctrl_pins[] = {
+	/* HRTS1#, HCTS1# */
+	RCAR_GP_PIN(1, 20), RCAR_GP_PIN(1, 19),
+};
+static const unsigned int hscif1_ctrl_mux[] = {
+	HRTS1_N_MARK, HCTS1_N_MARK,
+};
+
+/* - HSCIF2 ----------------------------------------------------------------- */
+static const unsigned int hscif2_data_pins[] = {
+	/* HRX2, HTX2 */
+	RCAR_GP_PIN(2, 8), RCAR_GP_PIN(2, 9),
+};
+static const unsigned int hscif2_data_mux[] = {
+	HRX2_MARK, HTX2_MARK,
+};
+static const unsigned int hscif2_clk_pins[] = {
+	/* HSCK2 */
+	RCAR_GP_PIN(2, 5),
+};
+static const unsigned int hscif2_clk_mux[] = {
+	HSCK2_MARK,
+};
+static const unsigned int hscif2_ctrl_pins[] = {
+	/* HRTS2#, HCTS2# */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 6),
+};
+static const unsigned int hscif2_ctrl_mux[] = {
+	HRTS2_N_MARK, HCTS2_N_MARK,
+};
+
+/* - HSCIF3 ----------------------------------------------------------------- */
+static const unsigned int hscif3_data_pins[] = {
+	/* HRX3, HTX3 */
+	RCAR_GP_PIN(1, 13), RCAR_GP_PIN(1, 17),
+};
+static const unsigned int hscif3_data_mux[] = {
+	HRX3_MARK, HTX3_MARK,
+};
+static const unsigned int hscif3_clk_pins[] = {
+	/* HSCK3 */
+	RCAR_GP_PIN(1, 14),
+};
+static const unsigned int hscif3_clk_mux[] = {
+	HSCK3_MARK,
+};
+static const unsigned int hscif3_ctrl_pins[] = {
+	/* HRTS3#, HCTS3# */
+	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 16),
+};
+static const unsigned int hscif3_ctrl_mux[] = {
+	HRTS3_N_MARK, HCTS3_N_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SDA0, SCL0 */
@@ -2057,6 +2149,19 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(du_sync),
 	SH_PFC_PIN_GROUP(du_oddf),
 
+	SH_PFC_PIN_GROUP(hscif0_data),
+	SH_PFC_PIN_GROUP(hscif0_clk),
+	SH_PFC_PIN_GROUP(hscif0_ctrl),
+	SH_PFC_PIN_GROUP(hscif1_data),
+	SH_PFC_PIN_GROUP(hscif1_clk),
+	SH_PFC_PIN_GROUP(hscif1_ctrl),
+	SH_PFC_PIN_GROUP(hscif2_data),
+	SH_PFC_PIN_GROUP(hscif2_clk),
+	SH_PFC_PIN_GROUP(hscif2_ctrl),
+	SH_PFC_PIN_GROUP(hscif3_data),
+	SH_PFC_PIN_GROUP(hscif3_clk),
+	SH_PFC_PIN_GROUP(hscif3_ctrl),
+
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2),
@@ -2196,6 +2301,30 @@ static const char * const du_groups[] = {
 	"du_oddf",
 };
 
+static const char * const hscif0_groups[] = {
+	"hscif0_data",
+	"hscif0_clk",
+	"hscif0_ctrl",
+};
+
+static const char * const hscif1_groups[] = {
+	"hscif1_data",
+	"hscif1_clk",
+	"hscif1_ctrl",
+};
+
+static const char * const hscif2_groups[] = {
+	"hscif2_data",
+	"hscif2_clk",
+	"hscif2_ctrl",
+};
+
+static const char * const hscif3_groups[] = {
+	"hscif3_data",
+	"hscif3_clk",
+	"hscif3_ctrl",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -2273,6 +2402,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
 
 	SH_PFC_FUNCTION(du),
 
+	SH_PFC_FUNCTION(hscif0),
+	SH_PFC_FUNCTION(hscif1),
+	SH_PFC_FUNCTION(hscif2),
+	SH_PFC_FUNCTION(hscif3),
+
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.20.1

