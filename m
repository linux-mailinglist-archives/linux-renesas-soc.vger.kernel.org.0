Return-Path: <linux-renesas-soc+bounces-23966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D04C27483
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 01:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EBC744E0EED
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 00:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF65F1F91C8;
	Sat,  1 Nov 2025 00:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2F1E6Bpt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54241E89C
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957914; cv=none; b=ChXw+CU7Ox1nZMx8h7tZb+2Nv5kKlo1pVMKPv6qOvhyMJqUS4HYdkuv4MlARuo1h4qeYShgnSTP5/TAWhPyEhFqw2HVK90fMkUWWf6pJGsTRnDnHjBYI1IRWVdAbmO89sd9D6WuKkN4Ds4Hz0Lcyu0Ei08wQIhXIsFnHmBueYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957914; c=relaxed/simple;
	bh=Hp7qc3W8zHx5BjX2uw9UknBJdIDnl0H5unrLfP4AWyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SazDBkY/WUJWJKa567Bb3nU5hRujdbeY8mpRkQf/c+/gy7vPiTo9CKFRr4I0A+SCs3e/2fSYW8xo+oMpl0zNiCsUp1yY7mj71AjxgG8TvogCWaEs5EO6Vd8gXdb6G5YguHtTeT2typ3Au3WlSPDuodDCo2uwlXqyx3MH/qnVpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2F1E6Bpt; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 312294E41459
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 07EED6070B;
	Sat,  1 Nov 2025 00:45:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 156E71181ABB0;
	Sat,  1 Nov 2025 01:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FwZ98ZMyqKR4GwNmGRjh6+TVLupgXCI0Xx1xIMNf2Tc=;
	b=2F1E6Bpt6P14InlhIREs+3na2XBFZtI4bIoiI/UzHJ6NR4pq7KTHZrFjK/S5peRXPqF0Ja
	OdOkSXld4VsY4MtFI3/AOhmYW2LADm7H5evtD4WImoGWa0AbGiUA5cGYs2BZxfT/FMixLK
	6PCcmGVMe58fL1+HELWB95SZTaHqXLE2XGMfDN+8nLCFjNPtMbDsseEaRdmMk1HK+JeCTl
	i/0Lt/XAu3nrcdmSBC0nXSn5RDMs9Njse3HE+V101cfMcyDXx1LlGYvqADKQAtSWbsNu6R
	e6TM2fjVDCBVwCLkVhEjQOe6k66LsBqi4tzFvvamTeDC0ZSArIrDY33UDqdemg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:04 +0100
Subject: [PATCH 02/11] rtc: ds1685: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-2-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-ds1685.c   | 3 ---
 include/linux/rtc/ds1685.h | 1 -
 2 files changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
index 97423f1d0361..5fc8e36b1abf 100644
--- a/drivers/rtc/rtc-ds1685.c
+++ b/drivers/rtc/rtc-ds1685.c
@@ -1268,9 +1268,6 @@ ds1685_rtc_probe(struct platform_device *pdev)
 	rtc_dev->range_min = RTC_TIMESTAMP_BEGIN_2000;
 	rtc_dev->range_max = RTC_TIMESTAMP_END_2099;
 
-	/* Maximum periodic rate is 8192Hz (0.122070ms). */
-	rtc_dev->max_user_freq = RTC_MAX_USER_FREQ;
-
 	/* See if the platform doesn't support UIE. */
 	if (pdata->uie_unsupported)
 		clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc_dev->features);
diff --git a/include/linux/rtc/ds1685.h b/include/linux/rtc/ds1685.h
index 01da4582db6d..8ec0ebfaef04 100644
--- a/include/linux/rtc/ds1685.h
+++ b/include/linux/rtc/ds1685.h
@@ -324,7 +324,6 @@ struct ds1685_rtc_platform_data {
 #define RTC_SQW_2HZ		0x0f	/*  0    1   1   1   1  */
 #define RTC_SQW_0HZ		0x00	/*  0    0   0   0   0  */
 #define RTC_SQW_32768HZ		32768	/*  1    -   -   -   -  */
-#define RTC_MAX_USER_FREQ	8192
 
 
 /*

-- 
2.51.1


