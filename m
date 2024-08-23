Return-Path: <linux-renesas-soc+bounces-8154-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E02095CCEF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 903D91F22338
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5155B18891A;
	Fri, 23 Aug 2024 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E/1IQqOK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EB21885B3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 12:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417502; cv=none; b=Gbqz99Ml9OxbHqA7XqPIJ+IoeuJAMcDXzhBqSn4ag8c3QH3XQpqoCIZP06DEXFotSqWgl+off9Q0oCK8MWagSPrArAY+mhoE+LId6NBZBw9Zxrf9b3u533gTKZqzw/iFEOFo67opl/38YameMYIli2sJeVym/hcOW6pMgbihte4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417502; c=relaxed/simple;
	bh=Pp7V41UldIPg+yPXiDv46w4z040CH5vPeQYOKc3e1as=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ci7NKocaIlSRdxG0kEbLGV0NMz/k9wNchjMKohy6yUylUMAzCeeseGPvMS9Mxs2svRi0rEzsPQY2k/aw8IlOUC3HNRuoxMJrnU9dzRmhNVgTUEBlCywbajscfYg89TY716SjArcs+DAZfCRp9KLIsoVRAmQEFnINlPIe04+C+xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E/1IQqOK; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5334806248dso169689e87.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417498; x=1725022298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6bKAkGedL7UMMYs8TWEGDN1lbQV1wuJfp8Y9Forb6E=;
        b=E/1IQqOKvQO5bGd4Ki8laFcenCv5p/8nm4IQ0mACJ9DpIOR3/gk1ugDEXFoBAVEi5K
         hd/uXRnEnvF5SjhSIO469csPYEYMWuFePKNSPHxZQT3EeCII/nln24BkVk6CWr+LBdfS
         izTLdoGfahXQvFPC/AbryYjiwYGVaeLP2jAizjW2DcvDKMM3A0bZn5RHAboTTsggshm/
         KZ8eVQcP8gUW7ECgWTZZMB9vEnjagxgQ+Qhy77N7iTQEajDbid+Ryrpx7tw5J6NKIrvK
         nDzQp0zC4OsOPPaTyuIxvXtuMv168R5Z4aP3Sw0oiFCK5NcFGMb79F+1pwnKJ9aOZAtt
         kTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417498; x=1725022298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6bKAkGedL7UMMYs8TWEGDN1lbQV1wuJfp8Y9Forb6E=;
        b=dvjRCtb8zyLv0DD+QInHlUsA6BNvjlFw/n2l5Llt/iGmIxazWLR3LRtxPqttRWGsI4
         y8F1FTwVjp1Dm5lw9p6+diw4Amqf3I8t5LEfSVuw8HDAXtLCjMbnmSUjs5Moof3VeCKs
         mh4VWlLUFMgyfhwIY0qzaSzxsGSNPodLSHZcy5xw0t65xdaOtVLlM4h8fQFOkUfQuh9d
         XMrz8LgNIVTZn5cEFZTq8aq/WIrZI8z27E5SdwiIXCvxU62h3+aynbbhbsqP3y3WpByF
         N9YEmoKrJUIqWRh0wtaelEvkQrTemPRowCGYfnX+e36NOe9aFeI8s87LLcFulwlZ33dn
         kvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8CBzhd+bqrgOLRLbAcDovGJ75ufkjEeJNkLxBaX0R/IROEtRIc8eCAfFfypTWTNmyNVYww2FyDpKbLHVxmDdY7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/sNcShW+WAGP4AVAWvyF6JaMMPRfNTk7Fr+ao6v8v5g8Dnkt7
	n9UQ3um+/dKppUILdcR97NDWYTl3f4f+Ai8GWE+uUaXbhJeGW6WiX6ksYWFjTZs=
X-Google-Smtp-Source: AGHT+IGQmqwRaOXufNemZtZqwlmIa7+KcLUj1o3M308GEk2HOgVnw4mfufLO7YIOaCdPCj+V+eeimA==
X-Received: by 2002:a05:6512:33c9:b0:530:bc24:bfc4 with SMTP id 2adb3069b0e04-53438755889mr818571e87.2.1724417497587;
        Fri, 23 Aug 2024 05:51:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:10 +0200
Subject: [PATCH 06/10] pmdomain: qcom: cpr: Simplify locking with guard()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-6-8320722eaf39@linaro.org>
References: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-pm-domain-v1-0-8320722eaf39@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4641;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Pp7V41UldIPg+yPXiDv46w4z040CH5vPeQYOKc3e1as=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXJ5m1RFokfXeXEQENi1lr7W2roZVhJaKfQX
 1F8cz1XW5+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFyQAKCRDBN2bmhouD
 169zEACSSjVVSneT4X8U1tvTYXw701X4Mt1YURXDVQNyPbd6io40jz4l1/14mYHZ2j1fswl2hTq
 RtjN9KVwmsWanbQXXlvy0ZiSGuJ26JWy9Vj4glcvOVop1hwQprfbyOcaOtPNsWd57giUKJEO1is
 Wmlun0Avn/UlvboOwSL6B+9AAOSzpLaVZ6eZ3ZeTbCO2N6ka0fAENGjTxagtjRU3ATJ8upBZp2R
 eoCztmFI9Tgee94KIgq0AXmtq+WMux/ucOSOZC3DonweLKRHS+AvNvUY/zM501AzMOWkugxcUHV
 FrmvRpIPNKwOozUrOQoHLQOLweqjqwkGISUtz/1fd+atji+ILsFSC1Ln2Aeju3scrI38H5HJIpA
 q7pbHMOaTo/GU9WpCpN/i2zCIayzqZR3YSpsP7YgAEjdy1c5PLq9Z8RcAdN1Ek2CxOtQ0Rky+AD
 424BEbR7Bs5R7F8CBu0immxmykmrDysRH52t+k2rNbBBZsQH6gM/jClacAWW9SvjO6K0VykeT7y
 FbLdktwp6Ywm04/cR03o7MdE/gQc0ka7bMCSvBr3evAY+USmIJK26gfzIYZlVMO4+mzMNtd4eEO
 aLo6TNXXmB+qJkx3c6XvG07O2kFWyLoCF0iF7C2eyVf/eRqmLj02qGBVqlxgkpCqlMiibkgS3HB
 E2+Bz1fLpBPV4gg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/qcom/cpr.c | 57 ++++++++++++++++++---------------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/drivers/pmdomain/qcom/cpr.c b/drivers/pmdomain/qcom/cpr.c
