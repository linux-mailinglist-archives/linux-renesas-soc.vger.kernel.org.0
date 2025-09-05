Return-Path: <linux-renesas-soc+bounces-21473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C1B456C7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 13:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BF8F14E382B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 11:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCA3322C94;
	Fri,  5 Sep 2025 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cktCuTWc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C976F2DC334;
	Fri,  5 Sep 2025 11:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072774; cv=none; b=MjIkkeAnkyUoiT866k/BX9sZk8H+uIFs/vP7VL2YcyYEmFUKs+CCntJMAkgtyHcb9KwbR1YE6cRWXC6Hr5my8lJlBck5VL2U1U7Xy53uC3+uUpOwPN4YMPq8ormrpmKgaf7M4DAkeW0lJZWFYptonDZsKJLYN/rA2IKsz0EVK+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072774; c=relaxed/simple;
	bh=6558W0gdFw2CcLK6XJJlcxR27J4Mz3Bc+q6QfMIH+OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rFtw4D2v7fMSCF1SWBTNC+AAt5qMOi/YdaaP7II+ZjCXWA40EVVshwXXwLEtnXN4ra/B4pYwFEFsxg4DTMiixZKiipd/IvFJ5xCH08FyQYPZBFhWO9AnclZywVJSnOV6H5i++am8d6DvcOpOFybW0JdpiMoqahZRXklNeZeF+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cktCuTWc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so19105775e9.0;
        Fri, 05 Sep 2025 04:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757072771; x=1757677571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gOWmyjzKCjcAwZA77QdwaQSqbMtQlFHl1MYZckajIMM=;
        b=cktCuTWcZI4hiUBbmCiye3ioKfU9EfnQq22hkqC6ZMdg9QptIksS5DOlUUvWexWRSn
         2aq/ZOo+Wug89SN3cPD57i3mmJmSMxT1jkZjNFWPeWYh6FJcT+HzclwH3v+yzeO091kM
         /KoUUcaCcTPDoyvxIPB9siEMDadxz21HtB9dHGvSVnHloc2GawYWeX71qUYaOlvtrS1f
         czh+C0KBpqQauPn2wJ/0S5OL6BUkhvYLTCIpsavRUzXo7+BJhH1tZnDCUOzaeay5d9Em
         n/LmDIjqae4YAjUduP6EJtXaJnDQUZR1Z3fob86upqW3rASVLNoijTiaLrxCnzqkC8qK
         dwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757072771; x=1757677571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOWmyjzKCjcAwZA77QdwaQSqbMtQlFHl1MYZckajIMM=;
        b=NyTgKxyUt49xCi9Jn8/g5HjQSQVSNKDTeIG+4luvmgGSnbLcb0yJKXd1xMlTlsnJDu
         rHBKvq9SFp8oacPD52gMZlUQqyG/ldOoY0s/o+TNZAyB5LxbuwSmtR2a93mEG/KHEu6w
         QJiNqDAWs4q8frLNrj4opQulHczN6ZQ8o8T9loUN9qhUivJ+LnxZIOyF0HOS2/gJunbl
         03yJStPEBiqfhQJl5y3DtldKFDkI915aGNhwOtMFSdupYBEAMq1nnWlVvT5k4wpsTU3v
         T69YJVLCsPltEfDmKB0er1rY7QR3IyFKkbBp4nlRDlulpF7+14PlD3FoXG15RGsZJyHJ
         lCqg==
X-Forwarded-Encrypted: i=1; AJvYcCUxmoSkcu2FzMOQVIfSlINIonbyEQ6v2lcttX8sKevS8HDX7rFmCGyEyl/qAdI9bPWjfHH0CFX7sBAH31qr@vger.kernel.org, AJvYcCVzHz5FVgtN8kMneGyzzxCBsmWJj7yHZu8QFQFzK7WahCNtHPAn4PLAH19dLQrxpa+FljIphANNc/k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZC3biO9sNHMttIValTEfnDGhh/tb/FdeFA2sG6BGW4mrIUbKk
	mFtMdsy0UHzWynVuZzsQJdnUt1YcbXVhiTXh06YQkfYCeTLuSDDYel8k
X-Gm-Gg: ASbGncurPO+zJAJel1uXxwE0izwdt1Bg6yFk67lduQrXMx6ogA2EDd5VgJMRByPUUux
	FyDdoOh0FQSW2DW715+6PnC5UI38Mr550WUebPU8f4TSUtPHPbwBFsyNQieS7SN33jKac30OqS4
	o13O9vZwcasrnOAHM4w3XrjZmvbYOuQohY1Oevz8owzzvGmHiRYwBmeNXi3M9GvMrhODMfsyLXj
	Vc9yG4+B8Atp3qNaBIJYkKaJxML7lvEBGAt0ldiSp8ynU5xbLhx7e4kFcNifQcWHjZkItyAY3dP
	NSksJOfITpAriSRfWN6PGEOt+NTQmn2K4kEUfQueEVrLw+Ti/GWNYqd6AqMB48SuSLFzKR28uqM
	Qw45E6FSPwbRRgWwSyFVAryVKruRXxHgsm7CNLlchLR1QI9UoBXEFiMUqiduA13kxj80=
