Return-Path: <linux-renesas-soc+bounces-18407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 67752ADBE49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 02:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B23B0188F6CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 00:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E331B224D6;
	Tue, 17 Jun 2025 00:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lfS1vp2u";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T4FlS+9D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E103E79CF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jun 2025 00:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750121479; cv=none; b=eRWZpJoty5fmUOg7Ow/K6Vxq7kK38LPE5l5hviBz6cGse9/M8F8Tz2o9wDFCyx3Fkgzq6qDIzWLRemouUDvTzSH1QwDvtIrRBJ16EZ0v8admCfL/sJg3m0x71H+Jvdi61I1ID8GDVo40ukjEwXZTkJqaMvD7sXACXVlxqCR+UpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750121479; c=relaxed/simple;
	bh=xDOsXpCKE0fGImCCT/Ty7hbhPrQ3yJOB55H1T8YwiLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ki7K4k0TtBX32V0EAmpRmF6YR2l8xWpk9eDh67Errs6F9fQLj2VSzyIIuJSrtFB2uJ6Ot2IHjY6yd5I/JtGu7hXA/gBe4glFQxKqFQ3DwMpg20yoWCuJF5Dv+60PeRXgJK5GmyMID66BQvwh0+WkotiWB+fwbSnBjlNz8728/94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lfS1vp2u; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T4FlS+9D; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4bLpGD0Jqgz9tbw;
	Tue, 17 Jun 2025 02:51:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvrwNGdIZSgJq5xWaqIiDKNV3AzrKgK1obvtMUj6EjM=;
	b=lfS1vp2u/vyPqSci6vIOHT0uon8iVtQ6TN1L7GzuzNpZKLMsiG+pitv6FZsG4BsQ5X6QPX
	4wr7tMcGOetpbtTNiQB21mUeSiCd+Tx0stq+fbrsAvlAMO93gog5WlIoEyYuDp9+IGc/Dm
	n5BHTgD37eFeLOwexXEe8+0PiO1DALOlsnhwHZKI3feolNqJy/DCAjtf13HGA52NDQsjVv
	o1ZhpeFj9i99b6EhvJKdv0WkFZsfJKxLYAGamn+E+2Eb7987s3ooUaoUtsgOuK3Wurh1HP
	mqGc5WQRJ5U9htWP6AwuNxkwfxPYCRbebxvM8b07M6AnvWJKgwiYt25HuLYR+w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750121474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zvrwNGdIZSgJq5xWaqIiDKNV3AzrKgK1obvtMUj6EjM=;
	b=T4FlS+9DmT+pchNlPNZzlMWopjehJh9nEHbFHunQfbDDB7V+imn0f4sQ14wnwewhd/Wup1
	1Ur80j57M5cY1Dl/+Jmr7NUJjMOLIRHVgtfinNMGfYYmBScIcAMCFcSlNUPFpSI4kyyjgl
	e8NMocb4Cf7mFPtNvsHhrYMhuzW1wIgjE3lg7dnfbijCT35judx3Y5+QHOZ82cBvJsGxkQ
	W853BlKNn6M2lF7OCnLnoWGLpffhehLgktW8s9JLRqO/TPmYoKtHc8eyRXCZPkx1TQMMdS
	5Cgj+FMZ5i2CgTLm9t2FxWWGaM0q5hTP/aGP9nqaPnhqx+gkW92SyGm+GTnRpw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
Date: Tue, 17 Jun 2025 02:50:25 +0200
Message-ID: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: nmug86pujzqqmcesapuay11to3qu6osh
X-MBO-RS-ID: e6a123acab8373b2a78
X-Rspamd-Queue-Id: 4bLpGD0Jqgz9tbw

Convert the driver from legacy PWM apply ops to modern waveform ops.
There is no functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Uwe Kleine-König" <ukleinek@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
---
 drivers/regulator/rpi-panel-v2-regulator.c | 50 +++++++++++++++++-----
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/rpi-panel-v2-regulator.c b/drivers/regulator/rpi-panel-v2-regulator.c
index 30b78aa75ee3..be42afc81d72 100644
--- a/drivers/regulator/rpi-panel-v2-regulator.c
+++ b/drivers/regulator/rpi-panel-v2-regulator.c
@@ -35,24 +35,52 @@ static const struct regmap_config rpi_panel_regmap_config = {
 	.can_sleep = true,
 };
 
-static int rpi_panel_v2_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
-				  const struct pwm_state *state)
+static int rpi_panel_v2_pwm_round_waveform_tohw(struct pwm_chip *chip,
+						struct pwm_device *pwm,
+						const struct pwm_waveform *wf,
+						void *_wfhw)
 {
-	struct regmap *regmap = pwmchip_get_drvdata(chip);
-	unsigned int duty;
+	u8 *wfhw = _wfhw;
+
+	*wfhw = DIV_ROUND_CLOSEST_ULL(wf->duty_length_ns * PWM_BL_MASK, wf->period_length_ns);
+
+	return 0;
+}
 
-	if (state->polarity != PWM_POLARITY_NORMAL)
-		return -EINVAL;
+static int rpi_panel_v2_pwm_round_waveform_fromhw(struct pwm_chip *chip,
+						  struct pwm_device *pwm,
+						  const void *_wfhw,
+						  struct pwm_waveform *wf)
+{
+	const u8 *wfhw = _wfhw;
+
+	/*
+	 * These numbers here are utter fabrications, the device is sealed
+	 * in metal casing and difficult to take apart and measure, so we
+	 * pick some arbitrary values here, values which fit nicely.
+	 */
+	wf->period_length_ns = 100 * 1000;	/* 100 us ~= 10 kHz */
+	wf->duty_length_ns = *wfhw * 1000;	/* 0..100us */
+	wf->duty_offset_ns = 0;
+
+	return 0;
+}
 
-	if (!state->enabled)
-		return regmap_write(regmap, REG_PWM, 0);
+static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
+					   struct pwm_device *pwm,
+					   const void *_wfhw)
+{
+	struct regmap *regmap = pwmchip_get_drvdata(chip);
+	const u8 *wfhw = _wfhw;
 
-	duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
-	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
+	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_ENABLE : 0));
 }
 
 static const struct pwm_ops rpi_panel_v2_pwm_ops = {
-	.apply = rpi_panel_v2_pwm_apply,
+	.sizeof_wfhw		= sizeof(u8),
+	.round_waveform_fromhw	= rpi_panel_v2_pwm_round_waveform_fromhw,
+	.round_waveform_tohw	= rpi_panel_v2_pwm_round_waveform_tohw,
+	.write_waveform		= rpi_panel_v2_pwm_write_waveform,
 };
 
 /*
-- 
2.47.2


