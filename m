Return-Path: <linux-renesas-soc+bounces-11780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 195419FFDCF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D55DE161165
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785361B424A;
	Thu,  2 Jan 2025 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTWCHQir"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CAB1B4128;
	Thu,  2 Jan 2025 18:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841936; cv=none; b=ZxlGehUomdBq5CHKPBBBNhJKZSXjnMjRpBJCe+aOy6arWjjLaJesIDUVXiXmSYvATr0Zu0E+IQ3ThqwZmGyJEsQHvkhhZ0Cue405aZspwmv3PtISCsSEEcLyN2B4QnZArF9xwOojKnYM8YzkTt9HmvqTLC5yqbVyRS0ZlmxQXyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841936; c=relaxed/simple;
	bh=D6NR7+lE0Olhkdz1KjttTYXISwJwgHV81pUVtekEvfM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7oRNeuWYY29nugISChElMDLAij/M0OgSmzevVfJlYXXBcmYayzhLyWMXoN0uRZNsv0a1na6OmZat9WK7k3DCv5i21a+QdO4K6z9KvFBBDiJH8xteY11KHmVj1SghVsI6xLaXF6j9+yWgwmfn7wRpccyBEllST3YEFZfy+6jVzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTWCHQir; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436a39e4891so28393605e9.1;
        Thu, 02 Jan 2025 10:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841932; x=1736446732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFsyeZ2ZqXf9GNuav8SYMOiYdjreplqm9Nxe79T96Ig=;
        b=JTWCHQirLEKTj0R6cYqLuHZP3HEh8u4ayJ0G8Jib4fvGaTcMQXlqEDnfXmULzR4zde
         Raa/SYMm17F/gfU9PIv27/e+tLV4aQwvrZCC9CHRSzAnvgftIifZPMWa52pywMpfV8R/
         +2eiv/eLPamAnZwXeXbpSffwBTznaeXRJBKUmPKVYY0MhFC/c4fxHUoQDC5koOIFcEWe
         +bke8EYHmqT3FbGGrFCbbvNcOj1k8hhrNpa5eOawcEvUI/OpgxlJcw7Qb1TbYF3sz22n
         wjcUXjeRUo6zgX/l4QT6yVhDuTovhO5ic6quIsD6ay30fkvswEF1AO/hgLU2ECyJZ8HF
         NnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841932; x=1736446732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFsyeZ2ZqXf9GNuav8SYMOiYdjreplqm9Nxe79T96Ig=;
        b=Yb244H5FwLhPH2Tt8tGw0WoeaObHIdKa4oZAuaHEIVhhCB6qtqANwGsXP7g7Z7AjCp
         oWi4GEE8GCgGN+IWMIDLW4dYIFIOey5zvUeur0h/AX7ogdr+mdnqumgixTPV7W6e1/rS
         1arAS/yqbHOVUGOAts8Cp0NVj/ymzO6nsxYLvBGwBxv9JubT4n9WG7F9+31fIcZtLhiZ
         ccbSFy+tFQkfaaHS9eM1DCfBMc4QbnzmqFKLmv/ZT8w07e+fomi0PAWgHQ/89I2Q5pSE
         BRHIG/rPZh1moRa4IJLUV+L3U2KbcinJvApGHhOFYWfGzA1wnmfsWsnSEe5FDRMKwlr6
         xFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1kKf8npneQv860ExCJ//wxDt+/XDpRNmEAfKha4bdz9vwjKdYhcUOOBvfouyfnZeFZC9a76ZdKvA=@vger.kernel.org, AJvYcCXTIvQKS3glbbTeCPMeBtH+E7Xz/2QCJYfaf94GaP0TXfyhZNBoJsTx2ZJepP/lg4CJOuJl0YLhDS8McmMx@vger.kernel.org
X-Gm-Message-State: AOJu0YwWaoaWSWUOihrRfrxG7jNfQ40wtVLd+DVCoZivQjeim43rBzUq
	qQgWB2z8K8cpszyfx6m91A301HtgtTZ8xzvHvSOU7HiVjc8lKWgs
X-Gm-Gg: ASbGncs9y2YhUwF2KrMDZXbDPadbNVAdFxJz7Dmjf4Ux9dQ8+U3HFiDN5wlg/OICcEU
	QREyr65gBnyS/ZVygBQqApFpAx6HTeyu9h0ubXTIHBTRX+Uy9zAmDCvbvnTQoZGVLpkIe0v2rtN
	abxMvvMip8ELfT+3CmkU76bYcfvGFKw4QH/kKxSuUhzuCbZh8OZGl39Yfaruj8lqDSEUUQbxsCq
	TtRhKTw/ke1YZiE4jA3kEdoxxwH+pgiCJa/P9oiO8WBTsDycx9Ost0imsUPL8O2g4iFSMt9btXz
	UHRqEC3a/A==
