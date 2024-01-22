Return-Path: <linux-renesas-soc+bounces-1643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D6F8364C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:49:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639EA1C22CA6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 13:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CF93D0B4;
	Mon, 22 Jan 2024 13:49:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBB63D0A9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 13:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931392; cv=none; b=DodQKKx+ysxNGFqXzkKFCoVhQVe0nY37hQm+9AvRhM0vb5ZAVtPcazvgpoQaelt3/lImfKMKxUh9BFi2l/1Eq0KJ/mVudbwcH53cL3fPsgJu+FeoZLGu9Eb1wVCvi89gOIuUY0WWyk57twGjpPqg5hWIEFSW5R8o6btXAxA4jgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931392; c=relaxed/simple;
	bh=JThqksEFWTF8uLx+x7NyMsFlcUdDrQwrkxPKhDD2Yw0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WIYuTeqHHlp0W4cYO9bHJX8sRmEBC6BWDN0UsCQJoktFT2a+Pp8XEoukl9lrb4EqjnDtcUawWDiEHZP4ZR1QZJvuCefw7Mw5oNpl6wcGl6buLAnYB64vLDW3D2pb1VZbvk5CK+FzvvMkSiDvIrATdWYVGos+UZvywuZezpQ6Y38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by albert.telenet-ops.be with bizsmtp
	id dppo2B00D0ZxL6o06ppovs; Mon, 22 Jan 2024 14:49:48 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRufb-00GGvS-DN;
	Mon, 22 Jan 2024 14:49:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRugO-00CDwv-CX;
	Mon, 22 Jan 2024 14:49:48 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: mstp: Remove obsolete clkdev registration
Date: Mon, 22 Jan 2024 14:49:45 +0100
Message-Id: <e98a6e47ebecc44fa41de6d88b4ed20c6efbd177.1705931322.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the DT conversion of SH-Mobile and Armadillo-800-EVA display
support, all devices are registered from DT, so we can remove the
registration of clkdevs.

Add the missing #include <linux/slab.h>, which was included implicitly
through <linux/clkdev.h> before.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Patch written in 2015 ;-)

To be queued in renesas-clk for v6.9.
---
 drivers/clk/renesas/clk-mstp.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index e96457371b4cce88..cab4c89c4d657740 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -10,7 +10,6 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
-#include <linux/clkdev.h>
 #include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -19,6 +18,7 @@
 #include <linux/of_address.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/slab.h>
 #include <linux/spinlock.h>
 
 /*
@@ -238,22 +238,12 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 
 		clks[clkidx] = cpg_mstp_clock_register(name, parent_name,
 						       clkidx, group);
-		if (!IS_ERR(clks[clkidx])) {
+		if (!IS_ERR(clks[clkidx]))
 			group->data.clk_num = max(group->data.clk_num,
 						  clkidx + 1);
-			/*
-			 * Register a clkdev to let board code retrieve the
-			 * clock by name and register aliases for non-DT
-			 * devices.
-			 *
-			 * FIXME: Remove this when all devices that require a
-			 * clock will be instantiated from DT.
-			 */
-			clk_register_clkdev(clks[clkidx], name, NULL);
-		} else {
+		else
 			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
 			       __func__, np, name, PTR_ERR(clks[clkidx]));
-		}
 	}
 
 	of_clk_add_provider(np, of_clk_src_onecell_get, &group->data);
-- 
2.34.1


