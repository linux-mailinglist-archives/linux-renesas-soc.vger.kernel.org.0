Return-Path: <linux-renesas-soc+bounces-6098-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0E3904CCB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 09:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06595B23027
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2024 07:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9611716D4F0;
	Wed, 12 Jun 2024 07:25:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BF516D4FA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Jun 2024 07:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718177123; cv=none; b=RWCzR09Yn0jH+yjbbdsXqM/NUi+Sz5VFYLudTpvL8/tiNtcpKw+oaKv/RWNSvfFkVkh/QX9CcMK76iWd8eC8udwJ01a0Ukcidd47hZBIMC862Dnl3U8QKzLx7mDiuBZZTGc0fBXvF8M6NS8eCqSzpB+ZJbDFBUGHQxgNKSwJvVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718177123; c=relaxed/simple;
	bh=344gSn+Afg2LPKoOHlxe1nr/xRR9XSgwET6Oi3+JYtE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=E1Cpdwf6FXL0W5aYvSutdr3XfDlKW/JJRv8//JNluWC10z13VIDtBPM4sTgYP042cDNi5T9lP4WCkh39KIrGx6mrR5fPpPAml8/V3/RV/rqTYeC2IQOqiwvXYR+aRVY/lHEvKBOykxRqtSFI64fP+RwRXcdmxRrQCq86aIIgS2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
	by xavier.telenet-ops.be with bizsmtp
	id aXRH2C00F3axqkY01XRHJs; Wed, 12 Jun 2024 09:25:18 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHIL6-007OWQ-KC;
	Wed, 12 Jun 2024 09:25:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sHIM9-00E9YS-Mu;
	Wed, 12 Jun 2024 09:25:17 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Cong Dang <cong.dang.xn@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: renesas: r8a779h0: Fix PLL2/PLL4 multipliers in comments
Date: Wed, 12 Jun 2024 09:25:16 +0200
Message-Id: <07126b55807c1596422c9547e72f0a032487da1e.1718177076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The multipliers for PLL2 and PLL4 as listed in the comments for
the cpg_pll_configs[] array are incorrect.  Fix them.

Note that the actual values in the tables were correct.

Reported-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Fixes: f077cab34df3010d ("clk: renesas: cpg-mssr: Add support for R-Car V4M")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.11.
---
 drivers/clk/renesas/r8a779h0-cpg-mssr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
index 0a553d5170d5fdde..1057a2b6a72769dd 100644
--- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
@@ -243,10 +243,10 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
  *   MD	 EXTAL		PLL1	PLL2	PLL3	PLL4	PLL5	PLL6	OSC
  * 14 13 (MHz)
  * ------------------------------------------------------------------------
- * 0  0	 16.66 / 1	x192	x204	x192	x144	x192	x168	/16
- * 0  1	 20    / 1	x160	x170	x160	x120	x160	x140	/19
+ * 0  0	 16.66 / 1	x192	x240	x192	x240	x192	x168	/16
+ * 0  1	 20    / 1	x160	x200	x160	x200	x160	x140	/19
  * 1  0	 Prohibited setting
- * 1  1	 33.33 / 2	x192	x204	x192	x144	x192	x168	/32
+ * 1  1	 33.33 / 2	x192	x240	x192	x240	x192	x168	/32
  */
 #define CPG_PLL_CONFIG_INDEX(md)	((((md) & BIT(14)) >> 13) | \
 					 (((md) & BIT(13)) >> 13))
-- 
2.34.1


