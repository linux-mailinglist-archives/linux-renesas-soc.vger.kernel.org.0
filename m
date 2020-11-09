Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ED4E2ABFC9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Nov 2020 16:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731617AbgKIP0V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Nov 2020 10:26:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729868AbgKIP0V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Nov 2020 10:26:21 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B20C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Nov 2020 07:26:20 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id qFSG2300N4C55Sk06FSG8e; Mon, 09 Nov 2020 16:26:16 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kc93g-000v8S-3j; Mon, 09 Nov 2020 16:26:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kc93f-00ALOd-ME; Mon, 09 Nov 2020 16:26:15 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779a0: Fix R and OSC clocks
Date:   Mon,  9 Nov 2020 16:26:14 +0100
Message-Id: <20201109152614.2465483-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car V3U clock driver defines the R and OSC clocks using R-Car Gen3
clock types.  However, The R-Car V3U clock driver does not use the R-Car
Gen3 clock driver core, hence registering the R and OSC clocks fails:

    renesas-cpg-mssr e6150000.clock-controller: Failed to register core clock osc: -22
    renesas-cpg-mssr e6150000.clock-controller: Failed to register core clock r: -22

Fix this by introducing clock definition macros specific to R-Car V3U.
Note that rcar_r8a779a0_cpg_clk_register() already handled the related
clock types.  Drop the now unneeded include of rcar-gen3-cpg.h.

Fixes: 17bcc8035d2d19fc ("clk: renesas: cpg-mssr: Add support for R-Car V3U")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.11, as no driver relies on the presence of
the R and OSC clocks yet.

 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 1eddff2f94c23e1e..c4aa561bb01152df 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -26,7 +26,6 @@
 #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
 
 #include "renesas-cpg-mssr.h"
-#include "rcar-gen3-cpg.h"
 
 enum rcar_r8a779a0_clk_types {
 	CLK_TYPE_R8A779A0_MAIN = CLK_TYPE_CUSTOM,
@@ -83,6 +82,14 @@ enum clk_ids {
 	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_PLL2X_3X, CLK_MAIN, \
 		 .offset = _offset)
 
+#define DEF_MDSEL(_name, _id, _md, _parent0, _div0, _parent1, _div1) \
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_MDSEL,	\
+		 (_parent0) << 16 | (_parent1),		\
+		 .div = (_div0) << 16 | (_div1), .offset = _md)
+
+#define DEF_OSC(_name, _id, _parent, _div)		\
+	DEF_BASE(_name, _id, CLK_TYPE_R8A779A0_OSC, _parent, .div = _div)
+
 static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	/* External Clock Inputs */
 	DEF_INPUT("extal",  CLK_EXTAL),
@@ -136,8 +143,8 @@ static const struct cpg_core_clk r8a779a0_core_clks[] __initconst = {
 	DEF_DIV6P1("canfd",	R8A779A0_CLK_CANFD,	CLK_PLL5_DIV4,	0x878),
 	DEF_DIV6P1("csi0",	R8A779A0_CLK_CSI0,	CLK_PLL5_DIV4,	0x880),
 
-	DEF_GEN3_OSC("osc",	R8A779A0_CLK_OSC,	CLK_EXTAL,	8),
-	DEF_GEN3_MDSEL("r",	R8A779A0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
+	DEF_OSC("osc",		R8A779A0_CLK_OSC,	CLK_EXTAL,	8),
+	DEF_MDSEL("r",		R8A779A0_CLK_R, 29, CLK_EXTALR, 1, CLK_OCO, 1),
 };
 
 static const struct mssr_mod_clk r8a779a0_mod_clks[] __initconst = {
-- 
2.25.1

