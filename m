Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD182DFE84
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Dec 2020 18:01:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbgLUQ7J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Dec 2020 11:59:09 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:22866 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgLUQ65 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:58:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608569754;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:
        Subject:Sender;
        bh=14sg95+jBMw5tIyD+A9KCEg4NTsd4hgrIjowgj9mPmo=;
        b=oV4dMx2oUX0GqMMarwcNnDQ+WMYkIOAYqvU3XTd3VNbt5mTVLZdr2+4goqUa45OQGQ
        byy0An7S/ipQhpdGE7qg/x4hn6tWKMS/zeUn/Eo38CIjwoTZPdtGJhipSpAWUVZPkTEf
        UWGcdPb7htt/K+mmsvb/zkUG8+2yJJrZs03tMuPiqBWNrAtl+75E9TArfIrp0IDtspfW
        YIVtk6oc6JUQuApAa8DAL+Kd3LSDg6IQCT4a1ciJHJFLHEd/5UDMndN0zllqbFg5LtS9
        6Lew8I320exfhv0HJHDpnPnBKx3TkSIb0GO3dYnx1+Q5ASMEAKJstiIQ/6BSoiDZkzsl
        ceYA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8GJSdzTYQw=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.10.2 DYNA|AUTH)
        with ESMTPSA id j05b20wBLGto0KZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 21 Dec 2020 17:55:50 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v2 11/12] pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
Date:   Mon, 21 Dec 2020 17:55:40 +0100
Message-Id: <20201221165541.27679-12-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201221165541.27679-1-uli+renesas@fpond.eu>
References: <20201221165541.27679-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds TMU TCLK1-4 pins, groups and functions to the R8A779A0
(V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index 20dc2d508599..cc8364b1964b 100644
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

