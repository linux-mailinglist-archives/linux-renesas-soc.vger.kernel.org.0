Return-Path: <linux-renesas-soc+bounces-5637-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B76678D3322
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39649B27CF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE370167DAB;
	Wed, 29 May 2024 09:35:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAFE169AD9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716975318; cv=none; b=m49JOgAPRPpAREQjUHo5lX+O4g/gBU/yyjZtcUHUxqMVdREnomoeOTBkDjtD8P1ejxQKVVdZxEPEmy/bZEKqHJf4BsUnZ57hT3enx7fNQtMftD/n6GATY/kHmdJJiHulwqBPFpiWQYe81Qdk9XvwraTyLetJAnD25FTf6I/+i+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716975318; c=relaxed/simple;
	bh=WFB0bI6r5CiypcJTxpq9dWxlGs/z1OBp3DMqkSgieUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eLHOpy7qBVarXx5NlTiq1QqQLvIv90SX6euRgbXVX+43+dx3jbGTquYYmSr39N/dKxh/nyeCulMPsPX2dG6YzMiPeU2fCksJ5aAF1tV2b3u9XJkYcj70Sn6HGeuEae85Ow742TlSlEUKNXYA0syxNs2BJZssId6B1BXGoaXw5o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by andre.telenet-ops.be with bizsmtp
	id UxbE2C00Y3VPV9V01xbEvx; Wed, 29 May 2024 11:35:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFhI-00GI2U-8c;
	Wed, 29 May 2024 11:35:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCFiE-008wVy-Hk;
	Wed, 29 May 2024 11:35:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Ye Bin <yebin10@huawei.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] clk: renesas: rcar-gen2: Use DEFINE_SPINLOCK() for static spinlock
Date: Wed, 29 May 2024 11:35:10 +0200
Message-Id: <8da2c908f00043f05f7e26e3c26400aea0cfe8bc.1716975021.git.geert+renesas@glider.be>
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

A static spinlock can be initialized automatically with
DEFINE_SPINLOCK() rather than explicitly calling spin_lock_init().

Suggested-by: Ye Bin <yebin10@huawei.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/rcar-gen2-cpg.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rcar-gen2-cpg.c
index edae874fa2b63369..4c3764972bad905f 100644
--- a/drivers/clk/renesas/rcar-gen2-cpg.c
+++ b/drivers/clk/renesas/rcar-gen2-cpg.c
@@ -30,7 +30,7 @@
 #define CPG_ADSPCKCR		0x025c
 #define CPG_RCANCKCR		0x0270
 
-static spinlock_t cpg_lock;
+static DEFINE_SPINLOCK(cpg_lock);
 
 /*
  * Z Clock
@@ -387,7 +387,5 @@ int __init rcar_gen2_cpg_init(const struct rcar_gen2_cpg_pll_config *config,
 		cpg_quirks = (uintptr_t)attr->data;
 	pr_debug("%s: mode = 0x%x quirks = 0x%x\n", __func__, mode, cpg_quirks);
 
-	spin_lock_init(&cpg_lock);
-
 	return 0;
 }
-- 
2.34.1


