Return-Path: <linux-renesas-soc+bounces-13514-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6D9A408EA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 15:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 517394244C5
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 22 Feb 2025 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4E0F1448F2;
	Sat, 22 Feb 2025 14:19:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D02156F41;
	Sat, 22 Feb 2025 14:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740233960; cv=none; b=Ui73iNp00JvP5+MlxWAjhzpzVWs1dyfaJxc261cxrgCG2DIzUQ0CqrEaCQd6YVPB+3qkTKtT/QJhYkHqvmYgvavRZWU0LsoQ/LqOEKodBJZmQepkvTUwk7ssrBl2dLrDpDi/3My+I6Y9MWGP1T16XmQgVjwcBimoK4C16y2R+KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740233960; c=relaxed/simple;
	bh=UVCdIVJsnFhC5EPAk8rsCE0RK3FZZWu5YtUXp0PdQJM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXSUOwGzJJBgZMbaJF6dl+tFRMa/I6LNYZwnElohWWcbC9xlK1SHm39JdounmRKflaVLSp1N0R/+KXbaNsuNx54vt5uM5jH4z53idwKKAEa+xvTdaheQ19Xn121PYfEmtHJXVdOhLCI1PU5BQibkvjxuxYJW0PscfW/LXS6r6lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: DXNgfJc4QGmu7yR6mhgowg==
X-CSE-MsgGUID: xrE1GFjsSxeJp86URmNjKg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Feb 2025 23:19:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.41])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8ED55436E6E8;
	Sat, 22 Feb 2025 23:19:06 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] clk: renesas: rzv2h: Adjust for CPG_BUS_m_MSTOP starting from m = 1
Date: Sat, 22 Feb 2025 14:17:01 +0000
Message-ID: <20250222141903.41262-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid using the "- 1" for finding mstop_index in all functions accessing
priv->mstop_count, by adjusting its pointer in rzv2h_cpg_probe().

While at it, drop the intermediate local variable 'index'.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/all/CAMuHMdX1gPNCFddg_DyK7Bv0BeFLOLi=5eteT_HhMH=Ph2wVvA@mail.gmail.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 419dc8cd2766..2b9771ab2b3f 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -447,8 +447,7 @@ static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
 {
 	unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data);
 	u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
-	unsigned int index = (mstop_index - 1) * 16;
-	atomic_t *mstop = &priv->mstop_count[index];
+	atomic_t *mstop = &priv->mstop_count[mstop_index * 16];
 	unsigned long flags;
 	unsigned int i;
 	u32 val = 0;
@@ -469,8 +468,7 @@ static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
 {
 	unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data);
 	u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
-	unsigned int index = (mstop_index - 1) * 16;
-	atomic_t *mstop = &priv->mstop_count[index];
+	atomic_t *mstop = &priv->mstop_count[mstop_index * 16];
 	unsigned long flags;
 	unsigned int i;
 	u32 val = 0;
@@ -630,8 +628,7 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	} else if (clock->mstop_data != BUS_MSTOP_NONE && mod->critical) {
 		unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, clock->mstop_data);
 		u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, clock->mstop_data);
-		unsigned int index = (mstop_index - 1) * 16;
-		atomic_t *mstop = &priv->mstop_count[index];
+		atomic_t *mstop = &priv->mstop_count[mstop_index * 16];
 		unsigned long flags;
 		unsigned int i;
 		u32 val = 0;
@@ -926,6 +923,9 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	if (!priv->mstop_count)
 		return -ENOMEM;
 
+	/* Adjust for CPG_BUS_m_MSTOP starting from m = 1 */
+	priv->mstop_count -= 16;
+
 	priv->resets = devm_kmemdup(dev, info->resets, sizeof(*info->resets) *
 				    info->num_resets, GFP_KERNEL);
 	if (!priv->resets)
-- 
2.43.0


