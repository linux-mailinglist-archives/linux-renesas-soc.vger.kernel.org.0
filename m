Return-Path: <linux-renesas-soc+bounces-21996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D93B82B4B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 05:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A798C720970
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Sep 2025 03:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC3E2222B2;
	Thu, 18 Sep 2025 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WGwgXXXq";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nMR+SFBi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C37E3D984;
	Thu, 18 Sep 2025 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758164861; cv=none; b=SkQYkGZ408oXffc+6KCwbaLLbSHxow6FoKJLzHfJXwefNG4YDMvJkdOzSjdJVkIiXq831LCjkfnp/pXWa6pS4tW78FRsAxc/FnlZfCVZ5lWvqNnwwHzIm16E6V7TaHlJxnBn/MK6PurYDZVkvNx3tTdYVKFaPTVCy10ehPO4QXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758164861; c=relaxed/simple;
	bh=r5J6Xh4YUa0MvD2MPxnB0v4QJmTN4BqYy1SGpfAPauA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P48PxLTmuG6bpWSoWv25USKEJ5jzj/hEwapx6UBLiO7R4DyQrBzRXWy9tWAnrUBDPO9/hNzk3gaKa0ABGp1GE8/2feDrM9sbpLd84blUQACKa4oP33GkcDNqb+wf7URLMcyX/VSRfr59N3ih8Rt9EoLXppvpXhqMSk1jYHROZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WGwgXXXq; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nMR+SFBi; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cS0td4ChSz9sdM;
	Thu, 18 Sep 2025 05:07:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758164857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OyYwV9bOm1SqIxxcvCeAbUqevMM0QbYFC2WSPc2lN1o=;
	b=WGwgXXXqYQYJPz52QRRmwI5of+NmwQ1tXWG78asBNl02xZAt8F5mB9LgaiTqZsb4hmi3w/
	Jb+4hv1zpBdK6s4+yWe/10GHixtrF4t7FaLZYam37w+wVpd+8kRn5jGiLMMXia0lXMumfj
	sECfQcl+rFYUMleAwIo/UFt+1RB3NMhg5NEGPibW2XDhTY5CAuTBSBqh/7asjD63tOuzub
	F09A506IMet8AUJqkk6Qy5hrV0GYSAnEn62YgDXAiRU35jmzUleEKlA36cu3zjJJWYKwZh
	pxn02goLJb188opcCNriGszvuJaNprAP1al53d+Az6y7cV+cikU1NacneIPF2w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1758164855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OyYwV9bOm1SqIxxcvCeAbUqevMM0QbYFC2WSPc2lN1o=;
	b=nMR+SFBi8VTOD2BmdZXmI5MioHfqeeJkSOn9P8kKkCuYGu6lTMHT01UnM+bOwGB3Wqw07q
	AY2nqjyEygxcZeFN+vAiF7cBoyH4b/XowU2U8DKWzKr6jh9726su4EfZjBVaR6ZwGa4+RC
	Jd3q/9NC8wbFavNg66gS73d5S0JrsayD+i7L3t+RgcauXkKb9hliooHzGYT+4u5xNzJO2A
	XpS0kehDP8OqcO/K8ilmOq42e28LoNJb53RIS+2AOFUsTllgJlAEWXPRGFhLTXjlSRzNws
	jPOZTx4fIoHYL7qUhMNe1Is+LhAgbB+GhX6Rt4wwsRWTlYdzQmezwM/n9uq18g==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: cpg-mssr: Read back reset registers to assure values latched
Date: Thu, 18 Sep 2025 05:06:51 +0200
Message-ID: <20250918030723.331634-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 1uk6oimsckbeo4zeydeu1hhyiijcxup4
X-MBO-RS-ID: 6cd8798236063df7e62

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
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 65dfaceea71f..7b52e8235984 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -688,6 +688,7 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 
 	/* Reset module */
 	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+	readl(priv->pub.base0 + priv->reset_regs[reg]);
 
 	/*
 	 * On R-Car Gen4, delay after SRCR has been written is 1ms.
@@ -701,6 +702,7 @@ static int cpg_mssr_reset(struct reset_controller_dev *rcdev,
 
 	/* Release module from reset state */
 	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
+	readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
 
 	return 0;
 }
@@ -715,6 +717,7 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
 
 	writel(bitmask, priv->pub.base0 + priv->reset_regs[reg]);
+	readl(priv->pub.base0 + priv->reset_regs[reg]);
 	return 0;
 }
 
@@ -729,6 +732,7 @@ static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
 	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
 
 	writel(bitmask, priv->pub.base0 + priv->reset_clear_regs[reg]);
+	readl(priv->pub.base0 + priv->reset_clear_regs[reg]);
 	return 0;
 }
 
-- 
2.51.0


