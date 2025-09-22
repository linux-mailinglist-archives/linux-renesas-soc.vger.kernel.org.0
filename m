Return-Path: <linux-renesas-soc+bounces-22173-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF17B92360
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 18:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D04016E4D4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Sep 2025 16:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D05D311581;
	Mon, 22 Sep 2025 16:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Fp3h06l5";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="K67lEHCi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D5215198;
	Mon, 22 Sep 2025 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758558098; cv=none; b=i87+o6yJcPWbKXL4ZR0rImbeQP07v33vEH0XhGrfpUxAbZkkFA564TpvNeUtVOjLL27uTE6jtnKKkA6Vb4DZgXYOiKqxPuxroI/FJWE1Igok6p0e3tkZhHn+VbZ+WFuI8tZ2v2p1cQlNGlLua/RmxtvyZUAaeze6FeObX/9Y1Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758558098; c=relaxed/simple;
	bh=tE2zAptSNq/J+Q+6Iqinursh6sIsMnJY11rAjVQrQzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p3MPTNEFptf4SQUw0crPBPdRJwOttK9NNus1QDTdfpYmI6Ybdkqutus+xUIuNU0zDFpEP6EWt2dLVl0ekjXbfcySthxRY2AUvMLWaBRlQQmjmHnD+QOQ7jVsdaZTyEktpLCc54vsC7X/Zp1kIHVQT/BdHSvvOSUZ/Z1sfujll68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Fp3h06l5; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K67lEHCi; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cVpJt2HRqz9v9D;
	Mon, 22 Sep 2025 18:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758558094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wg8AF9dz48wLNsQi3U7S4Uq6PfCqKgRn4n2UpopgsW8=;
	b=Fp3h06l5m7lTFRJp8JMHWBlBAy5wNH33oc7tftmXCc+9dbNa3Dp/rvMWoUabknNh62X0hy
	2Jko0CIdd2OPCsFRuZJsy7gAxGnVnK4fUlgDXC+7kDvSMfdmVwZNfj85iQAzNxgEVnVLhN
	gZB/hZFM7bTVd/iWTg+JZpFSwOmQKJJAlyc7pSK5ragIkNA31oCZLrEfum7FCL+TbX1//J
	WM9wOnXO/6OLx0JS3JC2T95pJKEOmEAkTGIJWZY7OaUCU+q0kl9x5eh0n0+LcaKr2WZnCv
	R8/5MgvNg/VMFrVnQVBXrio+aSpKkiQ/VVMAmXZBAmiBlImi/y+r3b8BLmmkJA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758558092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Wg8AF9dz48wLNsQi3U7S4Uq6PfCqKgRn4n2UpopgsW8=;
	b=K67lEHCinHPGd4ma6jjY++WBmQ8nbEV97S/csrT8IM/UvRWvQGaqPWRWE4r7kSEo3w2fh8
	WQpHMMAl0Zvht01x++siGYNVxJeq5uKPEp73weaoMg/1grvfYngzryco9saoz1Gl+eCG9N
	gRLny0CZTsMcfWmu+hItu9/uyFZvSRvlYanRYXjZN+aKcR8L92qsF1cNUNZqeZixVSfgLI
	Ivtz9lSp+v586slMbK11m6xfePAs/AVXKK0z9qkxEgT57WAZUxb8WDTy0tl+J8IC6HOTaX
	PiI2Cnu5hre1nYc2iz9QE1zT0/ltbh3K0XRHL6lZgkmc0XJVZUiDUJE+b7KitA==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4] clk: renesas: cpg-mssr: Read back reset registers to assure values latched
Date: Mon, 22 Sep 2025 18:20:38 +0200
Message-ID: <20250922162113.113223-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gk65d9biq6dji8d8n7ocptjtjgm14gxh
X-MBO-RS-ID: eca6f977796ca2cd658

On R-Car V4H, the PCIEC controller DBI read would generate an SError
in case the controller reset is released by writing SRSTCLR register
first, and immediately afterward reading some PCIEC controller DBI
register. The issue triggers in rcar_gen4_pcie_additional_common_init()
on dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW), which on V4H is the first
read after reset_control_deassert(dw->core_rsts[DW_PCIE_PWR_RST].rstc).

The reset controller which contains the SRSTCLR register and the PCIEC
controller which contains the DBI register share the same root access
bus, but the bus then splits into separate segments before reaching
each IP. Even if the SRSTCLR write access was posted on the bus before
the DBI read access, it seems the DBI read access may reach the PCIEC
controller before the SRSTCLR write completed, and trigger the SError.

Mitigate the issue by adding a dummy SRSTCLR read, which assures the
SRSTCLR write completes fully and is latched into the reset controller,
before the PCIEC DBI read access can occur.

Fixes: 0ab55cf18341 ("clk: renesas: cpg-mssr: Add support for R-Car V4H")
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Factor out the writel-then-readl code into cpg_mssr_writel_with_latch()
    and clean the code up a bit
V3: Add RB from Wolfram
V4: - Rename cpg_mssr_writel_with_latch() to cpg_mssr_reset_operate()
    - Drop priv varible from cpg_mssr_reset()
    - Add TB from Geert
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 44 +++++++++++---------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index be9f59e6975d7..6a33e8a3d6ddf 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -676,53 +676,47 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 
 #define rcdev_to_priv(x)	container_of(x, struct cpg_mssr_priv, rcdev)
 
-static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
-			  unsigned long id)
+static int cpg_mssr_reset_operate(struct reset_controller_dev *rcdev,
+				  char *func, bool set, unsigned long id)
 {
 	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
 	unsigned int reg = id / 32;
 	unsigned int bit = id % 32;
+	const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
 	u32 bitmask = BIT(bit);
 
-	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
+	if (func)
+		dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
 
+	writel(bitmask, priv->pub.base0 + reset_reg);
+	readl(priv->pub.base0 + reset_reg);
+	barrier_data(priv->pub.base0 + reset_reg);
+
+	return 0;
+}
+
+static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
 	/* Reset module */
-	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+	cpg_mssr_reset_operate(rcdev, "reset", true, id);
 
 	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
 	udelay(35);
 
 	/* Release module from reset state */
-	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
-
-	return 0;
+	return cpg_mssr_reset_operate(rcdev, NULL, false, id);
 }
 
 static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 {
-	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
-	unsigned int reg = id / 32;
-	unsigned int bit = id % 32;
-	u32 bitmask = BIT(bit);
-
-	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
-
-	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
-	return 0;
+	return cpg_mssr_reset_operate(rcdev, "assert", true, id);
 }
 
 static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
 			     unsigned long id)
 {
-	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
-	unsigned int reg = id / 32;
-	unsigned int bit = id % 32;
-	u32 bitmask = BIT(bit);
-
-	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
-
-	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
-	return 0;
+	return cpg_mssr_reset_operate(rcdev, "deassert", false, id);
 }
 
 static int cpg_mssr_status(struct reset_controller_dev *rcdev,
-- 
2.51.0


