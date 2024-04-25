Return-Path: <linux-renesas-soc+bounces-4903-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D08B1C6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 10:03:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8611A2852B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Apr 2024 08:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8936BB5D;
	Thu, 25 Apr 2024 08:03:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422856EB45
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Apr 2024 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714032213; cv=none; b=D8FNmEHnzj0XGQxyIbMtrvAF5lj1DfSeUfoPm0hyrX3avBhb9ozUQ3XP+celxhvvfqSyz4272worGbnXlv4sY5wehPOLMgvCrdHmBVxOpcyejvj3oZh4OrC17JlFCJnrseflFjKPkdwuufxy7k+GUHqjxn6vnPRXT70c/d+hBlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714032213; c=relaxed/simple;
	bh=Re28S32DxvEJ4ytZ0IHnq2LRyld5b5LDex8YRQ3jNb8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g0n0du4GPV59H9tGd0E9Mfteb6em9zUE9UU6QhG3+1zk7S3yexlseji53YFuxuunSdnBlfU4/s1eM+xhx+0bEnsgoPz24rZFvGXW+jSAog2P7FZb0dvh1tVtQRcsnP30EEAS3ecb15Knyp4XEW3+7/m2sDKs7kvudXaiyl8NZnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a8cf:a8c7:966f:f6c0])
	by baptiste.telenet-ops.be with bizsmtp
	id FL3K2C00D4stinQ01L3Kxr; Thu, 25 Apr 2024 10:03:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzu3y-0080sa-1t;
	Thu, 25 Apr 2024 10:03:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rzu4d-00CG5K-4H;
	Thu, 25 Apr 2024 10:03:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: shmobile: Remove unused CLK_ENABLE_ON_INIT
Date: Thu, 25 Apr 2024 10:03:18 +0200
Message-Id: <f01e60a1007afe9385ddc10c4665752857ba4135.1714032122.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CLK_ENABLE_ON_INIT is a relic from the old SH clock framework.
It is no longer used on SH/R-Mobile ARM drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.10.
---
 drivers/clk/renesas/clk-r8a73a4.c | 2 --
 drivers/clk/renesas/clk-r8a7740.c | 2 --
 drivers/clk/renesas/clk-sh73a0.c  | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/clk/renesas/clk-r8a73a4.c b/drivers/clk/renesas/clk-r8a73a4.c
index f45c2c45808be0b5..4b1815147f7769fc 100644
--- a/drivers/clk/renesas/clk-r8a73a4.c
+++ b/drivers/clk/renesas/clk-r8a73a4.c
@@ -30,8 +30,6 @@ struct r8a73a4_cpg {
 #define CPG_PLL2HCR	0xe4
 #define CPG_PLL2SCR	0xf4
 
-#define CLK_ENABLE_ON_INIT BIT(0)
-
 struct div4_clk {
 	const char *name;
 	unsigned int reg;
diff --git a/drivers/clk/renesas/clk-r8a7740.c b/drivers/clk/renesas/clk-r8a7740.c
index 325394b6e55e228d..22e9be7240bb2239 100644
--- a/drivers/clk/renesas/clk-r8a7740.c
+++ b/drivers/clk/renesas/clk-r8a7740.c
@@ -26,8 +26,6 @@ struct r8a7740_cpg {
 #define CPG_USBCKCR	0x8c
 #define CPG_FRQCRC	0xe0
 
-#define CLK_ENABLE_ON_INIT BIT(0)
-
 struct div4_clk {
 	const char *name;
 	unsigned int reg;
diff --git a/drivers/clk/renesas/clk-sh73a0.c b/drivers/clk/renesas/clk-sh73a0.c
index 8c51090f13e13b31..47fc99ccd283826c 100644
--- a/drivers/clk/renesas/clk-sh73a0.c
+++ b/drivers/clk/renesas/clk-sh73a0.c
@@ -34,8 +34,6 @@ struct sh73a0_cpg {
 #define CPG_DSI0PHYCR	0x6c
 #define CPG_DSI1PHYCR	0x70
 
-#define CLK_ENABLE_ON_INIT BIT(0)
-
 struct div4_clk {
 	const char *name;
 	const char *parent;
-- 
2.34.1


