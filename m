Return-Path: <linux-renesas-soc+bounces-29381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gASGDhxItGk4kAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29381-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:23:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D841F2880FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 18:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66CA23296773
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 17:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D1031AA90;
	Fri, 13 Mar 2026 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GYi8Tijs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F101D33F8D6
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 17:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422357; cv=none; b=fhL/8EkQ3FeLu+AFjgoomxJ3wN3JkkqMZH7kg2jQPTtUQC8EASCzqpsefdnnj+koSygeu8FO2ig09a4+841uQiB7YyDWTcjUymBDS/KjTZfnnWo7QG81JDzRCFxM4GT1Ep2MicLLrInqN6mWYkl0YXTL/zFfpccBzsFVebe+qiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422357; c=relaxed/simple;
	bh=dWlzpIRpWhs//KGkXhRaKZ5Oy2VekU+zobFeCi2zWjg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kVm/4/BFX2S0VmGAKCPU27SRykNTNTr/0mpptuMv00V0rzf6unDeqhX7fRMH/+qEfJjPrP998AA8EXlMJs0OtwJuuU5MLc8g4d8Wej/UAq3U0A7dOqMAgVdU3nivEeqWHmr+qXhj8/ZNE6cyBS4td9y7VFMbeie+/myh4y29idY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GYi8Tijs; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=d1IfdCdIdQyJxZ
	ZoIlmhwvV8tc1Lvx3UnGZzC6QnBI8=; b=GYi8TijsZpLel+79c9SJGwivZJtQIJ
	0/TgGNItio3hO7a1sGgWNH1MPOOaUz8Vtuc1k7jSLUaUQXxfBYLG/UyH7LFzPuoO
	7MANHznyKUFuFyyTYSyOIsdOTrZVkTV3SwMqmjGrC8rXlE31nl+5xlEICBu2zvEC
	Mbf4hmqXdjcjP5VJLltQ9a9/cFWHKeKs/reIvdMQ7zxLmrON2D25ykZ+zopPjngH
	1G7pD4Sw+KRtp8exr9d2QPmr8ISsg6H+qV9vOoGy2Byd0icnCNJmMF0o11ggwW2b
	fXl9kI+ZRV9Qzb30VLs/8wogOfkR7Tv/8S1nOslAEejqgdcImi/qnPSQ==
Received: (qmail 390599 invoked from network); 13 Mar 2026 18:19:13 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Mar 2026 18:19:13 +0100
X-UD-Smtp-Session: l3s3148p1@7kZhEetMrrIujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [RFC PATCH] watchdog: rzn1: remove now obsolete interrupt support
Date: Fri, 13 Mar 2026 18:16:42 +0100
Message-ID: <20260313171858.8317-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-29381-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[sang-engineering.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid]
X-Rspamd-Queue-Id: D841F2880FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Previously, it was overlooked that the watchdog could reset the system
directly. So, a workaround using the interrupt which called
emergency_restart() was implemented. We now configure the controller
when booting properly to allow watchdog resets directly. Thus, remove
the interrupt workaround.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Depends on Herve's series[1]. I'll resend it once his changes are
upstream. But maybe people want to discuss it already?

[1] https://lore.kernel.org/r/20260313092417.294356-1-herve.codina@bootlin.com

"[PATCH v2 0/3] watchdog: rzn1: Add support for direct hardware reset"

 drivers/watchdog/rzn1_wdt.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/watchdog/rzn1_wdt.c b/drivers/watchdog/rzn1_wdt.c
index 98978b5cc5b4..0494a817b20a 100644
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


