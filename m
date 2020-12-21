Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D1BB2DFE66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:58:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726209AbgLUQ6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:47 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.80]:20249 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgLUQ6p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569753;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=JfMvyVnwxZm41+wLq3Usu1N0reoi8mAuNiEmNJBHtZo=;
        b=Jbj31lXDF4D6/1rQqrjkPc9A6i25UwSYkt0fsuXWJYRhavKWY9lhRaIunuz+iQwD+o
        HoZudWaxNFtFYFjewc2q3qdq2vmSnc6RVtSy/82qv0DAGaqpZOjvDfShkQc4G8BIkei3
        csbPR1Brse7YrTqzkPwiJ4zs7TVLMjr4fFOKkWZLRckKeAt62CTE1Dsbm01gc9HGWtkv
        VEW4B9UQAU8yF61n8mRK205zvxnRGJgoLAcnLX+RO8u3TVcaytJzr80AYm4/iEDId8V6
        eJz8PLVt9kf5qYvp8hloqSInnwh4OSNKG9gGOvT2wuETUsilaaCet2XzF1j6+ZdMT4x8
        invg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGtl0KO
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:47 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/12] pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
Date:   Mon, 21 Dec 2020 17:55:30 +0100
Message-Id: <20201221165541.27679-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165541.27679-1-uli+renesas@fpond.eu>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds I2C0-6 pins, groups and functions to the R8A779A0 (V3U)
SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 107 +++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 253387e47b55..c19fb6bc08a1 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1233,6 +1233,69 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - I2C0 ------------------------------------------------------------------- */
+static const unsigned int i2c0_pins[] = {
+	/* SDA0, SCL0 */
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 2),
+};
+static const unsigned int i2c0_mux[] = {
+	SDA0_MARK, SCL0_MARK,
+};
+
+/* - I2C1 ------------------------------------------------------------------- */
+static const unsigned int i2c1_pins[] = {
+	/* SDA1, SCL1 */
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 4),
+};
+static const unsigned int i2c1_mux[] = {
+	SDA1_MARK, SCL1_MARK,
+};
+
+/* - I2C2 ------------------------------------------------------------------- */
+static const unsigned int i2c2_pins[] = {
+	/* SDA2, SCL2 */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 6),
+};
+static const unsigned int i2c2_mux[] = {
+	SDA2_MARK, SCL2_MARK,
+};
+
+/* - I2C3 ------------------------------------------------------------------- */
+static const unsigned int i2c3_pins[] = {
+	/* SDA3, SCL3 */
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 8),
+};
+static const unsigned int i2c3_mux[] = {
+	SDA3_MARK, SCL3_MARK,
+};
+
+/* - I2C4 ------------------------------------------------------------------- */
+static const unsigned int i2c4_pins[] = {
+	/* SDA4, SCL4 */
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 10),
+};
+static const unsigned int i2c4_mux[] = {
+	SDA4_MARK, SCL4_MARK,
+};
+
+/* - I2C5 ------------------------------------------------------------------- */
+static const unsigned int i2c5_pins[] = {
+	/* SDA5, SCL5 */
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 12),
+};
+static const unsigned int i2c5_mux[] = {
+	SDA5_MARK, SCL5_MARK,
+};
+
+/* - I2C6 ------------------------------------------------------------------- */
+static const unsigned int i2c6_pins[] = {
+	/* SDA6, SCL6 */
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 14),
+};
+static const unsigned int i2c6_mux[] = {
+	SDA6_MARK, SCL6_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -1342,6 +1405,14 @@ static const unsigned int scif_clk_mux[] = {
 };
 
 static const struct sh_pfc_pin_group pinmux_groups[] = {
+	SH_PFC_PIN_GROUP(i2c0),
+	SH_PFC_PIN_GROUP(i2c1),
+	SH_PFC_PIN_GROUP(i2c2),
+	SH_PFC_PIN_GROUP(i2c3),
+	SH_PFC_PIN_GROUP(i2c4),
+	SH_PFC_PIN_GROUP(i2c5),
+	SH_PFC_PIN_GROUP(i2c6),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -1358,6 +1429,34 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif_clk),
 };
 
+static const char * const i2c0_groups[] = {
+	"i2c0",
+};
+
+static const char * const i2c1_groups[] = {
+	"i2c1",
+};
+
+static const char * const i2c2_groups[] = {
+	"i2c2",
+};
+
+static const char * const i2c3_groups[] = {
+	"i2c3",
+};
+
+static const char * const i2c4_groups[] = {
+	"i2c4",
+};
+
+static const char * const i2c5_groups[] = {
+	"i2c5",
+};
+
+static const char * const i2c6_groups[] = {
+	"i2c6",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -1388,6 +1487,14 @@ static const char * const scif_clk_groups[] = {
 };
 
 static const struct sh_pfc_function pinmux_functions[] = {
+	SH_PFC_FUNCTION(i2c0),
+	SH_PFC_FUNCTION(i2c1),
+	SH_PFC_FUNCTION(i2c2),
+	SH_PFC_FUNCTION(i2c3),
+	SH_PFC_FUNCTION(i2c4),
+	SH_PFC_FUNCTION(i2c5),
+	SH_PFC_FUNCTION(i2c6),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

