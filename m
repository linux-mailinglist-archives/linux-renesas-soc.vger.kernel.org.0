Return-Path: <linux-renesas-soc+bounces-22035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53331B84E5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 15:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E88891C207ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 13:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5D91DE3A4;
	Thu, 18 Sep 2025 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JdvpdDrM";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jRJaMEkL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9126B1DB127;
	Thu, 18 Sep 2025 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758203148; cv=none; b=h4ygu1RC2ET9A79eNWO7IngVemHTZeHRQjbLu87sfO1JFQKwfyc8qeSMynj/xVpYQezLgQSZzkXQxYVYdMGhcsRtuDO71xfSvU1drJZRI6nO/YAe6/z0iGhsB57Xee+CzNjowGbHOfmKFlWWBz6bo4CZAKZNu1w6M0uyGbxEf00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758203148; c=relaxed/simple;
	bh=eM8+bNO8SYmZzyc9l6+Kbv+prZeIlbBXJL2UTgX7r2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=alVN9KgZB4a/HVrfMG3BWzvkci97NVzpwtgwDNMVxaA64VQ1D57zqeIGewXoSxMlNy+jF/niD58NKL1z58bbn2r7TUsP2U9N3WntkQQoYD1wXp0HSkV1BO8vC7jIMfLqd1XeeWemA4KUmlwk/PO2EMKY/A+2Dzb7MNe+9z4x6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JdvpdDrM; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jRJaMEkL; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cSH2w4mxvz9tkd;
	Thu, 18 Sep 2025 15:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758203144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6rVUHFRz/09XWMdDlkihzDC5joojtslamGCxOzK6xyM=;
	b=JdvpdDrMwNh9e0j9eY4LsK1trxntcsh4v7w5BQF+yypnitN8stVGgmgwx9McHSj2IbDAni
	vKlHHZ9WhGknybsP9z9aBq+i+DiKHp+I3HWypkG6IsYqPU28OcakiERb4m2g6v3K4CkXPR
	xAMqoRJqM1fpCS9aXQ+fF5Sl6acgGNO3ACBBHcFMAPlZaiZyiOZr1PPO7NIq0NTbG2A32r
	M4S8yA98C2WH9JQ2tv/6tfi8uTb5HG5iH2pqwu81IdwymnUBHpf/Ycv1RMaX1K0XnHwVaT
	N0yzg6hBew5n2kaumlbunXIr6t1PI2bG7uk7YLZyKuo9vc2tsmxhluMrPqb+ag==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758203142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6rVUHFRz/09XWMdDlkihzDC5joojtslamGCxOzK6xyM=;
	b=jRJaMEkL/bGmmWMxgStVY1mhsx37IwCtxhcBSsC+/6L3S6OpQhX+BBWoenY9Fz0nCTTHXQ
	KUoPAR+uVRTdW1sSB8VigvTxG4CIBhs9zrRmXZgN8KyJZQ730kh8Y4JPYWSVunrLsN7G2j
	a2wTpYE2svcwwynMeHPd5yfDRk+0clITgdxSbfNHg0c94a1cBSNkz7yH3ICTCkvctVD5gE
	ZnfAoe+KFAxTnFI4gvCnAQCQfMgvs6oHySw9oT4vtKeIdlFQaW5mGFy5v0EpSWLZ0yDXwu
	qexDLeH8VUCIeM/ClnR+XlvceYYAoGJ2MMzv044+TfEgqm0kc6s2uUT341oZHw==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] clk: renesas: cpg-mssr: Read back reset registers to assure values latched
Date: Thu, 18 Sep 2025 15:44:41 +0200
Message-ID: <20250918134526.18929-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xdjmonqgznbm3u45poc3a51qmxjki8fd
X-MBO-RS-ID: 518a766573264a66845

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
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 45 ++++++++++++--------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 65dfaceea71f..cfb7f2a59c6b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -676,18 +676,31 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 
 #define rcdev_to_priv(x)	container_of(x, struct cpg_mssr_priv, rcdev)
 
-static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
-			  unsigned long id)
+static int cpg_mssr_writel_with_latch(struct reset_controller_dev *rcdev,
+				      char *func, bool set, unsigned long id)
 {
 	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
 	unsigned int reg = id / 32;
 	unsigned int bit = id % 32;
+	const u16 reset_reg = set ? priv->reset_regs[reg] : priv->reset_clear_regs[reg];
 	u32 bitmask = BIT(bit);
 
-	dev_dbg(priv->dev, "reset %u%02u\n", reg, bit);
+	if (func)
+		dev_dbg(priv->dev, "%s %u%02u\n", func, reg, bit);
+
+	writel(bitmask, priv->pub.base0 + reset_reg);
+	readl(priv->pub.base0 + reset_reg);
+
+	return 0;
+}
+
+static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
+			  unsigned long id)
+{
+	struct cpg_mssr_priv *priv = rcdev_to_priv(rcdev);
 
 	/* Reset module */
-	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+	cpg_mssr_writel_with_latch(rcdev, "reset", true, id);
 
 	/*
 	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
@@ -700,36 +713,18 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 		usleep_range(35, 1000);
 
 	/* Release module from reset state */
-	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
-
-	return 0;
+	return cpg_mssr_writel_with_latch(rcdev, NULL, false, id);
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
+	return cpg_mssr_writel_with_latch(rcdev, "assert", true, id);
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
+	return cpg_mssr_writel_with_latch(rcdev, "deassert", false, id);
 }
 
 static int cpg_mssr_status(struct reset_controller_dev *rcdev,
-- 
2.51.0


