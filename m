Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6F3B2C5A8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403871AbgKZR2C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:28:02 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:17915 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391669AbgKZR2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:02 -0500
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Thu, 26 Nov 2020 12:27:59 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411679;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=qxE7sMR4JOv8QQEmxu05HgOqIsGlC2euZtHy6zO114A=;
        b=pvWRYKYbc9rL14Q0elokRmfuTCtfpdeAkOhAUqP3GUZn2LjSUnQoLwVl1vGpR/CQ+/
        jr0SJZHfGJdzK5yl7eDPkGCVmcL9f7RBg5hmtAkDgeWkn+kuHS9pNeDhYFpEusouVhi4
        hkbzozI1q2OEcvG0EVY9/rQMM1QUnPoB7PuqR/n/tBuGOsaGZAaZH6rrD9cgI4OXr04R
        wI3EZfVrHY67ms8wuektHuIep1kXFVUwMVl7QpDJGr9oW+YNO2Jv+yGbVZP+LifZiDR1
        Ipe+mjSbeR04V/szJAzfvw9dNhqsC6tagGQMCMmxbjJL64CvTEPyXL0dzHXnuJH7Z4dM
        ODCg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHM0Mpf
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:22:00 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 02/11] pinctrl: renesas: r8a779a0: Add CANFD pins, groups and functions
Date:   Thu, 26 Nov 2020 18:21:45 +0100
Message-Id: <20201126172154.25625-3-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
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
index 5fcc8e60167e..725d6b58bb4d 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1655,6 +1655,87 @@ static const unsigned int avb5_avtp_match_mux[] = {
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
+static const unsigned int canfd_clk_pins[] = {
+	/* CAN_CLK */
+	RCAR_GP_PIN(3, 0),
+};
+static const unsigned int canfd_clk_mux[] = {
+	CAN_CLK_MARK,
+};
+
 /* - I2C0 ------------------------------------------------------------------- */
 
 static const unsigned int i2c0_pins[] = {
@@ -1881,6 +1962,16 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
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
+	SH_PFC_PIN_GROUP(canfd_clk),
+
 	SH_PFC_PIN_GROUP(i2c0),
 	SH_PFC_PIN_GROUP(i2c1),
 	SH_PFC_PIN_GROUP(i2c2),
@@ -1976,6 +2067,42 @@ static const char * const avb5_groups[] = {
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
+static const char * const canfd_clk_groups[] = {
+	"canfd_clk",
+};
+
 static const char * const i2c0_groups[] = {
 	"i2c0",
 };
@@ -2040,6 +2167,16 @@ static const struct sh_pfc_function pinmux_functions[] = {
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
+	SH_PFC_FUNCTION(canfd_clk),
+
 	SH_PFC_FUNCTION(i2c0),
 	SH_PFC_FUNCTION(i2c1),
 	SH_PFC_FUNCTION(i2c2),
-- 
2.20.1

