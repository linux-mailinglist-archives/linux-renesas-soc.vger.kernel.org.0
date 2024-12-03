Return-Path: <linux-renesas-soc+bounces-10838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5391B9E1A85
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:14:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142D52839BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EAB1E3DD0;
	Tue,  3 Dec 2024 11:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XP2VKFR9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A0F1E5700
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224422; cv=none; b=SH7rdjTGoRpWzW9sm97D/pK4coIS8yxgOYgiIYYVzGaz8ujeYmJqHq6dTXn1URgSDVv51PyE6SJC8wN8UQB2Xkwhs4vsrWiV1yskC456N0q5YkTmlbrjMZvLrgdaeEQce0NeJu8ExDd8o/WsP9F9c1YIR1jrquVUaZ7COfgdTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224422; c=relaxed/simple;
	bh=gO4ZvBXUTFcYGZh6RIIOFvueXczmp6/AUCy3wQSSRGg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oV2QcOaNOR3TRlbP5jeVdXddlfGfxphN9bfyPla9croW7vwoemJ5/MJ15oshE3JX6wAmzkm97WIq5lqbnP3qyz5eMw193KRO5FMWqUsAHNEbJw7sq6tAaRixt+KwiMYhKk6kfTk+z6uFLW50pOqhOr9Rvf+pJJ1U+1cvoIyeYFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XP2VKFR9; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434ab938e37so34643015e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 03:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224419; x=1733829219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea89qn+C4sQlE1UymOyNPT2kFEXlVUxJjzTr785WLz8=;
        b=XP2VKFR913pfmHCy1D8qPSgum3T3g+TA10hDPU/AqwV7mnJj87BQRGzargn3NpvshF
         kANQbNbnHJEWA2RsHd8rkOtFGG+x01m9zipj1xILf9iW19z858YbGhqjF214qxkRbnfi
         Bfl10Tc/CEwCCZHoS/DmTInWNjwiaL8ceDWb5XSs+Q0UsQGHiz4jZkYbl6GqaRlEBSM2
         xnBwHQva5DXcPfd0/MWcrUZOpz6trjwtpa5oeT7pcrWUHKZF4Wo3n7OryZNIwvMe7E3/
         zUYL+boGth3mHMgUeSoPw7R430K9JymkUSMkPLVt+2ir4xCGxysKEbWAajjphHGQ/8dv
         Smfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224419; x=1733829219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ea89qn+C4sQlE1UymOyNPT2kFEXlVUxJjzTr785WLz8=;
        b=s99f91zlIfVWeAlk2qaEDnpKFqQflbiVWXSHMXvdAN2XfwXMRkY5wagsqdMTlSIEl6
         wBve9I7QlgQDqJGNV1h6tR5KTFRT8BrLknHDsCvDLsEzQqy9vyGAvPtDoF6CKVC0z8b0
         SooIhCx2kUHJzP1sFkzuETkT2S1gNEbHGlnovlX1GQPqr8Lw3RZoDOWujTFvj5TwKy4c
         +E+z1FczBlF1WJW9MO1euKJ/b/JzrBc4BwrTr4XlPwzPnDCH+M8Rc8jc17lv1FZePOv9
         GKy0xVesWTa9i6g4NJPSjZsRcEh1MOj94f5Wi9jFofOlRLz9b8qoWxmbVpGwiQEWzF07
         oCJw==
X-Forwarded-Encrypted: i=1; AJvYcCU173jJwJt14+ujXBXEthS/hBBCvAkaThqfHc18IN2HxkD6P6nSjBYcSCP8qbT3NaFGtqxFwFemi3Yi5xYbhYlKbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx6CIZ8Rxftcb+eoglhinXUxX7K419ATEXAa8MUxcXauk6WasX
	CfLMm//+boPzl8TDU9MLmNqVaX2TuC1eoRpcUYCGa5FN45qi+JezBgOJDGVcw1Y=
