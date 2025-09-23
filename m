Return-Path: <linux-renesas-soc+bounces-22219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99703B9666E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 16:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43472178E60
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 14:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E86320E030;
	Tue, 23 Sep 2025 14:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGBhYd0w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410CB2417D9
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 14:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758638732; cv=none; b=hlv4RZxH0CvTrJvQuli1SAIPVu2Mo+d6/46J9zmGhTnC60ojuHehguIstsmGk9fcgd4yN9FCIO2CGFhxakzYjJaSEi1gBrfWx+ECpUIC+EHj+r/Y0jU3No9vGR0lmcHmez/zVAL1HTDApdxj6lCPMYVOQxjo9fmqt5zGH7hetpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758638732; c=relaxed/simple;
	bh=gHfJe2wkX0a4J0T2iaI/ZrXum2g8dABmTaj/MRvdciw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRb9Iq0cMZ7mkWKQrIMULDdLhsmKcx6zF7NJ/JiQeHzrft3IaDMRmPmAlCVKvLdzGWH2QaikrTrsUHrVQ8ARWiNzDxqMeYcX+e0Es66OFNpPHMkVx6ieKXgSMLZPfz51PHlk4KtgM3vXXIM5E+KLs1hN5DCnVkjq83q+qxi3Zv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGBhYd0w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dd5e24d16so54900575e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758638728; x=1759243528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By9iTZQYVaW98aaM8/fCSAHAyxcTKcPpA3ibSeZs1YE=;
        b=bGBhYd0w++KpcxU7aVvecVbsR5MQIPpvzfsnOQmGahz/yh6ivnTHGt904m3D0OViQA
         JauHkmL+4FhKrV2OAgIGVLuXaGFDN5bmVWRTgWquXlIQrUTEqtmDqnLFX2w+bk+YGzd/
         an5XtmHGtTCM5NyWRJYe9ftUmkBYNXmvBHX06tdd1SIElpvh3YverTe9gMyUW1tufHpX
         hBIP0mQbTybk0fhQuYPYwvgUyQoYmRL+Fpfd0SlRfvUnTtl8pLvIqB3TJQGEeYAdEtjf
         2+B1NG7T2tBl0LNUa2HSlPM752Fw70fsSE4Bq7naPZPf8UrOSD8GVBm1s9rKHlLMvzwA
         66mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638728; x=1759243528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By9iTZQYVaW98aaM8/fCSAHAyxcTKcPpA3ibSeZs1YE=;
        b=l67q6DE9NAR2TqGDH6Sx0Z9GM5QtY25rvoVo5sAr882ccdzRrEmtKIb4NE9z3gopnZ
         7CdqlTIRI4x1jawp0ied866Xt2/Q0q0zo/qPzbqHect9xlwftVKUrxA2wHhLtNrq79k/
         L+Cg2gRkyuEKoEefbuikoV2LfhDymZx9biLr67wHx3jmz1NlPxI6Vux5VcIqmTLoDq08
         sPmCxCvDnwUxRcNG5YW634GdPDJ2Mj8LgNdpEe6ctm2wXZ8Bc/030RrnFN+fg0bpZcJn
         1ZKbG1XwJsljB88dPRAwX0iCV/8SJILo+SwMuiJLBCep9ZkfwuDgbpvJEevY6vKbeEq7
         tLAA==
X-Forwarded-Encrypted: i=1; AJvYcCXmF8og3i3tDATeSwIXsDwdDmqjAJmnL6qUStFK30xOIJLNaKeSGhuQ2cMnT+8DqlWzGbP8juVJeGRIQCpgN679Ag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt+8Q8IeYfbZNvOLpMKNPDvqcEtbpdyX+AqhsDQ6Y+5H1jH2mN
	t/gTSkmWa7t6FLOxaYSK0vwn2HtKKDB7AEfBL1vYTKCRPSpNRvWaGGSz
X-Gm-Gg: ASbGncvUTaMWQOOh+rc7fwVtIZT3LHgbJYDWy9O4MPTgtLToaMtUjHsVvCFnNwNrQDX
	7Adn2In/MorgGLcXk3mKlRBfmrswvyzqqTIsdsaDFNFtPgeG1z6v2QH9IkEQT0wuLIgMj+oMTPB
	7IFwmDCDccTyBl/12tDVCUFxcBAxbmpY97D2UZLQSbK7UEKYzxMPQ1t17iGo4ShdZxsLlXnwBpp
	vfbJOkHH8EbT27S7zWXI2F1cHgnzqkcdPI/bs2ugIHoMA4RoXn+SJXCOdTZVOFgpcvqzvO3mSVB
	rmd2xiXtoxdm+re72X3AF2lGQZuMMc6lPx+9OoV4/9EXQjJQ+hmUpuV82/FR0xyGF9XIchVZulm
	5t/alkCU/DGnG9VpDVd/DPsnTfcN0RNdmlTQAwx41nq+19Rwwg+t58P4JuP3NxuJuY0VrjDGJxi
	I9FA==