index 1bef89712188..a616a3ec3d46 100644
--- a/drivers/pmdomain/qcom/cpr.c
+++ b/drivers/pmdomain/qcom/cpr.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2019, Linaro Limited
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/err.h>
 #include <linux/debugfs.h>
@@ -747,9 +748,9 @@ static int cpr_set_performance_state(struct generic_pm_domain *domain,
 	struct cpr_drv *drv = container_of(domain, struct cpr_drv, pd);
 	struct corner *corner, *end;
 	enum voltage_change_dir dir;
-	int ret = 0, new_uV;
+	int ret, new_uV;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 
 	dev_dbg(drv->dev, "%s: setting perf state: %u (prev state: %u)\n",
 		__func__, state, cpr_get_cur_perf_state(drv));
@@ -760,10 +761,8 @@ static int cpr_set_performance_state(struct generic_pm_domain *domain,
 	 */
 	corner = drv->corners + state - 1;
 	end = &drv->corners[drv->num_corners - 1];
-	if (corner > end || corner < drv->corners) {
-		ret = -EINVAL;
-		goto unlock;
-	}
+	if (corner > end || corner < drv->corners)
+		return -EINVAL;
 
 	/* Determine direction */
 	if (drv->corner > corner)
@@ -783,7 +782,7 @@ static int cpr_set_performance_state(struct generic_pm_domain *domain,
 
 	ret = cpr_scale_voltage(drv, corner, new_uV, dir);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (cpr_is_allowed(drv)) {
 		cpr_irq_clr(drv);
@@ -794,10 +793,7 @@ static int cpr_set_performance_state(struct generic_pm_domain *domain,
 
 	drv->corner = corner;
 
-unlock:
-	mutex_unlock(&drv->lock);
-
-	return ret;
+	return 0;
 }
 
 static int
@@ -1443,9 +1439,9 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
 {
 	struct cpr_drv *drv = container_of(domain, struct cpr_drv, pd);
 	const struct acc_desc *acc_desc = drv->acc_desc;
-	int ret = 0;
+	int ret;
 
-	mutex_lock(&drv->lock);
+	guard(mutex)(&drv->lock);
 
 	dev_dbg(drv->dev, "attach callback for: %s\n", dev_name(dev));
 
@@ -1457,7 +1453,7 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
 	 * additional initialization when further CPUs get attached.
 	 */
 	if (drv->attached_cpu_dev)
-		goto unlock;
+		return 0;
 
 	/*
 	 * cpr_scale_voltage() requires the direction (if we are changing
@@ -1469,11 +1465,10 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
 	 * the first time cpr_set_performance_state() is called.
 	 */
 	drv->cpu_clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(drv->cpu_clk)) {
-		ret = dev_err_probe(drv->dev, PTR_ERR(drv->cpu_clk),
-				    "could not get cpu clk\n");
-		goto unlock;
-	}
+	if (IS_ERR(drv->cpu_clk))
+		return dev_err_probe(drv->dev, PTR_ERR(drv->cpu_clk),
+				     "could not get cpu clk\n");
+
 	drv->attached_cpu_dev = dev;
 
 	dev_dbg(drv->dev, "using cpu clk from: %s\n",
@@ -1490,42 +1485,39 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
 	ret = dev_pm_opp_get_opp_count(&drv->pd.dev);
 	if (ret < 0) {
 		dev_err(drv->dev, "could not get OPP count\n");
-		goto unlock;
+		return ret;
 	}
 	drv->num_corners = ret;
 
 	if (drv->num_corners < 2) {
 		dev_err(drv->dev, "need at least 2 OPPs to use CPR\n");
-		ret = -EINVAL;
-		goto unlock;
+		return -EINVAL;
 	}
 
 	drv->corners = devm_kcalloc(drv->dev, drv->num_corners,
 				    sizeof(*drv->corners),
 				    GFP_KERNEL);
-	if (!drv->corners) {
-		ret = -ENOMEM;
-		goto unlock;
-	}
+	if (!drv->corners)
+		return -ENOMEM;
 
 	ret = cpr_corner_init(drv);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	cpr_set_loop_allowed(drv);
 
 	ret = cpr_init_parameters(drv);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	/* Configure CPR HW but keep it disabled */
 	ret = cpr_config(drv);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	ret = cpr_find_initial_corner(drv);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (acc_desc->config)
 		regmap_multi_reg_write(drv->tcsr, acc_desc->config,
@@ -1540,10 +1532,7 @@ static int cpr_pd_attach_dev(struct generic_pm_domain *domain,
 	dev_info(drv->dev, "driver initialized with %u OPPs\n",
 		 drv->num_corners);
 
-unlock:
-	mutex_unlock(&drv->lock);
-
-	return ret;
+	return 0;
 }
 
 static int cpr_debug_info_show(struct seq_file *s, void *unused)

-- 
2.43.0


