Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBE63BE892
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jul 2021 15:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231575AbhGGNQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jul 2021 09:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhGGNQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jul 2021 09:16:23 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20DFDC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jul 2021 06:13:42 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q17so3025738wrv.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jul 2021 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/t4CGD6lK/wI3C8RkHXXrZaiSgvDd9+19bQ4kCEFaU=;
        b=RADpEqNaVLlpROdv1XXCYl2UPFMcx1pM6fbmXGmH+gKqX+9n9pUAgw2G16blT2kcIS
         ETYb0GOrTGPtISo9U0s8HeDHgHf51VIc/oJlXZ5idYdbWpQ58L/X4ccgm1mxD3sP+pc8
         3LscWHNBHdA3OF3K0HgEyEOfU+5PnHOrJc7rHIhquJw/t9R2kG6H9EMJES55ElWwxwc7
         dRYBUj0MiUPWXPbH2nfu9WwAZqKSUekTrK/jIGC27H+15YbPYnMqSVQA6TU18NZeiM74
         5Rkr46OpspsGC+APoo87gar0TDzQvEXyRD8htfYp5VXOih8i1y8GoTCPuxf4hB1p3ze3
         d2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/t4CGD6lK/wI3C8RkHXXrZaiSgvDd9+19bQ4kCEFaU=;
        b=nswApt//1w6NWFenZ45twWfmFI7CHC5lBK/yrBD2Q5NQd/TjThp7Y1LF+9zjQ+QcqF
         /CR+yWB1ebDds0mxyXNNGUeSPzn+/0W2MYP8CHMChf8IOT1Mpeqsr9mRT+YwJuiL8F8O
         nwYKpPw3/k2f8pqcQtVPMnShDgM++wYuaQWv+B6Juqf8gYhlmQbMLuEtFxVI7zpT7TDi
         BTaJTdup5LHiqpCVygkmcyZG1mCAHTLG0iiXE1yhqtNUKoBBHpWJhpE7HMov4zOEAwb7
         jp1Z7pVoa1KtR7wGnV/+GuA+P+7rJzhwNItmeBg7JDiKRjsbtFACUt/j7dJD/TSo+qCv
         RP0w==
X-Gm-Message-State: AOAM530kkpdWiVwC5m6Q2zRRuvbhQg6RTz8Gdq5uwfJvFZmMmn2yQkIX
        GwxZLrHe5lUZ1+OOy8sC343N9GGsOvD1wg==
X-Google-Smtp-Source: ABdhPJydMuikwObnVEYluJdDMfadZYhP/Slwd47Db8z14t/7v79rjFofEaclJbDU+LAWDrfa4J/TEw==
X-Received: by 2002:adf:ce84:: with SMTP id r4mr15207462wrn.397.1625663620725;
        Wed, 07 Jul 2021 06:13:40 -0700 (PDT)
Received: from bismarck.berto.se (p4fca2710.dip0.t-ipconnect.de. [79.202.39.16])
        by smtp.googlemail.com with ESMTPSA id l20sm19233670wmq.3.2021.07.07.06.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:13:40 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] thermal: rcar_gen3_thermal: Create struct for OF match data
Date:   Wed,  7 Jul 2021 15:13:04 +0200
Message-Id: <20210707131306.4098443-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707131306.4098443-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210707131306.4098443-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Prepare for storing more information in the OF match data by using a
struct instead of a single integer value. There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 39 +++++++++++++++++++----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index fdf16aa34eb470c7..770f1daae5379053 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -79,6 +79,10 @@ struct equation_coefs {
 	int b2;
 };
 
