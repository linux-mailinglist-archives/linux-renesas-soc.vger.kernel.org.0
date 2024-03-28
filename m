Return-Path: <linux-renesas-soc+bounces-3537-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8E4874CE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 12:03:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6849282414
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 11:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277B886AC8;
	Thu,  7 Mar 2024 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="C3bmehjd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFACD126F2A
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 11:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709809387; cv=none; b=CRFBae3uECzycQPAWne/VHwFu98Nld90nv6bwQ203SPEeKYqoNrlzUggDROk22if3iL7/wENYn75RI4gCtXnamQgTUn60oBPhhZmPJWSZNa2STShvfBh+t7FKqYJJLh4cttBSsH6b7oHd60uTp/uIWJnI6T6FCVw+XhLv0sLbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709809387; c=relaxed/simple;
	bh=mkQxESZx7XzBrzRBPALpIuDYSAuVnZKyaXQ619EMRxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxDbQqQUB+61/Z/MydvHF4cljdSQBdGpGlUZFFeSdYLKdkMBTmnwIOgm3/fXdtXOz5EAaPR627XR1J5mh74P0vi5V6GtWuSXvFycTWKvbjgzhgELrInf5bZkEoU5bhYW/wzWP4KHANsWLl5EJOeE/Mh+O1EqCxOt6Tk5yJXK+Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=C3bmehjd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4467d570cdso95895166b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 03:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709809383; x=1710414183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jrdoUk5yLq9JELO82ucEpyuoRJmhADQXtuT0g38B928=;
        b=C3bmehjdmOujDEzv26YaQHtBS1hhMPx46T964+L+HhWlEuEs5HgcjF0tMgZIMCpI+/
         sA+c68nltVNw8IJFT9l1rMiKVNftdyVuE6ar0/YqbHVB99KHC7OqJNEP1q+p0+nLZ/uJ
         P1LxBY3bccfhp/G6CQ4Uk5fMxVdICMBvOWBbGchmjSduzQsAzcOoULdfKYUGyZ1bNk2H
         H7/pP/zpzYik/uqgjxAzq0Ts7Gzw6ZnIoKAhYHFJ22v5LtAs7aYlOYzvaqyj8nyHwB/o
         qNlV3Og1QcoAtKeU+O7AO7Bgb6erYpF6NPfHhV4ax8uxyCmqAoXzG2YPJyJKzlVoMoyP
         S6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809383; x=1710414183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jrdoUk5yLq9JELO82ucEpyuoRJmhADQXtuT0g38B928=;
        b=QK/H/SfWZ+YeDUT+8Ii/tqOpVZrgtZX9zVC+Rj1v6PYXs6+Z10vmhBeO0smPgXfiSG
         w0sKhls7F+Wk0Mzi/FtB93F2HvAfk/l8gN4p/FqbRbiohtW12FYuOTdEIGK2p+sQssKN
         EEXa6tv9CNoYwDnFBVBMxmvM8yotI2eSRuxnRAhGXO/kmoZQ5NIV6KI8mFi00QlVxI3G
         9ahtyyMJ3NmguLwAL08OF0hrZtzpp4QzPXlOYapPACpQJCyX2fHR/he7cToVrjK4cfsN
         49+jILF3E92+tgqocHYvbR/ltOSJ014JtrVlhuEN3Te8GvFVNY4IZCwtI2rXRG5o39cZ
         0eIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNWeqK0dNmv6GAQMCImR+fTVgw+EOMz1UtYEOvUpstpox6nUmpmflvJcH1BGmBSv5vccGFBYkYHNORfLOwge3MrEfe1uooiydeD2K+HzenChM=
X-Gm-Message-State: AOJu0YxXzWiUHseAddognYym7zdleya1Ar7g6E8sHToM4tsaOO0umTdL
	ciz33GfTx8PPJgoKtAvRltsQN39h1TNjbLxJalv9GN9fdAIAqxJIw58mLCHG97I=
X-Google-Smtp-Source: AGHT+IEeyC4P1DENXfIOcK2GUsKPhvs6KngkZcKHheszcCMwlHHkE4KLYt3mfW6lVHn2tnFHHG/Pdg==
X-Received: by 2002:a17:906:a456:b0:a3f:5144:ada2 with SMTP id cb22-20020a170906a45600b00a3f5144ada2mr12036046ejb.2.1709809382694;
        Thu, 07 Mar 2024 03:03:02 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id md20-20020a170906ae9400b00a45c3a3390esm1167188ejb.200.2024.03.07.03.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:03:02 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] thermal: rcar_gen3: Move Tj_T storage to shared private data
