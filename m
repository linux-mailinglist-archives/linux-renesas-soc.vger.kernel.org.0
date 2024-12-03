Return-Path: <linux-renesas-soc+bounces-10842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 645139E1B2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 12:40:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC422B47768
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB191E767F;
	Tue,  3 Dec 2024 11:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="l1Gj43iP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F041E767B
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Dec 2024 11:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733224430; cv=none; b=UlHZD7H3O1WGgOpeFaiVuf29Hs6h/IpQK429uria5ciP+BHCmiXrHJvouNw0xDKCKX89xkuydFEWyN1ktOzNlOUKm0eySjNLadeWuAvnhsNs3chzPewekxqPTi4ms6F2sWUU4L9xrUyrInK8GoBe/NvHVB7/T4S0cLndhQ7bmxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733224430; c=relaxed/simple;
	bh=ppAUr9kQELfnIcj0LVIh+jDq1RIBidUazofkfaloBCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bXec0nfkc6rzRcZAtWYSZWwPrFaZM1bwN7FsqTnIv2G7pUsk1au4MGGMpYtB8lTgvQsqgT45lxSo+NKJtZjJQFURyJV2246XRqii7XbZJauAvDfOXnHIbuSOvh7GxHpyUyg0RpkCtXO8fo9ZTtc5rFahV4DccuRkjt/HptIWCHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=l1Gj43iP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385e87b25f0so1623989f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Dec 2024 03:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733224426; x=1733829226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FKLxbTEaud6H31j2MDcCIaBAMSwZe28Xjtt36pH2SQ=;
        b=l1Gj43iPOEs1EKoxiGJQX/XdFsUnCSxyDQ1T8lpCswbN+WUYjfAjzF3JddKOW4aYqE
         JRObk2SvfI3Y7uiILzTqH2PxxvN59ExSDl9kkVmk0zVZ7RX0SyiRnVkS+91UHhOg19uI
         udyvJPe5zslxHWhRym2OzPDplNFhx2RMUEK/h8vV2dNDuVDEe9Wq23Bvc9sCVR/qnAiL
         UsJbiyORCcAvR4DByvcO0VTjGskLd40HyeGgHaqCN9fv13q9PjgvF+LiiQ7Q7B82oTI3
         /8iAFUeNMz7KyxvWhVyxQWimP2rxWffZtaEGd85k7aI2DtucXMq2iNhFOFe0cNqhUITn
         3CLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733224426; x=1733829226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FKLxbTEaud6H31j2MDcCIaBAMSwZe28Xjtt36pH2SQ=;
        b=Cb5/hwUJeMpNMgFPUlZwiLmY3waJ0yaT6DVZdFM2/CP8b7uQQZApkL0nlFkF/zFP5q
         In754lUeGx5O3Tg+n2/w+A9SsEq6kr0BZObXDvn10kVcoqLMPyQf71XDiyvw2HzxQHor
         135B2XNA0bvdcqeYZANFvKATe1Qf+AaCy6G2KYCRYCmeyCXHouFIDfdhf0bFd5RHGaXe
         PyN+DpmxZR0RDSCX98QN5Xzyjgm8rE815bhfx/r3Gu0xtBQFF53zuXORC3bY+PvfOWX3
         gHvC82PXKMN40GPCLftk2vAFQsc0AjFsrU9DcmH96p90ffNs3nVmx5JpP6xAtOM0NZVb
         o5VQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0fsbEckJDcZypasbPGNtLTT3xV36iYHwJUolVob7DPmzGtGa7rppwMMcIEa38VLCH0BarVKAkT+C63P7mdgZnDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5FaRxEdtBPcpy8UcHTPUfJv3xYzjWSeuMeApcSKdhkrFCZipQ
	r8Bc3f+7e0lS2uOOxQEguP/FIBeia6WskyWTSLsao1iFY4927ugTITCIv9eJ3P7Z1xuKrHpNrkr
	i
X-Gm-Gg: ASbGncvuGkIloeFbVqL33kqHk1OnmNKRnfZgmexHsSHsXkwunCv+QXVFfhWlTD32vLX
	UsfGLAAPqZ+pIrTTaDGCl3CdXavhwlymqfhq2VFJdMcJTty0qJgbOJQO81o5fYeDq62BTTn1MbO
	HLLuYATAQf0Gxzoko9qfjwB9fsKiR9iffy6XnqYUNXeVI0f8ICHYy4/MwhoNWozkjUhAwrQuQ91
	YSqWCdVI9jKmT1pVXrHwgF6GzGXSEgZUobtfS/6NlpDF0KH0WVyUl9emYxGIqF7I2CECnEhdUS/
	v0cF
