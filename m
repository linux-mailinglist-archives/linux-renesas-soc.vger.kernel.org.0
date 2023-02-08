Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54A3F68F7C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Feb 2023 20:04:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbjBHTEY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Feb 2023 14:04:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231608AbjBHTEW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 14:04:22 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D252F5649A
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Feb 2023 11:03:49 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id bg26so14066460wmb.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Feb 2023 11:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/hFyX9rV0l+08XHcIQph4Ja17yEnvPyO1rQ3FXTg9g=;
        b=iZ3UKTWLbcC42VpoBxl+wmKmUgBfhYJC8+DxqWoO6A5DfeMCuuY5UkCvo4fIG/d8Er
         KKhlMAsGanIGUYMeIuNpmwycqeD0tzAGOr006ZKNs9FqGwAwMsqFdBGbAM0r6lYHOtkM
         kIeTMVglMt870tJbNw/dLiZB/ljvO7kuzP9owO6LSx8pUI3beo+pkOQmsKAB7wKAia8X
         yTYKLdzsyfHR06DL7TUl1sos8jIxak4OxHoniXB/8oXhW6dRcw6cdhT2wqBLcaT8EQEo
         JSc1PNjETHZY95HrGSHAFuyLYVcCl67xN980A3lqGJw9F8alWpKSlPInfYKyPwIkSb+Y
         avSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/hFyX9rV0l+08XHcIQph4Ja17yEnvPyO1rQ3FXTg9g=;
        b=QRNhQIukxSbwnq285X5XUXaoAodoXELdT3olGuV/K4xuKQPiGcp7MTBW6mNPUFt6w3
         slu5SJHe0HZnyywqmZNB9YBi2q8eAeUmcDpCYmNTls4uw0AMPRVHLTuS/c/EkCVWOLml
         Eo4QP+GTKkEhIj2rMqXnEKrZ5onMAgpT7oRRAHd9tVlD63ZCpsvKxhbCWLQNppuZ8hln
         CuN+wVb7hxzv4OYWt3nkqGzRhZuoXUKc+Ss2e5Ptz2/3UYiTx/3gX8V06qmEUCa/AWt7
         gpV1TfFChEc5xio7fVjJvBW8ptEcSbfuNPWXfXQRFpTmh7TglltFXYpsxvfEycZIkfNM
         QnXg==
X-Gm-Message-State: AO0yUKXCq6u37aipRgwzeKiITWG8wN20wRrfEXTQclOI0Hx+1v6Macdo
        7EB8Du/ty+co5QgduSQ1mEAvqw==
X-Google-Smtp-Source: AK7set/M0kHxIB5VlBD4+m8E9LdWeGxGGit3wERna/aHAFCL9ieNlU3k9h0TW639wGarLUEYGc319A==
X-Received: by 2002:a05:600c:2e83:b0:3e1:787:d70f with SMTP id p3-20020a05600c2e8300b003e10787d70fmr2124785wmn.32.1675883027176;
        Wed, 08 Feb 2023 11:03:47 -0800 (PST)
Received: from sleipner.berto.se (p4fca2792.dip0.t-ipconnect.de. [79.202.39.146])
        by smtp.googlemail.com with ESMTPSA id c12-20020adffb4c000000b002b6bcc0b64dsm14201382wrs.4.2023.02.08.11.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 11:03:46 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/3] drivers/thermal/rcar_gen3_thermal: Fix device initialization
Date:   Wed,  8 Feb 2023 20:03:33 +0100
Message-Id: <20230208190333.3159879-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208190333.3159879-1-niklas.soderlund+renesas@ragnatech.se>
References: <20230208190333.3159879-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The thermal zone is registered before the device is register and the
thermal coefficients are calculated, providing a window for very
incorrect readings.

The reason why the zone was register before the device was fully
initialized was that the presence of the set_trips() callback is used to
determine if the driver supports interrupt or not, as it is not defined
if the device is incapable of interrupts.

