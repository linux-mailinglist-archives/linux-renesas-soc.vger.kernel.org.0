Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CD3958ACA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Aug 2022 16:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241000AbiHEO6I (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Aug 2022 10:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241004AbiHEO6E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Aug 2022 10:58:04 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA4D6567E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Aug 2022 07:57:57 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z12so3520276wrs.9
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Aug 2022 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=7SsUb4RnqYdGY7NZbGFeE1p2fk5tLm2KSXbLthw+eUc=;
        b=vmuTxHh9bApM0bk9wk8aY/krxm7TpNI3S2XXJDXk50DEjRoDMfkNBRBvT67GjqyxND
         Deq4Xqlbxl8yRjU3oyuaiIluBYRM6oll4xWlvbElKF/cx4s8dF1cAzp3DUX7c2eOitBU
         4fFO3RByk71aTBNx5S3u1WRgZh1EWREX/BSfKG3zaVkjwcTAepGdM/FEXTpfv97dADRp
         2dquBW9wIzZ6vG0QNaBGqWZubgYIqHSGzkUkcie6Qe5FJDX24TRrL25vly5DoqnzTn9D
         LfeGZZdtoA3SObLc0mw9i0EILFXS6S22RqKws1GWNHW+dPjvjwHL5nGgwxIMMjhnSRis
         KjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=7SsUb4RnqYdGY7NZbGFeE1p2fk5tLm2KSXbLthw+eUc=;
        b=cex+QwsPPzjv7LfVMOjMSSRcgZD2w/qFih03BZvU0hNuvzL6iUv4TrKExGZLGDzox0
         o/mfAYyqKeKlof7wFZHkESAUzVfSRDlTVLuNfSsg0dxy4Lh+SfpzJn5cIdX5U0pT6vY8
         SDaQrjCLoruxnAsTKBECkMYjoNbGd6We2087ElKw401DsX1a1tOCn1IStvi54TRqOWUo
         5PuRTnoyveW6ROugnqdRXxIKdx9plP/rpgA2PSZm0dwL7slTevupDI0IomA6XdLa6DtO
         xkT+jVVpNWIczeBv3kQiXE9pRyto/0WKpIbT7cL7JxzDhjZOniIRzKyzUlOU/VJ1o+81
         F9VQ==
X-Gm-Message-State: ACgBeo0zmjIKbfB18Q+U73Am7qJff1cYKpGILTIzvCKsZIuA8m/UuEiJ
        3MfUsrPQOU2gZUV8w67fIQiJDg==
X-Google-Smtp-Source: AA6agR6EzbrcTalOnNmFei00Tm04yszUKnzyEJd3bn3iXh0O4XHjC33qMUt4DXRzPwNxMs5jKZYk+w==
X-Received: by 2002:a05:6000:1d84:b0:20e:5fae:6e71 with SMTP id bk4-20020a0560001d8400b0020e5fae6e71mr4520306wrb.224.1659711476748;
        Fri, 05 Aug 2022 07:57:56 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:aef0:8606:da6b:79ef])
        by smtp.gmail.com with ESMTPSA id y1-20020adfd081000000b0022159d92004sm3102448wrh.82.2022.08.05.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 07:57:56 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Amit Kucheria <amitk@kernel.org>,
        linux-renesas-soc@vger.kernel.org (open list:RENESAS R-CAR THERMAL
        DRIVERS)
Subject: [PATCH v1 08/26] thermal/drivers/rcar: Use generic thermal_zone_get_trip() function
Date:   Fri,  5 Aug 2022 16:57:11 +0200
Message-Id: <20220805145729.2491611-9-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
References: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The thermal framework gives the possibility to register the trip
points with the thermal zone. When that is done, no get_trip_* ops are
needed and they can be removed.

Convert ops content logic into generic trip points and register them with the
thermal zone.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/rcar_thermal.c | 49 +++++-----------------------------
 1 file changed, 6 insertions(+), 43 deletions(-)

diff --git a/drivers/thermal/rcar_thermal.c b/drivers/thermal/rcar_thermal.c
index 4df42d70d867..003457810072 100644
--- a/drivers/thermal/rcar_thermal.c
+++ b/drivers/thermal/rcar_thermal.c
@@ -278,52 +278,16 @@ static int rcar_thermal_get_temp(struct thermal_zone_device *zone, int *temp)
 	return rcar_thermal_get_current_temp(priv, temp);
 }
 
-static int rcar_thermal_get_trip_type(struct thermal_zone_device *zone,
-				      int trip, enum thermal_trip_type *type)
-{
-	struct rcar_thermal_priv *priv = rcar_zone_to_priv(zone);
-	struct device *dev = rcar_priv_to_dev(priv);
-
-	/* see rcar_thermal_get_temp() */
-	switch (trip) {
-	case 0: /* +90 <= temp */
-		*type = THERMAL_TRIP_CRITICAL;
-		break;
-	default:
-		dev_err(dev, "rcar driver trip error\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int rcar_thermal_get_trip_temp(struct thermal_zone_device *zone,
-				      int trip, int *temp)
-{
-	struct rcar_thermal_priv *priv = rcar_zone_to_priv(zone);
-	struct device *dev = rcar_priv_to_dev(priv);
-
-	/* see rcar_thermal_get_temp() */
-	switch (trip) {
-	case 0: /* +90 <= temp */
-		*temp = MCELSIUS(90);
-		break;
-	default:
-		dev_err(dev, "rcar driver trip error\n");
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
 static struct thermal_zone_device_ops rcar_thermal_zone_of_ops = {
 	.get_temp	= rcar_thermal_get_temp,
 };
 
 static struct thermal_zone_device_ops rcar_thermal_zone_ops = {
 	.get_temp	= rcar_thermal_get_temp,
-	.get_trip_type	= rcar_thermal_get_trip_type,
-	.get_trip_temp	= rcar_thermal_get_trip_temp,
+};
+
+static struct thermal_trip trips[] = {
+	{ .type = THERMAL_TRIP_CRITICAL, .temperature = 90000 }
 };
 
 /*
@@ -531,9 +495,8 @@ static int rcar_thermal_probe(struct platform_device *pdev)
 						dev, i, priv,
 						&rcar_thermal_zone_of_ops);
 		} else {
-			priv->zone = thermal_zone_device_register(
-						"rcar_thermal",
-						1, 0, priv,
+			priv->zone = thermal_zone_device_register_with_trips(
+				"rcar_thermal", trips, ARRAY_SIZE(trips), 0, priv,
 						&rcar_thermal_zone_ops, NULL, 0,
 						idle);
 
-- 
2.25.1

