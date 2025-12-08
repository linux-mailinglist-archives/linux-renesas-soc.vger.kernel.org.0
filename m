Return-Path: <linux-renesas-soc+bounces-25663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB26CAD93D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FFE6307B4E5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD603128D5;
	Mon,  8 Dec 2025 15:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BeENbSih"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA082EA169
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765207307; cv=none; b=f5RyDQY/N4Z6VoQKDE/9GGaB7gmQsQtCIoMfkIfu+gxXeClSLrCyxhOvwdLHxl3hVsajr5PVNCSxN9qBAaA6RxyAWNP5qCyiy4mKjkjezbjt9vYSwQEfXBH6PGqYJWx8oJ5JO5NvOeobARyhMfyO9KP0ONBgNGNl6+68+PflfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765207307; c=relaxed/simple;
	bh=M3SL8PolX24n7yB2arA6GbGjS0d0mvu6DQZ2mMbXRrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYJMGzBVykKQkGDR2hBlJoE4vwPul2JyzRGMsn0BPQTnLF9dheZ4fyCsvFZlhVEn65ocYQzjNY0jtti2AJGUEGyBdL/PtR2ySoyLasEP0mBnFv9gldAa/NeIijzmihmqXKeGDQd3P110PXwOqQPUP7IXoux12MCIPQLI410QM+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BeENbSih; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64198771a9bso8073049a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765207301; x=1765812101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYadcy1JHm8Mv93vS93czQrJhCISZAfZkmHzpoqS4TU=;
        b=BeENbSihXRrp9hOhaoq7cS7agoCn/3e3QsqRPqC/1ZEesbPVQcPcemHuVrgrM5W24n
         NZoJbb5LWERKEyZgnkRRYypMuqLhC0IsEaGpAd9l/JKES9epA5FdfQ0ERI4cx9oNKBJH
         kB4AZxRR5FihIkkHTSXLLlmZvA7+WP2n/Bz7c5VLSRjMas6aC74mbc7PyVjyI3A+f77x
         HImQpt774+IIdudZN9CaKp1MDxvFrH3dC/aOCWHupECQxHS57A+3d1fATcT0ahyARTEM
         7JOjqUgdTV9ZLLx1XKeghId7tsBZ084tbrTBhSqGUGtciZ3B3SYetCtgNyMFf9FqQdHG
         PTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765207301; x=1765812101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYadcy1JHm8Mv93vS93czQrJhCISZAfZkmHzpoqS4TU=;
        b=FM0vqWKlE1nL4yHML5g/d3MiJaI+OS2iic6V5jp++YhLK86fPYbMu8jOfPuI+0ZwlL
         vvEeNU+ZRDPsiBoRgHDXtlBnDakht7Hpwa6RJUqjCZOkAVeYjYFCDWuWpmhjJN5ZmEuE
         Shn7ICxATk0DgijhLEY1RBsCU670OEP+8tZPo2WQGLT3uQYcUKzI4Q224xxen3pXAB+7
         O0iaNWhMnGb2jD1985XB5eqjaNqFHjir0JpHyniArS2y/1SM23M2DhapDl+M9X6W1atV
         HYiAOrKCmu3zIhFPYKhagk11PpCQeVk2oBWaHntLGAtoHuxqi/D85WT5KOSwjviwSKrP
         RkWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkKF92RAyg5mzr1+gQxFzjKy43UOFBYZWWWfL2evCNoZfy4U0DYjsOAIHO819ujxVnb9UatEcM6qSk1ZQKpoBNWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjnQLfBKc42p2CHUrnatI9tokhAbhscsyLskGTeuv2CHqdPjCM
	njevp/QO38d5Esxmnxdmh6bNswE6rMXqwtwfWWgocS9XesRV1JsFxAri
X-Gm-Gg: ASbGncsm8zCsqmSOx00+UqMl2AVBVxuKiueP1vlX97PDvLyLqAXsva4GX2hQNC/mRWP
	PLnF+CR5fWwT1sDzTYDMoEbDxV7dkemRdtmiqDLgvhjOBTkfdSsmKerf+08/4Z5L2ZstSMpwNyh
	5SFw4JjQ0WDYzkAubvRjsjZtztxMZ1uOq2Ab28uby78JJjU873ruZpRZuyiWd4/ChMttzydupFK
	Y7R7XwXBV3ZrKhN1QfgtvKpC4loo4Af0r8gHYQZpl2cAB5rsLPYRi8/yeFKXs53AiA8i1IzpnPF
	b5cu+1EUS8xl5l22h1gAaQA10e7kVZPD5EK5V7l4FlZICpe3Bfr/XYYkfd7oSlKrCrBpZdOR6Xl
	4R9zaVtD4hyVDX/Y0U+OquI0rKtx6ibEuC+6sGJudlZq7b175VWbDIHfy4VBI5ov/5scMm0rhGe
	KHkhtZNvzCttNa/X44skHTp9z639PuZJEVPVWy/E+X3qy+S1dMTnOsJEoteJCG72S2hzbDtzrBT
	ce1mIirXyvQckeQ
