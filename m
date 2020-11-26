Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87EFD2C5A8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 18:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391588AbgKZR2A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 12:28:00 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:17173 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391668AbgKZR2A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 12:28:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606411679;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=SPjh9rf7u3ZmYU2+uoDIQ5Th0TMH4aB/rwm2q7Cl43E=;
        b=f/n/g4+f7VUGuwtZB4hlGTd6YO1L5Dy60gV7UbH2jJwLsQPIUVEyBXRus8M7i3b2UL
        sEdh5tdnar6mUrnb6ItLcp4oI/YOZotYQ5PpYNZuUWxcE063fUBPXMD1NkC/fsAM/71d
        BijcXQYj0g5mxorCzOFwVCc06VniO1b6+52SgjVFLW6uvnjIBLjgAfc62zbeHr5OH/z3
        DOFAWha+LzYTmW1DXZ2RaEh0NW7YuvbhWSKUDWv41q6adhptj8bN7IAdbs8lIlHqi0Qj
        Is0AHyl/ZDSWet5GP+cI5tw1AJTRpaTt9BR87YBgl54wq49+kx9UQuun+N94MNPnPrIX
        grmg==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR82ped3jxkhQ="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 47.3.3 DYNA|AUTH)
        with ESMTPSA id 60ba70wAQHM5Mpn
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 26 Nov 2020 18:22:05 +0100 (CET)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     wsa@the-dreams.de, geert@linux-m68k.org, hoai.luu.ub@renesas.com,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH 10/11] pinctrl: renesas: r8a779a0: Add TMU pins, groups and functions
Date:   Thu, 26 Nov 2020 18:21:53 +0100
Message-Id: <20201126172154.25625-11-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201126172154.25625-1-uli+renesas@fpond.eu>
References: <20201126172154.25625-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds TMU TCLK1-4 pins, groups and functions to the R8A779A0
(V3U) SoC.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/pinctrl/renesas/pfc-r8a779a0.c | 47 ++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/pinctrl/renesas/pfc-r8a779a0.c b/drivers/pinctrl/renesas/pfc-r8a779a0.c
index a83b6fa9ab9e..4aa725b3fbca 100644
--- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
+++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c
@@ -2502,6 +2502,39 @@ static const unsigned int scif_clk_mux[] = {
 	SCIF_CLK_MARK,
 };
 
+/* - TMU -------------------------------------------------------------------- */
+static const unsigned int tmu_tclk1_pins[] = {
+	/* TCLK1 */
+	RCAR_GP_PIN(2, 23),
+};
+static const unsigned int tmu_tclk1_mux[] = {
+	TCLK1_MARK,
+};
+
+static const unsigned int tmu_tclk2_pins[] = {
+	/* TCLK2 */
+	RCAR_GP_PIN(2, 24),
+};
+static const unsigned int tmu_tclk2_mux[] = {
+	TCLK2_MARK,
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
@@ -2666,6 +2699,11 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SH_PFC_PIN_GROUP(scif4_clk),
 	SH_PFC_PIN_GROUP(scif4_ctrl),
 	SH_PFC_PIN_GROUP(scif_clk),
+
+	SH_PFC_PIN_GROUP(tmu_tclk1),
+	SH_PFC_PIN_GROUP(tmu_tclk2),
+	SH_PFC_PIN_GROUP(tmu_tclk3),
+	SH_PFC_PIN_GROUP(tmu_tclk4),
 };
 
 static const char * const avb0_groups[] = {
@@ -2952,6 +2990,13 @@ static const char * const scif_clk_groups[] = {
 	"scif_clk",
 };
 
+static const char * const tmu_groups[] = {
+	"tmu_tclk1",
+	"tmu_tclk2",
+	"tmu_tclk3",
+	"tmu_tclk4",
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb0),
 	SH_PFC_FUNCTION(avb1),
@@ -3008,6 +3053,8 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif3),
 	SH_PFC_FUNCTION(scif4),
 	SH_PFC_FUNCTION(scif_clk),
+
+	SH_PFC_FUNCTION(tmu),
 };
 
 static const struct pinmux_cfg_reg pinmux_config_regs[] = {
-- 
2.20.1

