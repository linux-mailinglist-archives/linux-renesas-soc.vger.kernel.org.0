Return-Path: <linux-renesas-soc+bounces-8856-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771E6970A14
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Sep 2024 23:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A3B11C2245A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Sep 2024 21:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6016317B402;
	Sun,  8 Sep 2024 21:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="s4I0FQ6I";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nZ4yG/7y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D7117A5B6;
	Sun,  8 Sep 2024 21:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725829889; cv=none; b=lPziBdq/Pb/n1vJKHanIpF/uDQE3SEfigk64vr94uSpIHMyo47fslF/vQTXb+uL0yBTPfvtxNGgXNIKQb+WSyfNEyb+7dwY+9RlGmty5HHns5vo0+qPxMCqSwenVhjS5dH/aR7RLXORLO6Jl52hyKHROljo++QJOk2rp1aWW9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725829889; c=relaxed/simple;
	bh=25RB4FzT4WxgCBCu9L1xAKNbbyb/rhQbiNzzddhqHQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RWhJtZh5qMEqcJc0g04QLbw0kQh1wl9IKXLrUS6hhYL+6iIcS4t4tyoxpMP/6jT5Q3AfW5OdZsU9ne9rOJ7i42gGoZ+BAymnA8lRHYecYVALSN5G7LTj7+wyEWVYKEvDmJfKoBnKvbiVaAVJTHwfcuzO543VL1AohIAO6drr8Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=s4I0FQ6I; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nZ4yG/7y; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4X22h700jSz9sSH;
	Sun,  8 Sep 2024 23:11:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1725829879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iu10XaQnGzoRMAyxC23k7fGvV791jxaNF9ONi5fQsDo=;
	b=s4I0FQ6ImZjC1JOQW/ZFDPaaBo9yHJQMQZ2Cg5+nke7WyifVUZ2g2nNv7pwTyE39oECfz8
	FIcxAaq6rJ63bcH/LxJwQnEPU4eEC6mlNfRAMdprNW/AOYeZgsSx2ZPb5T7nA51LHNcnGX
	rGYOng/f+7pk5tqNv0XT7HVMi3Ypi3ZhY6zSblM+s34mRqdPqLJd6CKhpwxY/AsTfrdKvJ
	arD2CvkHhzgCiQBDp2umHxw8tzbczqZaDAKo/E5x2q/51WG/ApEgL0QbodCG9Bym0APXLG
	Eu609LS+geyDjGtm65drd9bujG7U2u3RtjBVOkrT3qBANjjQWZbWlAls2jPpnw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1725829877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iu10XaQnGzoRMAyxC23k7fGvV791jxaNF9ONi5fQsDo=;
	b=nZ4yG/7yOwdbuCc/aNK/dCedBMaqt98zEnz6NTF2ZGP4Z+tne1JKqn/+A1uUyZQ0SiqU5x
	IKzyOLgFUNifc3RH7fQyJtHtNObTt5VDNlYGi0ugjnD0Mam5Ho3ea/TWNt+aCnIhZ5usiW
	1O5tWqhlq5N0Dxbm7ud1MiyByyAcathWssrXMxlpFCCd61B29Bv89XLDqImGEJfTc2L3R6
	iYtHLCRkOQugugWD4ceE+ujOAQm6xNq80xmLSDBgLUjLL4kBBUXNPGgQVzuzpjOj274SMJ
	xI1nC9x8r2RDE07KoDhuUEY9tvm+yiM3G1pqX9rwavQs0SoWAlEVyP7zWEN5LA==
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: trivial: Remove duplicate and trailing empty lines
Date: Sun,  8 Sep 2024 23:10:40 +0200
Message-ID: <20240908211056.230784-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 169ab20e05709d2b496
X-MBO-RS-META: k8goq9uthstmbf4r5xuwm6uceha4pqq6

Remove the duplicate and trailing empty lines. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/clk/renesas/clk-r8a73a4.c       | 1 -
 drivers/clk/renesas/clk-r8a7778.c       | 1 -
 drivers/clk/renesas/r8a779a0-cpg-mssr.c | 1 -
 drivers/clk/renesas/r9a09g011-cpg.c     | 1 -
 drivers/clk/renesas/rcar-cpg-lib.c      | 1 -
 drivers/clk/renesas/rcar-gen3-cpg.c     | 1 -
 drivers/clk/renesas/renesas-cpg-mssr.c  | 2 --
 7 files changed, 8 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index 4b1815147f77..f331d8bc9daf 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -64,7 +64,6 @@ r8a73a4_cpg_register_clock(struct device_node *np, struct r8a73a4_cpg *cpg,
 	unsigned int mult = 1;
 	unsigned int div = 1;
 
-
 	if (!strcmp(name, "main")) {
 		u32 ckscr = readl(base + CPG_CKSCR);
 
diff --git a/drivers/clk/renesas/clk-r8a7778.c b/drivers/clk/renesas/clk-r8a7778.c
index 797556259370..6ea173f22251 100644
--- a/drivers/clk/renesas/clk-r8a7778.c
+++ b/drivers/clk/renesas/clk-r8a7778.c
@@ -67,7 +67,6 @@ r8a7778_cpg_register_clock(struct device_node *np, const char *name)
 	return ERR_PTR(-EINVAL);
 }
 
-
 static void __init r8a7778_cpg_clocks_init(struct device_node *np)
 {
 	struct clk_onecell_data *data;
diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
index 4c8e4c69c1bf..9c7e4094705c 100644
--- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
@@ -266,7 +266,6 @@ static const struct rcar_gen4_cpg_pll_config cpg_pll_configs[4] __initconst = {
 	{ 2,		128,	1,	192,	1,	32,	},
 };
 
-
 static int __init r8a779a0_cpg_mssr_init(struct device *dev)
 {
 	const struct rcar_gen4_cpg_pll_config *cpg_pll_config;
diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index dda9f29dff33..22272279b104 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -98,7 +98,6 @@ static const struct clk_div_table dtable_divd[] = {
 	{0, 0},
 };
 
-
 static const struct clk_div_table dtable_divw[] = {
 	{0, 6},
 	{1, 7},
diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index 42b126ea3e13..a45f8e7e9ab6 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -206,4 +206,3 @@ struct clk * __init cpg_rpcd2_clk_register(const char *name,
 
 	return clk;
 }
-
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 20b89eb6c35c..027100e84ee4 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -335,7 +335,6 @@ static u32 cpg_quirks __initdata;
 
 #define RCKCR_CKSEL	BIT(1)		/* Manual RCLK parent selection */
 
-
 static const struct soc_device_attribute cpg_quirks_match[] __initconst = {
 	{
 		.soc_id = "r8a7796", .revision = "ES1.0",
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 1b421b809796..79e7a90c3b1b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -39,7 +39,6 @@
 #define WARN_DEBUG(x)	do { } while (0)
 #endif
 
-
 /*
  * Module Standby and Software Reset register offets.
  *
@@ -716,7 +715,6 @@ static inline int cpg_mssr_reset_controller_register(struct cpg_mssr_priv *priv)
 }
 #endif /* !CONFIG_RESET_CONTROLLER */
 
-
 static const struct of_device_id cpg_mssr_match[] = {
 #ifdef CONFIG_CLK_R7S9210
 	{
-- 
2.45.2


