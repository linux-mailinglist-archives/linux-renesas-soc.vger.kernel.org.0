Return-Path: <linux-renesas-soc+bounces-8152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 641A395CCE5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C5F9288776
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21831188585;
	Fri, 23 Aug 2024 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KfH9cEYh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF8186E51
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417497; cv=none; b=KIsn2azj0LRvFIPiT8ebRSe22DtT7wEwoOPHBk7l3Gy4XK27CvaEOTUU6DTsF1d6zQWWQj9q90Z0lWclXlSsXm+hNIM2M9maA42snLfwaTkzGzCEEvn+yA0JJtgzo2z1bYDWu8nEveTQSwEqosboBPe4qhqIOtJhjNLl/dj/9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417497; c=relaxed/simple;
	bh=SIonlcq8HOjQxVkHbI4gb73PSf5POET9O8rpuJdEiF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T7xyrjg29sQiOjb5amAs4jIMlmYDzFldJGe6urvVWtfQ2LqLkj5wRgi/tvxIVDXg8o/2MGquUGsPxyWY1bxhy0zstn7GYrarkxYGecUcTVLuHrJ6OiyM9J6kqxWi0p46arj6eQR04JyN0MJCJ9AGD1tWPty8bkkPBccdPzuNWFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KfH9cEYh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a86681cd0d2so13912466b.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 05:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417494; x=1725022294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sHFK9oK00JeF1se/dTUg3YYmCpO8UbFn8fNRi4/HQ38=;
        b=KfH9cEYh3SCIyhdOEIxLtw5snXXJZe31JKyr6+8JIpCPZnYFl6WjpaISzpKK3yl1Sy
         sN6sYKr11B2iswOzIoiEtFk/E5kfjxqvk735yo2TY88xZ8FCWjonCjkcYL6CYT6CFB0u
         M+8vVakqMH9XAMDqEW02QmhqJrpQCXue24b6VzYSVl4gbX+atTS7RJdRVqJug6j8rMgf
         U53cDe154ZLYd/tYNkq1JpSyx3NQdbk+SzfAwUhy54bD9XnQh9O4EEB2UwUYBAgZ0mNz
         Mkal8mtRdHmLccWElKEY/2VYU0c9HquCaELR4rB+cKXZbNokf7Z2HbI/TuwoHUsI+S1W
         yuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417494; x=1725022294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHFK9oK00JeF1se/dTUg3YYmCpO8UbFn8fNRi4/HQ38=;
        b=DuXLgsxKQ6JZi6/vWQ1QOS1bjkuhtfE/lcFDw0rDQInrl8DPS/Hv3PDgLlJMCp6kW0
         NR7wuoGWYMpV9PRQcprNTLqSiRbCjFsEYLpgQuCtD00y5gEc8Z3Jx8hPc2YoZvTwFyg3
         d4FmyHGabcfJaFyyo5eUEAvzTRQZyupUbQLP2/2vHysV0R8R1t8mbGGk/MxM0YYTvz6z
         p+KmdqNg5acUQFFq7kFHIdKzd2RoTkXuvuai9AUTeM2Sx1ltFYVFH2qFcX3dWSKFTlM8
         J8WWDfNcXWoBNclsEZQ9nXHZjuTOmlsw08/h3pZrKAWU5oiw0tJnrGwJXxNnwMMdVxJV
         e69g==
X-Forwarded-Encrypted: i=1; AJvYcCUMKII4SJcY8jPsBBQR6eEEFiBRDbkarjzLKKSJMIZqq1XC7inghXmEvEvi+VEYdtzPCvQCnbPe3KCW647PJc4vxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz290kSQt7lOooQSwVi5ayJOrsIvQuyQNnkH84L8QonRQN/QJ15
	hzzRph/evPR+xUwvAAGxTp9Zntl605PGUdwvEDmka/HpbFAO7IpVpMsmbDvseSM=
