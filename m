Return-Path: <linux-renesas-soc+bounces-20805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4C3B2E6EE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:48:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395FB166548
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECD92857CB;
	Wed, 20 Aug 2025 20:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhISfZWS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF36C1F8677;
	Wed, 20 Aug 2025 20:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755722900; cv=none; b=lzAiGd7vBkD5830veW8sVQcun+rJgwRkA8+XOKx1AE4gDFL1fyomUuv8QbVId9lyEblMK+d6gCQWtPbH5v1pI+W7FIULFGxssQ3I4z0OBH93787yF2oBRx19WdXemhA2DLo5vUXstKzUWkZGZnzFRM+l4CTqrxccDU3mmSY3mlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755722900; c=relaxed/simple;
	bh=Vi7XYp3KB9g92kpoTXG5Wm8e0Tsq2aJpll52jS7fVXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jP6uN0vUTaUYUPSLTjwu+xWmb+ozWH+84sO0UF1lJOao7bhWabq0tABY8wn2JVzJ7QLCKvQWLv8KT5h+MgrPL/M567dP+DETFkkoNJoDnCHKhsWkH/yCMTU5bZi0o9WCu+kjc76UeFYhPlfvAjsucCadjcV0KTqXIz/upGMQ3Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhISfZWS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9d41d2a5cso202544f8f.0;
        Wed, 20 Aug 2025 13:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755722897; x=1756327697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzZVehsXACE+/IuIJyiVxe09Jy2nkSvbOTuB0HxqDVg=;
        b=ZhISfZWSgmvIKHiz3H0yU98UivUdzuw4mUqyVtZpDstV/cHUq+v/vPI7OKwmELhc8v
         backq+RZAavc/5KnFTpfzfQe2i86DknToTVjXN8k9BuyBzvNeo6AWltnt7IW/zbkCRI0
         zf6rSi5WP+dBG+Bvs4jejBG94+iS8HnF+ClazRtc4uc9Rnvh4w3nv4hhtUHxHd257xwj
         SlSl+VyK2zp18stFrfgVWEVI3bQfJbyoq4fg99VJD4cvam72/Ltkv0qyxFsFuUxjOnZZ
         xmDqeIGx1nvndIrSaBB9foEjlGtK/9YrWbst0KgNSgW0+x0J2gRCzPlF+lgOZfGP5X+6
         da0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755722897; x=1756327697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzZVehsXACE+/IuIJyiVxe09Jy2nkSvbOTuB0HxqDVg=;
        b=hI+ez8VBsZ1HBXYAMgVcn2lHBHEeiOYH4oAmG7ldTyiJhum4IzSib6nqMmoGfEyMY4
         TQmIm4mFSuMR7+RPzyTXXh4Kb3jnjRdL67iHIq7oGRenevP6wMNjGcBqmJHUWzFInCz4
         9K9Ei+SUWOjqxVbEeBPXpQZ/YLk9s8X1RaZPSvPq8aVN6W9pO6uG4zMZEEpPBg2gNeWP
         I2DQ35Trc5nJ/PwSSMzQk8QN7dv9sqDf2imQS5CyMHH8ncVvCMVrCYY33dNRqNpzotGr
         6CKrA9QTCKhmurgTjOn4ymZ5zLtD5lTSTzoPNVQQ/paSP9hbymPKB5cpV/uaXnxONtNf
         es8A==
X-Forwarded-Encrypted: i=1; AJvYcCUigSFOdRO4FI6odFvkUEaIIzdw0Nk0N/M2IzyvzMMnfQ/rciDPYyPCxAFYKsgDFqWO0zt2xLyZ6Nk=@vger.kernel.org, AJvYcCWBJ9d19Wi9FMtLQwI8WhpqqA+4RRJT29Jym8CMhiNOw3j2Asq9LLbHdakjsA9C/mV6pOWH+lyDCu/tbIeC@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3PuMyvIpnKCTUTPeHdWO5EOKipYm2jIY6GAzFk5YFoSQGQ1X
	l4drJ+WRaelxINV8srbVtO7Mbfmm4czUBeIWPEPPV6kg1mXPBKzfih3A