X-Google-Smtp-Source: AGHT+IFcgQaOcZ3bVZEsxgVHkZnb030SmH2AaWY0tmHI3uMUq4FY+Ie37rApGvTi2+tG+5SASHksJQ==
X-Received: by 2002:a05:600c:1c91:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-43668b499f6mr353550635e9.24.1735841932053;
        Thu, 02 Jan 2025 10:18:52 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:50 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to per-bit basis
Date: Thu,  2 Jan 2025 18:18:37 +0000
Message-ID: <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch MSTOP handling from group-based to per-bit configuration to
address issues with shared dependencies between module clocks. In the
current group-based configuration, multiple module clocks may rely on
a single MSTOP bit. When both clocks are turned ON and one is
subsequently turned OFF, the shared MSTOP bit will still be set, which
is incorrect since the other dependent module clock remains ON. By
switching to a per-bit configuration, we ensure precise control over
individual MSTOP bits, preventing such conflicts.

Replace the refcount API with atomic operations for managing MSTOP bit
counters. The refcount API requires explicitly setting the counter to
`1` before calling `refcount_inc()`, which introduces potential edge
cases and unnecessary complexity. Using atomic operations simplifies
the logic and avoids such issues, resulting in cleaner and more
maintainable code.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Dropped unnecessary parentheses
- Switched using to devm_kcalloc() instead of devm_kmalloc_array()
- Optimized check in rzv2h_mod_clock_endisable() if the states are same
- Dropped GET_MSTOP_IDX() macro and handled indexing in the code
- Made mstop_mask to unsigned long to avoid casting

v1->v2
- None
---
 drivers/clk/renesas/r9a09g047-cpg.c |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c |   2 +
 drivers/clk/renesas/rzv2h-cpg.c     | 186 ++++++++++++++--------------
 drivers/clk/renesas/rzv2h-cpg.h     |   5 +
 4 files changed, 104 insertions(+), 91 deletions(-)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 7945b9f95b95..536d922bed70 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -145,4 +145,6 @@ const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
 	/* Resets */
 	.resets = r9a09g047_resets,
 	.num_resets = ARRAY_SIZE(r9a09g047_resets),
+
+	.num_mstop_bits = 208,
 };
diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index 59dadedb2217..a45b4020996b 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -275,4 +275,6 @@ const struct rzv2h_cpg_info r9a09g057_cpg_info __initconst = {
 	/* Resets */
 	.resets = r9a09g057_resets,
 	.num_resets = ARRAY_SIZE(r9a09g057_resets),
+
+	.num_mstop_bits = 192,
 };
diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 23fb209d3232..a4c1e92e1fd7 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -68,6 +68,7 @@
  * @resets: Array of resets
  * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @mstop_count: Array of mstop values
  * @rcdev: Reset controller entity
  */
 struct rzv2h_cpg_priv {
@@ -82,17 +83,13 @@ struct rzv2h_cpg_priv {
 	unsigned int num_resets;
 	unsigned int last_dt_core_clk;
 
+	atomic_t *mstop_count;
+
 	struct reset_controller_dev rcdev;
 };
 
 #define rcdev_to_priv(x)	container_of(x, struct rzv2h_cpg_priv, rcdev)
 
-struct rzv2h_mstop {
-	u16 idx;
-	u16 mask;
-	refcount_t ref_cnt;
-};
-
 struct pll_clk {
 	struct rzv2h_cpg_priv *priv;
 	void __iomem *base;
@@ -107,7 +104,7 @@ struct pll_clk {
  * struct mod_clock - Module clock
  *
  * @priv: CPG private data
- * @mstop: handle to cpg bus mstop data
+ * @mstop_data: mstop data relating to module clock
  * @hw: handle between common and hardware-specific interfaces
  * @no_pm: flag to indicate PM is not supported
  * @on_index: register offset
@@ -117,7 +114,7 @@ struct pll_clk {
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
-	struct rzv2h_mstop *mstop;
+	unsigned int mstop_data;
 	struct clk_hw hw;
 	bool no_pm;
 	u8 on_index;
@@ -446,38 +443,70 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 }
 
 static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
-					 struct mod_clock *clock)
+					 u32 mstop_data)
 {
+	unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data);
+	u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
+	unsigned int index = (mstop_index - 1) * 16;
+	atomic_t *mstop = &priv->mstop_count[index];
 	unsigned long flags;
-	u32 val;
+	unsigned int i;
+	u32 val = 0;
 
 	spin_lock_irqsave(&priv->rmw_lock, flags);
-	if (!refcount_read(&clock->mstop->ref_cnt)) {
-		val = clock->mstop->mask << 16;
-		writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx));
-		refcount_set(&clock->mstop->ref_cnt, 1);
-	} else {
-		refcount_inc(&clock->mstop->ref_cnt);
+	for_each_set_bit(i, &mstop_mask, 16) {
+		if (!atomic_read(&mstop[i]))
+			val |= BIT(i) << 16;
+		atomic_inc(&mstop[i]);
 	}
+	if (val)
+		writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 }
 
 static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
