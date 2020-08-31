Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B6E258135
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Aug 2020 20:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729200AbgHaShi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 31 Aug 2020 14:37:38 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:36561 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729189AbgHaShh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 31 Aug 2020 14:37:37 -0400
X-IronPort-AV: E=Sophos;i="5.76,376,1592838000"; 
   d="scan'208";a="56004895"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Sep 2020 03:37:35 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EDB6E40CE840;
        Tue,  1 Sep 2020 03:37:32 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Rename vsp1-(sy|rt) clocks to vsp(s|r)
Date:   Mon, 31 Aug 2020 19:37:22 +0100
Message-Id: <20200831183722.8165-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

VSP1 instances VSPS (which stands for "VSP Standard") and VSPR (which
stands for "VSP for Resizing") were wrongly named as "vsp1-sy" and
"vsp1-rt". The clock section in the SoC datasheets misunderstood the
abbreviations as meaning VSP System and VSP Realtime, and named the
corresponding clocks VSP1(SY) and VSP1(RT). This mistake has been
carried over to the kernel code.

This patch fixes this by renaming the clock names to "vsps" and "vspr".

Inspired from commit 79ea9934b8df ("ARM: shmobile: r8a7790: Rename
VSP1_(SY|RT) clocks to VSP1_(S|R)")

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/r8a7743-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a77470-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7790-cpg-mssr.c  | 4 ++--
 drivers/clk/renesas/r8a7791-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7794-cpg-mssr.c  | 2 +-
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/r8a7743-cpg-mssr.c b/drivers/clk/renesas/r8a7743-cpg-mssr.c
index c01d9af2525a..0bba12a48d22 100644
--- a/drivers/clk/renesas/r8a7743-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7743-cpg-mssr.c
@@ -92,7 +92,7 @@ static const struct mssr_mod_clk r8a7743_mod_clks[] __initconst = {
 	DEF_MOD("tmu0",			 125,	R8A7743_CLK_CP),
 	DEF_MOD("vsp1du1",		 127,	R8A7743_CLK_ZS),
 	DEF_MOD("vsp1du0",		 128,	R8A7743_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A7743_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A7743_CLK_ZS),
 	DEF_MOD("scifa2",		 202,	R8A7743_CLK_MP),
 	DEF_MOD("scifa1",		 203,	R8A7743_CLK_MP),
 	DEF_MOD("scifa0",		 204,	R8A7743_CLK_MP),
diff --git a/drivers/clk/renesas/r8a7745-cpg-mssr.c b/drivers/clk/renesas/r8a7745-cpg-mssr.c
index 493874e5ebee..dc4a64e8dfb5 100644
--- a/drivers/clk/renesas/r8a7745-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7745-cpg-mssr.c
@@ -90,7 +90,7 @@ static const struct mssr_mod_clk r8a7745_mod_clks[] __initconst = {
 	DEF_MOD("cmt0",			 124,	R8A7745_CLK_R),
 	DEF_MOD("tmu0",			 125,	R8A7745_CLK_CP),
 	DEF_MOD("vsp1du0",		 128,	R8A7745_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A7745_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A7745_CLK_ZS),
 	DEF_MOD("scifa2",		 202,	R8A7745_CLK_MP),
 	DEF_MOD("scifa1",		 203,	R8A7745_CLK_MP),
 	DEF_MOD("scifa0",		 204,	R8A7745_CLK_MP),
diff --git a/drivers/clk/renesas/r8a77470-cpg-mssr.c b/drivers/clk/renesas/r8a77470-cpg-mssr.c
index d81ae65f0d18..f3d6e65011d7 100644
--- a/drivers/clk/renesas/r8a77470-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77470-cpg-mssr.c
@@ -85,7 +85,7 @@ static const struct mssr_mod_clk r8a77470_mod_clks[] __initconst = {
 	DEF_MOD("tmu2",			 122,	R8A77470_CLK_P),
 	DEF_MOD("cmt0",			 124,	R8A77470_CLK_R),
 	DEF_MOD("vsp1du0",		 128,	R8A77470_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A77470_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A77470_CLK_ZS),
 	DEF_MOD("msiof2",		 205,	R8A77470_CLK_MP),
 	DEF_MOD("msiof1",		 208,	R8A77470_CLK_MP),
 	DEF_MOD("sys-dmac1",		 218,	R8A77470_CLK_ZS),
diff --git a/drivers/clk/renesas/r8a7790-cpg-mssr.c b/drivers/clk/renesas/r8a7790-cpg-mssr.c
index c57cb93f8315..f7d233e0c142 100644
--- a/drivers/clk/renesas/r8a7790-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7790-cpg-mssr.c
@@ -108,8 +108,8 @@ static const struct mssr_mod_clk r8a7790_mod_clks[] __initconst = {
 	DEF_MOD("tmu0",			 125,	R8A7790_CLK_CP),
 	DEF_MOD("vsp1du1",		 127,	R8A7790_CLK_ZS),
 	DEF_MOD("vsp1du0",		 128,	R8A7790_CLK_ZS),
-	DEF_MOD("vsp1-rt",		 130,	R8A7790_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A7790_CLK_ZS),
+	DEF_MOD("vspr",			 130,	R8A7790_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A7790_CLK_ZS),
 	DEF_MOD("scifa2",		 202,	R8A7790_CLK_MP),
 	DEF_MOD("scifa1",		 203,	R8A7790_CLK_MP),
 	DEF_MOD("scifa0",		 204,	R8A7790_CLK_MP),
diff --git a/drivers/clk/renesas/r8a7791-cpg-mssr.c b/drivers/clk/renesas/r8a7791-cpg-mssr.c
index 65702debcabb..a0de784868da 100644
--- a/drivers/clk/renesas/r8a7791-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7791-cpg-mssr.c
@@ -102,7 +102,7 @@ static const struct mssr_mod_clk r8a7791_mod_clks[] __initconst = {
 	DEF_MOD("tmu0",			 125,	R8A7791_CLK_CP),
 	DEF_MOD("vsp1du1",		 127,	R8A7791_CLK_ZS),
 	DEF_MOD("vsp1du0",		 128,	R8A7791_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A7791_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A7791_CLK_ZS),
 	DEF_MOD("scifa2",		 202,	R8A7791_CLK_MP),
 	DEF_MOD("scifa1",		 203,	R8A7791_CLK_MP),
 	DEF_MOD("scifa0",		 204,	R8A7791_CLK_MP),
diff --git a/drivers/clk/renesas/r8a7792-cpg-mssr.c b/drivers/clk/renesas/r8a7792-cpg-mssr.c
index cf8b84a3a060..77af250876a5 100644
--- a/drivers/clk/renesas/r8a7792-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7792-cpg-mssr.c
@@ -88,7 +88,7 @@ static const struct mssr_mod_clk r8a7792_mod_clks[] __initconst = {
 	DEF_MOD("tmu0",			 125,	R8A7792_CLK_CP),
 	DEF_MOD("vsp1du1",		 127,	R8A7792_CLK_ZS),
 	DEF_MOD("vsp1du0",		 128,	R8A7792_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A7792_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A7792_CLK_ZS),
 	DEF_MOD("msiof1",		 208,	R8A7792_CLK_MP),
 	DEF_MOD("sys-dmac1",		 218,	R8A7792_CLK_ZS),
 	DEF_MOD("sys-dmac0",		 219,	R8A7792_CLK_ZS),
diff --git a/drivers/clk/renesas/r8a7794-cpg-mssr.c b/drivers/clk/renesas/r8a7794-cpg-mssr.c
index c1948693c5c1..4d7fa26a72c9 100644
--- a/drivers/clk/renesas/r8a7794-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7794-cpg-mssr.c
@@ -97,7 +97,7 @@ static const struct mssr_mod_clk r8a7794_mod_clks[] __initconst = {
 	DEF_MOD("cmt0",			 124,	R8A7794_CLK_R),
 	DEF_MOD("tmu0",			 125,	R8A7794_CLK_CP),
 	DEF_MOD("vsp1du0",		 128,	R8A7794_CLK_ZS),
-	DEF_MOD("vsp1-sy",		 131,	R8A7794_CLK_ZS),
+	DEF_MOD("vsps",			 131,	R8A7794_CLK_ZS),
 	DEF_MOD("scifa2",		 202,	R8A7794_CLK_MP),
 	DEF_MOD("scifa1",		 203,	R8A7794_CLK_MP),
 	DEF_MOD("scifa0",		 204,	R8A7794_CLK_MP),
-- 
2.17.1

