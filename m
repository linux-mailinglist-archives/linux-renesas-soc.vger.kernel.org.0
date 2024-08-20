Return-Path: <linux-renesas-soc+bounces-7949-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87055958414
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 12:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A934D1C2478A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2024 10:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A513518E76B;
	Tue, 20 Aug 2024 10:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZiXKEQOx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E69018E05E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 10:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724149180; cv=none; b=ILnD4vnfTJ1JXFsfIhDaIbDmwdFs22P+Zg4F11ecrpl2WH/yMWvP966kuvt5KZ5U6yHfYUXVw4xVpzSYDqQkGsmuBc7QGbwMdDn68kvRWPu/oDYvTo3wr903T/fpbVtY3xgh+SYo+bJyyVM5to6z0qTAqX0I+wwGZOWJz4u2a34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724149180; c=relaxed/simple;
	bh=Wr5nznH60aPy5RZ1toMDvv67f/JbqCseJWfH2M7+ODU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qo7xuyD1Hy+qnjMxf6vO2gOtwIm3oV0052Q68Zsq/8OBLgRa2gdF1lqxrs/HJELpVWlJAIfrXjl7tF3S9uO1auxGZV0tNZ2D7fLVFRccQacFy3hCJT2qGZwDrJWHRXnojohEwWFeA6sGTIFeBCQRi9K6IOF4cQ4gSgVUAEAqizc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZiXKEQOx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7a843bef98so595304966b.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Aug 2024 03:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724149177; x=1724753977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kP0OsNI0P+8dZfKavF7RqDgnlmT2Fdk1y9BAkCcY/5s=;
        b=ZiXKEQOxks/3QSN40RzMzs01z5ZIk6B3u860TULvW3IC1NTUNWgeULD5wCZOmn9E44
         meA0FeApB0/y6u6MHjyj0Ay9BUU3MQFOBxDIgXr5fs442GrQqI+wW2auUZxHiIiwUbRc
         TU0HEfK3XTptrcjpZ+VRp6fRxJGTJj2wMUkVbAJ/brknMkXR5GjotHHC4i66dTI880zK
         rQcdkXckFELgdSYzQzA9jadjL35JtuYFksBeL4e1jDjloqM0IuGts+KO0RYTUCjJWXzE
         uHu28Vo3nnpLAghqUwMPVRTvhPP45egNyLq1jPo07TXnRpNWNVGjlRuovlrdQxgendip
         qJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724149177; x=1724753977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kP0OsNI0P+8dZfKavF7RqDgnlmT2Fdk1y9BAkCcY/5s=;
        b=KfLmLAbfGbrG8hOcEPqYUBWBxBJp4IeTN3qUTa2l7sEYj1fOxnNj0jVnHtyLMTCgA8
         R23tRDEaqMaq0HOBmT2VMxKXds+yp0g02Jr5UJdcvd1Uf26kovBOPXLXTemAPXdJfee9
         i+O5u09hznP63wQAUFWm3QsU8201WOtVG0ru77P5RldL/JNPdgx1WBw7E2ox/LR6kKYv
         U4e7XDJOCVOqos/5cFBn9ankZ1ElI/YfEm4LvnsowGPQdV9wF3kfE8RidHyuGO25Fmew
         8MOlUwVhMjNZwAEhQt1fnoIC9dT991c7K8iFoeMPYQW28erIDqqyr6FeJQUsxN3Exb6J
         bCUQ==
X-Gm-Message-State: AOJu0YxyPBYzMUdOsySyGlfYkNhw+aXsEoKbe3DPmO51ikUlOnmPWddd
	6UlUENq/M8IJ7x/lUe8WpXvOMIHoEK2aM0lH/1qp2/wXArlb/Np0ict3x4oh+oWvQdnAZqXaB/6
	H
X-Google-Smtp-Source: AGHT+IEer6zUIkK9BunJKsfiVnr14g7TQUujSD8dQthJ3M69JW4ySk89ZCjoBOJfAU6drUiQDI6ECw==
X-Received: by 2002:a17:907:e2e8:b0:a7a:b620:aa3a with SMTP id a640c23a62f3a-a8392a2231fmr1007954466b.52.1724149176584;
        Tue, 20 Aug 2024 03:19:36 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83839464ebsm734550066b.155.2024.08.20.03.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 03:19:36 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v5 05/11] i2c: riic: Add suspend/resume support
Date: Tue, 20 Aug 2024 13:19:12 +0300
Message-Id: <20240820101918.2384635-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240820101918.2384635-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add suspend/resume support for the RIIC driver. This is necessary for the
Renesas RZ/G3S SoC which support suspend to deep sleep state where power
to most of the SoC components is turned off. As a result the I2C controller
needs to be reconfigured after suspend/resume. For this, the reset line
was stored in the driver private data structure as well as i2c timings.
The reset line and I2C timings are necessary to re-initialize the
controller after resume.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags
- added a comment on riic_i2c_resume() to explain why the reset
  signal is asserted on failure path