X-Google-Smtp-Source: AGHT+IHR2xfUs1VvdSX2gkXssqQPRKb5A4JuDNhCgJUhRiU8nW1xR4JtPsjVCrRDi2mqiDXG3fCLRw==
X-Received: by 2002:a5d:6da7:0:b0:381:ed32:d604 with SMTP id ffacd0b85a97d-385fd977357mr1683247f8f.10.1733224426145;
        Tue, 03 Dec 2024 03:13:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e0117069sm11794315f8f.60.2024.12.03.03.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 03:13:45 -0800 (PST)
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
Subject: [PATCH 09/14] iio: adc: rzg2l_adc: Add support for channel 8
Date: Tue,  3 Dec 2024 13:13:09 +0200
Message-Id: <20241203111314.2420473-10-claudiu.beznea.uj@bp.renesas.com>
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

The ADC on the Renesas RZ/G3S SoC includes an additional channel (channel
8) dedicated to reading temperature values from the Thermal Sensor Unit
(TSU). There is a direct in-SoC connection between the ADC and TSU IPs.

To read the temperature reported by the TSU, a different sampling rate
(compared to channels 0-7) must be configured in the ADM3 register.

The rzg2l_adc driver has been updated to support reading the TSU
temperature.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/iio/adc/rzg2l_adc.c | 81 +++++++++++++++++++++++++++----------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index aff41152ebf8..f938b0f9a795 100644
--- a/drivers/iio/adc/rzg2l_adc.c
+++ b/drivers/iio/adc/rzg2l_adc.c
@@ -55,7 +55,8 @@
 
 /**
  * struct rzg2l_adc_hw_params - ADC hardware specific parameters
- * @default_adsmp: default ADC sampling period (see ADM3 register)
+ * @default_adsmp: default ADC sampling period (see ADM3 register); index 0 is
+ * used for voltage channels, index 1 is used for temperature channel
  * @adsmp_mask: ADC sampling period mask (see ADM3 register)
  * @adint_inten_mask: conversion end interrupt mask (see ADINT register)
  * @default_adcmp: default ADC cmp (see ADM3 register)
@@ -63,7 +64,7 @@
  * @adivc: specifies if ADVIC register is available
  */
 struct rzg2l_adc_hw_params {
-	u16 default_adsmp;
+	u16 default_adsmp[2];
 	u16 adsmp_mask;
 	u16 adint_inten_mask;
 	u8 default_adcmp;
@@ -87,15 +88,26 @@ struct rzg2l_adc {
 	struct mutex lock;
 };
 
-static const char * const rzg2l_adc_channel_name[] = {
-	"adc0",
-	"adc1",
-	"adc2",
-	"adc3",
-	"adc4",
-	"adc5",
-	"adc6",
-	"adc7",
+/**
+ * struct rzg2l_adc_channel - ADC channel descriptor
+ * @name: ADC channel name
+ * @type: ADC channel type
+ */
+struct rzg2l_adc_channel {
+	const char * const name;
+	enum iio_chan_type type;
+};
+
+static const struct rzg2l_adc_channel rzg2l_adc_channels[] = {
+	{ "adc0", IIO_VOLTAGE },
+	{ "adc1", IIO_VOLTAGE },
+	{ "adc2", IIO_VOLTAGE },
+	{ "adc3", IIO_VOLTAGE },
+	{ "adc4", IIO_VOLTAGE },
+	{ "adc5", IIO_VOLTAGE },
+	{ "adc6", IIO_VOLTAGE },
+	{ "adc7", IIO_VOLTAGE },
+	{ "adc8", IIO_TEMP },
 };
 
 static unsigned int rzg2l_adc_readl(struct rzg2l_adc *adc, u32 reg)
@@ -161,7 +173,7 @@ static void rzg2l_set_trigger(struct rzg2l_adc *adc)
 	rzg2l_adc_writel(adc, RZG2L_ADM(1), reg);
 }
 
-static int rzg2l_adc_conversion_setup(struct rzg2l_adc *adc, u8 ch)
+static int rzg2l_adc_conversion_setup(struct rzg2l_adc *adc, u8 ch, enum iio_chan_type type)
 {
 	const struct rzg2l_adc_hw_params *hw_params = adc->hw_params;
 	u32 reg;
@@ -177,6 +189,15 @@ static int rzg2l_adc_conversion_setup(struct rzg2l_adc *adc, u8 ch)
 	reg |= BIT(ch);
 	rzg2l_adc_writel(adc, RZG2L_ADM(2), reg);
 
+	reg = rzg2l_adc_readl(adc, RZG2L_ADM(3));
+	reg &= ~hw_params->adsmp_mask;
+	/*
+	 * type could be IIO_VOLTAGE = 0 or IIO_TEMP = 9. Divide to 8 to get
+	 * index 0 or 1 depending on the channel type.
+	 */
+	reg |= hw_params->default_adsmp[type / 8];
+	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
+
 	/*
 	 * Setup ADINT
 	 * INTS[31] - Select pulse signal
@@ -192,7 +213,8 @@ static int rzg2l_adc_conversion_setup(struct rzg2l_adc *adc, u8 ch)
 	return 0;
 }
 
-static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc, u8 ch)
+static int rzg2l_adc_conversion(struct iio_dev *indio_dev, enum iio_chan_type type,
+				struct rzg2l_adc *adc, u8 ch)
 {
 	const struct rzg2l_adc_hw_params *hw_params = adc->hw_params;
 	struct device *dev = indio_dev->dev.parent;
@@ -202,7 +224,7 @@ static int rzg2l_adc_conversion(struct iio_dev *indio_dev, struct rzg2l_adc *adc
 	if (ret)
 		return ret;
 
-	ret = rzg2l_adc_conversion_setup(adc, ch);
+	ret = rzg2l_adc_conversion_setup(adc, ch, type);
 	if (ret)
 		goto rpm_put;
 
@@ -238,13 +260,27 @@ static int rzg2l_adc_read_raw(struct iio_dev *indio_dev,
 			return -EINVAL;
 
 		mutex_lock(&adc->lock);
-		ret = rzg2l_adc_conversion(indio_dev, adc, ch);
+		ret = rzg2l_adc_conversion(indio_dev, chan->type, adc, ch);
 		if (!ret)
 			*val = adc->last_val[ch];
 		mutex_unlock(&adc->lock);
 
 		return ret ? ret : IIO_VAL_INT;
 
+	case IIO_CHAN_INFO_PROCESSED:
+		if (chan->type != IIO_TEMP)
+			return -EINVAL;
+
+		mutex_lock(&adc->lock);
+		ret = rzg2l_adc_conversion(indio_dev, chan->type, adc, ch);
+		if (!ret) {
+			/* Convert it to mili Celsius. */
+			*val = adc->last_val[ch] * 1000;
+		}
+		mutex_unlock(&adc->lock);
+
+		return ret ? ret : IIO_VAL_INT;
+
 	default:
 		return -EINVAL;
 	}
