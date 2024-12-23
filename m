Return-Path: <linux-renesas-soc+bounces-11693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E37F09FB3A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 18:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DEDB166596
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Dec 2024 17:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B481C3C12;
	Mon, 23 Dec 2024 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SAlWugZP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B02C1C3BFB;
	Mon, 23 Dec 2024 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734975456; cv=none; b=EifZ+OwX/j71nRZSXCfDnqcJ0eUCXd+ISLsFjKmvi8IsFwqMimySYWZGKciwNirtvVqafyqRwZvfZayD3thS50aB0VMNvRrM4tQuTllqawiM3ldAxca2FAWVPIqGdirGXT9QbjVlbhqeR+FCORkr23/wVDThn2WmbXoDaGCF0nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734975456; c=relaxed/simple;
	bh=q+q9QnAUjo8OBu5e0wr3TdrEVSJAV5DpU16F3V0AsrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nPbpjUL9Hd//LO+FMpmfnoxSIS1YNOyCCmiROv105KTQECXbLG9iJBh62DL6kK7tTy0XWi7TJ1XkUuU/Nt9M8wAss3RJXKml7MmMkA9r6XKUNXHV18KjHEPl7UykyFxR/mfU+jHXTDHxzBkAfEUoxvNBZJmewtGASgXYS4AAfbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SAlWugZP; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7f4325168c8so1692979a12.1;
        Mon, 23 Dec 2024 09:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734975454; x=1735580254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6MNpPqCo6luCEKX0MGM1sgNvFmlx6jYhV1FzJSXOpY=;
        b=SAlWugZPmnQXUIV6AJcjxo51VT4aYzBrz2qHxjrzJBiBM5QUwygkyMieYqenUQcWl0
         gx2P80EN7K1n8z5KQD0LeS//emOlj/BERfPQr1Y3TQLMVtNde9ib5WAYHGoiRRJMrkl/
         041F2tuIzFuXYMfP3r9C/iPQ96rUF1x4Q313sxD+sPdCGHyjfnhCdWeMXFmhyMuRAvOI
         u4ERdVltmcjFXR9IG3RzOa4YcS6sg1iKPVNm77iiSr5WxkF49Zv8prjlG2TXuqp5woV7
         ZQ/gi5IOFeasJ7LUaC0jh2hjwipJaMNHyZ1vi/TnoY8UXdxvIy6kzfnPbSFrmNHpSqUr
         h2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734975454; x=1735580254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6MNpPqCo6luCEKX0MGM1sgNvFmlx6jYhV1FzJSXOpY=;
        b=EJ/1y7AIqL8gd7kNYc0gsCxKYGzsH2Up42vgNx0RA1rCnpOv/7i8XnRIoY1GS5C+ys
         9nLbZT/lqIX8z35YKfDBzBS5pQPCszonhJxX4iqyLhihNRJjuDRa02vk8jA2lJPcRfLG
         q4WZoW47TCmkNWHX1uBXIZlGLSzDxhVCKAYDXXWKQJjPX+q5o1EPYN9fjei1O7aqt9o+
         bvZyWyQu3TSsChRiBir9UKinTUO//My9h8FdYoYFsI8l8hrdeX+Y/LvIxYHlondtUUlc
         qZUXZxMJrc1J0NezxALUFtdsUgST/PZJl2yt86pEOEqB+eTWGu+AC9hZ+bAEfLBWeHqV
         q0ng==
X-Forwarded-Encrypted: i=1; AJvYcCU6semVIugsWaaLKhgeA+Ri2dyip8DWiaAdAChg2GQGFdS1EfK6jxxDme/ucYyYr19gZ0crfQkOdN+FCseE@vger.kernel.org, AJvYcCWaNInTpwSEhcdNBDRFFYA9kVziCfN+hZ6sN33FSVT8aFosUGs5RIIPuivD/bAMfhbNntIeRzPaWfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMGH4dPVQydUVlB2pa/vxft6gHRsoc6338hsBAbc9WFjL/z+jm
	vA87EziOm3y2Le4CotQgXbkMtixl/SifDYwLymfZ8lv9Gfa9W3Tq
