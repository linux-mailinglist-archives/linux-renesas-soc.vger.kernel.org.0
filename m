Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0EE02CA0F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Dec 2020 12:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgLALKw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Dec 2020 06:10:52 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.216]:26730 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbgLALKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Dec 2020 06:10:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606820818;
        s=strato-dkim-0002; d=fpond.eu;
        h=Message-Id:Date:Subject:Cc:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=CaCRNVSJOQ/+vSUfUe1CFq5EJcCBLS6oG69Cwbly/io=;
        b=Ghcmw+dz14wfuqV8hhWKsKDjfbeYA59NgXgOVNibuvmODGzCZ7LH7AFROBOkuTT+Ic
        BFCNpiE7YH8ePLPsk1YGndthFj9D49fphrlgXeeXivHtyoA1fl06KZ0F3bMDG31j0stY
        PUU3CeAYGtjqMCE0w5Gbn1/CyGbA2qx3mkDwTgww43jyXL0Bq05EHLCeUYm4PG0lkSbN
        CcYUzvEXHhOjcCTKtQLzYuIDzmQQbgne0GiwRnrpFNmaWLd43wVWp5otUWy1czMN2RGk
        5VY9Qf25VSPYTcjxb5/WPn04GqkN5jvkjlle+0PGYkR68L0AuAvCRBxsjDTDFRxgceDN
        dwxg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR+2tEbLpo"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wB1B6qm5I
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 1 Dec 2020 12:06:52 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH] pinctrl: renesas: r8a779a0: Add I2C pins, groups and functions
Date:   Tue,  1 Dec 2020 12:06:41 +0100
Message-Id: <20201201110641.28986-1-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds I2C0-6 pins, groups and functions to the R8A779A0 (V3U)
SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---

Hi!

This patch was missing from the "pinctrl: renesas: basic R8A779A0 (V3U)
support" series. I have thus posted it on its own for review now and will
include it in v2 of the series later.

CU
Uli


 drivers/pinctrl/renesas/pfc-r8a779a0.c | 108 +++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 8ce7238e8ad3..d0d0a682b13b 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1199,6 +1199,70 @@ static const struct sh_pfc_pin pinmux_pins[] = {
 	PINMUX_GPIO_GP_ALL(),
 };
 
+/* - I2C0 ------------------------------------------------------------------- */
+
+static const unsigned int i2c0_pins[] = {
+	/* SDA0, SCL0 */
+	RCAR_GP_PIN(2, 3), RCAR_GP_PIN(2, 2),
+};
+static const unsigned int i2c0_mux[] = {
+	GP2_03_MARK, GP2_02_MARK,
+};
+
+/* - I2C1 ------------------------------------------------------------------- */
+static const unsigned int i2c1_pins[] = {
+	/* SDA1, SCL1 */
+	RCAR_GP_PIN(2, 5), RCAR_GP_PIN(2, 4),
+};
+static const unsigned int i2c1_mux[] = {
+	GP2_05_MARK, GP2_04_MARK,
+};
+
+/* - I2C2 ------------------------------------------------------------------- */
+static const unsigned int i2c2_pins[] = {
+	/* SDA2, SCL2 */
+	RCAR_GP_PIN(2, 7), RCAR_GP_PIN(2, 6),
+};
+static const unsigned int i2c2_mux[] = {
+	GP2_07_MARK, GP2_06_MARK,
+};
+
+/* - I2C3 ------------------------------------------------------------------- */
+static const unsigned int i2c3_pins[] = {
+	/* SDA3, SCL3 */
+	RCAR_GP_PIN(2, 9), RCAR_GP_PIN(2, 8),
+};
+static const unsigned int i2c3_mux[] = {
+	GP2_09_MARK, GP2_08_MARK,
+};
+
+/* - I2C4 ------------------------------------------------------------------- */
+static const unsigned int i2c4_pins[] = {
+	/* SDA4, SCL4 */
+	RCAR_GP_PIN(2, 11), RCAR_GP_PIN(2, 10),
+};
+static const unsigned int i2c4_mux[] = {
+	GP2_11_MARK, GP2_10_MARK,
+};
+
+/* - I2C5 ------------------------------------------------------------------- */
+static const unsigned int i2c5_pins[] = {
+	/* SDA5, SCL5 */
+	RCAR_GP_PIN(2, 13), RCAR_GP_PIN(2, 12),
+};
+static const unsigned int i2c5_mux[] = {
+	GP2_13_MARK, GP2_12_MARK,
+};
+
+/* - I2C6 ------------------------------------------------------------------- */
+static const unsigned int i2c6_pins[] = {
+	/* SDA5, SCL5 */
+	RCAR_GP_PIN(2, 15), RCAR_GP_PIN(2, 14),
+};
+static const unsigned int i2c6_mux[] = {
+	GP2_15_MARK, GP2_14_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -1301,6 +1365,14 @@ static const unsigned int scif_clk_mux[] = {
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
@@ -1316,6 +1388,34 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
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
@@ -1345,6 +1445,14 @@ static const char * const scif_clk_groups[] = {
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