X-Gm-Gg: ASbGncvXAgxbyu+zQB5oJmZXVv1zwc8BMTzDdlJn4ooddlT1Sj+BIqLXkTwli/C+aKx
	OKDr4x5p/vXAAIq0D9uChlx2Qx4puUeXtqu1UT5NmFrJW/qF1cl3E9I8B+w2esfI2JPN9cnPBhw
	REsb6LzEHaUJ/9+kEhN2mqyU/am7t3TRcixRonRQmeOlIRfKblS6JXmLf+BvC7CI42mHeDYYlfB
	69lq5LYsjZ/eCQggYtaIB3DN3EHN7vc9dtRtFZ+FDWimBkItZ7FEOdnpr+ZlqeE3GOPEZXAF6CW
	f7zKeKV26R2qLHku+tzEUSqCQpTIFH5Dpv6wk0JR9GysyxJp+d1EOwppS6UJvGR8cJLGFto1qaK
	+pFOPqzhnN9Zj2RTAi+AC5nSX590L8QMjJShLF2bfXdjWdw==
X-Google-Smtp-Source: AGHT+IFXOfO+lZGHxO9WFLnCSsJh8Sm+UJlsTsYUOUSXtMWcNzeQjjRA06tvgkOOehCdwLwisCZWcA==
X-Received: by 2002:a05:6000:26cb:b0:3c3:ae31:7176 with SMTP id ffacd0b85a97d-3c4953a7d39mr176801f8f.14.1755722896838;
        Wed, 20 Aug 2025 13:48:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c0771c1a12sm8798641f8f.34.2025.08.20.13.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:48:16 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
Date: Wed, 20 Aug 2025 21:48:10 +0100
Message-ID: <20250820204810.2328183-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add support for module reset handling on the RZ/T2H SoC. Unlike earlier
CPG/MSSR variants, RZ/T2H uses a unified set of Module Reset Control
Registers (MRCR) where both reset and deassert actions are done via
read-modify-write (RMW) to the same register.

Introduce a new MRCR offset table (mrcr_for_rzt2h) for RZ/T2H and assign
it to reset_regs. For this SoC, the number of resets is based on the
number of MRCR registers rather than the number of module clocks. Also
add cpg_mrcr_reset_ops to implement reset, assert, and deassert using RMW
while holding the spinlock. This follows the RZ/T2H requirements, where
processing after releasing a module reset must be secured by performing
seven dummy reads of the same register, and where a module that is reset
and released again must ensure the target bit in the Module Reset Control
Register is set to 1.

Update the reset controller registration to select cpg_mrcr_reset_ops for
RZ/T2H, while keeping the existing cpg_mssr_reset_ops for other SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Added cpg_mrcr_reset_ops for RZ/T2H specific handling
- Updated commit message
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 139 ++++++++++++++++++++++++-
 1 file changed, 135 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5ff6ee1f7d4b..77a298b50c9c 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -137,6 +137,22 @@ static const u16 srcr_for_gen4[] = {
 	0x2C60, 0x2C64, 0x2C68, 0x2C6C, 0x2C70, 0x2C74,
 };
 
+static const u16 mrcr_for_rzt2h[] = {
+	0x240,	/* MRCTLA */
+	0x244,	/* Reserved */
+	0x248,	/* Reserved */
+	0x24C,	/* Reserved */
+	0x250,	/* MRCTLE */
+	0x254,	/* Reserved */
+	0x258,	/* Reserved */
+	0x25C,	/* Reserved */
+	0x260,	/* MRCTLI */
+	0x264,	/* Reserved */
+	0x268,	/* Reserved */
+	0x26C,	/* Reserved */
+	0x270,	/* MRCTLM */
+};
+
 /*
  * Software Reset Clearing Register offsets
  */
@@ -736,6 +752,102 @@ static int cpg_mssr_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
 }
 
