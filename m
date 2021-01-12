Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1016D2F3675
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391725AbhALRCv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:51 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([81.169.146.175]:24190 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391650AbhALRCu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470787;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=K6ctrQ0KHmtAJAfCJ21/5jyXu/Aoqqvb4VRgsXQckGY=;
        b=O2mlDlkSGZESIsomHZUU3Hpi+1rZvaqUopa1EhsOXjFwf7CHf55ITxut+wqkV9JzxS
        O3Gvp6nqU/68lklwIzAPOH+36zFJmqBFlTqykCTsu8OEBfv5sSL6yI8qDRke0NkKJ8mY
        9B3e2igBrVinLDYRE/wstQnoEX5NFoARDxAPGp2/gD3kMihpdeHSuQtx9uYm5ZiCiPU1
        C8v7ejodPfQV4zMo57nnrVIQeviAtjMaR7i/JSWP2RhbXKdH4FujGVpVIzH0uHISpokY
        87T5XQk8gJ9AXMNhcGHbtz6NtjSSFJbOo7C0QjECDxAIdzRFHEhnxfh37iisv5iV3z7k
        Zb7Q==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxgNUY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:42 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 06/12] pinctrl: renesas: r8a779a0: Add INTC-EX pins, groups and function
Date:   Tue, 12 Jan 2021 17:59:23 +0100
Message-Id: <20210112165929.31002-7-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165929.31002-1-uli+renesas@fpond.eu>
References: <20210112165929.31002-1-uli+renesas@fpond.eu>
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
index 909b5f37776c..78235c242867 100644
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

