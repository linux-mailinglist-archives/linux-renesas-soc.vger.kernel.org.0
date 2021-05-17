Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7870238225E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 May 2021 02:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhEQAnH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 16 May 2021 20:43:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:46840 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229459AbhEQAnF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 May 2021 20:43:05 -0400
Date:   17 May 2021 09:36:45 +0900
X-IronPort-AV: E=Sophos;i="5.82,306,1613401200"; 
   d="scan'208";a="81299777"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 May 2021 09:36:45 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 83FC04142B9D;
        Mon, 17 May 2021 09:36:45 +0900 (JST)
Message-ID: <87im3ici1u.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] clk: renesas: r8a77995: Add ZA2 clock
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org,
        kazuya.mizuguchi.ks@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        hoai.luu.ub@renesas.com, takeshi.kihara.df@renesas.com,
        harunobu.kurokawa.dn@renesas.com, khiem.nguyen.xt@renesas.com,
        hien.dang.eb@renesas.com
In-Reply-To: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com>
References: <87k0nyci2t.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Implement support for the ZA2 clock which is needed
for R-Car Sound.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 9cfd00cf4e69..8fb84ed6fe08 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -35,6 +35,7 @@ enum clk_ids {
 	CLK_PLL0D2,
 	CLK_PLL0D3,
 	CLK_PLL0D5,
+	CLK_PLL0D24,
 	CLK_PLL1D2,
 	CLK_PE,
 	CLK_S0,
@@ -62,6 +63,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_FIXED(".pll0d2",   CLK_PLL0D2,         CLK_PLL0,       2, 1),
 	DEF_FIXED(".pll0d3",   CLK_PLL0D3,         CLK_PLL0,       3, 1),
 	DEF_FIXED(".pll0d5",   CLK_PLL0D5,         CLK_PLL0,       5, 1),
+	DEF_FIXED(".pll0d24",  CLK_PLL0D24,        CLK_PLL0,      24, 1),
 	DEF_FIXED(".pll1d2",   CLK_PLL1D2,         CLK_PLL1,       2, 1),
 	DEF_FIXED(".pe",       CLK_PE,             CLK_PLL0D3,     4, 1),
 	DEF_FIXED(".s0",       CLK_S0,             CLK_PLL1,       2, 1),
@@ -75,6 +77,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 	DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
 
 	/* Core Clock Outputs */
+	DEF_FIXED("za2",       R8A77995_CLK_ZA2,   CLK_PLL0D24,    1, 1),
 	DEF_FIXED("z2",        R8A77995_CLK_Z2,    CLK_PLL0D3,     1, 1),
 	DEF_FIXED("ztr",       R8A77995_CLK_ZTR,   CLK_PLL1,       6, 1),
 	DEF_FIXED("zt",        R8A77995_CLK_ZT,    CLK_PLL1,       4, 1),
-- 
2.25.1