+static int cpg_mrcr_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
+	unsigned int reg = id / 32;
+	unsigned int bit = id % 32;
+	u32 bitmask = BIT(bit);
+	unsigned long flags;
+	unsigned int i;
+
+	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
+
+	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
+	/* Reset module */
+	bitmask |= readl(priv->pub.base0 + priv->reset_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+
+	/* Ensure module reset control register is set */
+	if (!(bitmask & readl(priv->pub.base0 + priv->reset_regs[reg]))) {
+		dev_err(priv->dev, "Reset register %u%02u is not set\n",
+			readl(priv->pub.base0 + priv->reset_regs[reg]), bit);
+		spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+		return -EIO;
+	}
+
+	/* Release module from reset state */
+	bitmask = readl(priv->pub.base0 + priv->reset_regs[reg]) & ~bitmask;
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+
+	/*
+	 * To secure processing after release from a module reset, dummy read
+	 * the same register at least seven times.
+	 */
+	for (i = 0; i < 7; i++)
+		readl(priv->pub.base0 + priv->reset_regs[reg]);
+
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+
+	return 0;
+}
+
+static int cpg_mrcr_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
+	unsigned int reg = id / 32;
+	unsigned int bit = id % 32;
+	u32 bitmask = BIT(bit);
+	unsigned long flags;
+
+	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
+
+	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
+	bitmask |= readl(priv->pub.base0 + priv->reset_regs[reg]);
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+
+	/* Ensure module reset control register is set */
+	if (!(bitmask & readl(priv->pub.base0 + priv->reset_regs[reg]))) {
+		dev_err(priv->dev, "Reset register %u%02u is not set\n",
+			readl(priv->pub.base0 + priv->reset_regs[reg]), bit);
+		spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+		return -EIO;
+	}
+
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+
+	return 0;
+}
+
+static int cpg_mrcr_deassert(struct reset_controller_dev *rcdev,
+			     unsigned long id)
+{
+	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
+	unsigned int reg = id / 32;
+	unsigned int bit = id % 32;
+	u32 bitmask = BIT(bit);
+	unsigned long flags;
+	unsigned int i;
+
+	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
+
+	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
+	bitmask = readl(priv->pub.base0 + priv->reset_regs[reg]) & ~bitmask;
+	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+
+	/*
+	 * To secure processing after release from a module reset, dummy read
+	 * the same register at least seven times.
+	 */
+	for (i = 0; i < 7; i++)
+		readl(priv->pub.base0 + priv->reset_regs[reg]);
+
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+
+	return 0;
+}
+
 static const struct reset_control_ops cpg_mssr_reset_ops = {
 	.reset = cpg_mssr_reset,
 	.assert = cpg_mssr_assert,
@@ -743,6 +855,13 @@ static const struct reset_control_ops cpg_mssr_reset_ops = {
 	.status = cpg_mssr_status,
 };
 
+static const struct reset_control_ops cpg_mrcr_reset_ops = {
+	.reset = cpg_mrcr_reset,
+	.assert = cpg_mrcr_assert,
+	.deassert = cpg_mrcr_deassert,
+	.status = cpg_mssr_status,
+};
+
 static int cpg_mssr_reset_xlate(struct reset_controller_dev *rcdev,
 				const struct of_phandle_args *reset_spec)
 {
@@ -760,11 +879,23 @@ static int cpg_mssr_reset_xlate(struct reset_controller_dev *rcdev,
 
 static int cpg_mssr_reset_controller_register(struct cpg_mssr_priv *priv)
 {
-	priv->rcdev.ops = &cpg_mssr_reset_ops;
+	/*
+	 * RZ/T2H (and family) has the Module Reset Control Registers
+	 * which allows control resets of certain modules.
+	 * The number of resets is not equal to the number of module clocks.
+	 */
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
+		priv->rcdev.ops = &cpg_mrcr_reset_ops;
+		priv->rcdev.nr_resets = ARRAY_SIZE(mrcr_for_rzt2h) * 32;
+	} else {
+		priv->rcdev.ops = &cpg_mssr_reset_ops;
+		priv->rcdev.nr_resets = priv->num_mod_clks;
+	}
+
 	priv->rcdev.of_node = priv->dev->of_node;
 	priv->rcdev.of_reset_n_cells = 1;
 	priv->rcdev.of_xlate = cpg_mssr_reset_xlate;
-	priv->rcdev.nr_resets = priv->num_mod_clks;
+
 	return devm_reset_controller_register(priv->dev, &priv->rcdev);
 }
 
@@ -1166,6 +1297,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->control_regs = stbcr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
 		priv->control_regs = mstpcr_for_rzt2h;
+		priv->reset_regs = mrcr_for_rzt2h;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
 		priv->status_regs = mstpsr_for_gen4;
 		priv->control_regs = mstpcr_for_gen4;
@@ -1262,8 +1394,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 		goto reserve_exit;
 
 	/* Reset Controller not supported for Standby Control SoCs */
-	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
-	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		goto reserve_exit;
 
 	error = cpg_mssr_reset_controller_register(priv);
-- 
2.51.0