@@ -254,7 +290,7 @@ static int rzg2l_adc_read_label(struct iio_dev *iio_dev,
 				const struct iio_chan_spec *chan,
 				char *label)
 {
-	return sysfs_emit(label, "%s\n", rzg2l_adc_channel_name[chan->channel]);
+	return sysfs_emit(label, "%s\n", rzg2l_adc_channels[chan->channel].name);
 }
 
 static const struct iio_info rzg2l_adc_iio_info = {
@@ -332,11 +368,14 @@ static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct rzg2l
 		if (channel >= hw_params->num_channels)
 			return -EINVAL;
 
-		chan_array[i].type = IIO_VOLTAGE;
+		chan_array[i].type = rzg2l_adc_channels[channel].type;
 		chan_array[i].indexed = 1;
 		chan_array[i].channel = channel;
-		chan_array[i].info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
-		chan_array[i].datasheet_name = rzg2l_adc_channel_name[channel];
+		if (rzg2l_adc_channels[channel].type == IIO_VOLTAGE)
+			chan_array[i].info_mask_separate = BIT(IIO_CHAN_INFO_RAW);
+		else
+			chan_array[i].info_mask_separate = BIT(IIO_CHAN_INFO_PROCESSED);
+		chan_array[i].datasheet_name = rzg2l_adc_channels[channel].name;
 		i++;
 	}
 
@@ -386,7 +425,7 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 	reg &= ~RZG2L_ADM3_ADCMP_MASK;
 	reg &= ~hw_params->adsmp_mask;
 	reg |= FIELD_PREP(RZG2L_ADM3_ADCMP_MASK, hw_params->default_adcmp) |
-	       hw_params->default_adsmp;
+	       hw_params->default_adsmp[0];
 
 	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
 
@@ -479,7 +518,7 @@ static int rzg2l_adc_probe(struct platform_device *pdev)
 static const struct rzg2l_adc_hw_params rzg2l_hw_params = {
 	.num_channels = 8,
 	.default_adcmp = 0xe,
-	.default_adsmp = 0x578,
+	.default_adsmp = { 0x578 },
 	.adsmp_mask = GENMASK(15, 0),
 	.adint_inten_mask = GENMASK(7, 0),
 	.adivc = true
-- 
2.39.2


