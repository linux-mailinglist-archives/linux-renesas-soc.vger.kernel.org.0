Return-Path: <linux-renesas-soc+bounces-22324-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B00A6B99F6A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 15:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CBC219C194E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 13:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3C42FCC0D;
	Wed, 24 Sep 2025 13:03:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9123C139579;
	Wed, 24 Sep 2025 13:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758718994; cv=none; b=mXSyRQAQW4D2aonx67GOhpwkEEQKqcSSmXvkcPy6Foj8ImD8T95koobgUreZtXypG0sYbj5S+PCCPC3yQ6+b9BFkNnG1Bls/1hcDM3B6/tE6IeZXNcXk4p7GC7BDVf77SwUyxPWdNCTvb8the1c3d0Hv/Sb27r0qV1PMcncPt30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758718994; c=relaxed/simple;
	bh=xMq3AUxobbF3UqePYHoPl4poiHEHjtjH3amZN3psfes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K9aBHFYlD4A7KsjETwppNsFCN0g05RmcvgbEolJQLS2tlQ1OIfqpq2oyYtzRZg1e7ThLtyrfss4You8xOTP46KMzm577PcQf83G0YW+A+FpXWBvtq3fd6E3d7e4OpVg/fa1uOeDe3GiZMbqB8KBnTqg+RsHzQ16qTcP+ub1m3Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB887C4CEE7;
	Wed, 24 Sep 2025 13:03:12 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-lib: Remove unneeded semicolon
Date: Wed, 24 Sep 2025 15:03:09 +0200
Message-ID: <deb1537b5f96d991332db5c8088bae705f7e17e3.1758718886.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Semicolons after end of function braces are not needed, remove them.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.19.

 drivers/clk/renesas/rcar-cpg-lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
index a45f8e7e9ab676f5..7b271de7037a13d9 100644
--- a/drivers/clk/renesas/rcar-cpg-lib.c
+++ b/drivers/clk/renesas/rcar-cpg-lib.c
@@ -35,7 +35,7 @@ void cpg_reg_modify(void __iomem *reg, u32 clear, u32 set)
 	val |= set;
 	writel(val, reg);
 	spin_unlock_irqrestore(&cpg_lock, flags);
-};
+}
 
 static int cpg_simple_notifier_call(struct notifier_block *nb,
 				    unsigned long action, void *data)
-- 
2.43.0


