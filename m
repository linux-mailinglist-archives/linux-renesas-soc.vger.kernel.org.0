Return-Path: <linux-renesas-soc+bounces-17497-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41419AC3D79
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 11:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0150C7A7668
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 May 2025 09:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99EE1F3B87;
	Mon, 26 May 2025 09:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PTUXBxSd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C81F3BAC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 May 2025 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253504; cv=none; b=FVv2v4+/jKjBA/9s2vQsOKcvFaW/XVYh52NgXk6Qq5DB99JkjMcHiRb++wKzhLmloTJQGd2tg4mywWO1gBUe5vfG3uiXCRIAOveGvTSyuyiZnliCnXo4vZktTlG5nFmqkfzMN/63Mg7N0Eo7dj/5RBapp3l4XvkgRnrmOTnBXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253504; c=relaxed/simple;
	bh=52t0WkM0nNFCxz9RQVOLQxvjKW92aB97gbaLS0yhpAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdreULWnDTTRYMOXHUDWY81j3s31BArsXb7KOa9O3SrQhMKH/uRUSHpnF9WjI9HA7Swba3QtuJTKh9MjoUoAca21yKBBWugwyqhA/3wBrF1aElpSbh/CB5g0oi1cyCE8F2ujPWea+Z9JI5pyzSHGiD5QbV+05/d4S76tdluGmOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PTUXBxSd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4wQHsjv1BfpPaCGFuYm3Mq6iRYBKzjHe1tZgJkIqu4M=; b=PTUXBx
	SdoBErQPA36RWfplMWqCN6wnDZJzVuhYKFZdJ/6b8coTArMbsB9xjpKtlY4nd2jm
	4iOib341lluMbvtw00xJbNxTG19Tc9VzkiaqFSCXfRUmu+IyRmcSFwN4C06cIJTv
	YG5Zqj69epPNSU1WaWkEWX5pkXv5UndkrvndRPFJWNMCHYOK089rynxGjPMGFxuL
	EBehVNxuoWR2qPm+CnGyqTQgARG6My+ckphSFtjBwvbxQxJ9d+CFr+7qWiylGelt
	joYC10vn2MKP3DwvnRFLVbfvMsi2AbhVbMn/oXMFm2jgt4WJMXjtAdOTzHPv8Mdi
	t1XnkNGU+ySaOyqg==
Received: (qmail 769292 invoked from network); 26 May 2025 11:58:19 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 May 2025 11:58:19 +0200
X-UD-Smtp-Session: l3s3148p1@yI/Q/AY2bSptKPCv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH v3 3/3] rtc: rzn1: support input frequencies other than 32768Hz
Date: Mon, 26 May 2025 11:58:04 +0200
Message-ID: <20250526095801.35781-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
References: <20250526095801.35781-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using the SCMP mode instead of SUBU, this RTC can also support
other input frequencies than 32768Hz. Also, upcoming SoCs will only
support SCMP.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/rtc/rtc-rzn1.c | 58 +++++++++++++++++++++++++++++++++---------
 1 file changed, 46 insertions(+), 12 deletions(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 7777df1e3426..c4ed43735457 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/bcd.h>
+#include <linux/clk.h>
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
@@ -22,7 +23,6 @@
 #include <linux/spinlock.h>
 
 #define RZN1_RTC_CTL0 0x00
-#define   RZN1_RTC_CTL0_SLSB_SUBU 0
 #define   RZN1_RTC_CTL0_SLSB_SCMP BIT(4)
 #define   RZN1_RTC_CTL0_AMPM BIT(5)
 #define   RZN1_RTC_CTL0_CEST BIT(6)
@@ -50,6 +50,8 @@
 #define   RZN1_RTC_SUBU_DEV BIT(7)
 #define   RZN1_RTC_SUBU_DECR BIT(6)
 
+#define RZN1_RTC_SCMP 0x3c
+
 #define RZN1_RTC_ALM 0x40
 #define RZN1_RTC_ALH 0x44
 #define RZN1_RTC_ALW 0x48
@@ -357,7 +359,7 @@ static int rzn1_rtc_set_offset(struct device *dev, long offset)
 	return 0;
 }
 