X-Google-Smtp-Source: AGHT+IG+ExTLkkqiZj4F94wbaeOa6oj93rYEJrBGbOViMoIXe+T3d8eIMlAgjaQNJ3TJ6mk/hCvbmg==
X-Received: by 2002:a05:600c:c04b:10b0:45b:98d4:5eb7 with SMTP id 5b1f17b1804b1-45b98d4615amr87376015e9.18.1757072770698;
        Fri, 05 Sep 2025 04:46:10 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:6760:b4ec:282a:825a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfd000dasm37784155e9.5.2025.09.05.04.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 04:46:10 -0700 (PDT)
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
Subject: [PATCH v3] clk: renesas: cpg-mssr: Add module reset support for RZ/T2H
Date: Fri,  5 Sep 2025 12:45:58 +0100
Message-ID: <20250905114558.1602756-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3:
- Simplifed the code by adding a common function cpg_mrcr_set_bit() to handle
  set/clear of bits with options for verify and dummy reads.
- Added a macro for the number of dummy reads required.
  
v1->v2:
- Added cpg_mrcr_reset_ops for RZ/T2H specific handling
- Updated commit message
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 112 ++++++++++++++++++++++++-
 1 file changed, 108 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5ff6ee1f7d4b..81206db2b873 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -40,6 +40,8 @@
 #define WARN_DEBUG(x)	do { } while (0)
 #endif
 
+#define RZT2H_RESET_REG_READ_COUNT	7
+
 /*
  * Module Standby and Software Reset register offets.
  *
@@ -137,6 +139,22 @@ static const u16 srcr_for_gen4[] = {
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
@@ -736,6 +754,73 @@ static int cpg_mssr_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->pub.base0 + priv->reset_regs[reg]) & bitmask);
 }
 
+static int cpg_mrcr_set_bit(struct reset_controller_dev *rcdev, unsigned long id,
+			    bool set, bool verify, bool dummy_reads, const char *op_name)
+{
+	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
+	unsigned int reg = id / 32;
+	unsigned int bit = id % 32;
+	u32 bitmask = BIT(bit);
+	void __iomem *reg_addr;
+	unsigned long flags;
+	unsigned int i;
+	u32 val;
+
+	dev_dbg(priv->dev, "%s %u%02u\n", op_name, reg, bit);
+
+	spin_lock_irqsave(&priv->pub.rmw_lock, flags);
+
+	reg_addr = priv->pub.base0 + priv->reset_regs[reg];
+	/* Read current value and modify */
+	val = readl(reg_addr);
+	if (set)
+		val |= bitmask;
+	else
+		val &= ~bitmask;
+	writel(val, reg_addr);
+
+	/* Verify the operation if requested */
+	if (verify) {
+		val = readl(reg_addr);
+		if ((set && !(bitmask & val)) || (!set && (bitmask & val))) {
+			dev_err(priv->dev, "Reset register %u%02u operation failed\n", reg, bit);
+			spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+			return -EIO;
+		}
+	}
+
+	/* Perform dummy reads if required */
+	for (i = 0; dummy_reads && i < RZT2H_RESET_REG_READ_COUNT; i++)
+		readl(reg_addr);
+
+	spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
+
+	return 0;
+}
+
+static int cpg_mrcr_reset(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	int ret;
+
+	/* Assert reset */
+	ret = cpg_mrcr_set_bit(rcdev, id, true, true, false, "reset");
+	if (ret)
+		return ret;
+
+	/* Deassert reset with dummy reads */
+	return cpg_mrcr_set_bit(rcdev, id, false, false, true, "reset");
+}
+
+static int cpg_mrcr_assert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return cpg_mrcr_set_bit(rcdev, id, true, true, false, "assert");
+}
+
+static int cpg_mrcr_deassert(struct reset_controller_dev *rcdev, unsigned long id)
+{
+	return cpg_mrcr_set_bit(rcdev, id, false, false, true, "deassert");
+}
+
 static const struct reset_control_ops cpg_mssr_reset_ops = {
 	.reset = cpg_mssr_reset,
 	.assert = cpg_mssr_assert,
@@ -743,6 +828,13 @@ static const struct reset_control_ops cpg_mssr_reset_ops = {
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
@@ -760,11 +852,23 @@ static int cpg_mssr_reset_xlate(struct reset_controller_dev *rcdev,
 
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
 
@@ -1166,6 +1270,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		priv->control_regs = stbcr;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
 		priv->control_regs = mstpcr_for_rzt2h;
+		priv->reset_regs = mrcr_for_rzt2h;
 	} else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
 		priv->status_regs = mstpsr_for_gen4;
 		priv->control_regs = mstpcr_for_gen4;
@@ -1262,8 +1367,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 		goto reserve_exit;
 
 	/* Reset Controller not supported for Standby Control SoCs */
-	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
-	    priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		goto reserve_exit;
 
 	error = cpg_mssr_reset_controller_register(priv);
-- 
2.51.0


