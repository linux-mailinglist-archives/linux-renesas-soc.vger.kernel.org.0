Return-Path: <linux-renesas-soc+bounces-15358-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AFAA7B30B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 02:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B4AB77A60F0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 00:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05DC17D346;
	Fri,  4 Apr 2025 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GEMqPHne"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904EF1714B3;
	Fri,  4 Apr 2025 00:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743725078; cv=none; b=ijGlinBGNWW5MbC1HCMQ4X9aXhLjMy50WymJvppT9KbcaJ3dFv9vy2Ij5qHQRjXMLE2BL8EeA6IWK5dUD+MtuNPu1mdlJqlZWbuKg7iOO1S9whyec5KWdRoBJQDMSJaf2xjDqV8bR8ELI2agNMi7ZvBwI4z0uc4YGPVzzBFOkAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743725078; c=relaxed/simple;
	bh=3De/TUvxoE4yPVMzhpQsp6bmJVPBJHS16Yz18hlBbp8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HLO+FrkBTsCtEFba/qslDNewbE1RsnZqBJ5fgujeN009HeYXZreTm8Q2EebGWSwCklah/5YngfN2gowmZ4vzX6R0ZWX1rt7DLRoF4biiRUlekZPwjKB4mp7s0G0dOBR21zhns3JNG8cdR1Zylu3ouYY7h9KBRRIKNL9jQsq/ei0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GEMqPHne; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72454C4CEEE;
	Fri,  4 Apr 2025 00:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743725078;
	bh=3De/TUvxoE4yPVMzhpQsp6bmJVPBJHS16Yz18hlBbp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEMqPHnenN7cnPcsd16hQ9Y4Gts3IxPawLFDbCahMGMi+MVN0N2oRja1n1JUkw1GC
	 OeVQu/kWcKVHPUZ+dNWRCYZxN0NW7ApWfx7eWy+215DzQS9Il5KrdCJaqFvijKKbLZ
	 BGUbFzQohdyVj5TSlkqdMz+Lb2gxlngLqXCtlf2gYenNd27YvjjSJcc8mj2IzSRCQ2
	 8JTkBNSn+7cmsXLXaI4eMgK1Q/8mRUrQNV/UhrtYECHxLM9EwBkcllNx394qIyFwyL
	 yjGFsxmr6WVNUL45Z3pvJxgNGQMkqRW3UJax9LBg5X/eeeBd4kD6AH6shzDj6GIw5t
	 I8iHtQq+ZjqRg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 16/23] clk: renesas: rzv2h: Adjust for CPG_BUS_m_MSTOP starting from m = 1
Date: Thu,  3 Apr 2025 20:03:53 -0400
Message-Id: <20250404000402.2688049-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404000402.2688049-1-sashal@kernel.org>
References: <20250404000402.2688049-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

[ Upstream commit 69ac2acd209a15bd7a61a15c9532a5b505252e1c ]

Avoid using the "- 1" for finding mstop_index in all functions accessing
priv->mstop_count, by adjusting its pointer in rzv2h_cpg_probe().

While at it, drop the intermediate local variable index.

Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Closes: https://lore.kernel.org/all/CAMuHMdX1gPNCFddg_DyK7Bv0BeFLOLi=5eteT_HhMH=Ph2wVvA@mail.gmail.com/
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Link: https://lore.kernel.org/20250222142009.41324-1-biju.das.jz@bp.renesas.com
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/renesas/rzv2h-cpg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index a4c1e92e1fd76..4e81a0bae0228 100644
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
2.39.5