-					  struct mod_clock *clock)
+					  u32 mstop_data)
 {
+	unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data);
+	u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
+	unsigned int index = (mstop_index - 1) * 16;
+	atomic_t *mstop = &priv->mstop_count[index];
 	unsigned long flags;
-	u32 val;
+	unsigned int i;
+	u32 val = 0;
 
 	spin_lock_irqsave(&priv->rmw_lock, flags);
-	if (refcount_dec_and_test(&clock->mstop->ref_cnt)) {
-		val = clock->mstop->mask << 16 | clock->mstop->mask;
-		writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx));
+	for_each_set_bit(i, &mstop_mask, 16) {
+		if (!atomic_read(&mstop[i]) ||
+		    atomic_dec_and_test(&mstop[i]))
+			val |= BIT(i) << 16 | BIT(i);
 	}
+	if (val)
+		writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 }
 
+static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
+{
+	struct mod_clock *clock = to_mod_clock(hw);
+	struct rzv2h_cpg_priv *priv = clock->priv;
+	u32 bitmask;
+	u32 offset;
+
+	if (clock->mon_index >= 0) {
+		offset = GET_CLK_MON_OFFSET(clock->mon_index);
+		bitmask = BIT(clock->mon_bit);
+	} else {
+		offset = GET_CLK_ON_OFFSET(clock->on_index);
+		bitmask = BIT(clock->on_bit);
+	}
+
+	return readl(priv->base + offset) & bitmask;
+}
+
 static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
+	bool enabled = rzv2h_mod_clock_is_enabled(hw);
 	struct mod_clock *clock = to_mod_clock(hw);
 	unsigned int reg = GET_CLK_ON_OFFSET(clock->on_index);
 	struct rzv2h_cpg_priv *priv = clock->priv;
@@ -489,15 +518,18 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
 		enable ? "ON" : "OFF");
 
+	if (enabled == enable)
+		return 0;
+
 	value = bitmask << 16;
 	if (enable) {
 		value |= bitmask;
 		writel(value, priv->base + reg);
-		if (clock->mstop)
-			rzv2h_mod_clock_mstop_enable(priv, clock);
+		if (clock->mstop_data != BUS_MSTOP_NONE)
+			rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
 	} else {
-		if (clock->mstop)
-			rzv2h_mod_clock_mstop_disable(priv, clock);
+		if (clock->mstop_data != BUS_MSTOP_NONE)
+			rzv2h_mod_clock_mstop_disable(priv, clock->mstop_data);
 		writel(value, priv->base + reg);
 	}
 
@@ -525,73 +557,12 @@ static void rzv2h_mod_clock_disable(struct clk_hw *hw)
 	rzv2h_mod_clock_endisable(hw, false);
 }
 
-static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
-{
-	struct mod_clock *clock = to_mod_clock(hw);
-	struct rzv2h_cpg_priv *priv = clock->priv;
-	u32 bitmask;
-	u32 offset;
-
-	if (clock->mon_index >= 0) {
-		offset = GET_CLK_MON_OFFSET(clock->mon_index);
-		bitmask = BIT(clock->mon_bit);
-	} else {
-		offset = GET_CLK_ON_OFFSET(clock->on_index);
-		bitmask = BIT(clock->on_bit);
-	}
-
-	return readl(priv->base + offset) & bitmask;
-}
-
 static const struct clk_ops rzv2h_mod_clock_ops = {
 	.enable = rzv2h_mod_clock_enable,
 	.disable = rzv2h_mod_clock_disable,
 	.is_enabled = rzv2h_mod_clock_is_enabled,
 };
 
