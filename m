Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7DAB2F367A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 18:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391414AbhALRCy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 12:02:54 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104]:13887 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404430AbhALRCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 12:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610470791;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=ziVdnX8wLRpivbvDZFeluIKcM8I8PfAtvxHP8bJ4zyo=;
        b=HCTjQZPvSsN2g/EXHPgPMrflVAnPkjUpJp0x08iKg8aH0hBZ5CuP0cdNOPtCbjAOAc
        ujvJ9lyqBE7TBBk1piSkAXjzu/PHzNr98/hGoL+LX3KRfRyLy+xHN93CvrNrQCp1B0oD
        riXmhj4DnAwZxxw4bT8PHU6f68qFtp+yn8/HyUlgAiyntQxnMC2oCtwSCOV0fEOiF68R
        r3SzxBZSxO9L3rXkskoT0iafxRqwnMWCyyD0Pw3zrK9X+pQLr8Ki8/S7TJ6ZV4nNAb9/
        fX2zdNnF5f5G1Vu+tGSHJAB2Z2YA/ZYtJIQFAbJ3zxCv3c2UlaYwUYok6i1BHbXyv3C6
        rX5w==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8XxYaA36"
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.12.1 DYNA|AUTH)
        with ESMTPSA id z08ea3x0CGxkNUg
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 12 Jan 2021 17:59:46 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 11/12] pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
Date:   Tue, 12 Jan 2021 17:59:28 +0100
Message-Id: <20210112165929.31002-12-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210112165929.31002-1-uli+renesas@fpond.eu>
References: <20210112165929.31002-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds TMU TCLK1-4 pins, groups and functions to the R8A779A0
(V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index f244aa5fd12e..f4f46a76d06a 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2535,6 +2535,53 @@ static const unsigned int scif_clk_mux[] = {
 	SCIF_CLK_MARK,
 };
 
+/* - TMU -------------------------------------------------------------------- */
+static const unsigned int tmu_tclk1_a_pins[] = {
+	/* TCLK1 */
+	RCAR_GP_PIN(2, 23),
+};
+static const unsigned int tmu_tclk1_a_mux[] = {
+	TCLK1_A_MARK,
+};
+static const unsigned int tmu_tclk1_b_pins[] = {
+	/* TCLK1 */
+	RCAR_GP_PIN(1, 23),
+};
+static const unsigned int tmu_tclk1_b_mux[] = {
+	TCLK1_B_MARK,
+};
+
+static const unsigned int tmu_tclk2_a_pins[] = {
+	/* TCLK2 */
+	RCAR_GP_PIN(2, 24),
+};
+static const unsigned int tmu_tclk2_a_mux[] = {
+	TCLK2_A_MARK,
+};
+static const unsigned int tmu_tclk2_b_pins[] = {
+	/* TCLK2 */
+	RCAR_GP_PIN(2, 10),
+};
+static const unsigned int tmu_tclk2_b_mux[] = {
+	TCLK2_B_MARK,
+};
+
+static const unsigned int tmu_tclk3_pins[] = {
+	/* TCLK3 */
+	RCAR_GP_PIN(2, 11),
+};
+static const unsigned int tmu_tclk3_mux[] = {
+	TCLK3_MARK,
+};
+
+static const unsigned int tmu_tclk4_pins[] = {
+	/* TCLK4 */
+	RCAR_GP_PIN(2, 12),
+};
+static const unsigned int tmu_tclk4_mux[] = {
+	TCLK4_MARK,
+};
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(avb0_link),
 	SH_PFC_PIN_GROUP(avb0_magic),
@@ -2711,6 +2758,13 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
+
+	SH_PFC_PIN_GROUP(tmu_tclk1_a),
+	SH_PFC_PIN_GROUP(tmu_tclk1_b),
+	SH_PFC_PIN_GROUP(tmu_tclk2_a),
+	SH_PFC_PIN_GROUP(tmu_tclk2_b),
+	SH_PFC_PIN_GROUP(tmu_tclk3),
+	SH_PFC_PIN_GROUP(tmu_tclk4),
 };
 
 static const char * const avb0_groups[] = {
@@ -3014,6 +3068,15 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk",
 };
 
+static const char * const tmu_groups[] = {
+	"tmu_tclk1_a",
+	"tmu_tclk1_b",
+	"tmu_tclk2_a",
+	"tmu_tclk2_b",
+	"tmu_tclk3",
+	"tmu_tclk4",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
@@ -3072,6 +3135,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif_clk),
+
+	SH_PFC_FUNCTION(tmu),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.20.1

