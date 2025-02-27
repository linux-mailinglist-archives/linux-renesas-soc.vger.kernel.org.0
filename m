Return-Path: <linux-renesas-soc+bounces-13776-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EB3A47FD7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:48:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3021D1893EBA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 13:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F58E23314A;
	Thu, 27 Feb 2025 13:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="L2MtVc91"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029F23315D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663823; cv=none; b=PzjYuppkllKNldqvWnJLa6pQxEb4e41cTHK0WnnrqiydfjlzixXviStxN0WAWJCUF6MapUfaElhOHatmRHm/h5vPKB+qkATjuvLUuYUhckV4x+5hH9/gmMboLjIhJjWDZ/T2z4uA25qqzNImvWCJHgvvF0v0BDGWPzQnGp04DGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663823; c=relaxed/simple;
	bh=+lEKNSXns2Off88iLN0X5fJz/356oQrWq+GzbGKJ+XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+USICIPufpzQNLf/W8eoPUyWp+kTkYLjLW4wPKpgo/DUmpBBxFUXP9c8XHRHLhC4PO3qeQXjtueEylVXiHE0S8WnHkmxTNCEsgGd4oiVA1DEI8TwZk6dhbmdZWQlRm0pvIeZ/wjDyPmtQv+e7+xQwLfbilq3d3tSRVhGJU/s14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=L2MtVc91; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=UOkcpbt2gZQQhOLLvm8OY4HPmFHBF1NYMhttkhTDfLw=; b=L2MtVc
	9120dwZelJ1Nb3ArvJ1HOZXvXsWy6nlE3muXPHL1tKJ5xkUOnW21TQbEFIEeGz5X
	J6ALwrqhWo1HL+ZYo0OysekjwRAg3ZKNCRv04TLYeFU+ZokE7iOtx2AJfMEWKFQG
	Y/iJajMTe4BfjBxkGtg0xFZEfleQaeyzqLXHmZX2JWLd/6Z7YYzjTtg7HhtdYxAd
	AjsLA6cIh8yggkJpxMw5BuVSnZirj+ht/0d5laHbocj0LgnUO1fxofMmvkLYSA+n
	3iMkRt+k0PDVl0EsA84rhj35jR/F+L119+lLJNhQuFl6XPpUyQXc795yzqWfCAE9
	138AhT+6E+yrDvaQ==
Received: (qmail 962352 invoked from network); 27 Feb 2025 14:43:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:31 +0100
X-UD-Smtp-Session: l3s3148p1@/cgh4B8vA0RtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 3/8] rtc: sh: only disable carry interrupts in probe()
Date: Thu, 27 Feb 2025 14:42:58 +0100
Message-ID: <20250227134256.9167-13-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
References: <20250227134256.9167-10-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With old, custom UIE handling removed, we can now disable the carry
interrupt in probe() and leave it like this. No further handling is
required.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index f8227a71084a..469806604f31 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -213,25 +213,6 @@ static int sh_rtc_proc(struct device *dev, struct seq_file *seq)
 	return 0;
 }
 
-static inline void sh_rtc_setcie(struct device *dev, unsigned int enable)
-{
-	struct sh_rtc *rtc = dev_get_drvdata(dev);
-	unsigned int tmp;
-
-	spin_lock_irq(&rtc->lock);
-
-	tmp = readb(rtc->regbase + RCR1);
-
-	if (!enable)
-		tmp &= ~RCR1_CIE;
-	else
-		tmp |= RCR1_CIE;
-
-	writeb(tmp, rtc->regbase + RCR1);
-
-	spin_unlock_irq(&rtc->lock);
-}
-
 static int sh_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	sh_rtc_setaie(dev, enabled);
@@ -434,6 +415,7 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	struct resource *res;
 	char clk_name[14];
 	int clk_id, ret;
+	unsigned int tmp;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (unlikely(!rtc))
@@ -553,8 +535,9 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, rtc);
 
 	/* everything disabled by default */
-	sh_rtc_setaie(&pdev->dev, 0);
-	sh_rtc_setcie(&pdev->dev, 0);
+	tmp = readb(rtc->regbase + RCR1);
+	tmp &= ~(RCR1_CIE | RCR1_AIE);
+	writeb(tmp, rtc->regbase + RCR1);
 
 	rtc->rtc_dev->ops = &sh_rtc_ops;
 	rtc->rtc_dev->max_user_freq = 256;
@@ -585,7 +568,6 @@ static void __exit sh_rtc_remove(struct platform_device *pdev)
 	struct sh_rtc *rtc = platform_get_drvdata(pdev);
 
 	sh_rtc_setaie(&pdev->dev, 0);
-	sh_rtc_setcie(&pdev->dev, 0);
 
 	clk_disable(rtc->clk);
 }
-- 
2.45.2


