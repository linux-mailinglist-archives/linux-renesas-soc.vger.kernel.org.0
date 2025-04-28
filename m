Return-Path: <linux-renesas-soc+bounces-16401-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E48FA9EFD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 13:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A7816C74C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 11:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA381CD213;
	Mon, 28 Apr 2025 11:56:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B2526463E
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841415; cv=none; b=UHbnqD/Fzqr+8kQLjPQTzidB/v69i5UPR741jcJCQr+4j5W2bQ6gHeN3ARRWtuBgWe8haEUGgbXIcVxcrrL9e1/DyZFTFth2ZgZRka6nXfL1DzERnqAMn5LEy8oiZwsrX9ByfrdkhuDsPNM0FEVxtsXSS571lBYHwhvq7XQU3yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841415; c=relaxed/simple;
	bh=umDqawJwovAh6vB9xHWnn7XP55zDZXseFV7F/Y6ioxU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XlSuQZ57yMarS//Ea013P0eQZglVygtj8JtLoMFUylh6QRpGebtqTsSLlMF83l6zu3vP1AShqvMu4SLbAX9JNPjI7xZGwo2wQAV7JE7uvj8Dnn0NuBAjbCv8+cWbSE1vTOLPTYCUIKgWoXn+gzUsSIdOG88maGe6Q7prTLCI4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4ZmMP90Kpfz4x1CJ
	for <linux-renesas-soc@vger.kernel.org>; Mon, 28 Apr 2025 13:56:45 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b9c4:1670:abc0:a1fc])
	by michel.telenet-ops.be with cmsmtp
	id ibwc2E00G4Aed8c06bwcoB; Mon, 28 Apr 2025 13:56:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9N6B-00000000F7U-12BG;
	Mon, 28 Apr 2025 13:56:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9Mvs-00000006x8R-2ime;
	Mon, 28 Apr 2025 13:45:56 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: Use str_on_off() helper
Date: Mon, 28 Apr 2025 13:45:55 +0200
Message-ID: <622f8554dcb815c8fc73511a1a118c1724570fa9.1745840497.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the str_on_off() helper instead of open-coding the same operation.
Note that this does change the case of the flags, which doesn't matter
much for debug messages.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.16.

 drivers/clk/renesas/renesas-cpg-mssr.c | 3 ++-
 drivers/clk/renesas/rzg2l-cpg.c        | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index da021ee446ec8120..71431970d6e6a10b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -27,6 +27,7 @@
 #include <linux/psci.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
 
@@ -204,7 +205,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 	int error;
 
 	dev_dbg(dev, "MSTP %u%02u/%pC %s\n", reg, bit, hw->clk,
-		enable ? "ON" : "OFF");
+		str_on_off(enable));
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index b91dfbfb01e31cd8..a8628f64a03bd7e0 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -27,6 +27,7 @@
 #include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
+#include <linux/string_choices.h>
 #include <linux/units.h>
 
 #include <dt-bindings/clock/renesas-cpg-mssr.h>
@@ -1217,7 +1218,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	}
 
 	dev_dbg(dev, "CLK_ON 0x%x/%pC %s\n", CLK_ON_R(reg), hw->clk,
-		enable ? "ON" : "OFF");
+		str_on_off(enable));
 
 	value = bitmask << 16;
 	if (enable)
-- 
2.43.0


