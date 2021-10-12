Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0680942998D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Oct 2021 00:58:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbhJKXAQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 11 Oct 2021 19:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235600AbhJKXAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 19:00:15 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34341C061745
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 15:58:15 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v17so60759243wrv.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Oct 2021 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BGMxwj9S4tGsGbVMFGP061SaoGO3sR5swaKq89xPTbo=;
        b=lEUFXmfh6Pmy+jKTw8f9eUWzj6VB6oi4/cP7uEK6G2Cv1QmBeCnFAXh7vy6FaO1IFK
         m5g2KzZ3SlBJRTW6n2FbKTFaQMtD+hd4HWlsJgNR9MBy5RvSNBI3Sj+EgbIEwrxur5ri
         hGt3DYB6ZuxdjsUzAA6VU+Zp1jp0N/CZN4SOqNKUilNhi5eSDgb8YACezbcsFyexieTf
         9AzSFAOabVcB21jL2iC7kFUCa02KHAW3N+llUAaxvFFoBNrrw4Q7BHoC0lrb1T3vJBjL
         cAlryep1u0q9/d9M0HFsKBUdUR5TUGm3XV+TUSsanDVpXw67NcnaTDCk27FuJUIeikzM
         V24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BGMxwj9S4tGsGbVMFGP061SaoGO3sR5swaKq89xPTbo=;
        b=NJ97Pop8NecFQKOUXeauvXIBcrytewR4oHzUvPZS6awfRAhxFxAv8gy1U73u/lVo67
         4okUfWD6RAxzeisEqRpy16p6DLS5FuF7eH8e3/CGe7Mt1g9w/2j9m59r7DVZMrG03U8B
         kzObHWyNPJ1sRjWk1SlR3aDDJOU+GLmgErI+F+/xqn+csZv1Aj67AiXkQ8I1xRKmqYxx
         S2MByqJD7fpsP/oQ3mXCSMcUSBL16Y3b1e3akBaSJHQdG0aTj0rzIAIbrR7SPUuKXSd8
         ZTuvl9luxP2P/62MutMcORwjk8bdO3DCvG5Q23vvOS+FN9CLILEaeDfnx3QTe0+es013
         1nwg==
X-Gm-Message-State: AOAM5308q3H2bO5REL1vWkLig+rqXLyJRWLAvsr3UICZhbq3azQMWq7R
        k++ASpMXv34JQ2/zfA/OihYu8Bs/z1KLirAT
X-Google-Smtp-Source: ABdhPJxdqJD4q5Gygm2xNWaE+uKfpMbC5OAdqmxKZXgeBoBMG9RVEiGR6MpNsD1Fy5JHWDpdIdmeUA==
X-Received: by 2002:adf:e584:: with SMTP id l4mr18083336wrm.173.1633993093743;
        Mon, 11 Oct 2021 15:58:13 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id h8sm9240890wrm.27.2021.10.11.15.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 15:58:13 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] thermal: rcar_gen3_thermal: Store thcode and ptat in priv data
Date:   Tue, 12 Oct 2021 00:58:01 +0200
Message-Id: <20211011225802.11497-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211011225802.11497-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211011225802.11497-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Prepare for reading the THCODE and PTAT values from hardware fuses by
storing the values used during calculations in the drivers private
data structures.

As the values are now stored directly in the private data structures
there is no need to keep track of the TSC channel id as its only usage
was to lookup the THCODE row, drop it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since RFT
- Keep thcodes array static.
---
 drivers/thermal/rcar_gen3_thermal.c | 51 ++++++++++++++++-------------
 1 file changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 85228d308dd35b19..7d7e6ebe837a83af 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -62,15 +62,6 @@
 
 #define TSC_MAX_NUM	5
 