-static struct rzv2h_mstop
-*rzv2h_cpg_get_mstop(struct rzv2h_cpg_priv *priv, struct mod_clock *clock, u32 mstop_data)
-{
-	struct rzv2h_mstop *mstop;
-	unsigned int i;
-
-	for (i = 0; i < priv->num_mod_clks; i++) {
-		struct mod_clock *clk;
-		struct clk_hw *hw;
-
-		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
-			continue;
-
-		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
-		clk = to_mod_clock(hw);
-		if (!clk->mstop)
-			continue;
-
-		if (BUS_MSTOP(clk->mstop->idx, clk->mstop->mask) == mstop_data) {
-			if (rzv2h_mod_clock_is_enabled(&clock->hw)) {
-				if (refcount_read(&clk->mstop->ref_cnt))
-					refcount_inc(&clk->mstop->ref_cnt);
-				else
-					refcount_set(&clk->mstop->ref_cnt, 1);
-			}
-			return clk->mstop;
-		}
-	}
-
-	mstop = devm_kzalloc(priv->dev, sizeof(*mstop), GFP_KERNEL);
-	if (!mstop)
-		return NULL;
-
-	mstop->idx = FIELD_GET(BUS_MSTOP_IDX_MASK, mstop_data);
-	mstop->mask = FIELD_GET(BUS_MSTOP_BITS_MASK, mstop_data);
-	if (rzv2h_mod_clock_is_enabled(&clock->hw))
-		refcount_set(&mstop->ref_cnt, 1);
-	else
-		refcount_set(&mstop->ref_cnt, 0);
-
-	return mstop;
-}
-
 static void __init
 rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 			   struct rzv2h_cpg_priv *priv)
@@ -638,6 +609,7 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 	clock->no_pm = mod->no_pm;
 	clock->priv = priv;
 	clock->hw.init = &init;
+	clock->mstop_data = mod->mstop_data;
 
 	ret = devm_clk_hw_register(dev, &clock->hw);
 	if (ret) {
@@ -647,12 +619,39 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 
 	priv->clks[id] = clock->hw.clk;
 
-	if (mod->mstop_data != BUS_MSTOP_NONE) {
-		clock->mstop = rzv2h_cpg_get_mstop(priv, clock, mod->mstop_data);
-		if (!clock->mstop) {
-			clk = ERR_PTR(-ENOMEM);
-			goto fail;
+	/*
+	 * Ensure the module clocks and MSTOP bits are synchronized when they are
+	 * turned ON by the bootloader. Enable MSTOP bits for module clocks that were
+	 * turned ON in an earlier boot stage.
+	 */
+	if (clock->mstop_data != BUS_MSTOP_NONE &&
+	    !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw)) {
+		rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
+	} else if (clock->mstop_data != BUS_MSTOP_NONE && mod->critical) {
+		unsigned long mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, clock->mstop_data);
+		u16 mstop_index = FIELD_GET(BUS_MSTOP_IDX_MASK, clock->mstop_data);
+		unsigned int index = (mstop_index - 1) * 16;
+		atomic_t *mstop = &priv->mstop_count[index];
+		unsigned long flags;
+		unsigned int i;
+		u32 val = 0;
+
+		/*
+		 * Critical clocks are turned ON immediately upon registration, and the
+		 * MSTOP counter is updated through the rzv2h_mod_clock_enable() path.
+		 * However, if the critical clocks were already turned ON by the initial
+		 * bootloader, synchronize the atomic counter here and clear the MSTOP bit.
+		 */
+		spin_lock_irqsave(&priv->rmw_lock, flags);
+		for_each_set_bit(i, &mstop_mask, 16) {
+			if (atomic_read(&mstop[i]))
+				continue;
+			val |= BIT(i) << 16;
+			atomic_inc(&mstop[i]);
 		}
+		if (val)
+			writel(val, priv->base + CPG_BUS_MSTOP(mstop_index));
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
 	}
 
 	return;
@@ -922,6 +921,11 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	if (!clks)
 		return -ENOMEM;
 
+	priv->mstop_count = devm_kcalloc(dev, info->num_mstop_bits,
+					 sizeof(*priv->mstop_count), GFP_KERNEL);
+	if (!priv->mstop_count)
+		return -ENOMEM;
+
 	priv->resets = devm_kmemdup(dev, info->resets, sizeof(*info->resets) *
 				    info->num_resets, GFP_KERNEL);
 	if (!priv->resets)
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index f918620c4650..a772304f9057 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -193,6 +193,9 @@ struct rzv2h_reset {
  *
  * @resets: Array of Module Reset definitions
  * @num_resets: Number of entries in resets[]
+ *
+ * @num_mstop_bits: Maximum number of MSTOP bits supported, equivalent to the
+ *		    number of CPG_BUS_m_MSTOP registers multiplied by 16.
  */
 struct rzv2h_cpg_info {
 	/* Core Clocks */
@@ -209,6 +212,8 @@ struct rzv2h_cpg_info {
 	/* Resets */
 	const struct rzv2h_reset *resets;
 	unsigned int num_resets;
+
+	unsigned int num_mstop_bits;
 };
 
 extern const struct rzv2h_cpg_info r9a09g047_cpg_info;
-- 
2.43.0


