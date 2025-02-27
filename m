Return-Path: <linux-renesas-soc+bounces-13769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED167A47FE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 14:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC75E3B4DD2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Feb 2025 13:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0173E233D89;
	Thu, 27 Feb 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S3FUzG8Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E423314E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Feb 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740663820; cv=none; b=XaMKp4aatfJE9oI+aaH0b1XJ9qzdJD/yBzpSMWkrOXb/+h2bvgFNQICS73Bd1A7C2xnXqfEjvjcX5vBUGoIb/qmqiq/Ve1ecIx4R5p678hY1a7wZHlAI5UmtItLHGkgFeGy8hbnYAmjzqIQTu7jH4/Pf+QfkhLjqLxohqJgoeh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740663820; c=relaxed/simple;
	bh=vAFzxwkXeTzesQ+x3tdBqDDfeRpINbz2vW0aMsCwE64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOijOezlIqyw1E2DppzAmoVxvt8By3CN4CBUOWoMDFXbP4+lV8VeTitQSVkHaZ30CUinP2zRHVRGUp35wtbjLHdOpKNZl8r9HLaa5dY5gSUSHBzcnFmJaVY9UoS/2zn59yBkRkkR/8sWCEy7EGtjyM72x36MONMiLvHZDB3r9jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S3FUzG8Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=/+X4d+2tCAXnFT+wF0nRgsn1iikYvQLvyAR0+y9C9ls=; b=S3FUzG
	8QIVyI/z2bJomT0FZMsP6m01mRlqp6YxllY87Ddlf84l1QJ6069JE+/75OE3MMf5
	8YxrqzXy14RQjPipz6FBMNeG41V5ZgvdlMA/ntnEk5Z6avhJ5tLp88H9h7Oc9V7k
	+Qu4k0jnWCFU8o1LRepzifhjB1fJdE6I8jO/1pC6sL1Cu2DR2NovCoL0f3e63RdF
	n7CD8wKOiReebW7bEyKdtqcPb/RzhgZX+0HLWksPegSXXIogcFI1Vn6wLhNV4G3b
	96QWhQvtr3umpS/OIDR06Ou+vIT/jSupp9Se90eJ8Ql8I1hsHgj0kzHcRgmK/tAt
	oumI4bvqTAfN/eGw==
Received: (qmail 962451 invoked from network); 27 Feb 2025 14:43:35 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Feb 2025 14:43:35 +0100
X-UD-Smtp-Session: l3s3148p1@mYtl4B8vPGJtKPD9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 7/8] rtc: sh: use local variables in probe() for mapping IO
Date: Thu, 27 Feb 2025 14:43:02 +0100
Message-ID: <20250227134256.9167-17-wsa+renesas@sang-engineering.com>
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

No need to store the resource for the registers in the per-device struct
because we only need it during probe. Remove some unneeded unlikely()
while here and correct the type of 'regsize'.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/rtc/rtc-sh.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 033bdfc83e42..3bafb2a0659d 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -86,8 +86,6 @@
 
 struct sh_rtc {
 	void __iomem		*regbase;
-	unsigned long		regsize;
-	struct resource		*res;
 	int			alarm_irq;
 	struct clk		*clk;
 	struct rtc_device	*rtc_dev;
@@ -328,10 +326,11 @@ static const struct rtc_class_ops sh_rtc_ops = {
 static int __init sh_rtc_probe(struct platform_device *pdev)
 {
 	struct sh_rtc *rtc;
-	struct resource *res;
+	struct resource *res, *req_res;
 	char clk_name[14];
 	int clk_id, ret;
 	unsigned int tmp;
+	resource_size_t regsize;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (unlikely(!rtc))
@@ -353,20 +352,18 @@ static int __init sh_rtc_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
 	if (!res)
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (unlikely(res == NULL)) {
+	if (!res) {
 		dev_err(&pdev->dev, "No IO resource\n");
 		return -ENOENT;
 	}
 
-	rtc->regsize = resource_size(res);
-
-	rtc->res = devm_request_mem_region(&pdev->dev, res->start,
-					rtc->regsize, pdev->name);
-	if (unlikely(!rtc->res))
+	regsize = resource_size(res);
+	req_res = devm_request_mem_region(&pdev->dev, res->start, regsize, pdev->name);
+	if (!req_res)
 		return -EBUSY;
 
-	rtc->regbase = devm_ioremap(&pdev->dev, rtc->res->start, rtc->regsize);
-	if (unlikely(!rtc->regbase))
+	rtc->regbase = devm_ioremap(&pdev->dev, req_res->start, regsize);
+	if (!rtc->regbase)
 		return -EINVAL;
 
 	if (!pdev->dev.of_node) {
-- 
2.45.2


