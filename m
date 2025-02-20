Return-Path: <linux-renesas-soc+bounces-13427-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2632AA3DEA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 16:33:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F293BBECB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 15:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19DDD20CCC3;
	Thu, 20 Feb 2025 15:28:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D475B20C00C;
	Thu, 20 Feb 2025 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065291; cv=none; b=frxmn1whYgSroOrj1diWCViDDzIqzC9Uu2RG7wF1DSN6yKZ9GuajidY60uiZrbNBLjosGTjZWXunmsiNodUrb2l4l0hKq14A1SFo7pjTWH2/WPsqA+xW44YVNzSOJ/WiFlkIrIKybAFShjP/pMajLb2JbkCIC5pLkON0D4VtZV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065291; c=relaxed/simple;
	bh=SpWQh85zGyi6wSz/zp1SDb4fObo0nHPBblsuzhr5za4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r6K6vZu4gX38Rv9PiB/JsWL70q0ANbLHdOQat3K7Fpz4LLoWEZIXK1llFxMXsEwmsbtqUdNRPsJakr3x/FFdDSLZM7eZJ4VBhui2K2DJJ/ukh42NMs20tbeZHkSwDErFiHAE/ne3999EXnql2DMWrs5plWSFCVO+P1+kJM+qtPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: gWl5MlYwR/i02rZOparpsA==
X-CSE-MsgGUID: 7zjGwnoYTwyXIbKs1GBiew==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Feb 2025 00:28:08 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.134])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D7A894043708;
	Fri, 21 Feb 2025 00:28:02 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: mturquette@baylibre.com,
	magnus.damm@gmail.com,
	krzk+dt@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	sboyd@kernel.org,
	geert+renesas@glider.be,
	lukasz.luba@arm.com,
	rafael@kernel.org,
	robh@kernel.org,
	p.zabel@pengutronix.de
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 5/7] thermal: renesas: rzg3e: Add safety check when reading temperature
Date: Thu, 20 Feb 2025 16:26:10 +0100
Message-ID: <20250220152640.49010-6-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
References: <20250220152640.49010-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Becaure reading temperature may fail, add mechanism to panic in case
reading the temperature fails after a given number of trials. This is due
to the thermal core disabling the thermal zone device after a couple of
consecutive attempt failures.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
This is proposed in a seperate patch on purpose, as it may be subject to debate
and would ease the review.

 drivers/thermal/renesas/rzg3e_thermal.c | 38 +++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/renesas/rzg3e_thermal.c b/drivers/thermal/renesas/rzg3e_thermal.c
index 4b7b16b1fb09..b70bff45c88f 100644
--- a/drivers/thermal/renesas/rzg3e_thermal.c
+++ b/drivers/thermal/renesas/rzg3e_thermal.c
@@ -83,6 +83,19 @@
 #define TSU_TIMEOUT_US		10000
 #define TSU_MIN_CLOCK_RATE	24000000
 
+/*
+ * Number of consecutive errors before shutdown
+ *
+ * While simulating thermal sensor failure, we have noticed that the thermal
+ * core tries to fetch the temperature a couple times and then disable the
+ * thermal zone device. In case of extreme heat, this might lead to SoC
+ * destruction.
+ *
+ * Let's prevent this by limitating the number of failure and panic in
+ * case it happens.
+ */
+#define MAX_TEMP_READ_ERRORS       10
+
 /**
  * struct rzg3e_thermal_priv - RZ/G3E thermal private data structure
  * @base: TSU base address
@@ -93,6 +106,7 @@
  * @conv_complete: ADC conversion completion
  * @reg_lock: protect shared register access
  * @cached_temp: last computed temperature (milliCelsius)
+ * @error_count: Track consecutive errors
  * @trmval: trim (calibration) values
  */
 struct rzg3e_thermal_priv {
@@ -104,6 +118,7 @@ struct rzg3e_thermal_priv {
 	struct completion conv_complete;
 	spinlock_t reg_lock;
 	int cached_temp;
+	atomic_t error_count;
 	u32 trmval[2];
 };
 
@@ -200,6 +215,7 @@ static irqreturn_t rzg3e_thermal_adc_irq(int irq, void *dev_id)
 static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 {
 	struct rzg3e_thermal_priv *priv = thermal_zone_device_priv(zone);
+	int error_count;
 	u32 val;
 	int ret;
 
@@ -217,7 +233,7 @@ static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 					TSU_POLL_DELAY_US, TSU_TIMEOUT_US);
 	if (ret) {
 		dev_err(priv->dev, "ADC conversion timed out\n");
-		return ret;
+		goto handle_error;
 	}
 
 	/* Start conversion */
@@ -225,15 +241,33 @@ static int rzg3e_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 
 	if (!wait_for_completion_timeout(&priv->conv_complete,
 					 msecs_to_jiffies(100))) {
+		ret = -ETIMEDOUT;
 		dev_err(priv->dev, "ADC conversion completion timeout\n");
-		return -ETIMEDOUT;
+		goto handle_error;
 	}
 
 	scoped_guard(spinlock_irqsave, &priv->reg_lock) {
 		*temp = priv->cached_temp;
 	}
 
+	/* Reset error count on successful read */
+	atomic_set(&priv->error_count, 0);
 	return 0;
+
+handle_error:
+	error_count = atomic_inc_return(&priv->error_count);
+	if (error_count >= MAX_TEMP_READ_ERRORS) {
+		dev_emerg(priv->dev,
+			"Failed to read temperature %d times, initiating emergency shutdown\n",
+			error_count);
+		mdelay(100);
+		panic("Temperature sensor failure - emergency shutdown");
+	}
+
+	dev_err(priv->dev, "Failed to read temperature (error %d), attempt %d/%d\n",
+		ret, error_count, MAX_TEMP_READ_ERRORS);
+
+	return ret;
 }
 
 /* Convert temperature in milliCelsius to raw sensor code */
-- 
2.25.1


