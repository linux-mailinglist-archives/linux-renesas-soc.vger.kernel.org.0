Return-Path: <linux-renesas-soc+bounces-10750-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C39DB49E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 10:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C0F3B20F1B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Nov 2024 09:11:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2AB155743;
	Thu, 28 Nov 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MTk8xOCr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FDC1547E4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 28 Nov 2024 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732785083; cv=none; b=O3khL/pdwS98DbmXHJiJ5OD/EJDmQM4sxzJi/lFXBrDz5GVWzpwhZyoiwe1jsb9Fd+kk/qAfR4mwhRlIYALLQP1G5ogCHxxvnz9AO0Rn/hwkrqqbwJFwo5hV9U1PgKhuJnndQoke17LRR8cOlHrtujcX4n2IpEzBPjg6amq4XKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732785083; c=relaxed/simple;
	bh=gFc5htNRKqes2oc5GqPvA55fEySIv0W39XGFBZmDNg8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E2CqYYdGJ7FKjHCRnJRFxlr9eRQvX5WOOlEoVO7SNrStwNJJRKN+Ks/eEEha9vD0yoDUUijSViYNnkZchQbgkWcbbwt200NRBAwvkJtF8mfJfKeGLDiKPAEIYd60cqRIAm8FH2zt6+CGUARAp1cNkUj/DYl1q1bv4xEPK1xznF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MTk8xOCr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=u8pi3Mn5fgXNuW294q7qSGMBXjB5A/AbYX9mbD48Nyo=; b=MTk8xO
	CrEUs9ZsxYCwvuze+VHJjlo3sZZ5onlpayZCmdOeRj3FdOJ7XjTWpYg2FVvK1Vua
	AvBQuBxW0+yCs7fqz63XFWTeVbmtJfNjN1TJoJI/x7yLuktA9PGk5SLp+9fAzNgd
	jldqoqumVdCGAieJDaZbVm4bPCe3lyKx1ooesaq7a1c4nAGRJ0AbE4GeozU6O+3o
	FPxpP8Q8IaON6QJSABdj5QNGs5GyTNgdJtlWjbrOK77RnE7GrF4blOzQbkvI1Tq/
	klyL6PBzvsSO4NhyfqZOZWt2ojhouwBumACsWXRHDrgGs8oXTJLhcZWoBTbVI5Ac
	YeK090kauTHyozyw==
Received: (qmail 853590 invoked from network); 28 Nov 2024 10:11:19 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Nov 2024 10:11:19 +0100
X-UD-Smtp-Session: l3s3148p1@xLQjd/UneORehhYU
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 1/2] clk: renesas: r9a06g032: add restart handler
Date: Thu, 28 Nov 2024 10:11:11 +0100
Message-Id: <20241128091113.24116-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241128091113.24116-1-wsa+renesas@sang-engineering.com>
References: <20241128091113.24116-1-wsa+renesas@sang-engineering.com>
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
support to be added later.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/clk/renesas/r9a06g032-clocks.c | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas/r9a06g032-clocks.c
index c1348e2d450c..ff0b446f4d13 100644
--- a/drivers/clk/renesas/r9a06g032-clocks.c
+++ b/drivers/clk/renesas/r9a06g032-clocks.c
@@ -20,6 +20,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
+#include <linux/reboot.h>
 #include <linux/slab.h>
 #include <linux/soc/renesas/r9a06g032-sysctrl.h>
 #include <linux/spinlock.h>
@@ -29,6 +30,14 @@
 #define R9A06G032_SYSCTRL_USB_H2MODE  (1<<1)
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
@@ -1270,6 +1279,12 @@ static void r9a06g032_clocks_del_clk_provider(void *data)
 	of_clk_del_provider(data);
 }
 
+static int r9a06g032_restart_handler(struct sys_off_data *data)
+{
+	writel(R9A06G032_SYSCTRL_SWRST, sysctrl_priv->reg + R9A06G032_SYSCTRL_RSTCTRL);
+	return NOTIFY_DONE;
+}
+
 static void __init r9a06g032_init_h2mode(struct r9a06g032_priv *clocks)
 {
 	struct device_node *usbf_np;
@@ -1324,6 +1339,18 @@ static int __init r9a06g032_clocks_probe(struct platform_device *pdev)
 
 	r9a06g032_init_h2mode(clocks);
 
+	/* Clear potentially pending resets */
+	writel(R9A06G032_SYSCTRL_WDA7RST_0 | R9A06G032_SYSCTRL_WDA7RST_1,
+	       clocks->reg + R9A06G032_SYSCTRL_RSTCTRL);
+	/* Allow software reset */
+	writel(R9A06G032_SYSCTRL_SWRST | R9A06G032_SYSCTRL_RSTEN_MRESET_EN,
+	       clocks->reg + R9A06G032_SYSCTRL_RSTEN);
+
+	error = devm_register_sys_off_handler(dev, SYS_OFF_MODE_RESTART, SYS_OFF_PRIO_HIGH,
+					      r9a06g032_restart_handler, NULL);
+	if (error)
+		dev_warn(dev, "couldn't register restart handler (%d)\n", error);
+
 	for (i = 0; i < ARRAY_SIZE(r9a06g032_clocks); ++i) {
 		const struct r9a06g032_clkdesc *d = &r9a06g032_clocks[i];
 		const char *parent_name = d->source ?
-- 
2.39.2