X-Google-Smtp-Source: AGHT+IFajoINpwBqXOy10Wn9OzjgBX7BwKqp9BWgU6u6VB/UL3dqVJGLcyrrYRTfzfsMfIhwr8gSPA==
X-Received: by 2002:a05:6402:2356:b0:640:f2cd:831 with SMTP id 4fb4d7f45d1cf-64919c1f900mr7242886a12.10.1765207300669;
        Mon, 08 Dec 2025 07:21:40 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412deddsm11547484a12.31.2025.12.08.07.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:21:40 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 7/9] pwm: rzg2l-gpt: Add suspend/resume support
Date: Mon,  8 Dec 2025 15:21:24 +0000
Message-ID: <20251208152133.269316-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
References: <20251208152133.269316-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3E using PSCI, s2ram powers down the SoC. Add suspend/resume
callbacks for save/restore GPT context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added error checks on suspend() and device set to operational state
   on failure().
v3:
 * New patch.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 132 +++++++++++++++++++++++++++++++-----
 1 file changed, 116 insertions(+), 16 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 79ee59271d24..4eac35390c60 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -90,14 +90,26 @@ struct rzg2l_gpt_info {
 	u8 prescale_mult;
 };
 
+struct rzg2l_gpt_cache {
+	u32 gtpr;
+	u32 gtccr[2];
+	u32 gtcr;
+	u32 gtior;
+};
+
 struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
 	const struct rzg2l_gpt_info *info;
+	struct clk *clk;
+	struct clk *bus_clk;
+	struct reset_control *rst;
+	struct reset_control *rst_s;
 	unsigned long rate_khz;
 	u32 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_enable_count[RZG2L_MAX_HW_CHANNELS];
+	struct rzg2l_gpt_cache hw_cache[RZG2L_MAX_HW_CHANNELS];
 };
 
 /* This represents a hardware configuration for one channel */
@@ -462,10 +474,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 {
 	struct rzg2l_gpt_chip *rzg2l_gpt;
 	struct device *dev = &pdev->dev;
-	struct reset_control *rstc;
 	struct pwm_chip *chip;
 	unsigned long rate;
-	struct clk *clk;
 	int ret;
 
 	chip = devm_pwmchip_alloc(dev, RZG2L_MAX_PWM_CHANNELS, sizeof(*rzg2l_gpt));
@@ -479,27 +489,29 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 
 	rzg2l_gpt->info = of_device_get_match_data(dev);
 
-	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
+	rzg2l_gpt->rst = devm_reset_control_get_exclusive_deasserted(dev, NULL);
+	if (IS_ERR(rzg2l_gpt->rst))
+		return dev_err_probe(dev, PTR_ERR(rzg2l_gpt->rst),
+				     "Cannot deassert reset control\n");
 
-	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, "rst_s");
-	if (IS_ERR(rstc))
-		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert rst_s reset\n");
+	rzg2l_gpt->rst_s = devm_reset_control_get_optional_exclusive_deasserted(dev, "rst_s");
+	if (IS_ERR(rzg2l_gpt->rst_s))
+		return dev_err_probe(dev, PTR_ERR(rzg2l_gpt->rst_s),
+				     "Cannot deassert rst_s reset\n");
 
-	clk = devm_clk_get_optional_enabled(dev, "bus");
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get bus clock\n");
+	rzg2l_gpt->bus_clk = devm_clk_get_optional_enabled(dev, "bus");
+	if (IS_ERR(rzg2l_gpt->bus_clk))
+		return dev_err_probe(dev, PTR_ERR(rzg2l_gpt->bus_clk), "Cannot get bus clock\n");
 
-	clk = devm_clk_get_enabled(dev, NULL);
-	if (IS_ERR(clk))
-		return dev_err_probe(dev, PTR_ERR(clk), "Cannot get clock\n");
+	rzg2l_gpt->clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(rzg2l_gpt->clk))
+		return dev_err_probe(dev, PTR_ERR(rzg2l_gpt->clk), "Cannot get clock\n");
 
