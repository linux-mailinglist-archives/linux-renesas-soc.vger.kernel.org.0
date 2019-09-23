Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11520BB700
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 16:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438146AbfIWOlm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 10:41:42 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:36815 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2437469AbfIWOlm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 10:41:42 -0400
X-IronPort-AV: E=Sophos;i="5.64,540,1559487600"; 
   d="scan'208";a="27040880"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2019 23:41:40 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 560B24012C09;
        Mon, 23 Sep 2019 23:41:38 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] clk: renesas: r8a774b1: Add TMU clock
Date:   Mon, 23 Sep 2019 15:41:28 +0100
Message-Id: <1569249688-15821-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds the TMU clocks to the R8A774B1 SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
This patch depend upon the below patch
https://patchwork.kernel.org/patch/11151827/
---
 drivers/clk/renesas/r8a774b1-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a774b1-cpg-mssr.c b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
index 6cad6ba..c9af7091 100644
--- a/drivers/clk/renesas/r8a774b1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774b1-cpg-mssr.c
@@ -110,6 +110,11 @@ static const struct cpg_core_clk r8a774b1_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a774b1_mod_clks[] __initconst = {
+	DEF_MOD("tmu4",			 121,	R8A774B1_CLK_S0D6),
+	DEF_MOD("tmu3",			 122,	R8A774B1_CLK_S3D2),
+	DEF_MOD("tmu2",			 123,	R8A774B1_CLK_S3D2),
+	DEF_MOD("tmu1",			 124,	R8A774B1_CLK_S3D2),
+	DEF_MOD("tmu0",			 125,	R8A774B1_CLK_CP),
 	DEF_MOD("fdp1-0",		 119,	R8A774B1_CLK_S0D1),
 	DEF_MOD("scif5",		 202,	R8A774B1_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A774B1_CLK_S3D4),
-- 
2.7.4

