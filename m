Return-Path: <linux-renesas-soc+bounces-11005-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CAF9E6CF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 12:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B9A91682CA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 11:15:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 748861FF604;
	Fri,  6 Dec 2024 11:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="emkRSVVg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B4420013F
	for <linux-renesas-soc@vger.kernel.org>; Fri,  6 Dec 2024 11:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733483648; cv=none; b=OK67q8ATaaARvvcff+fNpE1ApK8O7sekpMZ+2Z0ehsZ18Iug5APyPjc/RQVR6NCGA7EJZARfpwaApYn5d8b6XyUhpvBaT0RvEvxc8Y7mr1H2ybGurfEDwdzCrWIx4o64uJphhnXArOdC9mykrfhLZJl/ETbB0bivQIERKmBYbxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733483648; c=relaxed/simple;
	bh=k+e2xOqzzPlHXfQrE6tIHd8B8n0ckX4ZsqRauyT6SrU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ryyWQnMpvlRLrL47vYEf5JwD93r9ByAwwVyXv17ZoHQwiFYv5ILNSyFmt/yB8e76g4Ay/5JGgYJKTCQuz4JSqnlbb1dNq3vjU37qNXKfB3i1X8zOKoebdHu8VKzu7pJcwzvCAdQfsQ2CN58maa0CGgPkWakRiJp+AHjF9uH9rFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=emkRSVVg; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385e1f12c82so1611193f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Dec 2024 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733483644; x=1734088444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Opknw59dd1fO7VceDAzkVbX2zeeLYIzonu5RWkuZeEg=;
        b=emkRSVVggyVlkmoOV1p1JmE08HiIcJ8YoF7+FB4K0l4OBR641AiHLbHDd2tKZVQVTs
         n1Ak1hFx1XUVUINezCkL6A/BZlVnzbihXdFoIQ9aRBgS+ixvxMbn7UbW9sAUJZXi3LKI
         WRnCSU78wJVggdW7OUaPqTzCUn70bKm4ZvnQ++HAyN8wx6ttyj9ZTT/XNGT3otHkp3L8
         cS7OHhaVV65PCLMiE1qy86bBGZpVQZZ8CUJjMbIkMiT0z8Ckucu+ZYzXD9z+sedwV35f
         0AmYy1t+EUOoNUqiFsbxm4jigpTvdThLC6pB0rkqD+fjVOf3FZ1OIFURuDdAfjqamKWh
         hvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733483644; x=1734088444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Opknw59dd1fO7VceDAzkVbX2zeeLYIzonu5RWkuZeEg=;
        b=n5Qtecm4moOqJfTEmHzun0lAZ6rdUcnBPc1TdUXKN+Bn5ewWASPx8L6sDK7bhn3R6l
         v+6N62MK4cY2AA1HAXprTW796Yszw3qpz0Ee8OkhP753kdMLUpL2aENd1MzUL/LPfY8T
         nlIcxT8sSe290QNKLjigFFS0h1AuePT++0wnjMpXp1JjhZYlsbUMjCjiTuDCQzrc6RO7
         7eU87Cf6uJTVMOGCM0al1Qh3/VFAH63vVHykA4o4Cc/wxhWHFyD5JPpHScRzCUXtHyuo
         bG2Th71CdyxkQtYtKKnyNth9vyluCgBr7dD8Yczrt7NNfcLU4dFBTGCA8Uww9T3bO4aD
         nacA==
X-Forwarded-Encrypted: i=1; AJvYcCW60KXhxDkBhh78RIq5Lle+YZp4wIOvmJbGPGEw88jROaJqSqjqbGW0wrMMAnqSFoME5xA61XgkycaYtaURIy3Ixw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb3T+24A5OiUk9GQWPmuJrkKo+7dVhP4ERfYPGSojCdAj5lVgy
	V/8qqskd9o81TQ9qWa3/nzyoLgK7w7fGXqaNQkTA50yVA68Gs4qtTft5p865ueg=
X-Gm-Gg: ASbGncuIslZrH327h5gqkxzRLjjsCP4Vdun1bzeWvBxUbQCHbnpGzDWH3MeOHKxx4vh
	WUoBO3cwlA7G1e+1WC7A+JXysVHkaf2BPfqVWV1C67d2qC2xCT/M0BJo95eE3j1EGjotz7ymWWA
	U0BVX0aZX/nvis2unBOpff0OxRe8VYcQdP/SqkZ66gRYzwwL1y90Jcd/wrMrTH2q3q0YTJo5dzB
	YB5tdApOCzh8VuDtBJZi85Ja1plXD9OEh2TivzzHIb9VnYwMa4riEFE0JCQz/ki5+2lbmzlEY3u
	Obqr
X-Google-Smtp-Source: AGHT+IGHPjOUenYoqUgXzgnQIz721t4g0doqmz4uKaZGCl3bSPXpuHOTDDdqMtgiDrRz79pHzQnacA==
X-Received: by 2002:a05:6000:178e:b0:385:e013:b844 with SMTP id ffacd0b85a97d-3862b355269mr1789922f8f.15.1733483644418;
        Fri, 06 Dec 2024 03:14:04 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eee2a6sm226877866b.90.2024.12.06.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:14:03 -0800 (PST)
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
Subject: [PATCH v2 06/15] iio: adc: rzg2l_adc: Use read_poll_timeout()
Date: Fri,  6 Dec 2024 13:13:28 +0200
Message-Id: <20241206111337.726244-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v2:
- none

 drivers/iio/adc/rzg2l_adc.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
index 482da6dcf174..38d4fb014847 100644
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
@@ -338,7 +334,6 @@ static int rzg2l_adc_parse_properties(struct platform_device *pdev, struct rzg2l
 
 static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
 {
-	int timeout = 5;
 	u32 reg;
 	int ret;
 
@@ -351,14 +346,10 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
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


