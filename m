Return-Path: <linux-renesas-soc+bounces-5640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BA68D3325
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D37FB216FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:35:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE491169AD9;
	Wed, 29 May 2024 09:35:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219C167DA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975324; cv=none; b=Jk9obo1AJoutf5eIma/10ADNNb1QUJrfVLFujqlVbVeICSndBpsnYq3wTTXwGWJVEGIGZ8FhPFlzztgMPVNnyZdbmSJgOAcbdcVBIjsREqD+rn0jcsEjn32DSq4CZBek2HvtMNgqCry6WcP/9z1A17HFDtyXDN02U/TfsRsk2vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975324; c=relaxed/simple;
	bh=DnWpyF+PBCTslYaCokf6Ls34+nQ1E77Jp4U1kForVio=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WivMgOXe8iVf2tg5F1w4z9RX2ucVmDZQcp/5D3cZ4oUfxF20E6lFUCbg9Y0jejQxSJ8x1CSzIYKus3HQxRwomrSayihapmtrn0MAiBsL1izsJaSrwo3oGUaWigZzAk0oye9+BvZYxn5VfwrE2RL0UKLhXkWBev/q2x0Pb1k2IZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by laurent.telenet-ops.be with bizsmtp
	id UxbE2C00a3VPV9V01xbErS; Wed, 29 May 2024 11:35:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFhI-00GI2W-8d;
	Wed, 29 May 2024 11:35:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFiE-008wVq-GH;
	Wed, 29 May 2024 11:35:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: r8a77970: Use common cpg_lock
Date: Wed, 29 May 2024 11:35:08 +0200
Message-Id: <0cd9b5ffbe986bd7dc4ffb3f13492123432ee2e1.1716975021.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716975021.git.geert+renesas@glider.be>
References: <cover.1716975021.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car Gen3 Socs use the common CPG/MSSR library functions in
rcar-cpg-lib.c, so the R-Car V3M sub-driver can use the common cpg_lock
instead of a driver-private lock.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/r8a77970-cpg-mssr.c b/drivers/clk/renesas/r8a77970-cpg-mssr.c
index 7e90e94c4b68821b..3cec0f501b947eae 100644
--- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
@@ -18,6 +18,7 @@
 #include <dt-bindings/clock/r8a77970-cpg-mssr.h>
 
 #include "renesas-cpg-mssr.h"
+#include "rcar-cpg-lib.h"
 #include "rcar-gen3-cpg.h"
 
 #define CPG_SD0CKCR		0x0074
@@ -47,8 +48,6 @@ enum clk_ids {
 	MOD_CLK_BASE
 };
 
-static spinlock_t cpg_lock;
-
 static const struct clk_div_table cpg_sd0h_div_table[] = {
 	{  0,  2 }, {  1,  3 }, {  2,  4 }, {  3,  6 },
 	{  4,  8 }, {  5, 12 }, {  6, 16 }, {  7, 18 },
@@ -213,8 +212,6 @@ static int __init r8a77970_cpg_mssr_init(struct device *dev)
 	if (error)
 		return error;
 
-	spin_lock_init(&cpg_lock);
-
 	cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
 
 	return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);
-- 
2.34.1


