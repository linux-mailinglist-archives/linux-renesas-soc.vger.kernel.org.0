Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 336462DFE6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgLUQ6t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:49 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:23969 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgLUQ6s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569755;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=3bjGW3KXWBJXOOgbsk5+8fW15xBq2QDgaQOcRnq7RVI=;
        b=G55Ij0ICyKcI0yycg21YiZJ+UP80feB8OimqGO/CH7HBw0IcyVeKyEcTMC/22+adIo
        zafoSBtw97x0XGsbFtyPAIvw34lHJBQvjqtbFcPnmuhFxOoY2wlAsZ5Ah5Z7dSs1Pao0
        SbRaj2/yBnlffyGB+vcRP55bi0CqXyxU1yt8msS1a+9l/X5EoLyt83fjFIwNPPg5QBpR
        G2q657RkTJ7XWA6Qk8HlHVUaHqoRmstZQPt0UNgkWtQPVn9qotHwy2L8NoGdyCefzli8
        Txr6Gb8eDrVWaP2AyiQmjRKkDHJW/FLH1VePHn71GlR1h94Dt7RWHx38OP6vle1fZobK
        2f8A==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGtn0KX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:49 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 09/12] pinctrl: renesas: r8a779a0: Add PWM pins, groups and functions
Date:   Mon, 21 Dec 2020 17:55:38 +0100
Message-Id: <20201221165541.27679-10-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165541.27679-1-uli+renesas@fpond.eu>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds PWM0-4 pins, groups and functions to the R8A779A0 (V3U)
SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 77 ++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index e356e8b00786..b62c61bc0b8f 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2332,6 +2332,51 @@ static const unsigned int msiof5_rxd_mux[] = {
 	MSIOF5_RXD_MARK,
 };
 
+/* - PWM0 ------------------------------------------------------------------- */
+static const unsigned int pwm0_pins[] = {
+	/* PWM0 */
+	RCAR_GP_PIN(3, 5),
+};
+static const unsigned int pwm0_mux[] = {
+	PWM0_MARK,
+};
+
+/* - PWM1 ------------------------------------------------------------------- */
+static const unsigned int pwm1_pins[] = {
+	/* PWM1 */
+	RCAR_GP_PIN(3, 6),
+};
+static const unsigned int pwm1_mux[] = {
+	PWM1_MARK,
+};
+
+/* - PWM2 ------------------------------------------------------------------- */
+static const unsigned int pwm2_pins[] = {
+	/* PWM2 */
+	RCAR_GP_PIN(3, 7),
+};
+static const unsigned int pwm2_mux[] = {
+	PWM2_MARK,
+};
+
+/* - PWM3 ------------------------------------------------------------------- */
+static const unsigned int pwm3_pins[] = {
+	/* PWM3 */
+	RCAR_GP_PIN(3, 8),
+};
+static const unsigned int pwm3_mux[] = {
+	PWM3_MARK,
+};
+
+/* - PWM4 ------------------------------------------------------------------- */
+static const unsigned int pwm4_pins[] = {
+	/* PWM4 */
+	RCAR_GP_PIN(3, 9),
+};
+static const unsigned int pwm4_mux[] = {
+	PWM4_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2589,6 +2634,12 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(msiof5_txd),
 	SH_PFC_PIN_GROUP(msiof5_rxd),
 
+	SH_PFC_PIN_GROUP(pwm0),
+	SH_PFC_PIN_GROUP(pwm1),
+	SH_PFC_PIN_GROUP(pwm2),
+	SH_PFC_PIN_GROUP(pwm3),
+	SH_PFC_PIN_GROUP(pwm4),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2845,6 +2896,26 @@ static const char * const msiof5_groups[] = {
 	"msiof5_rxd",
 };
 
+static const char * const pwm0_groups[] = {
+	"pwm0",
+};
+
+static const char * const pwm1_groups[] = {
+	"pwm1",
+};
+
+static const char * const pwm2_groups[] = {
+	"pwm2",
+};
+
+static const char * const pwm3_groups[] = {
+	"pwm3",
+};
+
+static const char * const pwm4_groups[] = {
+	"pwm4",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2918,6 +2989,12 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(msiof4),
 	SH_PFC_FUNCTION(msiof5),
 
+	SH_PFC_FUNCTION(pwm0),
+	SH_PFC_FUNCTION(pwm1),
+	SH_PFC_FUNCTION(pwm2),
+	SH_PFC_FUNCTION(pwm3),
+	SH_PFC_FUNCTION(pwm4),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