X-Gm-Gg: ASbGnctvoMS6TQnmxX4g/7FmoB3Ztv9V8jbgmChkun1s+pChghSEIDsf1Uh6q1QXdHX
	u535cevp/XWbi8ZQASyEpzjRP1lKH4/ycVIrbHWkrsjGFzVN6DHwNK4LWyaawpSCxBVxlHI59Fr
	b/khF+vElnpHKpwb0zmS/3aMkQkVP3VX84qpxaDNqJutQIlLfC0kmGPp7Ryf9OlYl6di8FO018d
	TFD7amr0cXMe9jV11rPFjKEIBORgh9PuG4yy/uuckpFWb48GRmRa6woIN+x/0NEJzD1jHbrK3bN
	Gc0rJDU=
X-Google-Smtp-Source: AGHT+IFw5PT8NweztUstz6q4ozTBlBa7GVXXCpSGOzPg7e94ayQ85LOT/wMDNIAeKFe+6XP+d/ILNA==
X-Received: by 2002:a17:90b:520e:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-2f452e2144dmr21981468a91.15.1734975453752;
        Mon, 23 Dec 2024 09:37:33 -0800 (PST)
Received: from prasmi.. ([2401:4900:1c07:689d:b086:b856:9280:38c3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed52cec5sm10664032a91.7.2024.12.23.09.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 09:37:33 -0800 (PST)
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
Subject: [PATCH v2 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to per-bit basis
Date: Mon, 23 Dec 2024 17:37:06 +0000
Message-ID: <20241223173708.384108-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241223173708.384108-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor MSTOP handling to switch from group-based to per-bit
configuration. Introduce atomic counters for each MSTOP bit and update
enable/disable logic.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- New patch
---
 drivers/clk/renesas/r9a09g047-cpg.c |   2 +
 drivers/clk/renesas/r9a09g057-cpg.c |   2 +
 drivers/clk/renesas/rzv2h-cpg.c     | 168 +++++++++++++---------------
 drivers/clk/renesas/rzv2h-cpg.h     |   5 +
 4 files changed, 84 insertions(+), 93 deletions(-)

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
index 29b1ce003370..154ad0db6dca 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -43,6 +43,8 @@
 
 #define CPG_BUS_1_MSTOP		(0xd00)
 #define CPG_BUS_MSTOP(m)	(CPG_BUS_1_MSTOP + ((m) - 1) * 4)
+/* On RZ/V2H(P) and RZ/G3E CPG_BUS_m_MSTOP starts from m = 1 */
+#define GET_MSTOP_IDX(mask)	((FIELD_GET(BUS_MSTOP_IDX_MASK, (mask))) - 1)
 
 #define KDIV(val)		((s16)FIELD_GET(GENMASK(31, 16), (val)))
 #define MDIV(val)		FIELD_GET(GENMASK(15, 6), (val))
@@ -68,6 +70,7 @@
  * @resets: Array of resets
  * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @mstop_count: Array of mstop
  * @rcdev: Reset controller entity
  */
 struct rzv2h_cpg_priv {
@@ -82,17 +85,13 @@ struct rzv2h_cpg_priv {
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
@@ -107,7 +106,7 @@ struct pll_clk {
  * struct mod_clock - Module clock
  *
  * @priv: CPG private data
- * @mstop: handle to cpg bus mstop data
+ * @mstop_data: mstop data relating to module clock
  * @hw: handle between common and hardware-specific interfaces
  * @no_pm: flag to indicate PM is not supported
  * @on_index: register offset
@@ -117,7 +116,7 @@ struct pll_clk {
  */
 struct mod_clock {
 	struct rzv2h_cpg_priv *priv;
-	struct rzv2h_mstop *mstop;
+	unsigned int mstop_data;
 	struct clk_hw hw;
 	bool no_pm;
 	u8 on_index;
@@ -446,36 +445,65 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 }
 
 static void rzv2h_mod_clock_mstop_enable(struct rzv2h_cpg_priv *priv,
-					 struct mod_clock *clock)
+					 u32 mstop_data)
 {
+	u16 mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
+	u16 mstop_index = GET_MSTOP_IDX(mstop_data);
+	unsigned int index = mstop_index * 16;
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
+	for_each_set_bit(i, (unsigned long *)&mstop_mask, 16) {
+		if (!atomic_read(&priv->mstop_count[index + i]))
+			val |= BIT(i) << 16;
+		atomic_inc(&priv->mstop_count[index + i]);
 	}
+	if (val)
+		writel(val, priv->base + CPG_BUS_MSTOP(mstop_index + 1));
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 }
 
 static void rzv2h_mod_clock_mstop_disable(struct rzv2h_cpg_priv *priv,
-					  struct mod_clock *clock)
+					  u32 mstop_data)
 {
+	u16 mstop_mask = FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
+	u16 mstop_index = GET_MSTOP_IDX(mstop_data);
+	unsigned int index = mstop_index * 16;
 	unsigned long flags;
-	u32 val;
+	unsigned int i;
+	u32 val = 0;
 
 	spin_lock_irqsave(&priv->rmw_lock, flags);
-	if (refcount_dec_and_test(&clock->mstop->ref_cnt)) {
-		val = clock->mstop->mask << 16 | clock->mstop->mask;
-		writel(val, priv->base + CPG_BUS_MSTOP(clock->mstop->idx));
+	for_each_set_bit(i, (unsigned long *)&mstop_mask, 16) {
+		if (!atomic_read(&priv->mstop_count[index + i]) ||
+		    atomic_dec_and_test(&priv->mstop_count[index + i]))
+			val |= BIT(i) << 16 | BIT(i);
 	}
+	if (val)
+		writel(val, priv->base + CPG_BUS_MSTOP(mstop_index + 1));
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
 	struct mod_clock *clock = to_mod_clock(hw);
@@ -489,15 +517,19 @@ static int rzv2h_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", reg, hw->clk,
 		enable ? "ON" : "OFF");
 
+	if ((rzv2h_mod_clock_is_enabled(hw) && enable) ||
+	    (!rzv2h_mod_clock_is_enabled(hw) && !enable))
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
-	mstop->idx = FIELD_GET(BUS_MSTOP_IDX_MASK, (mstop_data));
-	mstop->mask = FIELD_GET(BUS_MSTOP_BITS_MASK, (mstop_data));
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
@@ -647,13 +619,16 @@ rzv2h_cpg_register_mod_clk(const struct rzv2h_mod_clk *mod,
 
 	priv->clks[id] = clock->hw.clk;
 
-	if (mod->mstop_data != BUS_MSTOP_NONE) {
-		clock->mstop = rzv2h_cpg_get_mstop(priv, clock, mod->mstop_data);
-		if (!clock->mstop) {
-			clk = ERR_PTR(-ENOMEM);
-			goto fail;
-		}
-	}
+	/*
+	 * Ensure the module clocks and MSTOP bits are synchronized when they are
+	 * turned ON by the bootloader. Enable MSTOP bits for module clocks that were
+	 * turned ON in an earlier boot stage. Skip critical clocks, as they will be
+	 * turned ON immediately upon registration, and the MSTOP counter will be
+	 * updated through the rzv2h_mod_clock_enable() path.
+	 */
+	if (clock->mstop_data != BUS_MSTOP_NONE &&
+	    !mod->critical && rzv2h_mod_clock_is_enabled(&clock->hw))
+		rzv2h_mod_clock_mstop_enable(priv, clock->mstop_data);
 
 	return;
 
@@ -922,6 +897,13 @@ static int __init rzv2h_cpg_probe(struct platform_device *pdev)
 	if (!clks)
 		return -ENOMEM;
 
+	priv->mstop_count = devm_kmalloc_array(dev, info->num_mstop_bits,
+					       sizeof(*priv->mstop_count), GFP_KERNEL);
+	if (!priv->mstop_count)
+		return -ENOMEM;
+	for (i = 0; i < info->num_mstop_bits; i++)
+		atomic_set(&priv->mstop_count[i], 0);
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