Fix this by using the operations structure in the private data instead
of the zone to determine if interrupts are available or not, and
initialize the device before registering the zone.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/thermal/rcar_gen3_thermal.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 2dfce4f09631..8835846884d1 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -89,7 +89,8 @@ struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	struct thermal_zone_device_ops ops;
 	unsigned int num_tscs;
-	void (*thermal_init)(struct rcar_gen3_thermal_tsc *tsc);
+	void (*thermal_init)(struct rcar_gen3_thermal_priv *priv,
+			     struct rcar_gen3_thermal_tsc *tsc);
 	int ptat[3];
 };
 
@@ -240,7 +241,7 @@ static irqreturn_t rcar_gen3_thermal_irq(int irq, void *data)
 	for (i = 0; i < priv->num_tscs; i++) {
 		status = rcar_gen3_thermal_read(priv->tscs[i], REG_GEN3_IRQSTR);
 		rcar_gen3_thermal_write(priv->tscs[i], REG_GEN3_IRQSTR, 0);
-		if (status)
+		if (status && priv->tscs[i]->zone)
 			thermal_zone_device_update(priv->tscs[i]->zone,
 						   THERMAL_EVENT_UNSPECIFIED);
 	}
@@ -311,7 +312,8 @@ static bool rcar_gen3_thermal_read_fuses(struct rcar_gen3_thermal_priv *priv)
 	return true;
 }
 
-static void rcar_gen3_thermal_init_r8a7795es1(struct rcar_gen3_thermal_tsc *tsc)
+static void rcar_gen3_thermal_init_r8a7795es1(struct rcar_gen3_thermal_priv *priv,
+					      struct rcar_gen3_thermal_tsc *tsc)
 {
 	rcar_gen3_thermal_write(tsc, REG_GEN3_CTSR,  CTSR_THBGR);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_CTSR,  0x0);
@@ -322,7 +324,7 @@ static void rcar_gen3_thermal_init_r8a7795es1(struct rcar_gen3_thermal_tsc *tsc)
 
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0x3F);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
-	if (tsc->zone->ops->set_trips)
+	if (priv->ops.set_trips)
 		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN,
 					IRQ_TEMPD1 | IRQ_TEMP2);
 
@@ -338,7 +340,8 @@ static void rcar_gen3_thermal_init_r8a7795es1(struct rcar_gen3_thermal_tsc *tsc)
 	usleep_range(1000, 2000);
 }
 
-static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
+static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_priv *priv,
+				   struct rcar_gen3_thermal_tsc *tsc)
 {
 	u32 reg_val;
 
@@ -350,7 +353,7 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQCTL, 0);
 	rcar_gen3_thermal_write(tsc, REG_GEN3_IRQMSK, 0);
-	if (tsc->zone->ops->set_trips)
+	if (priv->ops.set_trips)
 		rcar_gen3_thermal_write(tsc, REG_GEN3_IRQEN,
 					IRQ_TEMPD1 | IRQ_TEMP2);
 
@@ -510,6 +513,9 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	for (i = 0; i < priv->num_tscs; i++) {
 		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
 
+		priv->thermal_init(priv, tsc);
+		rcar_gen3_thermal_calc_coefs(priv, tsc, *ths_tj_1);
+
 		zone = devm_thermal_of_zone_register(dev, i, tsc, &priv->ops);
 		if (IS_ERR(zone)) {
 			dev_err(dev, "Sensor %u: Can't register thermal zone\n", i);
@@ -518,9 +524,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		}
 		tsc->zone = zone;
 
-		priv->thermal_init(tsc);
-		rcar_gen3_thermal_calc_coefs(priv, tsc, *ths_tj_1);
-
 		tsc->zone->tzp->no_hwmon = false;
 		ret = thermal_add_hwmon_sysfs(tsc->zone);
 		if (ret)
@@ -558,7 +561,7 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
 	for (i = 0; i < priv->num_tscs; i++) {
 		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
 
-		priv->thermal_init(tsc);
+		priv->thermal_init(priv, tsc);
 	}
 
 	return 0;
-- 
2.39.1