X-Google-Smtp-Source: AGHT+IGkLcJr7qmx+kk0Mf1OqBzBcj8SESNmSZsO5RMr/2TNYehPzhiv8lDtB/y22+8VFZ21pTrA5w==
X-Received: by 2002:a17:907:7251:b0:a72:499a:e5ba with SMTP id a640c23a62f3a-a86a54f1da8mr63264466b.7.1724417494310;
        Fri, 23 Aug 2024 05:51:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:08 +0200
Subject: [PATCH 04/10] pmdomain: imx: gpcv2: Simplify with scoped for each
 OF child loop
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-4-8320722eaf39@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=SIonlcq8HOjQxVkHbI4gb73PSf5POET9O8rpuJdEiF4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXHNWbTEZR3xTnH8G2XCUU3finRw/p+H/0Dk
 Ki10ETVi1mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFxwAKCRDBN2bmhouD
 10tmEACEF+qYwKmzCHJYENSf7RAfHIzyoHyh/f1mLGQkqyn3p1jq1yPTl2nbyGmLjAKNpm2yni6
 WYlGbwEBM3ZQEIc9PNqMUh/62XH1qX4pphhGLQbRju3LUBWa4/o8x6a8DhYN45cvHh1v/M8KSi0
 uvXr9YbeIq4JX41V6Q1sdqD0y8YZC5aNgQxUL+RB7Hrto+ABEjwPqh91tTgMQfybzV5rnUI7NPt
 jn0XWYy1DQU16Hl+nVS9knCodQcEs4UhRiuTjtY6aBzQcSpqqmmyRG60tkPmx93L1hL5eZIbg0C
 S147YiMUOrGg+vFi3xJdo8lrIOBbyFjm7A9AHl+Us0D7/WPjIECc7pS0D3Ezrt79IcG0Lm/s2Jm
 ZhHcm48D6AQcMCK7uWMafEfOxyuYVz5nEhycajYV5Cc09OF9DDTzZskURHU9GhwNA/ssgU33iqp
 12eVZZG+rMMbCmcyoJdpd9Rlw+srlxNNl463Spy8mLZg40i90d9EM/PKdz8jiWgcbSC1Y+ZA1SA
 YyJ+BWT9RFhs+vpgDpFqr+gDd0Kx0ziExRw9u3UgwQRJaohnyOxS0Fa6EAo4UnvcQiIFRXEyfxi
 sfFM8/QOogPXG2mrQlkBAIJQ9er0CRctdXhTVlCPGYhjZUZFY8YLcGy+IB3eIGw7HpRgDHWHgoP
 VepROSAjXTke+lA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/imx/gpcv2.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 856eaac0ec14..963d61c5af6d 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1458,7 +1458,7 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		.max_register   = SZ_4K,
 	};
 	struct device *dev = &pdev->dev;
-	struct device_node *pgc_np, *np;
+	struct device_node *pgc_np;
 	struct regmap *regmap;
 	void __iomem *base;
 	int ret;
@@ -1480,7 +1480,7 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for_each_child_of_node(pgc_np, np) {
+	for_each_child_of_node_scoped(pgc_np, np) {
 		struct platform_device *pd_pdev;
 		struct imx_pgc_domain *domain;
 		u32 domain_index;
@@ -1491,7 +1491,6 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(np, "reg", &domain_index);
 		if (ret) {
 			dev_err(dev, "Failed to read 'reg' property\n");
-			of_node_put(np);
 			return ret;
 		}
 
@@ -1506,7 +1505,6 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 						domain_index);
 		if (!pd_pdev) {
 			dev_err(dev, "Failed to allocate platform device\n");
-			of_node_put(np);
 			return -ENOMEM;
 		}
 
@@ -1515,7 +1513,6 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 					       sizeof(domain_data->domains[domain_index]));
 		if (ret) {
 			platform_device_put(pd_pdev);
-			of_node_put(np);
 			return ret;
 		}
 
@@ -1532,7 +1529,6 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		ret = platform_device_add(pd_pdev);
 		if (ret) {
 			platform_device_put(pd_pdev);
-			of_node_put(np);
 			return ret;
 		}
 	}

-- 
2.43.0