X-Google-Smtp-Source: AGHT+IGeaLZNcziJFwxEnB+ujLHDeNr3b8C5SkLS7nPKFj5AlRt42fsuSfQ2qfOOoel3vyehbrlVsA==
X-Received: by 2002:a05:600c:c171:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-46e1dadca3cmr28239555e9.27.1758638728217;
        Tue, 23 Sep 2025 07:45:28 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f0aac3fdsm238940435e9.1.2025.09.23.07.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:45:27 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v3 2/8] pwm: rzg2l-gpt: Add info variable to struct rzg2l_gpt_chip
Date: Tue, 23 Sep 2025 15:45:06 +0100
Message-ID: <20250923144524.191892-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
References: <20250923144524.191892-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G3E GPT IP is similar to the one found on RZ/G2L GPT, but there are
some differences. The field width of prescalar on RZ/G3E is 4 whereas on
RZ/G2L it is 3. Add rzg2l_gpt_info variable to handle this differences.
The FIELD_PREP and FIELD_GET macro is giving compilation issue as the
parameters are not build time constants. So added Non-constant mask
variant of FIELD_GET() and FIELD_PREP().

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change.
v1->v2:
 * Collected tag.
---
 drivers/pwm/pwm-rzg2l-gpt.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 392bd129574b..1d09fb01c72f 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -33,6 +33,19 @@
 #include <linux/time.h>
 #include <linux/units.h>
 
+/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
+#define field_get(_mask, _reg)	\
+({\
+	typeof(_mask) (mask) = (_mask); \
+	(((_reg) & (mask)) >> (ffs(mask) - 1)); \
+})
+
+#define field_prep(_mask, _val)	\
+({\
+	typeof(_mask) (mask) = (_mask); \
+	(((_val) << (ffs(mask) - 1)) & (mask)); \
+})
+
 #define RZG2L_GET_CH(hwpwm)	((hwpwm) / 2)
 #define RZG2L_GET_CH_OFFS(ch)	(0x100 * (ch))
 
@@ -46,7 +59,6 @@
 
 #define RZG2L_GTCR_CST		BIT(0)
 #define RZG2L_GTCR_MD		GENMASK(18, 16)
-#define RZG2L_GTCR_TPCS		GENMASK(26, 24)
 
 #define RZG2L_GTCR_MD_SAW_WAVE_PWM_MODE	FIELD_PREP(RZG2L_GTCR_MD, 0)
 
@@ -77,9 +89,14 @@
 #define RZG2L_MAX_SCALE_FACTOR	1024
 #define RZG2L_MAX_TICKS		((u64)U32_MAX * RZG2L_MAX_SCALE_FACTOR)
 
+struct rzg2l_gpt_info {
+	u32 gtcr_tpcs_mask;
+};
+
 struct rzg2l_gpt_chip {
 	void __iomem *mmio;
 	struct mutex lock; /* lock to protect shared channel resources */
+	const struct rzg2l_gpt_info *info;
 	unsigned long rate_khz;
 	u32 period_ticks[RZG2L_MAX_HW_CHANNELS];
 	u32 channel_request_count[RZG2L_MAX_HW_CHANNELS];
@@ -324,7 +341,7 @@ static int rzg2l_gpt_read_waveform(struct pwm_chip *chip,
 
 	guard(mutex)(&rzg2l_gpt->lock);
 	if (rzg2l_gpt_is_ch_enabled(rzg2l_gpt, pwm->hwpwm, &gtcr)) {
-		wfhw->prescale = FIELD_GET(RZG2L_GTCR_TPCS, gtcr);
+		wfhw->prescale = field_get(rzg2l_gpt->info->gtcr_tpcs_mask, gtcr);
 		wfhw->gtpr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTPR(ch));
 		wfhw->gtccr = rzg2l_gpt_read(rzg2l_gpt, RZG2L_GTCCR(ch, sub_ch));
 		if (wfhw->gtccr > wfhw->gtpr)
@@ -364,8 +381,8 @@ static int rzg2l_gpt_write_waveform(struct pwm_chip *chip,
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTUDDTYC(ch), RZG2L_GTUDDTYC_UP_COUNTING);
 
 		/* Select count clock */
-		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_TPCS,
-				 FIELD_PREP(RZG2L_GTCR_TPCS, wfhw->prescale));
+		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), rzg2l_gpt->info->gtcr_tpcs_mask,
+				 field_prep(rzg2l_gpt->info->gtcr_tpcs_mask, wfhw->prescale));
 
 		/* Set period */
 		rzg2l_gpt_write(rzg2l_gpt, RZG2L_GTPR(ch), wfhw->gtpr);
@@ -430,6 +447,8 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	if (IS_ERR(rzg2l_gpt->mmio))
 		return PTR_ERR(rzg2l_gpt->mmio);
 
+	rzg2l_gpt->info = of_device_get_match_data(dev);
+
 	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(rstc))
 		return dev_err_probe(dev, PTR_ERR(rstc), "Cannot deassert reset control\n");
@@ -472,8 +491,12 @@ static int rzg2l_gpt_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct rzg2l_gpt_info rzg2l_data = {
+	.gtcr_tpcs_mask = GENMASK(26, 24),
+};
+
 static const struct of_device_id rzg2l_gpt_of_table[] = {
-	{ .compatible = "renesas,rzg2l-gpt", },
+	{ .compatible = "renesas,rzg2l-gpt", .data = &rzg2l_data },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_gpt_of_table);
-- 
2.43.0


