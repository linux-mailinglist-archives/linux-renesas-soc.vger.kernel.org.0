Return-Path: <linux-renesas-soc+bounces-8157-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C65E95CCFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 14:54:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427441C213B3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2024 12:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B701898F2;
	Fri, 23 Aug 2024 12:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4qi6NCJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E7188A2A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724417507; cv=none; b=UD4pznT84/cFCMJhrTr9Nec5Rgjpb3deCtijR62Jd4wOzBR014RaXHGhPUTXK4Xnj5aIwAzCL32sUIZ9scLsp3irwx7427JzFSbOq8JRhDvCHFaS+kWstdwmFchJsXywXgQFNAPNXLW+uEKivyF7z9DAYx4/bPfd+uKxYJK6GVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724417507; c=relaxed/simple;
	bh=XWmH+Hl1yGiIFL5fYsxLdEp7Bwy4xbJyw8YwEuJJ1k0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTsyEAbrumRdJq6hhCzuSYAwTloDZ+Fb6l2nV0hz6cKASj/CKA4bUV7X19NH0nnCSDZfDApYhDyKYgNBqM2bJr8rbqkBReX9fML3ppYB3aFGO9w/4D/pprrDJ2/95nsezSzuZAU60DpEeTZ2o7AyoIhmwdAh+2Fo5eGPV41B/Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4qi6NCJ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f402830d19so3158381fa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Aug 2024 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724417503; x=1725022303; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrO9VIOVY0Ri5IaSOP2cHACmrrm/g6eQHTHu7wmBZg8=;
        b=x4qi6NCJSX+XEAbU9ZLxLI114O0P2vRFK2pHTLV5wjzDrprrTqFa5SdGSfKYFWyPOF
         C7xiwSx6Nfn7BVcsfsi4DnrzM71m1j2pc1jH1yLOoIMN+A1aLq35i/3LdE+3jLQzTbGG
         uA2Gjs8swZFsVVxmFsvRKF4Ewkfyv72FgXKyGQhmm4vJbQJa+t9LP6TsaI8v25dVJDUQ
         N9+qNYxASVh/SBmpnEvPMcuVmvVqwSo/7KcXvUNgFB2vhL7rGqn5wVh7IQaoYt40zo0k
         2cbtWkXnkX6Jjw9q0aaXTymAcHKIQr12CXkIQ7cF9E/PxDbax4g68HG/N0rwNYMJ53bL
         ce8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417503; x=1725022303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FrO9VIOVY0Ri5IaSOP2cHACmrrm/g6eQHTHu7wmBZg8=;
        b=FgCs4CL0x9dHCRiqYIOUBaGpaRz4R/KN1KJHZFigVIB11mN7aC6DiQzr5METf1CWKg
         aA8lANYNMIuG1XnMIGdhzsS5jAorVVmpcYE+zhSrLoTPtKgQ4jrxR160EegF3Um8A5JF
         sxUpdxk0bNaBxV8TOHQsOHIt/t9AgufT5LtlqDyHnDaVQqT6WJFUQMyy9W16sFVsVywH
         YDkuSJBlD5DLLqAZ+qqUWtqiZII3kqBQYAWsYa7l0PsPBd92d/MWCfry+D9tADfPKDM2
         B4c05q5gGTWSE7obvcbLxh6v4DhH5BMTYh1fuyQwFI7ugCtfffQVZGsz1f0ID8CDU6Jd
         KA5A==
X-Forwarded-Encrypted: i=1; AJvYcCXozIv7+SJSJTkLolK0Y/Y3e7hm5cxA4yhfdFDcBQ7lSKaTGUFAUUIOtkrIFV7NLjPOIPJR2eV6EB3yCHbnR9xpcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1rUKztZa2tTP5r7hHaxesLnp1Ysi3NTVhxugm3EetVCTJeRDx
	anfRw7bVAVziqeDE04480FrGF0x2UvP8PgYtwkKhfI4bCfSlXhWlS/gpu2m9Cx0=
X-Google-Smtp-Source: AGHT+IHQt6XsQjCUfkUrlag0GNPSCDr9z/SiyDUFBx8p2vfO9ppalFsmm1bqmGaVYaUEm16X8IjYbw==
X-Received: by 2002:a05:651c:2204:b0:2ef:17df:6314 with SMTP id 38308e7fff4ca-2f4f4932c8dmr7795291fa.4.1724417503135;
        Fri, 23 Aug 2024 05:51:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f4f384bsm255931666b.192.2024.08.23.05.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:51:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 14:51:13 +0200
