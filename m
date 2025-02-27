Return-Path: <linux-renesas-soc+bounces-13771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52574A47FD5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1C81897891
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 13:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F57233152;
	Thu, 27 Feb 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jxij3+A6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E73233144
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663821; cv=none; b=JnyV5Q53mUIY1EX95HRoGCpbV2ptzwwJ7KRJssY/r9586oWU1ZPLgy7CTJwz1yEDFXMx/5RYwKVYxJpJIRHsfwSm3a/AsL8Z4/GoWqJJH29j0NIUikuIgL1hGReHNQngHDMhwDqHt9rUn1trElcHTGzvJek8sPEpcOfYJ4ypDwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663821; c=relaxed/simple;
	bh=mlEOI5HRHdA0r+khPOFstglI4Q0KaINDuTiOi53x7fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQcB0MLqLDRFCSU9++dJWpBXUugld2Vg7C1JyLUTsimnArDwvHkt84cUgVPMEfuKDfI1nJkpRkpQcW8x+sJd+tcIL0sb1LIpIv26iwYN15gLyMqCjGd4Nvhj5jXM4iW51xo8ZjZ/bQY4aZkoo6FdxdwyJ/DsCOiQ6ROQ81fVU+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jxij3+A6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=fEqcBkTeEAbMdoXRszSD0T9cx6kWOcSndq0YAOBoylM=; b=jxij3+
	A6lNj42B54P5b19/sPw5604x+0VeWf+ql7iMw7/KqR7xqhbOnAceyYCh3qke4OT6
	r9ywDNqgF5uSL7SSrJZe6psKrYZAaShFbUk8u77QjDW700auftS1HMy6PdYWKatQ
	PAFXgYA2zV7f9jLRrMoT1GJryItfbY22OIMDPmsS+iFw9RYIgUB7V11Upo3hP14v
	xwPBAzmVYnOv96dMpCaLlW36AQ6WH0fD1WKP96tP7LyslGTtyfKaKExdz1pHzgFn
	I3Sm95js8lbZ/EuIVaiwF0Lv9vitVivlSnkwumN7gYIVedKYWz8S0GGm3rphrnpq
	NWuFNdlhdcy/lfDg==
Received: (qmail 962427 invoked from network); 27 Feb 2025 14:43:34 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:34 +0100
X-UD-Smtp-Session: l3s3148p1@/AxV4B8vjGFtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 6/8] rtc: sh: remove useless wrapper function
Date: Thu, 27 Feb 2025 14:43:01 +0100
Message-ID: <20250227134256.9167-16-wsa+renesas@sang-engineering.com>
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

The wrapper to enable interrupts is so thin that we can use it directly.
Also gets rid of an 'inline' which doesn't make sense here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index bf49dbd09cab..033bdfc83e42 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -115,7 +115,7 @@ static irqreturn_t sh_rtc_alarm(int irq, void *dev_id)
 	return IRQ_RETVAL(pending);
 }
 
-static inline void sh_rtc_setaie(struct device *dev, unsigned int enable)
+static int sh_rtc_alarm_irq_enable(struct device *dev, unsigned int enable)
 {
 	struct sh_rtc *rtc = dev_get_drvdata(dev);
 	unsigned int tmp;
@@ -132,11 +132,7 @@ static inline void sh_rtc_setaie(struct device *dev, unsigned int enable)
 	writeb(tmp, rtc->regbase + RCR1);
 
 	spin_unlock_irq(&rtc->lock);
-}
 
-static int sh_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
-{
-	sh_rtc_setaie(dev, enabled);
 	return 0;
 }
 
@@ -457,7 +453,7 @@ static void __exit sh_rtc_remove(struct platform_device *pdev)
 {
 	struct sh_rtc *rtc = platform_get_drvdata(pdev);
 
-	sh_rtc_setaie(&pdev->dev, 0);
+	sh_rtc_alarm_irq_enable(&pdev->dev, 0);
 
 	clk_disable(rtc->clk);
 }
-- 
2.45.2


