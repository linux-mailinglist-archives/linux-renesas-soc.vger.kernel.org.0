Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 800112904DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 14:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407345AbgJPMR0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 08:17:26 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:7874 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407333AbgJPMRY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 08:17:24 -0400
X-IronPort-AV: E=Sophos;i="5.77,382,1596466800"; 
   d="scan'208";a="59771535"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 16 Oct 2020 21:17:22 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BB40F43871A2;
        Fri, 16 Oct 2020 21:17:20 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/4] clk: renesas: r8a774a1: Add RPC clocks
Date:   Fri, 16 Oct 2020 13:17:07 +0100
Message-Id: <20201016121709.8447-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Biju Das <biju.das.jz@bp.renesas.com>

Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
as well as the RPC-IF module clock, in the RZ/G2M (R8A774A1) CPG/MSSR
driver.

Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index fd54b9f625da..4a43ebec7d5e 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -41,6 +41,7 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
+	CLK_RPCSRC,
 	CLK_RINT,
 
 	/* Module Clocks */
@@ -67,6 +68,12 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 	DEF_FIXED(".s2",        CLK_S2,            CLK_PLL1_DIV2,  4, 1),
 	DEF_FIXED(".s3",        CLK_S3,            CLK_PLL1_DIV2,  6, 1),
 	DEF_FIXED(".sdsrc",     CLK_SDSRC,         CLK_PLL1_DIV2,  2, 1),
+	DEF_BASE(".rpcsrc",     CLK_RPCSRC, CLK_TYPE_GEN3_RPCSRC, CLK_PLL1),
+
+	DEF_BASE("rpc",         R8A774A1_CLK_RPC, CLK_TYPE_GEN3_RPC,
+		 CLK_RPCSRC),
+	DEF_BASE("rpcd2",       R8A774A1_CLK_RPCD2, CLK_TYPE_GEN3_RPCD2,
+		 R8A774A1_CLK_RPC),
 
 	DEF_GEN3_OSC(".r",      CLK_RINT,          CLK_EXTAL,      32),
 
@@ -200,6 +207,7 @@ static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
 	DEF_MOD("can-fd",		 914,	R8A774A1_CLK_S3D2),
 	DEF_MOD("can-if1",		 915,	R8A774A1_CLK_S3D4),
 	DEF_MOD("can-if0",		 916,	R8A774A1_CLK_S3D4),
+	DEF_MOD("rpc-if",		 917,	R8A774A1_CLK_RPCD2),
 	DEF_MOD("i2c6",			 918,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c5",			 919,	R8A774A1_CLK_S0D6),
 	DEF_MOD("i2c-dvfs",		 926,	R8A774A1_CLK_CP),
-- 
2.17.1

