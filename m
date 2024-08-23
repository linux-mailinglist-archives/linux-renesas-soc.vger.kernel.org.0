Return-Path: <linux-renesas-soc+bounces-8151-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AEC95CCDD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:52:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CA6728876A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7EE18732C;
	Fri, 23 Aug 2024 12:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SY+ORrf8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6415C186614
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417496; cv=none; b=lwlH3LMtN0ZQubI+L+3TCG3B/60PWW6fG85gEVx4+78P+KddoRe1jxNAg8763+8ryYQdvwFe8vEVz4zDfuEp5BWmPc7NdTdGqgH5zvGmKruDOwq5hy3PpWAYZ5+AUTRBs6CaDcr+XnOAWep8BYPhDklkGu+pC0WGGGqUr6Lugx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417496; c=relaxed/simple;
	bh=6qWKewqo7/bxcFlu9EkD12hoXBrxu7JPlLAdc+zUmSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AkwMMo/Ri7jKvx8U7HZLtdszT1fdixY7WuWIxJz/OWrhdQWQHvi0Z2MlrOzwAj4pGadTdetOo7SiMXhZISP833eRWiTKLPoOMOZSETyEAceWZPTA/QbeQmf7F7589wDeqGVoBGPHXwUYGr3WTz8mEyrcRrfVVlG7eHBfkb99n7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SY+ORrf8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a866966ffceso8870666b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 05:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417493; x=1725022293; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRxioGT7mc7f/KyEL+IMNJTNgSsqnXXhip1lqUSU6yA=;
        b=SY+ORrf8DJ1vgrsB578B4oOA4mqXNvLfoduIwQClDYHFZOfGHrwaSZjqs2tvt3vYrU
         I6k4lPh3dlm5/5XRv52cA4olbIwh/1tndnsj3eyBIqlQ/DxHM6EnPSaw8UCHxirGc0Uq
         N/qk0eQCbs91iN2khuRv44n9hPtQRiISQCra7MgZWHF7gW25h8oxuZMbYB49YmJBdwVg
         OIu8jjAHUZPKMYUyW6FE/oMbyHXC5y8Df5c831nhMq4/uhztA1itdh7qtIexEyBM2w0V
         aRI+Q/Rcinv++sQp59Rl6AFPS3ilhWTtGe1SKdhqltInK+rm4qJR5YHH5bOHHwVdyBO9
         7gzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417493; x=1725022293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRxioGT7mc7f/KyEL+IMNJTNgSsqnXXhip1lqUSU6yA=;
        b=WATU2rSmUFtWUtPvzizgxmvow8sTFif61uSBjMCMMSqSeo5d9WBLLTZ8mW80Opxyca
         PMnyJ21PU02avRnvV7LEid9/POCGDBc5cJSqR8ulhkJc/JS8KooNhNtMm2Fb8MtGSd+0
         KCuC8YV5b5rV+7/QV+gYQki7s4MfF7L/lZBk34gj4IXDoLSK2mDPaimhMb9EKGvTXBoj
         XiRpYPHENRtch7TDSSvCET/EV7Qt98Bh67Qbf6BXe3bQ2pgma4Xu5/qUi0OJf7T+GsDM
         6E4VozQcjHGtnyN5TIWtO6A3G9MX034dincRl6Gh5JH46jrD7UyBKbMM02Xfaii5Ar8X
         52jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsV3vzgKHSu/gtMjIyScC5sBuE4e+jWrwDYiOovwgADSHfOGhUdA1dcNvrZiD9tz8oaliOUhcOMWxqg3pX3tjH4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw13kt8F+ytN2Huams9Cs6nBbE8CmxRiCu0oPAjzcjtVoKrxomf
	RJaXDpb69JF9E8UCe4vYyuFXfrCbAo4bhJn+vHT+4d243ZanQMiRBvLqXOazXBA=