Changes in v4:
- rebased on top of latest next

Changes in v3:
- none

Changes in v2:
- deassert the reset line in resume if riic_init_hw() fails as
  if that happens there is no way to recover the controller

 drivers/i2c/busses/i2c-riic.c | 73 +++++++++++++++++++++++++++++------
 1 file changed, 62 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index ec854a525a0b..eb741d4b1005 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -105,6 +105,8 @@ struct riic_dev {
 	struct completion msg_done;
 	struct i2c_adapter adapter;
 	struct clk *clk;
+	struct reset_control *rstc;
+	struct i2c_timings i2c_t;
 };
 
 struct riic_irq_desc {
@@ -302,11 +304,12 @@ static const struct i2c_algorithm riic_algo = {
 	.functionality = riic_func,
 };
 
-static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
+static int riic_init_hw(struct riic_dev *riic)
 {
 	int ret;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
+	struct i2c_timings *t = &riic->i2c_t;
 	struct device *dev = riic->adapter.dev.parent;
 
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
@@ -423,8 +426,6 @@ static int riic_i2c_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct riic_dev *riic;
 	struct i2c_adapter *adap;
-	struct i2c_timings i2c_t;
-	struct reset_control *rstc;
 	int i, ret;
 
 	riic = devm_kzalloc(dev, sizeof(*riic), GFP_KERNEL);
@@ -441,16 +442,16 @@ static int riic_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(riic->clk);
 	}
 
-	rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc),
+	riic->rstc = devm_reset_control_get_optional_exclusive(dev, NULL);
+	if (IS_ERR(riic->rstc))
+		return dev_err_probe(dev, PTR_ERR(riic->rstc),
 				     "Error: missing reset ctrl\n");
 
-	ret = reset_control_deassert(rstc);
+	ret = reset_control_deassert(riic->rstc);
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, riic_reset_control_assert, rstc);
+	ret = devm_add_action_or_reset(dev, riic_reset_control_assert, riic->rstc);
 	if (ret)
 		return ret;
 
@@ -479,14 +480,14 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	init_completion(&riic->msg_done);
 
-	i2c_parse_fw_timings(dev, &i2c_t, true);
+	i2c_parse_fw_timings(dev, &riic->i2c_t, true);
 
 	/* Default 0 to save power. Can be overridden via sysfs for lower latency. */
 	pm_runtime_set_autosuspend_delay(dev, 0);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_enable(dev);
 
-	ret = riic_init_hw(riic, &i2c_t);
+	ret = riic_init_hw(riic);
 	if (ret)
 		goto out;
 
@@ -496,7 +497,7 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, riic);
 
-	dev_info(dev, "registered with %dHz bus speed\n", i2c_t.bus_freq_hz);
+	dev_info(dev, "registered with %dHz bus speed\n", riic->i2c_t.bus_freq_hz);
 	return 0;
 
 out:
@@ -553,6 +554,55 @@ static const struct riic_of_data riic_rz_v2h_info = {
 	},
 };
 
+static int riic_i2c_suspend(struct device *dev)
+{
+	struct riic_dev *riic = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
+
+	i2c_mark_adapter_suspended(&riic->adapter);
+
+	/* Disable output on SDA, SCL pins. */
+	riic_clear_set_bit(riic, ICCR1_ICE, 0, RIIC_ICCR1);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_sync(dev);
+
+	return reset_control_assert(riic->rstc);
+}
+
+static int riic_i2c_resume(struct device *dev)
+{
+	struct riic_dev *riic = dev_get_drvdata(dev);
+	int ret;
+
+	ret = reset_control_deassert(riic->rstc);
+	if (ret)
+		return ret;
+
+	ret = riic_init_hw(riic);
+	if (ret) {
+		/*
+		 * In case this happens there is no way to recover from this
+		 * state. The driver will remain loaded. We want to avoid
+		 * keeping the reset line de-asserted for no reason.
+		 */
+		reset_control_assert(riic->rstc);
+		return ret;
+	}
+
+	i2c_mark_adapter_resumed(&riic->adapter);
+
+	return 0;
+}
+
+static const struct dev_pm_ops riic_i2c_pm_ops = {
+	SYSTEM_SLEEP_PM_OPS(riic_i2c_suspend, riic_i2c_resume)
+};
+
 static const struct of_device_id riic_i2c_dt_ids[] = {
 	{ .compatible = "renesas,riic-rz", .data = &riic_rz_a_info },
 	{ .compatible = "renesas,riic-r9a09g057", .data = &riic_rz_v2h_info },
@@ -565,6 +615,7 @@ static struct platform_driver riic_i2c_driver = {
 	.driver		= {
 		.name	= "i2c-riic",
 		.of_match_table = riic_i2c_dt_ids,
+		.pm	= pm_ptr(&riic_i2c_pm_ops),
 	},
 };
 
-- 
2.39.2