-	ret = devm_clk_rate_exclusive_get(dev, clk);
+	ret = devm_clk_rate_exclusive_get(dev, rzg2l_gpt->clk);
 	if (ret)
 		return ret;
 
-	rate = clk_get_rate(clk);
+	rate = clk_get_rate(rzg2l_gpt->clk);
 	if (!rate)
 		return dev_err_probe(dev, -EINVAL, "The gpt clk rate is 0");
 
@@ -526,7 +538,92 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add PWM chip\n");
 
+	platform_set_drvdata(pdev, chip);
+
+	return 0;
+}
+
+static int rzg2l_gpt_suspend(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < RZG2L_MAX_HW_CHANNELS; i++) {
+		if (!rzg2l_gpt->channel_enable_count[i])
+			continue;
+
+		rzg2l_gpt->hw_cache[i].gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(i));
+		rzg2l_gpt->hw_cache[i].gtccr[0] = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(i, 0));
+		rzg2l_gpt->hw_cache[i].gtccr[1] = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(i, 1));
+		rzg2l_gpt->hw_cache[i].gtcr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCR(i));
+		rzg2l_gpt->hw_cache[i].gtior = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTIOR(i));
+	}
+
+	clk_disable_unprepare(rzg2l_gpt->clk);
+	clk_disable_unprepare(rzg2l_gpt->bus_clk);
+	ret = reset_control_assert(rzg2l_gpt->rst_s);
+	if (ret)
+		goto fail_clk;
+
+	ret = reset_control_assert(rzg2l_gpt->rst);
+	if (ret)
+		goto fail_reset_s;
+
 	return 0;
+
+fail_reset_s:
+	reset_control_deassert(rzg2l_gpt->rst_s);
+fail_clk:
+	clk_prepare_enable(rzg2l_gpt->bus_clk);
+	clk_prepare_enable(rzg2l_gpt->clk);
+	return ret;
+}
+
+static int rzg2l_gpt_resume(struct device *dev)
+{
+	struct pwm_chip *chip = dev_get_drvdata(dev);
+	struct rzg2l_gpt_chip *rzg2l_gpt = to_rzg2l_gpt_chip(chip);
+	unsigned int i;
+	int ret;
+
+	ret = reset_control_deassert(rzg2l_gpt->rst);
+	if (ret)
+		return ret;
+
+	ret = reset_control_deassert(rzg2l_gpt->rst_s);
+	if (ret)
+		goto fail_reset;
+
+	ret = clk_prepare_enable(rzg2l_gpt->bus_clk);
+	if (ret)
+		goto fail_reset_all;
+
+	ret = clk_prepare_enable(rzg2l_gpt->clk);
+	if (ret)
+		goto fail_bus_clk;
+
+	for (i = 0; i < RZG2L_MAX_HW_CHANNELS; i++) {
+		if (!rzg2l_gpt->channel_enable_count[i])
+			continue;
+
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(i), rzg2l_gpt->hw_cache[i].gtpr);
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCCR(i, 0), rzg2l_gpt->hw_cache[i].gtccr[0]);
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCCR(i, 1), rzg2l_gpt->hw_cache[i].gtccr[1]);
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTCR(i), rzg2l_gpt->hw_cache[i].gtcr);
+		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTIOR(i), rzg2l_gpt->hw_cache[i].gtior);
+	}
+
+	return 0;
+
+fail_bus_clk:
+	clk_disable_unprepare(rzg2l_gpt->bus_clk);
+fail_reset_all:
+	reset_control_assert(rzg2l_gpt->rst_s);
+fail_reset:
+	reset_control_assert(rzg2l_gpt->rst);
+	return ret;
 }
 
 static const struct rzg2l_gpt_info rzg3e_data = {
@@ -548,10 +645,13 @@ static const struct of_device_id rzg2l_gpt_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, rzg2l_gpt_of_table);
 
+static DEFINE_SIMPLE_DEV_PM_OPS(rzg2l_gpt_pm_ops, rzg2l_gpt_suspend, rzg2l_gpt_resume);
+
 static struct platform_driver rzg2l_gpt_driver = {
 	.driver = {
 		.name = "pwm-rzg2l-gpt",
 		.of_match_table = rzg2l_gpt_of_table,
+		.pm = pm_sleep_ptr(&rzg2l_gpt_pm_ops),
 	},
 	.probe = rzg2l_gpt_probe,
 };
-- 
2.43.0


