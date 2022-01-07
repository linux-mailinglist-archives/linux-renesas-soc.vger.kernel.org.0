Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6765C487914
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jan 2022 15:35:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbiAGOfC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jan 2022 09:35:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347932AbiAGOeo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 09:34:44 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 310CAC061746
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Jan 2022 06:34:44 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:190f:68c2:a684:b2f7])
        by albert.telenet-ops.be with bizsmtp
        id fqah2600A31q0Fw06qah0c; Fri, 07 Jan 2022 15:34:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n5qKG-008Y0A-S4; Fri, 07 Jan 2022 15:34:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1n5qKG-00FI1O-8Q; Fri, 07 Jan 2022 15:34:40 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r8a779f0: Fix RSW2 clock divider
Date:   Fri,  7 Jan 2022 15:34:36 +0100
Message-Id: <d6a406f31e6f02f892e0253f4e8a9a2f68fd652e.1641566003.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

According to Section 8.1.2 Figure 8.1.1 ("Block Diagram of CPG"), Note
22 ("RSW2 divider"), and Table 8.1.4d ("Lists of CPG clocks generated
from CPGMA1"), the RSwitch2 and PCI Express clock is generated from PLL5
by dividing by two, followed by the RSW2 divider.  As PLL5 runs at 3200
MHz, and RSW2 is fixed to 320 MHz, the RSW2 divider must be 5.

Correct the parent and the fixed divider.

Fixes: 24aaff6a6ce4c4de ("clk: renesas: cpg-mssr: Add support for R-Car S4-8")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v5.18, as this is non-critical.

 drivers/clk/renesas/r8a779f0-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a779f0-cpg-mssr.c b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
index e6ec02c2c2a8b83c..344957d533d811ad 100644
--- a/drivers/clk/renesas/r8a779f0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779f0-cpg-mssr.c
@@ -103,7 +103,7 @@ static const struct cpg_core_clk r8a779f0_core_clks[] __initconst = {
 	DEF_FIXED("s0d12_hsc",	R8A779F0_CLK_S0D12_HSC,	CLK_S0,		12, 1),
 	DEF_FIXED("cl16m_hsc",	R8A779F0_CLK_CL16M_HSC,	CLK_S0,		48, 1),
 	DEF_FIXED("s0d2_cc",	R8A779F0_CLK_S0D2_CC,	CLK_S0,		2, 1),
-	DEF_FIXED("rsw2",	R8A779F0_CLK_RSW2,	CLK_PLL5,	2, 1),
+	DEF_FIXED("rsw2",	R8A779F0_CLK_RSW2,	CLK_PLL5_DIV2,	5, 1),
 	DEF_FIXED("cbfusa",	R8A779F0_CLK_CBFUSA,	CLK_EXTAL,	2, 1),
 	DEF_FIXED("cpex",	R8A779F0_CLK_CPEX,	CLK_EXTAL,	2, 1),
 
-- 
2.25.1

