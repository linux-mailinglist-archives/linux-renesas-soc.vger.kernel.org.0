Return-Path: <linux-renesas-soc+bounces-32225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGaFEFho/GnzPgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7774E6B8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 92E0E300E03E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC9F3E867D;
	Thu,  7 May 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DrZC1sio"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8676D3D564E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149460; cv=none; b=GXOfIFMj3z4Gdkt+XNTZ1Hr3xrJbgiK5qI5UzZB58yulZ5Ae5uV5syiLCBNmCDnxNg/j+D3cn9cNg72IllIU3oYHWpFnjWx6oZd+B/LgX5G0C762NPHhUPYKq1sU/MbJpChn7H7deMoH7/+0hakY5FuGWzB6L5TMO7mR3dAufIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149460; c=relaxed/simple;
	bh=PEBmWLsNLDcSW50JEPK3HzO2y997HxNC5pylc7gDSPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=He/NLuR5rXy8jF2wNBVK2woGwYbOkzH26a9JEZfP7b3pjVnA4Tr3CF+4jah3W92fNtXsUV4IKGXvy2P3l/G7dneH7qx4amsB/N/8KuJwRloXGl3B0mPjEtXrYVVUcdcHQQuHP4oM0DpBeyiXQpz0QgVrm5Ghif0w96p0SvJoyYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DrZC1sio; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0bPQHhTlMGHkow0cp7D5dntPctxUPfYHw5mO1fd6jqA=; b=DrZC1s
	iodv5PdmTWuxQJ5dusdZ3PXdQ2PZlLaIxZxz1Q/DST0i13ry14swHN/oYFX8Gq9E
	JegHpKGTczy1m1qrnu78TtlF3JFTiY3CcQAgXIsfPQ25O3iyywoEJ2ZygOk3ab2o
	VwUiQ1Ezpe6/2LVSo+DMC07laNlbZLb8sAWR80azANTjFWtvlUY0REXrbK/yNnrM
	bEBrVdzEmrixrgFFdn95wsff7rvMF/v5PaeGoBCI3OI3h/IFXKrBhqjxk2PZU/xt
	u0/65Lt7aUlwM+fKCgDkUC1ZmQpO14BItGh1ykmi6n4PnrYghSGJyPLKJPOOxN6y
	QpZSV0aiCvgMBQMg==
Received: (qmail 1070473 invoked from network); 7 May 2026 12:24:15 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 May 2026 12:24:15 +0200
X-UD-Smtp-Session: l3s3148p1@hYimrjdRyucujnu4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v4 3/4] watchdog: rzn1: remove now obsolete interrupt support
Date: Thu,  7 May 2026 12:24:08 +0200
Message-ID: <20260507102410.43384-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C7774E6B8D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32225-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sang-engineering.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Previously, it was overlooked that the watchdog could reset the system
directly. So, a workaround using the interrupt which called
emergency_restart() was implemented. We now configure the controller
when booting properly to allow watchdog resets directly. Thus, remove
the interrupt workaround.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/watchdog/rzn1_wdt.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 48d5afef62a5..4fdc5363ba98 100644
--- a/drivers/watchdog/rzn1_wdt.c
+++ b/drivers/watchdog/rzn1_wdt.c
@@ -79,14 +79,6 @@ static int rzn1_wdt_start(struct watchdog_device *w)
 	return 0;
 }
 
-static irqreturn_t rzn1_wdt_irq(int irq, void *_wdt)
-{
-	pr_crit("RZN1 Watchdog. Initiating system reboot\n");
-	emergency_restart();
-
-	return IRQ_HANDLED;
-}
-
 static struct watchdog_info rzn1_wdt_info = {
 	.identity = "RZ/N1 Watchdog",
 	.options = WDIOF_MAGICCLOSE | WDIOF_SETTIMEOUT | WDIOF_KEEPALIVEPING,
@@ -101,12 +93,10 @@ static const struct watchdog_ops rzn1_wdt_ops = {
 static int rzn1_wdt_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 	struct rzn1_watchdog *wdt;
 	unsigned long clk_rate;
 	struct clk *clk;
 	int ret;
-	int irq;
 
 	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
 	if (!wdt)
@@ -116,15 +106,6 @@ static int rzn1_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->base))
 		return PTR_ERR(wdt->base);
 
-	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
-		return irq;
-
-	ret = devm_request_irq(dev, irq, rzn1_wdt_irq, 0,
-			       np->name, wdt);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to request irq %d\n", irq);
-
 	clk = devm_clk_get_enabled(dev, NULL);
 	if (IS_ERR(clk))
 		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
-- 
2.47.3