+struct rcar_gen3_thermal_info {
+	int ths_tj_1;
+};
+
 struct rcar_gen3_thermal_tsc {
 	void __iomem *base;
 	struct thermal_zone_device *zone;
@@ -88,6 +92,7 @@ struct rcar_gen3_thermal_tsc {
 };
 
 struct rcar_gen3_thermal_priv {
+	const struct rcar_gen3_thermal_info *info;
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	unsigned int num_tscs;
 	void (*thermal_init)(struct rcar_gen3_thermal_tsc *tsc);
@@ -243,44 +248,50 @@ static void rcar_gen3_thermal_init(struct rcar_gen3_thermal_tsc *tsc)
 	usleep_range(1000, 2000);
 }
 
-static const int rcar_gen3_ths_tj_1 = 126;
-static const int rcar_gen3_ths_tj_1_m3_w = 116;
+static const struct rcar_gen3_thermal_info rcar_gen3_thermal_gen3 = {
+	.ths_tj_1 = 126,
+};
+
+static const struct rcar_gen3_thermal_info rcar_gen3_thermal_m3w = {
+	.ths_tj_1 = 116,
+};
+
 static const struct of_device_id rcar_gen3_thermal_dt_ids[] = {
 	{
 		.compatible = "renesas,r8a774a1-thermal",
-		.data = &rcar_gen3_ths_tj_1_m3_w,
+		.data = &rcar_gen3_thermal_m3w,
 	},
 	{
 		.compatible = "renesas,r8a774b1-thermal",
-		.data = &rcar_gen3_ths_tj_1,
+		.data = &rcar_gen3_thermal_gen3,
 	},
 	{
 		.compatible = "renesas,r8a774e1-thermal",
-		.data = &rcar_gen3_ths_tj_1,
+		.data = &rcar_gen3_thermal_gen3,
 	},
 	{
 		.compatible = "renesas,r8a7795-thermal",
-		.data = &rcar_gen3_ths_tj_1,
+		.data = &rcar_gen3_thermal_gen3,
 	},
 	{
 		.compatible = "renesas,r8a7796-thermal",
-		.data = &rcar_gen3_ths_tj_1_m3_w,
+		.data = &rcar_gen3_thermal_m3w,
 	},
 	{
 		.compatible = "renesas,r8a77961-thermal",
-		.data = &rcar_gen3_ths_tj_1_m3_w,
+		.data = &rcar_gen3_thermal_m3w,
 	},
 	{
 		.compatible = "renesas,r8a77965-thermal",
-		.data = &rcar_gen3_ths_tj_1,
+		.data = &rcar_gen3_thermal_gen3,
 	},
 	{
 		.compatible = "renesas,r8a77980-thermal",
-		.data = &rcar_gen3_ths_tj_1,
+		.data = &rcar_gen3_thermal_gen3,
 	},
 	{
 		.compatible = "renesas,r8a779a0-thermal",
-		.data = &rcar_gen3_ths_tj_1,
+		.data = &rcar_gen3_thermal_gen3,
 	},
 	{},
 };
@@ -307,7 +318,6 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 {
 	struct rcar_gen3_thermal_priv *priv;
 	struct device *dev = &pdev->dev;
-	const int *ths_tj_1 = of_device_get_match_data(dev);
 	struct resource *res;
 	struct thermal_zone_device *zone;
 	int ret, i;
@@ -320,6 +330,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->info = of_device_get_match_data(dev);
+
 	priv->thermal_init = rcar_gen3_thermal_init;
 	if (soc_device_match(r8a7795es1))
 		priv->thermal_init = rcar_gen3_thermal_init_r8a7795es1;
@@ -352,7 +364,8 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		priv->tscs[i] = tsc;
 
 		priv->thermal_init(tsc);
-		rcar_gen3_thermal_calc_coefs(tsc, ptat, thcodes[i], *ths_tj_1);
+		rcar_gen3_thermal_calc_coefs(tsc, ptat, thcodes[i],
+					     priv->info->ths_tj_1);
 
 		zone = devm_thermal_zone_of_sensor_register(dev, i, tsc,
 							    &rcar_gen3_tz_of_ops);
-- 
2.32.0