Date: Thu,  7 Mar 2024 12:02:14 +0100
Message-ID: <20240307110216.2962918-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307110216.2962918-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240307110216.2962918-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The calculated Tj_T constant is calculated from the PTAT data either
read from the first TSC zone on the device if calibration data is fused,
or from fallback values in the driver itself. The value calculated is
shared among all TSC zones.

Move the Tj_T constant to the shared private data structure instead of
duplicating it in each TSC private data. This requires adding a pointer
to the shared data to the TSC private data structure. This back pointer
make it easier to curter rework the temperature conversion logic.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index cafcb6d6e235..da1b971b287d 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -81,10 +81,10 @@ struct rcar_thermal_info {
 };
 
 struct rcar_gen3_thermal_tsc {
+	struct rcar_gen3_thermal_priv *priv;
 	void __iomem *base;
 	struct thermal_zone_device *zone;
 	struct equation_coefs coef;
-	int tj_t;
 	int thcode[3];
 };
 
@@ -92,6 +92,7 @@ struct rcar_gen3_thermal_priv {
 	struct rcar_gen3_thermal_tsc *tscs[TSC_MAX_NUM];
 	struct thermal_zone_device_ops ops;
 	unsigned int num_tscs;
+	int tj_t;
 	int ptat[3];
 	const struct rcar_thermal_info *info;
 };
@@ -146,15 +147,15 @@ static void rcar_gen3_thermal_calc_coefs(struct rcar_gen3_thermal_priv *priv,
 	 * Division is not scaled in BSP and if scaled it might overflow
 	 * the dividend (4095 * 4095 << 14 > INT_MAX) so keep it unscaled
 	 */
-	tsc->tj_t = (FIXPT_INT((priv->ptat[1] - priv->ptat[2]) * (ths_tj_1 - TJ_3))
-		     / (priv->ptat[0] - priv->ptat[2])) + FIXPT_INT(TJ_3);
+	priv->tj_t = (FIXPT_INT((priv->ptat[1] - priv->ptat[2]) * (ths_tj_1 - TJ_3))
+		      / (priv->ptat[0] - priv->ptat[2])) + FIXPT_INT(TJ_3);
 
 	tsc->coef.a1 = FIXPT_DIV(FIXPT_INT(tsc->thcode[1] - tsc->thcode[2]),
-				 tsc->tj_t - FIXPT_INT(TJ_3));
+				 priv->tj_t - FIXPT_INT(TJ_3));
 	tsc->coef.b1 = FIXPT_INT(tsc->thcode[2]) - tsc->coef.a1 * TJ_3;
 
 	tsc->coef.a2 = FIXPT_DIV(FIXPT_INT(tsc->thcode[1] - tsc->thcode[0]),
-				 tsc->tj_t - FIXPT_INT(ths_tj_1));
+				 priv->tj_t - FIXPT_INT(ths_tj_1));
 	tsc->coef.b2 = FIXPT_INT(tsc->thcode[0]) - tsc->coef.a2 * ths_tj_1;
 }
 
@@ -196,10 +197,11 @@ static int rcar_gen3_thermal_get_temp(struct thermal_zone_device *tz, int *temp)
 static int rcar_gen3_thermal_mcelsius_to_temp(struct rcar_gen3_thermal_tsc *tsc,
 					      int mcelsius)
 {
+	struct rcar_gen3_thermal_priv *priv = tsc->priv;
 	int celsius, val;
 
 	celsius = DIV_ROUND_CLOSEST(mcelsius, 1000);
-	if (celsius <= INT_FIXPT(tsc->tj_t))
+	if (celsius <= INT_FIXPT(priv->tj_t))
 		val = celsius * tsc->coef.a1 + tsc->coef.b1;
 	else
 		val = celsius * tsc->coef.a2 + tsc->coef.b2;
@@ -512,6 +514,7 @@ static int rcar_gen3_thermal_probe(struct platform_device *pdev)
 			goto error_unregister;
 		}
 
+		tsc->priv = priv;
 		tsc->base = devm_ioremap_resource(dev, res);
 		if (IS_ERR(tsc->base)) {
 			ret = PTR_ERR(tsc->base);
-- 
2.44.0


