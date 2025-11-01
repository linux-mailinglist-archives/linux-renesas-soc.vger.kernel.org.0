Return-Path: <linux-renesas-soc+bounces-23974-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A34C274D4
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 01:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5F1714ED917
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 00:46:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3A8246763;
	Sat,  1 Nov 2025 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AkQ5uQ3E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A67423C4F3
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957922; cv=none; b=f6umUZsk79BZMThjsVpRgbm3X3VZM+WO30Ym/lV2BrdDSkZZRJw8oJlUb6i+qx95769adnuXr9QeCPmYsZTt8Kar43394xk8PXSr3V0Wmjo+xDRJdrCpF3gr5snJ67o89hhF8KJTUrlPi+2tYoaheH+BpRuWg6e7O5F7EA76iI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957922; c=relaxed/simple;
	bh=1f6MR0MiAHQdxR7gpnJkL5A1h0+6bW3LcsOnk0DeMKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ssyJvPB1zofmO9+oVwQPzrOKzMOUSmJJhl9xaTV6HcndZ6uAoc/ih0apDy4qsr5UZp166CmEWifUmAVUjkW7W91IuhFdI/0ZYlXCpIsIQ/oQIow9s4HcDq9ax0hTQ2dLauR++fPKcdNyVzY3N+SMgArZE6PSOBYVU06CSCqJHbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AkQ5uQ3E; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 28351C0E963;
	Sat,  1 Nov 2025 00:44:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B30A86070B;
	Sat,  1 Nov 2025 00:45:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA1911181ABB0;
	Sat,  1 Nov 2025 01:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=plz341VcZ204tSoODz8pylkp/qt2TMoiA4BDjs1J680=;
	b=AkQ5uQ3EP8GULGLHklk7NASbY0MWH4a2cDxolDspFTAoPNxHo+TIHljnR0368xOCs3Ee7Q
	eoFlhMdMupUYsyP9KEmVmj8GZcagZ/kZxqGBs9x1qCe6bBrHin+RVSTlTlO04mMAXSRzpU
	GeSUmtR7AGiiFnepfXR5p7rdY6kcRHxz+S9r3qHal3TsOIkF6PAi6tLZgA9n7mc51KR2JK
	UU2f3wFedca7X1azAYbyo5GLrEA+CeAMFV31HMhcRjLWxbefMnDjeVp/sUzcz0xAw9/40+
	yCxI2oPjKlGyu0Jb6zBYqOKHPiC6HoUKLCi2XiS8A9RGJTxbJJoJI35WBgViVg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:12 +0100
Subject: [PATCH 10/11] rtc: rx8025: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-10-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-rx8025.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index aabe62c283a1..07119985fa83 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -565,8 +565,6 @@ static int rx8025_probe(struct i2c_client *client)
 			clear_bit(RTC_FEATURE_ALARM, rx8025->rtc->features);
 	}
 
-	rx8025->rtc->max_user_freq = 1;
-
 	set_bit(RTC_FEATURE_ALARM_RES_MINUTE, rx8025->rtc->features);
 	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rx8025->rtc->features);
 

-- 
2.51.1


