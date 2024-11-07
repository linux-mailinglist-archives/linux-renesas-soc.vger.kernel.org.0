Return-Path: <linux-renesas-soc+bounces-10391-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 231AE9C0EFF
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 20:34:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD5331F231B9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2024 19:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E4D6217465;
	Thu,  7 Nov 2024 19:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="i5nLyb+v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0988321733F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Nov 2024 19:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007933; cv=none; b=MDhpkYIbIPXwdHlo9bAcZEx0Vonizd9/Gzwj6Sh+btbjR3UgilYP1s8lmLljZxKwyxi/6SvUJGT3VOwjWQkbee325ZliETmqRVr0E3yh9I2zagwpeDW0IXFxXZsgv4Vfu4Cn1e7y6Z7ui1Elu24gQCQn/qWARKbTaFGdLW/LAVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007933; c=relaxed/simple;
	bh=OintD9rFSVvs2q5JufWD72f6dtsaNkW+4o5Hy5URNmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tJ1FXaSFFq+fIxxodCB4YzM8APeg9lv/21H3jSPVbXNDFLizSZ8Swa8CJKcb+z0KK4hf0O3IlN+9lHKinarc3Rt+/2/dormfOVHZ4diR/dhPXOXrHOxWS6XOsGvTdNt4pWupJkIy4/+Q1aoURex4tEag0MH+XA/YqQpeQq2QhBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=i5nLyb+v; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=wLnmGFI2D6XzO1
	y7AoltGnzpl8EYzD12WYCHMPYPqDc=; b=i5nLyb+vZrdPi++9dkKKFRpJQ8daNZ
	x8271k93VjXLhKz/d/Yp1QU4eztl68ZZK/rtRVLhMyZ9pbS0KmOgQuLoVorgJ4lT
	N4FvTIT9EyNQquUGDfleJ3OLHepqbSL9wwHPdtZozN9Z+sqB2IxzFKJmRGXK68KJ
	c/87DTQ3cXFnfpd7t7Mr7dI9D+QynCcfCOV1+RYhjQwi8erF4YiV1N0a1VQ6vVil
	Vskha4dY1vP7SQ8ojZjuDOxRC2eBet9pCCpgxKQUGrx8SV1Qo6wsp8tfj7f130hu
	nTFOLr0nAhbvAFUfhW4oVHKD66uXpAVAk9Maihz91MbU3Hj3zmBW6InQ==
Received: (qmail 1046223 invoked from network); 7 Nov 2024 20:32:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Nov 2024 20:32:00 +0100
X-UD-Smtp-Session: l3s3148p1@PKEqsFcm0rhehhrW
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: renesas: r9a06g032: add restart handler
Date: Thu,  7 Nov 2024 20:31:44 +0100
Message-Id: <20241107193145.20175-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SYSCTRL module also does reset handling. Start supporting that by
allowing software resets which can then be utilized by a restart
handler. Finally 'reboot' will do something useful on RZ/N1D. Watchdog
support to be added later. Use BIT() macro consistently while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I got a RZ/N1D now. Before I start the real work, I need working
'reboot' for fluent hacking :)

 drivers/clk/renesas/r9a06g032-clocks.c | 33 +++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index c1348e2d450c..8451567579c2 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -20,15 +20,24 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/soc/renesas/r9a06g032-sysctrl.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/r9a06g032-sysctrl.h>
 
 #define R9A06G032_SYSCTRL_USB    0x00
-#define R9A06G032_SYSCTRL_USB_H2MODE  (1<<1)
+#define R9A06G032_SYSCTRL_USB_H2MODE BIT(1)
 #define R9A06G032_SYSCTRL_DMAMUX 0xA0
 
+#define R9A06G032_SYSCTRL_RSTEN 0x120
+#define R9A06G032_SYSCTRL_RSTEN_MRESET_EN BIT(0)
+#define R9A06G032_SYSCTRL_RSTCTRL 0x198
+/* These work for both reset registers */
+#define R9A06G032_SYSCTRL_SWRST BIT(6)
+#define R9A06G032_SYSCTRL_WDA7RST_1 BIT(2)
+#define R9A06G032_SYSCTRL_WDA7RST_0 BIT(1)
+
 /**
  * struct regbit - describe one bit in a register
  * @reg: offset of register relative to base address,
@@ -670,6 +679,7 @@ struct r9a06g032_priv {
 	struct clk_onecell_data data;
 	spinlock_t lock; /* protects concurrent access to gates */
 	void __iomem *reg;
+	struct notifier_block restart_nb;
 };
 
 static struct r9a06g032_priv *sysctrl_priv;
@@ -1270,6 +1280,13 @@ static void r9a06g032_clocks_del_clk_provider(void *data)
 	of_clk_del_provider(data);
 }
 
+static int r9a06g032_restart_notifier(struct notifier_block *nb,
+				      unsigned long action, void *data)
+{
+	writel(R9A06G032_SYSCTRL_SWRST, sysctrl_priv->reg + R9A06G032_SYSCTRL_RSTCTRL);
+	return NOTIFY_DONE;
+}
+
 static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
 {
 	struct device_node *usbf_np;
@@ -1324,6 +1341,20 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 
 	r9a06g032_init_h2mode(clocks);
 
+	/* Clear potentially pending resets */
+	writel(R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1,
+	       clocks->reg + R9A06G032_SYSCTRL_RSTCTRL);
+	/* Allow software reset */
+	writel(R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_EN,
+	       clocks->reg + R9A06G032_SYSCTRL_RSTEN);
+
+	clocks->restart_nb.notifier_call = r9a06g032_restart_notifier;
+	clocks->restart_nb.priority = 192;
+
+	error = register_restart_handler(&clocks->restart_nb);
+	if (error)
+		dev_warn(dev, "couldn't register restart handler (%d)\n", error);
+
 	for (i = 0; i < ARRAY_SIZE(r9a06g032_clocks); ++i) {
 		const struct r9a06g032_clkdesc *d = &r9a06g032_clocks[i];
 		const char *parent_name = d->source ?
-- 
2.39.2


