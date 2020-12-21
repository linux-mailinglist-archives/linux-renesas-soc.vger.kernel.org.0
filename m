Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE9552DFE69
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:58:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725870AbgLUQ6r (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:47 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:33643 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbgLUQ6q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569752;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=XshN0cVc3H6ddugiuYu5S3wRufb5wnxJCk4DCTrkyLM=;
        b=I90tkks1nnNuDJgbEKEmfdHDxggUJFGq2AdCtl11A2soPJCLd424Ujm/JH4WjtGZvL
        jJ2nL4I5JG59geC48Dh1AiiuA8UWaVEFVdnMLPJ7Aj6+iBWogF8uxeb71XUUOiy4n0Dj
        5xkNkKE42uhJzPfShY7hN2+GfflNYSE12eL/EImAHqSZa+/KrZf+rBxNVz9vGLgjGFoQ
        tWToe3Qo8G0HMWr+dMjmzjGH7J2pH3m/VZrJVIp6jPFbc1L02u/CLLwDSSRyrMIaixSA
        eQiY0jtzfirVQl80ImAonC8KjE5vm/SH2uQKz3hebTp2/EE9d4Wgn2UG2fxNOIwpqIO/
        uSmg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGtl0KQ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:47 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 03/12] pinctrl: renesas: r8a779a0: Add CANFD pins, groups and functions
Date:   Mon, 21 Dec 2020 17:55:32 +0100
Message-Id: <20201221165541.27679-4-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165541.27679-1-uli+renesas@fpond.eu>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds CANFD 0-7 and CANFD clock pinmux support for the
R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 137 +++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 72838e2175f8..6a58727062e9 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1689,6 +1689,87 @@ static const unsigned int avb5_avtp_match_mux[] = {
 	AVB5_AVTP_MATCH_MARK,
 };
 