X-Google-Smtp-Source: AGHT+IHMocKCRFEh+CWrcVL8T1z7ail94X2HtRLfeci96aOjLekKRRPWfihiPmUqT2nRTIvout3Lmw==
X-Received: by 2002:a17:907:7e95:b0:a7a:87b3:722f with SMTP id a640c23a62f3a-a86a52b15d1mr93167966b.3.1724417492678;
        Fri, 23 Aug 2024 05:51:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:07 +0200
Subject: [PATCH 03/10] pmdomain: imx: gpc: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-3-8320722eaf39@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1900;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=6qWKewqo7/bxcFlu9EkD12hoXBrxu7JPlLAdc+zUmSI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXGryEowWY/W/NRlv0M7ukHF8AYtODYM2+yB
 /lAA0KMckOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFxgAKCRDBN2bmhouD
 18Q2EACKdgYqni98KR6DjkFKNTDdlnmQiPfC/qbDuSnGBnEHXyalbvgwz/aMLrsZ3GSBujZsFhU
 r7C2rdmokdifJOlhbP2COkCyb4D2KLy+EMJbLpqxQck74O3r7gLnBLe/Mt0e8RstNveD9o04L8N
 IMeUE8J3ASsB+IDsZ3KaFzO5+0q3PzFNPLkU0//h6a1ecdI7hDQlzv3moQkVjP5c1pnpd6prkbD
 n4lXn80mN4rSPMzRgIau/BXt3rxEOk4raqNjnWfcnkYcTpmz1LsKkN/ELHKd4ocNArnEhMB8jNU
 c/7vsNUOZPwLCJftpXX3fIbEOD6gN6khFFtkDJprS5po4aAFbSTwgvdDXnpqz8PA9DTMXkCSs9U
 xgUaLY1eJcIqudLRYBSSUIpnn2MAQjNi0jPxfQAkXBuMKJoC2pBMs7sZPzOGkcECbGH6BLqG1cY
 26ZXqF9QACoOltgPRiNpO+mcx6ugDyvzoOF4kfXn2aN75iPIcbP+iJdJyyeYa9WoTo/juGjFdZC
 gq+M5hrVm68lUiJVb48Izn2LMSc8oAcXs2Kcu8XrNJcWzpnwYvk7cMQro4V/7xv0xTh9wQYodP5
 AtRTAd0er+83B7fur7r3B5K6piGdH50PPRVLIy36uZPybik94FX61eQrBhk5oNtnT673W6jg7L6
 eiFD4ui7kSmU3xA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/imx/gpc.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 9517cce93d8a..80a4dcc77199 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -455,7 +455,6 @@ static int imx_gpc_probe(struct platform_device *pdev)
 	} else {
 		struct imx_pm_domain *domain;
 		struct platform_device *pd_pdev;
-		struct device_node *np;
 		struct clk *ipg_clk;
 		unsigned int ipg_rate_mhz;
 		int domain_index;
@@ -465,28 +464,24 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			return PTR_ERR(ipg_clk);
 		ipg_rate_mhz = clk_get_rate(ipg_clk) / 1000000;
 
-		for_each_child_of_node(pgc_node, np) {
+		for_each_child_of_node_scoped(pgc_node, np) {
 			ret = of_property_read_u32(np, "reg", &domain_index);
-			if (ret) {
-				of_node_put(np);
+			if (ret)
 				return ret;
-			}
+
 			if (domain_index >= of_id_data->num_domains)
 				continue;
 
 			pd_pdev = platform_device_alloc("imx-pgc-power-domain",
 							domain_index);
-			if (!pd_pdev) {
-				of_node_put(np);
+			if (!pd_pdev)
 				return -ENOMEM;
-			}
 
 			ret = platform_device_add_data(pd_pdev,
 						       &imx_gpc_domains[domain_index],
 						       sizeof(imx_gpc_domains[domain_index]));
 			if (ret) {
 				platform_device_put(pd_pdev);
-				of_node_put(np);
 				return ret;
 			}
 			domain = pd_pdev->dev.platform_data;
@@ -500,7 +495,6 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			ret = platform_device_add(pd_pdev);
 			if (ret) {
 				platform_device_put(pd_pdev);
-				of_node_put(np);
 				return ret;
 			}
 		}

-- 
2.43.0


