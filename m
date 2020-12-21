Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ECC62DFE6C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 17:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgLUQ6s (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:58:48 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:22274 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgLUQ6r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569754;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=pxdT0TQCDKqkz/dAZzWj4CzDzpzkLcYyctKWOHP165c=;
        b=SGD8j1UqRVw6HQ7J/I8XRb3/3FMdXsUKYTqcJ1H50xz5UreOCdG4cmH13un8EEh880
        7pwyQt3ZSG5ksTbAAd2r7Bd2dYxd09hygOOwh9asL8A98YyFvnGeNLzFEijBRYw+uG04
        CDma9UL6jSjfOABYxvDZZ4kVjg/dSI+ARWvSn3Mqk9XveY6c+6VbLRd2MosVqLSNCkVc
        A/rKnvvdEhuhZV0BDHWf+suU/GCMokLIefJOeFe8MlvUFjOLEZjFLvegdpsgDcQ64HwU
        ftcslszZ/rzRRBbPQu7pZyrM+JYt1K/mjSd8+3t3DaTl02nU+ctf+YbJhR0wujQMaBOI
        n3tA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGtm0KT
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:48 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 06/12] pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
Date:   Mon, 21 Dec 2020 17:55:35 +0100
Message-Id: <20201221165541.27679-7-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165541.27679-1-uli+renesas@fpond.eu>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add pins, groups, and function for the Interrupt Controller for External
Devices (INTC-EX) on the R-Car R8A779A0 (V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 62 ++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index be8afb13cce6..a141fd1ee49c 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -1965,6 +1965,50 @@ static const unsigned int i2c6_mux[] = {
 	SDA6_MARK, SCL6_MARK,
 };
 
+/* - INTC-EX ---------------------------------------------------------------- */
+static const unsigned int intc_ex_irq0_pins[] = {
+	/* IRQ0 */
+	RCAR_GP_PIN(1, 24),
+};
+static const unsigned int intc_ex_irq0_mux[] = {
+	IRQ0_MARK,
+};
+static const unsigned int intc_ex_irq1_pins[] = {
+	/* IRQ1 */
+	RCAR_GP_PIN(1, 25),
+};
+static const unsigned int intc_ex_irq1_mux[] = {
+	IRQ1_MARK,
+};
+static const unsigned int intc_ex_irq2_pins[] = {
+	/* IRQ2 */
+	RCAR_GP_PIN(1, 26),
+};
+static const unsigned int intc_ex_irq2_mux[] = {
+	IRQ2_MARK,
+};
+static const unsigned int intc_ex_irq3_pins[] = {
+	/* IRQ3 */
+	RCAR_GP_PIN(1, 27),
+};
+static const unsigned int intc_ex_irq3_mux[] = {
+	IRQ3_MARK,
+};
+static const unsigned int intc_ex_irq4_pins[] = {
+	/* IRQ4 */
+	RCAR_GP_PIN(2, 14),
+};
+static const unsigned int intc_ex_irq4_mux[] = {
+	IRQ4_MARK,
+};
+static const unsigned int intc_ex_irq5_pins[] = {
+	/* IRQ5 */
+	RCAR_GP_PIN(2, 15),
+};
+static const unsigned int intc_ex_irq5_mux[] = {
+	IRQ5_MARK,
+};
+
 /* - SCIF0 ------------------------------------------------------------------ */
 static const unsigned int scif0_data_pins[] = {
 	/* RX0, TX0 */
@@ -2170,6 +2214,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(i2c5),
 	SH_PFC_PIN_GROUP(i2c6),
 
+	SH_PFC_PIN_GROUP(intc_ex_irq0),
+	SH_PFC_PIN_GROUP(intc_ex_irq1),
+	SH_PFC_PIN_GROUP(intc_ex_irq2),
+	SH_PFC_PIN_GROUP(intc_ex_irq3),
+	SH_PFC_PIN_GROUP(intc_ex_irq4),
+	SH_PFC_PIN_GROUP(intc_ex_irq5),
+
 	SH_PFC_PIN_GROUP(scif0_data),
 	SH_PFC_PIN_GROUP(scif0_clk),
 	SH_PFC_PIN_GROUP(scif0_ctrl),
@@ -2353,6 +2404,15 @@ static const char * const i2c6_groups[] = {
 	"i2c6",
 };
 
+static const char * const intc_ex_groups[] = {
+	"intc_ex_irq0",
+	"intc_ex_irq1",
+	"intc_ex_irq2",
+	"intc_ex_irq3",
+	"intc_ex_irq4",
+	"intc_ex_irq5",
+};
+
 static const char * const scif0_groups[] = {
 	"scif0_data",
 	"scif0_clk",
@@ -2415,6 +2475,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(i2c5),
 	SH_PFC_FUNCTION(i2c6),
 
+	SH_PFC_FUNCTION(intc_ex),
+
 	SH_PFC_FUNCTION(scif0),
 	SH_PFC_FUNCTION(scif1),
 	SH_PFC_FUNCTION(scif3),
-- 
2.20.1