-/* default THCODE values if FUSEs are missing */
-static const int thcodes[TSC_MAX_NUM][3] = {
-	{ 3397, 2800, 2221 },
-	{ 3393, 2795, 2216 },
-	{ 3389, 2805, 2237 },
-	{ 3415, 2694, 2195 },
-	{ 3356, 2724, 2244 },
-};
-
 /* Structure for thermal temperature calculation */
 struct equation_coefs {
 	int a1;
@@ -84,13 +75,14 @@ struct rcar_gen3_thermal_tsc {
 	struct thermal_zone_device *zone;
 	struct equation_coefs coef;
 	int tj_t;
-	unsigned int id; /* thermal channel id */
+	int thcode[3];
 };
 
 struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	unsigned int num_tscs;
 	void (*thermal_init)(struct rcar_gen3_thermal_tsc *tsc);
+	int ptat[3];
 };
 
 static inline u32 rcar_gen3_thermal_read(struct rcar_gen3_thermal_tsc *tsc,
@@ -133,8 +125,8 @@ static inline void rcar_gen3_thermal_write(struct rcar_gen3_thermal_tsc *tsc,
 /* no idea where these constants come from */
 #define TJ_3 -41
 
-static void rcar_gen3_thermal_calc_coefs(struct rcar_gen3_thermal_tsc *tsc,
-					 int *ptat, const int *thcode,
+static void rcar_gen3_thermal_calc_coefs(struct rcar_gen3_thermal_priv *priv,
+					 struct rcar_gen3_thermal_tsc *tsc,
 					 int ths_tj_1)
 {
 	/* TODO: Find documentation and document constant calculation formula */
@@ -143,16 +135,16 @@ static void rcar_gen3_thermal_calc_coefs(struct rcar_gen3_thermal_tsc *tsc,
 	 * Division is not scaled in BSP and if scaled it might overflow
 	 * the dividend (4095 * 4095 << 14 > INT_MAX) so keep it unscaled
 	 */
-	tsc->tj_t = (FIXPT_INT((ptat[1] - ptat[2]) * (ths_tj_1 - TJ_3))
-		     / (ptat[0] - ptat[2])) + FIXPT_INT(TJ_3);
+	tsc->tj_t = (FIXPT_INT((priv->ptat[1] - priv->ptat[2]) * (ths_tj_1 - TJ_3))
+		     / (priv->ptat[0] - priv->ptat[2])) + FIXPT_INT(TJ_3);
 
-	tsc->coef.a1 = FIXPT_DIV(FIXPT_INT(thcode[1] - thcode[2]),
+	tsc->coef.a1 = FIXPT_DIV(FIXPT_INT(tsc->thcode[1] - tsc->thcode[2]),
 				 tsc->tj_t - FIXPT_INT(TJ_3));
-	tsc->coef.b1 = FIXPT_INT(thcode[2]) - tsc->coef.a1 * TJ_3;
+	tsc->coef.b1 = FIXPT_INT(tsc->thcode[2]) - tsc->coef.a1 * TJ_3;
 
-	tsc->coef.a2 = FIXPT_DIV(FIXPT_INT(thcode[1] - thcode[0]),
+	tsc->coef.a2 = FIXPT_DIV(FIXPT_INT(tsc->thcode[1] - tsc->thcode[0]),
 				 tsc->tj_t - FIXPT_INT(ths_tj_1));
-	tsc->coef.b2 = FIXPT_INT(thcode[0]) - tsc->coef.a2 * ths_tj_1;
+	tsc->coef.b2 = FIXPT_INT(tsc->thcode[0]) - tsc->coef.a2 * ths_tj_1;
 }
 
 static int rcar_gen3_thermal_round(int temp)
@@ -174,7 +166,7 @@ static int rcar_gen3_thermal_get_temp(void *devdata, int *temp)
 	/* Read register and convert to mili Celsius */
 	reg = rcar_gen3_thermal_read(tsc, REG_GEN3_TEMP) & CTEMP_MASK;
 
-	if (reg <= thcodes[tsc->id][1])
+	if (reg <= tsc->thcode[1])
 		val = FIXPT_DIV(FIXPT_INT(reg) - tsc->coef.b1,
 				tsc->coef.a1);
 	else
@@ -401,9 +393,15 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	unsigned int i;
 	int ret;
 
-	/* default values if FUSEs are missing */
+	/* Default THCODE values in case FUSEs are not set. */
 	/* TODO: Read values from hardware on supported platforms */
-	int ptat[3] = { 2631, 1509, 435 };
+	static const int thcodes[TSC_MAX_NUM][3] = {
+		{ 3397, 2800, 2221 },
+		{ 3393, 2795, 2216 },
+		{ 3389, 2805, 2237 },
+		{ 3415, 2694, 2195 },
+		{ 3356, 2724, 2244 },
+	};
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -413,6 +411,10 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 	if (soc_device_match(r8a7795es1))
 		priv->thermal_init = rcar_gen3_thermal_init_r8a7795es1;
 
+	priv->ptat[0] = 2631;
+	priv->ptat[1] = 1509;
+	priv->ptat[2] = 435;
+
 	platform_set_drvdata(pdev, priv);
 
 	if (rcar_gen3_thermal_request_irqs(priv, pdev))
@@ -439,7 +441,10 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 			ret = PTR_ERR(tsc->base);
 			goto error_unregister;
 		}
-		tsc->id = i;
+
+		tsc->thcode[0] = thcodes[i][0];
+		tsc->thcode[1] = thcodes[i][1];
+		tsc->thcode[2] = thcodes[i][2];
 
 		priv->tscs[i] = tsc;
 
@@ -453,7 +458,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 		tsc->zone = zone;
 
 		priv->thermal_init(tsc);
-		rcar_gen3_thermal_calc_coefs(tsc, ptat, thcodes[i], *ths_tj_1);
+		rcar_gen3_thermal_calc_coefs(priv, tsc, *ths_tj_1);
 
 		tsc->zone->tzp->no_hwmon = false;
 		ret = thermal_add_hwmon_sysfs(tsc->zone);
-- 
2.33.0

