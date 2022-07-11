Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAD2656D174
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Jul 2022 23:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbiGJVZx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 10 Jul 2022 17:25:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbiGJVZW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Jul 2022 17:25:22 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FADF11145
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Jul 2022 14:25:07 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id d13-20020a05600c34cd00b003a2dc1cf0b4so2016498wmq.4
        for <linux-renesas-soc@vger.kernel.org>; Sun, 10 Jul 2022 14:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CzlgEZhrlCFL+OQsf/SzUTaiNcFhv4XXUC/LzAeamWA=;
        b=4b2oQHMn1N6LHmtTd4eLIKOgP5mFZS8x6sOM2tys0hIGAdoPLysuHebHLdBNixoEG2
         b2ufVF7p9CnW3H3KCCtfZLzdmfMxuDlV0dvrjeBFw/AkVSFgWALOPNkZjsNwWR6ciIPK
         9+bLzPfv432FW7t9Fuv69r/RRS01BrFSSt0yWdXckILFmmKLxLeQnsiJTBVxjs4zrqd/
         CrImGfrTo3K6DgWH+cadfQAfXEmD9O8RWcFt4fQb9Mveu+faJWrpGV+YHe3ecwVWe5/S
         zFXRs9ksSSwBk3FrpyhL40OCN5rgZWSji17di9jLuawzyRPGly6vZsV4QH3pBBCJZ+lS
         JPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CzlgEZhrlCFL+OQsf/SzUTaiNcFhv4XXUC/LzAeamWA=;
        b=4dYz5nLAuPeqc6IA3DUDf2CwqlkbHSWL6+9lr+TMj7sozWza/z6J5t4ZjgPFb49fuJ
         QLpsoQUTiJ1Qz5xPPEsxm9pdNojTX4nVo+Bi3GrRMc69LsAGdwqmhrkUMYJk30SwJeeX
         k2eIHgmd+Jf6Kd1eCRbmomKQ6+D10OCxOnqlqAFbkDhf8v5un7Hzv13iZ6rkAm/dRB97
         mc+47NrfRQRJ3JNzqCPR0EPygWy15kPDkuBlOusMnjC42dfeJlY8WBU/HEf2JY9IqkS3
         jsIILoD4uYQH81X3x22mdaB/0YZ0KSc/1EouC0P3RJjPDSUZIFtpBloGA+6S1nvI9x8F
         oeSw==
X-Gm-Message-State: AJIora/v8/RFytN3SRVEWMnlk4oz45kC5gMswEJ/SidUYBL1wqtIwWMg
        yQyG7a98t6ye5BfYZwadxfY4pg==
X-Google-Smtp-Source: AGRyM1tUnSuEusuW6oUitN0W13iIYIqg1NdwqHUrz3fQTZ9nWgA73i89QNlbmbKyUHDhE0j/BiMP4g==
X-Received: by 2002:a05:600c:3b13:b0:3a1:8ad9:9d2 with SMTP id m19-20020a05600c3b1300b003a18ad909d2mr12027916wms.129.1657488306697;
        Sun, 10 Jul 2022 14:25:06 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:c7c0:6823:f3ce:2447])
        by smtp.gmail.com with ESMTPSA id m19-20020a05600c3b1300b003a2dd0d21f0sm7142759wms.13.2022.07.10.14.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:25:06 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linexp.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, khilman@baylibre.com, abailon@baylibre.com,
        amitk@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL
        DRIVERS)
Subject: [PATCH v1 17/33] thermal/drivers/rcar: Switch to new of API
Date:   Sun, 10 Jul 2022 23:24:07 +0200
Message-Id: <20220710212423.681301-18-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220710212423.681301-1-daniel.lezcano@linexp.org>
References: <20220710212423.681301-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach.

Use this new API.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
---
 drivers/thermal/rcar_gen3_thermal.c | 16 ++++++++--------
 drivers/thermal/rcar_thermal.c      | 13 +++----------
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 43eb25b167bc..29946114a8f9 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -164,9 +164,9 @@ static int rcar_gen3_thermal_round(int temp)
 	return result * RCAR3_THERMAL_GRAN;
 }
 
-static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
+static int rcar_gen3_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct rcar_gen3_thermal_tsc *tsc = devdata;
+	struct rcar_gen3_thermal_tsc *tsc = tz->devdata;
 	int mcelsius, val;
 	int reg;
 
@@ -203,9 +203,9 @@ static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
 	return INT_FIXPT(val);
 }
 
-static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
+static int rcar_gen3_thermal_set_trips(struct thermal_zone_device *tz, int low, int high)
 {
-	struct rcar_gen3_thermal_tsc *tsc = devdata;
+	struct rcar_gen3_thermal_tsc *tsc = tz->devdata;
 	u32 irqmsk = 0;
 
 	if (low != -INT_MAX) {
@@ -225,7 +225,7 @@ static int rcar_gen3_thermal_set_trips(void *devdata, int low, int high)
 	return 0;
 }
 
-static struct thermal_zone_of_device_ops rcar_gen3_tz_of_ops = {
+static struct thermal_zone_device_ops rcar_gen3_tz_of_ops = {
 	.get_temp	= rcar_gen3_thermal_get_temp,
 	.set_trips	= rcar_gen3_thermal_set_trips,
 };
@@ -504,8 +504,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	for (i = 0; i < priv->num_tscs; i++) {
 		struct rcar_gen3_thermal_tsc *tsc = priv->tscs[i];
 
-		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
-							    &rcar_gen3_tz_of_ops);
+		zone = devm_thermal_of_zone_register(dev, i, tsc,
+						     &rcar_gen3_tz_of_ops);
 		if (IS_ERR(zone)) {
 			dev_err(dev, "Can't register thermal zone\n");
 			ret = PTR_ERR(zone);
@@ -556,7 +556,7 @@ static int __maybe_unused rcar_gen3_thermal_resume(struct device *dev)
 
 		priv->thermal_init(tsc);
 		if (zone->ops->set_trips)
-			rcar_gen3_thermal_set_trips(tsc, zone->prev_low_trip,
+			rcar_gen3_thermal_set_trips(zone, zone->prev_low_trip,
 						    zone->prev_high_trip);
 	}
 
diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 1d729ed4d685..4df42d70d867 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -271,13 +271,6 @@ static int rcar_thermal_get_current_temp(struct rcar_thermal_priv *priv,
 	return 0;
 }
 
-static int rcar_thermal_of_get_temp(void *data, int *temp)
-{
-	struct rcar_thermal_priv *priv = data;
-
-	return rcar_thermal_get_current_temp(priv, temp);
-}
-
 static int rcar_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 {
 	struct rcar_thermal_priv *priv = rcar_zone_to_priv(zone);
@@ -323,8 +316,8 @@ static int rcar_thermal_get_trip_temp(struct thermal_zone_device *zone,
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops rcar_thermal_zone_of_ops = {
-	.get_temp	= rcar_thermal_of_get_temp,
+static struct thermal_zone_device_ops rcar_thermal_zone_of_ops = {
+	.get_temp	= rcar_thermal_get_temp,
 };
 
 static struct thermal_zone_device_ops rcar_thermal_zone_ops = {
@@ -534,7 +527,7 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 			goto error_unregister;
 
 		if (chip->use_of_thermal) {
-			priv->zone = devm_thermal_zone_of_sensor_register(
+			priv->zone = devm_thermal_of_zone_register(
 						dev, i, priv,
 						&rcar_thermal_zone_of_ops);
 		} else {
-- 
2.25.1