Subject: [PATCH 09/10] pmdomain: renesas: rcar-gen4-sysc: Use scoped device
 node handling to simplify error paths
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-pm-domain-v1-9-8320722eaf39@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2725;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XWmH+Hl1yGiIFL5fYsxLdEp7Bwy4xbJyw8YwEuJJ1k0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyIXMuhF/r6XYZvbssPimAH7xSy/VPxtyP2RAn
 SKx6v/2vH+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsiFzAAKCRDBN2bmhouD
 1xx0D/wOZ/Gin9mdDLVFXUWB37LsDCwOjzZhR9qfsq0n6W6JYFtvECA3bgQpv4nW/mYAB85dr+j
 ro8zgDq5YXul9FfRGG0ATZvZT2gcCHL/oAnDreUc8vfZLsSlJ1aX84TFJomiW+mQ3XXwCRmsZHB
 1T0CJt70K1YB2eltp8jp0dig71yi2HdMF6UYhbDo/gYVGtlFtNiYB67Kwdw0UOeW9YzcmeFi6YK
 Tz8GvX3QEooih+bxbIDhHX8Z1IKftzyzty+quNuwmYUOyDi4eSZe2mp4j0/FoaW5MlY31kxW0rp
 3S9JXPQfyAUVLKdG/0FQQEI8YLTvcupNPFisaS4Bby2Sn1U517UKrVFAFpZ9TDPTzWPFeQ7DUUe
 N8kAyUNMyWN+WNJx+ECpszWWFmk9bCNiZvIJN6pNvCy9N7GzJqATm4RWSxqwOZxL8H0sDTvlx5c
 SQz+eEInbU7p0zcJom64jgD1i2plMUsbuoINKbgMq1y+QdsEBmRi6astV/l1pDUIofIKm/A6u3Y
 N6sQEDEDv1e7tknn9+k5mh99Qk2SjG6+f2mhpMyv/XuC4yKpoHnihKWMMjM5xv97lj2iR1d0N26
 3YLDkz0E6IEUTDsbNmc1w4Q/VgIsWFghm2U0TXGnTuF57hccO1BnQ1aFdYOM38AO3rCHpOxw96L
 jO9lsFhJ2yrQ1lw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 66409cff2083..4ca85dbdedc2 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/clk/renesas.h>
 #include <linux/delay.h>
 #include <linux/err.h>
@@ -303,12 +304,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
 	const struct rcar_gen4_sysc_info *info;
 	const struct of_device_id *match;
 	struct rcar_gen4_pm_domains *domains;
-	struct device_node *np;
 	void __iomem *base;
 	unsigned int i;
 	int error;
 
-	np = of_find_matching_node_and_match(NULL, rcar_gen4_sysc_matches, &match);
+	struct device_node *np __free(device_node) =
+		of_find_matching_node_and_match(NULL, rcar_gen4_sysc_matches, &match);
 	if (!np)
 		return -ENODEV;
 
@@ -317,17 +318,14 @@ static int __init rcar_gen4_sysc_pd_init(void)
 	base = of_iomap(np, 0);
 	if (!base) {
 		pr_warn("%pOF: Cannot map regs\n", np);
-		error = -ENOMEM;
-		goto out_put;
+		return -ENOMEM;
 	}
 
 	rcar_gen4_sysc_base = base;
 
 	domains = kzalloc(sizeof(*domains), GFP_KERNEL);
-	if (!domains) {
-		error = -ENOMEM;
-		goto out_put;
-	}
+	if (!domains)
+		return -ENOMEM;
 
 	domains->onecell_data.domains = domains->domains;
 	domains->onecell_data.num_domains = ARRAY_SIZE(domains->domains);
@@ -345,10 +343,8 @@ static int __init rcar_gen4_sysc_pd_init(void)
 
 		n = strlen(area->name) + 1;
 		pd = kzalloc(sizeof(*pd) + n, GFP_KERNEL);
-		if (!pd) {
-			error = -ENOMEM;
-			goto out_put;
-		}
+		if (!pd)
+			return -ENOMEM;
 
 		memcpy(pd->name, area->name, n);
 		pd->genpd.name = pd->name;
@@ -357,7 +353,7 @@ static int __init rcar_gen4_sysc_pd_init(void)
 
 		error = rcar_gen4_sysc_pd_setup(pd);
 		if (error)
-			goto out_put;
+			return error;
 
 		domains->domains[area->pdr] = &pd->genpd;
 
@@ -369,14 +365,12 @@ static int __init rcar_gen4_sysc_pd_init(void)
 		if (error) {
 			pr_warn("Failed to add PM subdomain %s to parent %u\n",
 				area->name, area->parent);
-			goto out_put;
+			return error;
 		}
 	}
 
 	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
 
-out_put:
-	of_node_put(np);
 	return error;
 }
 early_initcall(rcar_gen4_sysc_pd_init);

-- 
2.43.0


