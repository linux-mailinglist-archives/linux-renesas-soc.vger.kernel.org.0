Return-Path: <linux-renesas-soc+bounces-18905-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C82E8AED197
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Jun 2025 00:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D075118919EC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Jun 2025 22:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C4023FC5F;
	Sun, 29 Jun 2025 22:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="NvRHFZAf";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fTK5rAcc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11634199E9D;
	Sun, 29 Jun 2025 22:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751235219; cv=none; b=N7OFES3WPHbADRg7aeFgr+eI7fbhPcnl5WnPUh0rpDbgaYRQO7zvJIgqpfp4WxTjOPupRvBxGb6Fjb5fCKmhOgWzxKaGgs4pgKAVNpgGK0TB2UHTkNVBP/81/UbPJBfPg5UEdTlOZACLnm1Y19WnKb8oGVWvPhGggFgOl5c2zqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751235219; c=relaxed/simple;
	bh=mhNsrq/FL3GGGBxirI66EyCfOeGnfH0YLll+6hJYwQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIfEiS/u5lDATKR7tvWGADK+9X70TKD2bXtfh9cvLw5gbrtO2FzKQsGqEOzPIzE24Q/qxUfSIAOe+RTF0iw4ewTnjqIufeKouYyhKcPcRusrOflcvAO285Ma6H5f+gF2NnUZFMjPcEU8QIvO8vpqtwQSJ2aVh64Hk8fPqKcTRZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=NvRHFZAf; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fTK5rAcc; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bVjwV4DN8z9syG;
	Mon, 30 Jun 2025 00:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751234602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHRWcFYqtVchRtwkkdbmCtC4/un5G7pRG+gJHdVdxTc=;
	b=NvRHFZAfoSpPpAhiiqTE11VpVMme/BgartJW0ploezjByKJ/gbLkpfZGB4THqdkfi6D79/
	LwD+//EhS2AwLYXcmqwDZZ8uitnxhymCuYQ6BleDXy7TFfPBLp+VVhw4MjsxqsEfnILR1L
	5L2l5r1HsQQI3TOdI9l4omMVmfK2PkQfI9UxQxlP3B1CuqX32lzC5g6nJ9Wc0CxftJ/wNk
	K4mSmY8YeJ/yV/pqfChXBomB6XCt2q2toGcKNGDjMZYsRNmMiDQEehNH5N1KWR/AJMmKMx
	oLp2lDFyuXHsy6IB6lE414e4fFs/jKGPSG1aS8RDLWs6UthnCPIZmsHns3utKA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1751234600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EHRWcFYqtVchRtwkkdbmCtC4/un5G7pRG+gJHdVdxTc=;
	b=fTK5rAccx5JbODnYQ4QD1gGVklSxLkH0dQWN4MVIQUuxI1l43lZyI9MDIEf/84HVeZwy6B
	Cp1IOnzW+QjUj72neRx6bED1cAWz5QCiyUAkiRZERzZCjANC+5H0uL6b707ilvPI+7GnBh
	9i50a8eGqxIyc9WWEChfGVlMr1/oABXEZ/k3+DNfyV64hLNpZXNADJ3N46yNy/mRvecKuW
	00p6Fepm/4QvmJT7B4jWUUPx0ER7xi4WLfqcRP4XhQNvVBsGvjZL2F/kEJTre33/Icv1jR
	HEpNDYNVI0I+C3DwI5+JAMnoPCtgF3rjTIkLT3cOFYD4OMr9Y9ibV2RZbG8c2Q==
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (pwm-fan) Implement after shutdown fan settings
Date: Mon, 30 Jun 2025 00:02:09 +0200
Message-ID: <20250629220301.935515-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>
References: <20250629220301.935515-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: rb87y51i17msgp16gxdb9wmgjfs53d3n
X-MBO-RS-ID: f192539e5e37403a79a
X-Rspamd-Queue-Id: 4bVjwV4DN8z9syG

Add fan-shutdown-percent property, used to describe fan RPM in percent set
during shutdown. This is used to keep the fan running at fixed RPM after
the kernel shut down, which is useful on hardware that does keep heating
itself even after the kernel did shut down, for example from some sort of
management core. The current behavior of pwm-fan is to unconditionally
stop the fan on shutdown, which is not always the safe and correct thing
to do, so let the hardware description include the expected behavior.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/hwmon/pwm-fan.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index d0fe53451bdf..37269db2de84 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -64,6 +64,7 @@ struct pwm_fan_ctx {
 
 	u64 pwm_duty_cycle_from_stopped;
 	u32 pwm_usec_from_stopped;
+	u8 pwm_shutdown;
 };
 
 /* This handler assumes self resetting edge triggered interrupt. */
@@ -484,9 +485,14 @@ static void pwm_fan_cleanup(void *__ctx)
 	struct pwm_fan_ctx *ctx = __ctx;
 
 	timer_delete_sync(&ctx->rpm_timer);
-	/* Switch off everything */
-	ctx->enable_mode = pwm_disable_reg_disable;
-	pwm_fan_power_off(ctx, true);
+	if (ctx->pwm_shutdown) {
+		ctx->enable_mode = pwm_enable_reg_enable;
+		__set_pwm(ctx, ctx->pwm_shutdown);
+	} else {
+		/* Switch off everything */
+		ctx->enable_mode = pwm_disable_reg_disable;
+		pwm_fan_power_off(ctx, true);
+	}
 }
 
 static int pwm_fan_probe(struct platform_device *pdev)
@@ -498,6 +504,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	int ret;
 	const struct hwmon_channel_info **channels;
 	u32 initial_pwm, pwm_min_from_stopped = 0;
+	u32 pwm_shutdown_percent = 0;
 	u32 *fan_channel_config;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
@@ -648,6 +655,11 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		channels[1] = &ctx->fan_channel;
 	}
 
+	ret = device_property_read_u32(dev, "fan-shutdown-percent",
+				       &pwm_shutdown_percent);
+	if (!ret && pwm_shutdown_percent)
+		ctx->pwm_shutdown = (clamp(pwm_shutdown_percent, 0, 100) * 255) / 100;
+
 	ret = device_property_read_u32(dev, "fan-stop-to-start-percent",
 				       &pwm_min_from_stopped);
 	if (!ret && pwm_min_from_stopped) {
-- 
2.47.2