-static const struct rtc_class_ops rzn1_rtc_ops = {
+static const struct rtc_class_ops rzn1_rtc_ops_subu = {
 	.read_time = rzn1_rtc_read_time,
 	.set_time = rzn1_rtc_set_time,
 	.read_alarm = rzn1_rtc_read_alarm,
@@ -367,12 +369,21 @@ static const struct rtc_class_ops rzn1_rtc_ops = {
 	.set_offset = rzn1_rtc_set_offset,
 };
 
+static const struct rtc_class_ops rzn1_rtc_ops_scmp = {
+	.read_time = rzn1_rtc_read_time,
+	.set_time = rzn1_rtc_set_time,
+	.read_alarm = rzn1_rtc_read_alarm,
+	.set_alarm = rzn1_rtc_set_alarm,
+	.alarm_irq_enable = rzn1_rtc_alarm_irq_enable,
+};
+
 static int rzn1_rtc_probe(struct platform_device *pdev)
 {
 	struct rzn1_rtc *rtc;
-	u32 val;
-	int irq;
-	int ret;
+	u32 val, scmp_val = 0;
+	struct clk *xtal;
+	unsigned long rate;
+	int irq, ret;
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (!rtc)
@@ -395,7 +406,6 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	rtc->rtcdev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc->rtcdev->range_max = RTC_TIMESTAMP_END_2099;
 	rtc->rtcdev->alarm_offset_max = 7 * 86400;
-	rtc->rtcdev->ops = &rzn1_rtc_ops;
 
 	ret = devm_pm_runtime_enable(&pdev->dev);
 	if (ret < 0)
@@ -404,10 +414,24 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	/*
-	 * Ensure the clock counter is enabled.
-	 * Set 24-hour mode and possible oscillator offset compensation in SUBU mode.
-	 */
+	/* Only switch to scmp if we have an xtal clock with a valid rate and != 32768 */
+	xtal = devm_clk_get_optional(&pdev->dev, "xtal");
+	if (IS_ERR(xtal)) {
+		ret = PTR_ERR(xtal);
+		goto dis_runtime_pm;
+	} else if (xtal) {
+		rate = clk_get_rate(xtal);
+
+		if (rate < 32000 || rate > BIT(22)) {
+			ret = -EOPNOTSUPP;
+			goto dis_runtime_pm;
+		}
+
+		if (rate != 32768)
+			scmp_val = RZN1_RTC_CTL0_SLSB_SCMP;
+	}
+
+	/* Disable controller during SUBU/SCMP setup */
 	val = readl(rtc->base + RZN1_RTC_CTL0) & ~RZN1_RTC_CTL0_CE;
 	writel(val, rtc->base + RZN1_RTC_CTL0);
 	/* Wait 2-4 32k clock cycles for the disabled controller */
@@ -416,8 +440,18 @@ static int rzn1_rtc_probe(struct platform_device *pdev)
 	if (ret)
 		goto dis_runtime_pm;
 
-	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | RZN1_RTC_CTL0_SLSB_SUBU,
-	       rtc->base + RZN1_RTC_CTL0);
+	/* Set desired modes leaving the controller disabled */
+	writel(RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
+
+	if (scmp_val) {
+		writel(rate - 1, rtc->base + RZN1_RTC_SCMP);
+		rtc->rtcdev->ops = &rzn1_rtc_ops_scmp;
+	} else {
+		rtc->rtcdev->ops = &rzn1_rtc_ops_subu;
+	}
+
+	/* Enable controller finally */
+	writel(RZN1_RTC_CTL0_CE | RZN1_RTC_CTL0_AMPM | scmp_val, rtc->base + RZN1_RTC_CTL0);
 
 	/* Disable all interrupts */
 	writel(0, rtc->base + RZN1_RTC_CTL1);
-- 
2.47.2