+/* - CANFD0 ----------------------------------------------------------------- */
+static const unsigned int canfd0_data_pins[] = {
+	/* CANFD0_TX, CANFD0_RX */
+	RCAR_GP_PIN(3, 1), RCAR_GP_PIN(3, 2),
+};
+static const unsigned int canfd0_data_mux[] = {
+	CANFD0_TX_MARK, CANFD0_RX_MARK,
+};
+
+/* - CANFD1 ----------------------------------------------------------------- */
+static const unsigned int canfd1_data_pins[] = {
+	/* CANFD1_TX, CANFD1_RX */
+	RCAR_GP_PIN(3, 3), RCAR_GP_PIN(3, 4),
+};
+static const unsigned int canfd1_data_mux[] = {
+	CANFD1_TX_MARK, CANFD1_RX_MARK,
+};
+
+/* - CANFD2 ----------------------------------------------------------------- */
+static const unsigned int canfd2_data_pins[] = {
+	/* CANFD2_TX, CANFD2_RX */
+	RCAR_GP_PIN(3, 5), RCAR_GP_PIN(3, 6),
+};
+static const unsigned int canfd2_data_mux[] = {
+	CANFD2_TX_MARK, CANFD2_RX_MARK,
+};
+
+/* - CANFD3 ----------------------------------------------------------------- */
+static const unsigned int canfd3_data_pins[] = {
+	/* CANFD3_TX, CANFD3_RX */
+	RCAR_GP_PIN(3, 7), RCAR_GP_PIN(3, 8),
+};
+static const unsigned int canfd3_data_mux[] = {
+	CANFD3_TX_MARK, CANFD3_RX_MARK,
+};
+
+/* - CANFD4 ----------------------------------------------------------------- */
+static const unsigned int canfd4_data_pins[] = {
+	/* CANFD4_TX, CANFD4_RX */
+	RCAR_GP_PIN(3, 9), RCAR_GP_PIN(3, 10),
+};
+static const unsigned int canfd4_data_mux[] = {
+	CANFD4_TX_MARK, CANFD4_RX_MARK,
+};
+
+/* - CANFD5 ----------------------------------------------------------------- */
+static const unsigned int canfd5_data_pins[] = {
+	/* CANFD5_TX, CANFD5_RX */
+	RCAR_GP_PIN(3, 11), RCAR_GP_PIN(3, 12),
+};
+static const unsigned int canfd5_data_mux[] = {
+	CANFD5_TX_MARK, CANFD5_RX_MARK,
+};
+
+/* - CANFD6 ----------------------------------------------------------------- */
+static const unsigned int canfd6_data_pins[] = {
+	/* CANFD6_TX, CANFD6_RX */
+	RCAR_GP_PIN(3, 13), RCAR_GP_PIN(3, 14),
+};
+static const unsigned int canfd6_data_mux[] = {
+	CANFD6_TX_MARK, CANFD6_RX_MARK,
+};
+
+/* - CANFD7 ----------------------------------------------------------------- */
+static const unsigned int canfd7_data_pins[] = {
+	/* CANFD7_TX, CANFD7_RX */
+	RCAR_GP_PIN(3, 15), RCAR_GP_PIN(3, 16),
+};
+static const unsigned int canfd7_data_mux[] = {
+	CANFD7_TX_MARK, CANFD7_RX_MARK,
+};
+
+/* - CANFD Clock ------------------------------------------------------------ */
+static const unsigned int can_clk_pins[] = {
+	/* CAN_CLK */
+	RCAR_GP_PIN(3, 0),
+};
+static const unsigned int can_clk_mux[] = {
+	CAN_CLK_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 static const unsigned int i2c0_pins[] = {
 	/* SDA0, SCL0 */
@@ -1921,6 +2002,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb5_avtp_capture),
 	SH_PFC_PIN_GROUP(avb5_avtp_match),
 
+	SH_PFC_PIN_GROUP(canfd0_data),
+	SH_PFC_PIN_GROUP(canfd1_data),
+	SH_PFC_PIN_GROUP(canfd2_data),
+	SH_PFC_PIN_GROUP(canfd3_data),
+	SH_PFC_PIN_GROUP(canfd4_data),
+	SH_PFC_PIN_GROUP(canfd5_data),
+	SH_PFC_PIN_GROUP(canfd6_data),
+	SH_PFC_PIN_GROUP(canfd7_data),
+	SH_PFC_PIN_GROUP(can_clk),
+
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2),
@@ -2017,6 +2108,42 @@ static const char * const avb5_groups[] = {
 	"avb5_avtp_match",
 };
 
+static const char * const canfd0_groups[] = {
+	"canfd0_data",
+};
+
+static const char * const canfd1_groups[] = {
+	"canfd1_data",
+};
+
+static const char * const canfd2_groups[] = {
+	"canfd2_data",
+};
+
+static const char * const canfd3_groups[] = {
+	"canfd3_data",
+};
+
+static const char * const canfd4_groups[] = {
+	"canfd4_data",
+};
+
+static const char * const canfd5_groups[] = {
+	"canfd5_data",
+};
+
+static const char * const canfd6_groups[] = {
+	"canfd6_data",
+};
+
+static const char * const canfd7_groups[] = {
+	"canfd7_data",
+};
+
+static const char * const can_clk_groups[] = {
+	"can_clk",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -2082,6 +2209,16 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb4),
 	SH_PFC_FUNCTION(avb5),
 
+	SH_PFC_FUNCTION(canfd0),
+	SH_PFC_FUNCTION(canfd1),
+	SH_PFC_FUNCTION(canfd2),
+	SH_PFC_FUNCTION(canfd3),
+	SH_PFC_FUNCTION(canfd4),
+	SH_PFC_FUNCTION(canfd5),
+	SH_PFC_FUNCTION(canfd6),
+	SH_PFC_FUNCTION(canfd7),
+	SH_PFC_FUNCTION(can_clk),
+
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.20.1

