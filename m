Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD8B63CC89
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 15:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389958AbfFKNHN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 09:07:13 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:25340 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389744AbfFKNHN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 09:07:13 -0400
X-IronPort-AV: E=Sophos;i="5.60,579,1549897200"; 
   d="scan'208";a="18183691"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2019 22:07:12 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 50EC34003878;
        Tue, 11 Jun 2019 22:07:10 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 4/6] clk: renesas: r8a774a1: Add TMU clock
Date:   Tue, 11 Jun 2019 14:06:39 +0100
Message-Id: <1560258401-9517-5-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds the TMU clocks to the R8A774A1 SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r8a774a1-cpg-mssr.c b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
index 76ed7d1..e05bfa2 100644
--- a/drivers/clk/renesas/r8a774a1-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a774a1-cpg-mssr.c
@@ -113,6 +113,11 @@ static const struct cpg_core_clk r8a774a1_core_clks[] __initconst = {
 };
 
 static const struct mssr_mod_clk r8a774a1_mod_clks[] __initconst = {
+	DEF_MOD("tmu4",			 121,	R8A774A1_CLK_S0D6),
+	DEF_MOD("tmu3",			 122,	R8A774A1_CLK_S3D2),
+	DEF_MOD("tmu2",			 123,	R8A774A1_CLK_S3D2),
+	DEF_MOD("tmu1",			 124,	R8A774A1_CLK_S3D2),
+	DEF_MOD("tmu0",			 125,	R8A774A1_CLK_CP),
 	DEF_MOD("fdp1-0",		 119,	R8A774A1_CLK_S0D1),
 	DEF_MOD("scif5",		 202,	R8A774A1_CLK_S3D4),
 	DEF_MOD("scif4",		 203,	R8A774A1_CLK_S3D4),
-- 
2.7.4

