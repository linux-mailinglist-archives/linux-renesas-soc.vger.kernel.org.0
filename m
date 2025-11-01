Return-Path: <linux-renesas-soc+bounces-23969-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8232AC274A1
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 01 Nov 2025 01:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 66C8E4EB8A7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  1 Nov 2025 00:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4F972236E1;
	Sat,  1 Nov 2025 00:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="okML6Mft"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DE12080C0
	for <linux-renesas-soc@vger.kernel.org>; Sat,  1 Nov 2025 00:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761957917; cv=none; b=uNYd3AlL4j877U/GEo5Wji0xdowj/MIU8qqyzOM7V9PpAs093knSHslokZLgEx9eCGMH8sru1AJyT7O00SHxnSTzwjlYyUxSdL7jqecEzue0NHlnlHCEOjT5dTPSxHJDKNCta05CUADYlLrybh+GfxG6V+UmfsDPG7NUnoNUQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761957917; c=relaxed/simple;
	bh=7DU3Gb5mwsAeENslrMgvCkryaEbOjjfdSj/H9XV0hlA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NriGdGsw+k/vLP7MewOUwv6MzkuUGIFPO/jvi+TDME8AajwKtEpzf44k4KL1CTLAxuwvXZjsQGosSfa+BXrIdHHk7ApP8N4CZMub4gkOmtOYsGKe5b/B8rxqFRhVrOTWSASfS1ODnF+kDbaZp3ahklkdtAYYFktjlDFE3y4V5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=okML6Mft; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C2B3FC0E969;
	Sat,  1 Nov 2025 00:44:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 57FBB6070B;
	Sat,  1 Nov 2025 00:45:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A99C1181ABB0;
	Sat,  1 Nov 2025 01:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761957913; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=e2RdZS4TbDlJ0vf5dfnSXerXLEXyBmJL02eBs2hVtXc=;
	b=okML6MftxczWzrG2b6rZoDJvlqq+VkxyoC/NZ2gIU9BRYfSkw+uO9UGClgAEO2G0TqUCj+
	bj6S4ue80eaAUKtpB1Gm/W2FogwLC7rtO3mZPIaFnzBvDQC/7OdwQlfXoVO8TVSns4I9QH
	Y+OZpgiw8Vjga+T8EfWSGxWfJlzfHtt8Wof2NlucnWik6Rh7zaKGWjoL7b6xz+5P2ePHA+
	V0SQRxnf8FuWev/Ck0CuNVRVUm/le/hamOD1On1tnFYirDDO9oIiM5oLrKphJgfFtdyFD/
	mQq+DyreZnieTUWUZitTw1dBYtIfbpIGIlBkkdn9fxZlsu1cAkCi4MW9WgY7Dg==
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Sat, 01 Nov 2025 01:45:07 +0100
Subject: [PATCH 05/11] rtc: rv3028: stop setting max_user_freq
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-max_user_freq-v1-5-c9a274fd6883@bootlin.com>
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
 drivers/rtc/rtc-rv3028.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index c2a531f0e125..d96f6bb68850 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -1023,8 +1023,6 @@ static int rv3028_probe(struct i2c_client *client)
 	eeprom_cfg.priv = rv3028;
 	devm_rtc_nvmem_register(rv3028->rtc, &eeprom_cfg);
 
-	rv3028->rtc->max_user_freq = 1;
-
 #ifdef CONFIG_COMMON_CLK
 	rv3028_clkout_register_clk(rv3028, client);
 #endif

-- 
2.51.1


