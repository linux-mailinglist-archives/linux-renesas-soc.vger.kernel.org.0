Return-Path: <linux-renesas-soc+bounces-7258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2549F92E77D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 13:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6F881F246D9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7824415B977;
	Thu, 11 Jul 2024 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JSs7D/Jm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDB115B145
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698745; cv=none; b=C3zla6RzvxLCvpzBeqLQFHoQSs6tU5Q2cLa/jBbbEEigtGI7grYZx9/BEt5twC6vqzvo75r0KQvfr2L1K5vPGq9mBdCDe84R+c2rXxKUiYQAEYScL3L6mjqnE9vcDbSi9f1/GxBeK9ufDgngzJw7LIdjoo+cwYVQ/i3j9zS+T5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698745; c=relaxed/simple;
	bh=jRoDI1oSiylZ2cVuASTuH56sgLGCa6Z24SkqAIRQYT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uZwKA4xYF5RNI+/ikV+ZCkskUa8B/URP2UpjBG4jDJ8AtJgB4mteW9TXSfuMjZ1Nv8gwJzkVCkjYgzSD4uvmunsHQy93OL7EzAJ61BibIaQ2kQRqR9FmV+Hum+EgUwsFyRD+YNXU5WTh9ac1NSNw8HIMy1RnoVs3QXO2gjdodac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JSs7D/Jm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367a464e200so387638f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698742; x=1721303542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJThVrGYyMyufMggX4ZMcdVtMBeW9H/yuK40MYKYk8I=;
        b=JSs7D/Jm0JxylECCI+oBJ+fRTu9Oc0063hj+2FbxNchKyqZ5wY8gDZNywDmjYJBtDH
         5IOVys+nKWHxwS75FaX9I4QNgP6lJ4Ql/3Xy3DQRgRPXr+52vsK0pmK1FLSLgobiUoPv
         NBcbnuCTfVhB0U4qqEYOkq3PiuP9aEH0n85mXmY73ngDwQocs13Cf0BZLVTFnMF89OiI
         VRjQHsflcpTbpBVQp4XcI1zhaTcfDNkYCWNbjMUwB1mtkKNkNXJUX/UFHLzNZOY+T6yF
         3ideG/7ihDJjCK9AvDcsEkmofVHPGzI+dht5YG8zmXvJcY50LT79Oz7KlGULRZCTFJC9
         dqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698742; x=1721303542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJThVrGYyMyufMggX4ZMcdVtMBeW9H/yuK40MYKYk8I=;
        b=RKOP1k4DBC4DIHrGWoCUDfBw4QTm+YyOpZgTOyn6qAKqaKeaSXSaFJ0JrlCB+JcFCe
         pqxey+Y04FwZvnt+0F+mMYtJjzwXS5zNQmpuK6Y9hMAhgayleD9k9lyaCfdgrBtq2yeA
         X1SicuM4cOoVm7tu8oaeOIELidpJFvX1YkM6RSD4ycSSqbUNmmg+9Av5MJ2hvkRgMnKV
         8xnNt/TBQhQ/GZeHBM1ZcRzxd645ASVoc3h9Zz9nG3CVvLw2rZflrU7D4XxqJ5jpRX2P
         dfqM6aQ+sBXFbRUQyEUzdab2cCg54j0Wiwww622//iIPSTmdflXDkXXZlEmkJTB1hWZn
         31AA==
X-Gm-Message-State: AOJu0YyD+vTYTvyU4Cv3clAGBsSR/MzCdKdMACAZPxrCvOeknWiglmtp
	5pr+29Z6lWwyn9Di8SFL3ozwV8UZwhrt5zbu7UbjNM4zFQHlU3cTjFessQ4wnfk=
X-Google-Smtp-Source: AGHT+IFKw3cfLVa/UDUeKRcVo+k4pNPULOD79lnEOfj72l2lZrzTno4S32QLVmBXdP7XKU7iGiXCIg==
X-Received: by 2002:a5d:4529:0:b0:35f:1d10:18f0 with SMTP id ffacd0b85a97d-367cead92b4mr4965631f8f.64.1720698742064;
        Thu, 11 Jul 2024 04:52:22 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:21 -0700 (PDT)
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
Subject: [PATCH v3 02/11] i2c: riic: Call pm_runtime_get_sync() when need to access registers
Date: Thu, 11 Jul 2024 14:51:58 +0300
Message-Id: <20240711115207.2843133-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to runtime resume the device as long as the IP registers
are not accessed. Calling pm_runtime_get_sync() at the register access
time leads to a simpler error path.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- collected tags

Changes in v2:
- none

 drivers/i2c/busses/i2c-riic.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c742ab6106b9..af7edc26462c 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -301,19 +301,15 @@ static const struct i2c_algorithm riic_algo = {
 
 static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 {
-	int ret = 0;
 	unsigned long rate;
 	int total_ticks, cks, brl, brh;
 	struct device *dev = riic->adapter.dev.parent;
 
-	pm_runtime_get_sync(dev);
-
 	if (t->bus_freq_hz > I2C_MAX_FAST_MODE_FREQ) {
 		dev_err(&riic->adapter.dev,
 			"unsupported bus speed (%dHz). %d max\n",
 			t->bus_freq_hz, I2C_MAX_FAST_MODE_FREQ);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	rate = clk_get_rate(riic->clk);
@@ -351,8 +347,7 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 	if (brl > (0x1F + 3)) {
 		dev_err(&riic->adapter.dev, "invalid speed (%lu). Too slow.\n",
 			(unsigned long)t->bus_freq_hz);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	brh = total_ticks - brl;
@@ -384,6 +379,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 		 t->scl_fall_ns / (1000000000 / rate),
 		 t->scl_rise_ns / (1000000000 / rate), cks, brl, brh);
 
+	pm_runtime_get_sync(dev);
+
 	/* Changing the order of accessing IICRST and ICE may break things! */
 	riic_writeb(riic, ICCR1_IICRST | ICCR1_SOWP, RIIC_ICCR1);
 	riic_clear_set_bit(riic, 0, ICCR1_ICE, RIIC_ICCR1);
@@ -397,9 +394,8 @@ static int riic_init_hw(struct riic_dev *riic, struct i2c_timings *t)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-out:
 	pm_runtime_put(dev);
-	return ret;
+	return 0;
 }
 
 static struct riic_irq_desc riic_irqs[] = {
-- 
2.39.2