X-Gm-Gg: ASbGncvbFrioneOhd4MbLP3Dym7p5X15tQBly0kYPHSdSpIRh/AUKEIwVLQbZL/df0a
	w3MTFqOozyky1q/NQyIlzeWSpIfpfVW3OGC0PTrd0ko0FPItAp0FYqKhpSKr2P6+X5GXSi8Tbd+
	YznXjygtW4cPBygvaKTAnLPcPgEv5UtBJ9H9a6NOGItsteKviwT0O7pLSiIwzn1BZihO2M5lBHe
	rhk3AjwflknontbUeXVE3PiwuvXQbhWJ+gjteMqhLQSig0DLJK+tuOcYrmnvUHCnrtpaU9i5Wkm
	kAqu
X-Google-Smtp-Source: AGHT+IFPqx8VqZ8PfxTE5fU9zGnVOxsbbHEHY67sOEJJ9ywazNa1wCT+yEhiDBsok1OIhNAHxkrIZg==
X-Received: by 2002:a5d:6c62:0:b0:385:f17b:de54 with SMTP id ffacd0b85a97d-385fd3c4576mr1617956f8f.5.1733224419249;
        Tue, 03 Dec 2024 03:13:39 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:38 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	jic23@kernel.org,
	lars@metafoo.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de
Cc: claudiu.beznea@tuxon.dev,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 05/14] iio: adc: rzg2l_adc: Use read_poll_timeout()
Date: Tue,  3 Dec 2024 13:13:05 +0200
Message-Id: <20241203111314.2420473-6-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241203111314.2420473-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Replace the driver-specific implementation with the read_poll_timeout()
function. This change simplifies the code and improves maintainability by
leveraging the standardized helper.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 5437b21c4e70..62932f9295b6 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -13,6 +13,7 @@
 #include <linux/iio/iio.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -112,7 +113,7 @@ static void rzg2l_adc_pwr(struct rzg2l_adc *adc, bool on)
 
 static void rzg2l_adc_start_stop(struct rzg2l_adc *adc, bool start)
 {
-	int timeout = 5;
+	int ret;
 	u32 reg;
 
 	reg = rzg2l_adc_readl(adc, RZG2L_ADM(0));
@@ -125,15 +126,10 @@ static void rzg2l_adc_start_stop(struct rzg2l_adc *adc, bool start)
 	if (start)
 		return;
 
-	do {
-		usleep_range(100, 200);
-		reg = rzg2l_adc_readl(adc, RZG2L_ADM(0));
-		timeout--;
-		if (!timeout) {
-			pr_err("%s stopping ADC timed out\n", __func__);
-			break;
-		}
-	} while (((reg & RZG2L_ADM0_ADBSY) || (reg & RZG2L_ADM0_ADCE)));
+	ret = read_poll_timeout(rzg2l_adc_readl, reg, !(reg & (RZG2L_ADM0_ADBSY | RZG2L_ADM0_ADCE)),
+				200, 1000, true, adc, RZG2L_ADM(0));
+	if (ret)
+		pr_err("%s stopping ADC timed out\n", __func__);
 }
 
 static void rzg2l_set_trigger(struct rzg2l_adc *adc)
@@ -342,7 +338,6 @@ static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct rzg2l
 
 static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 {
-	int timeout = 5;
 	u32 reg;
 	int ret;
 
@@ -355,14 +350,10 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 	reg |= RZG2L_ADM0_SRESB;
 	rzg2l_adc_writel(adc, RZG2L_ADM(0), reg);
 
-	while (!(rzg2l_adc_readl(adc, RZG2L_ADM(0)) & RZG2L_ADM0_SRESB)) {
-		if (!timeout) {
-			ret = -EBUSY;
-			goto exit_hw_init;
-		}
-		timeout--;
-		usleep_range(100, 200);
-	}
+	ret = read_poll_timeout(rzg2l_adc_readl, reg, reg & RZG2L_ADM0_SRESB,
+				200, 1000, false, adc, RZG2L_ADM(0));
+	if (ret)
+		goto exit_hw_init;
 
 	/* Only division by 4 can be set */
 	reg = rzg2l_adc_readl(adc, RZG2L_ADIVC);
-- 
2.39.2


