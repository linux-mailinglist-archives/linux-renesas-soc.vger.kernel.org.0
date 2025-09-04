Return-Path: <linux-renesas-soc+bounces-21385-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB39B44738
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78EA31C2828A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5586427FB1E;
	Thu,  4 Sep 2025 20:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VCefIifk";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xf0QWvbr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E75827F183;
	Thu,  4 Sep 2025 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017345; cv=none; b=taVV9eVeZOIEoSbo+ZVJ7rmLHDDv67dnJ2ZxI03YnjuCl5HhusVN3cKOBL6+g0Mn44dsGjDen3/f2i/pVhZ6gqpaSl/4K7+LOKX9y0ysj6aPhF/beD3ijgzsrg8Uv9+1rCdK+nK6UKe7MzJUk844Cnl5byk76nuDjkrpNcdahxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017345; c=relaxed/simple;
	bh=w6Chw6LF/sedA+e1aX3TzkOCNEWHgEGeNJiKHIFlsJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgQWgoslzkCsOwWByt6aA9RIOmR2A6YW8IOsdtP6Pt6jrZoMgRCHsYTC9DlcXZ9yVCuJVLbmV+ln+clmY71P7y4fsfaKqHefNTBdv3EHW5Poox/Ps1P6toqV9Jkw9nl3lNjkMsqUs7RVnqhOV7dbPB9uyQCZ7RWrm+cKgeWenQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VCefIifk; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xf0QWvbr; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4cHrW04NfWz9tcR;
	Thu,  4 Sep 2025 22:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnbLlgm2n1ZDr06QGenfkPonttS4Jevyk7nGejqyWWY=;
	b=VCefIifkbkogE/JX7Jt4amyys4lKr5PaCj4U0XtGaNsukbD4y9gTsenWv8daKsN3U8wZNa
	LRhGJtC53zCNKFY09P9lRf/wAabZbbSpLQpbU+Affax3s5s7ajPUjTvPN7xCAzbwfPCmAL
	//bh9cwa6ruj1+9P6vQA+nFNAnD4oyTk1dCGY6CNh6xlP3iu4zUQor11xhtj52c09LpjYp
	V56T/bFPoFzhUWit5+q7pw37JCOp1TwvUrVt9IUemUJltIaK77BO0tvTCIhbQp7KbVAsHN
	yajK5ub0SFMFXOpPwUKY2lGBS0zOmIstsEB6Mg9ouwzn8bWbrIw/P3S1het1Sw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rnbLlgm2n1ZDr06QGenfkPonttS4Jevyk7nGejqyWWY=;
	b=xf0QWvbrgCfFAE0wyZyyeZX4gvKTYGTeBlbT/Zurbrv4fBd7/ABITbAm/Gazs8ApVYZuoA
	3aO1LIVKz126klf6LuyyTClvh/UUeiu0fiets5vFDxO398R3utTKMuP3bDKbtwklOQ/qG7
	69OkoNM/emq4vCceuTeXKtT5y76D9q2ztnG68wxZ5X1lbki/J+fXuxG5AK1dJHXnwz+zpK
	uz/U45ujBqmJFzmC0WbeOBI/grWoKN/0JWG80WvQAm7CskTmAFQVErC5QYrrobHH3kfGxp
	NYuP4cM2vvRxg6plKWXJKL0ttEgTuzoNa3aPmKqMXm7VkEBc7V9/kSVz1a13ZQ==
To: linux-hwmon@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Akinobu Mita <akinobu.mita@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [RESEND PATCH 2/2] hwmon: (pwm-fan) Implement after shutdown fan settings
Date: Thu,  4 Sep 2025 22:21:10 +0200
Message-ID: <20250904202157.170600-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
References: <20250904202157.170600-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xcdw7da4fwak5w1hp86nujkuo1xujqdu
X-MBO-RS-ID: e0a82f404da6ba04d45

Add fan-shutdown-percent property, used to describe fan RPM in percent set
during shutdown. This is used to keep the fan running at fixed RPM after
the kernel shut down, which is useful on hardware that does keep heating
itself even after the kernel did shut down, for example from some sort of
management core. The current behavior of pwm-fan is to unconditionally
stop the fan on shutdown, which is not always the safe and correct thing
to do, so let the hardware description include the expected behavior.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Akinobu Mita <akinobu.mita@gmail.com>
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
index d0fe53451bdf8..37269db2de84f 100644
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
2.50.1


