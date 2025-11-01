Return-Path: <linux-renesas-soc+bounces-23965-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC7C2747A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 01:45:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72FE74205E8
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 00:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64D9F1EC018;
	Sat,  1 Nov 2025 00:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XTJXexuE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94C34D387;
	Sat,  1 Nov 2025 00:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957914; cv=none; b=ZEIaDpiQx2cFcBXZMNb8t+epn83dYOdeBQxaEhOmPk59ijHnD+nyK8H2f8z1XFQwSRsEDoBE8+18w1hko1V9dOaPMfZ6gDdAnbhblliQrtNfd6opPCQ+n6DwzySvpTesiFK+xj2q0iXV5cMnnazdVbUJQlWr5+JNzUF5RgFQzIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957914; c=relaxed/simple;
	bh=bPDRA39AMGijEr/F0ZVGd4wstedUgrZ02mKZabeRt8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oi+YzF6Iik2yUoGfqr8HOkqzBoqsNFttGPWUMdUJxQLvNJw8xBYGdorzJZxjrrs6kM12jQi62JXcyjOBKzkcfXnEfc4BVvaN3IIlJi4JOYZX3T/9fvmJfPNZ5N0QxY2wxDopWlD6MNJdxFKFm24BQS9r65n0n09I0w0lp3Mo2AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XTJXexuE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1025DC0E964;
	Sat,  1 Nov 2025 00:44:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C4F46070B;
	Sat,  1 Nov 2025 00:45:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 66CB21181ABB0;
	Sat,  1 Nov 2025 01:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IWoFmTgj8NX7O1NsecPxWoINumPPI8umaHSHSRynp3c=;
	b=XTJXexuE41/x5yWVZJCM4J/2oIcHRNTmR+fmnbF+zjlqKRE4A1k1JxjKI1biod85mg7x+q
	6YefOj7N5iDAHAnyMfzwAr32v7tUhNgv2HEHORBgkNHRkDEleAWtj2YgUHwJjbM+54bwpp
	8fKV9OSToPyNz9Va0tl5pdIkKxGwjrtXY0YJqX3jD1MJ++GeQlk2rYAkaE4940r2nxdMmd
	JQBcLnh4oaUVtgZbEMvrZ6Q0cj8D7QWzjEihYswjcKk9qdMK+LuMj95BawEUa5m5J4/DUI
	3zmwCGSUYk6NCwHqYku4BQIPhOtOFoZ4fQ2A06y/1IZqJJqf1iMH/Q47pLgM3A==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:03 +0100
Subject: [PATCH 01/11] rtc: sa1100: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-1-c9a274fd6883@bootlin.com>
References: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
In-Reply-To: <20251101-max_user_freq-v1-0-c9a274fd6883@bootlin.com>
To: Joshua Kinard <linux@kumba.dev>, 
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

max_user_freq has not been related to the hardware RTC since commit
6610e0893b8b ("RTC: Rework RTC code to use timerqueue for events"). Stop
setting it from individual driver to avoid confusing new contributors.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-sa1100.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
index 1ad93648d69c..26b2f4184ecc 100644
--- a/drivers/rtc/rtc-sa1100.c
+++ b/drivers/rtc/rtc-sa1100.c
@@ -40,8 +40,6 @@
 
 #define RTC_DEF_DIVIDER		(32768 - 1)
 #define RTC_DEF_TRIM		0
-#define RTC_FREQ		1024
-
 
 static irqreturn_t sa1100_rtc_interrupt(int irq, void *dev_id)
 {
@@ -202,7 +200,6 @@ int sa1100_rtc_init(struct platform_device *pdev, struct sa1100_rtc *info)
 	}
 
 	info->rtc->ops = &sa1100_rtc_ops;
-	info->rtc->max_user_freq = RTC_FREQ;
 	info->rtc->range_max = U32_MAX;
 
 	ret = devm_rtc_register_device(info->rtc);

-- 
2.51.1


