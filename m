Return-Path: <linux-renesas-soc+bounces-11422-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7729F3C62
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 22:14:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57831163248
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 21:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B12511DDA16;
	Mon, 16 Dec 2024 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RVNdtEi+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDBC1DC1A2;
	Mon, 16 Dec 2024 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734382952; cv=none; b=uCKfHJOkctujb/HGpCXLr9c2LAu6E3GfZpm6h5L3csd73TCnpbr7H9CFk+uQB7LquDeRL2RKi9sq0mhlHLnOMJVwuMFlH6G0tYdaMXuGY2Nemq1Mt8D5V7Mi4Owdx8BDCSlnXsCkBbzGg/TWf6ABWg2lTxFl/eRWye0BHs4scRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734382952; c=relaxed/simple;
	bh=ZonM3Z4uaVypcvYjSPoFF+Sxzx7IJRzhAEy9veoJreE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cT8MvxLqv0p7VITXQb5WS2DYFgdq9qhKEVcFz2nFe3hr+aMnc0rkxbM7BrtDFZDem2+UD4jXngOSGPUArd/ZM1W8dW2WwxlQCUIb/w/gSJLghPwq+XypyZOdR4K1D+y+6Wojyeypwnr4aohuYsrv2EmiDoFYqyQv3HMjY4/z3S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RVNdtEi+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4361d5dcf5bso50073355e9.3;
        Mon, 16 Dec 2024 13:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734382949; x=1734987749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UM5LZqemNZfod4/mo0COvRf0hthJ7kY9y3cWTyoxO98=;
        b=RVNdtEi+HdGLSCQ39L2x8aYid6uRCC5ZvYeQ7J+7MyKbluzsZDwQJezLV6cCsjBqx1
         zlB+EAnQODbH1qakfRVJKHWoFu0Ca1lZVRAXX/cWbDY8AymY1kMHOmmIyhSVFWUKrKsy
         xCH01iMiZqHYGhv7FcqVgmD6L9p8U+OpFO5ZbNSDOLJh7JkP72YWbvnvNlYd3XH9++go
         lZtI7Yumb2FJNwjU/wWvUFyvzjfe8iwIe+ADBrhewn9RjmYZlEzS940OrCcui+vKehMp
         yES2hyI+cm1szuF8++d7qRvTeNE/HRgRE2bn0wJTkv5x/4BAqLDnGWGau3NQ/8/+1MuA
         lvZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734382949; x=1734987749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UM5LZqemNZfod4/mo0COvRf0hthJ7kY9y3cWTyoxO98=;
        b=QPms5gRtoCEZfJ2xnHTQW6YjOPg0Y86Kkt+KOoKcXFyhY6SlxPcmQCjWryatMGGzOC
         7A0QfwxFV5XXJpi0t9F6NqCJzP8kdyb3NspY48urQ9BuQGYs12f5KgldnJyaD1MSs/9G
         Amu/41Et1oZiXq83uF+z34rdG6wLafK5Nb/+t1+lH/9MzhIrP4re8ii372LMMjymM2Pm
         EfKfdM4hsIk4jK8B5XXFUbq46uQ2XqCK4bTh8Q9V+//N+sTAlRCO6f4/oefMGWJ01mps
         1FcyCeLJgFgjBuHqT0w0gpleuwwKtXrkAPAjnS3vwdUJO6286aQZhA93KLFiH4nN0wyr
         28XA==
X-Forwarded-Encrypted: i=1; AJvYcCV6hv1jNLcbi9tW3coKIHjibvOri2JF3m6OdVqos3uLQEA9XHTkKZp3T2wyXu8uDxqocf4sG3X0RNIKVcjX@vger.kernel.org, AJvYcCVnSbZtBbrlwAKkjCQWqtPBEdTA8Rkt6o7Jwtfj/u87mSqzUgzPWqFxKUAJ5yIK4+gBtxlAkasfWNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpCvQe14z3YuxDhfszC/mWhoSfTLgee+EbG76ht99xB+FMj/aR
	06FUIAyjPRDb5+Z31RkFuY4eV8iJjjdZy3O0vO83ITA9B7qbZzhA
X-Gm-Gg: ASbGncsxcXSZ1W/YMG1JyEhJJyeP06PWtrNCZQtL7EwvX8W0YMRTYhJgmVf6Q5hlmJA
	1DGvZhIeQdK/6tdZ4mxhT8SfP0CjPsrgG6B7HGUz1upOKaFfDoDoooHanrOHCE9IR9ux8fjQBl+
	Z2N0imDJExrks/iUKyWjkpBUQlVZeOoCF/Q7mLak8oQN/0NXYCaan4oKiAtlFa//ebJD4dek/pH
	bkKcxl2UcOPYtkZqHjPbOdYW/7VH6e47frNY/+71i2BSw9kCRnOp7hY1ezP/V5WeQ7fjXjg1i4x
	I7SJSDmcrw==
X-Google-Smtp-Source: AGHT+IHOMi8P/Wxhpo1QwTL5+6Q5kCVVLDdSOkS7nG9lQa5bcazAgFqq8khQT8nPJAJyU0BHS3l9Ug==
X-Received: by 2002:a05:600c:3b1d:b0:435:192:63fb with SMTP id 5b1f17b1804b1-4362aa1361emr137837375e9.3.1734382948470;
        Mon, 16 Dec 2024 13:02:28 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:2883:1646:daef:e6b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436362c7e02sm95732095e9.40.2024.12.16.13.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:02:27 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzg2l-cpg: Refactor Runtime PM clock validation
Date: Mon, 16 Dec 2024 21:02:01 +0000
Message-ID: <20241216210201.239855-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor rzg2l_cpg_attach_dev to delegate clock validation for Runtime PM
to the updated rzg2l_cpg_is_pm_clk function. Ensure validation of clocks
associated with the power domain while excluding external and core clocks.
Prevent incorrect Runtime PM management for clocks outside the domain's
scope.

Update rzg2l_cpg_is_pm_clk to operate on a per-power-domain basis. Verify
clkspec.np against the domain's device node, check argument validity, and
validate clock type (CPG_MOD). Use the no_pm_mod_clks array to exclude
specific clocks from PM management.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 102 +++++++++++++++++---------------
 1 file changed, 54 insertions(+), 48 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index ddf722ca79eb..6e4a51427bd2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1538,28 +1538,6 @@ static int rzg2l_cpg_reset_controller_register(struct rzg2l_cpg_priv *priv)
 	return devm_reset_controller_register(priv->dev, &priv->rcdev);
 }
 
-static bool rzg2l_cpg_is_pm_clk(struct rzg2l_cpg_priv *priv,
-				const struct of_phandle_args *clkspec)
-{
-	const struct rzg2l_cpg_info *info = priv->info;
-	unsigned int id;
-	unsigned int i;
-
-	if (clkspec->args_count != 2)
-		return false;
-
-	if (clkspec->args[0] != CPG_MOD)
-		return false;
-
-	id = clkspec->args[1] + info->num_total_core_clks;
-	for (i = 0; i < info->num_no_pm_mod_clks; i++) {
-		if (info->no_pm_mod_clks[i] == id)
-			return false;
-	}
-
-	return true;
-}
-
 /**
  * struct rzg2l_cpg_pm_domains - RZ/G2L PM domains data structure
  * @onecell_data: cell data
@@ -1584,45 +1562,73 @@ struct rzg2l_cpg_pd {
 	u16 id;
 };
 
+static bool rzg2l_cpg_is_pm_clk(struct rzg2l_cpg_pd *pd,
+				const struct of_phandle_args *clkspec)
+{
+	if (clkspec->np != pd->genpd.dev.of_node || clkspec->args_count != 2)
+		return false;
+
+	switch (clkspec->args[0]) {
+	case CPG_MOD: {
+		struct rzg2l_cpg_priv *priv = pd->priv;
+		const struct rzg2l_cpg_info *info = priv->info;
+		unsigned int id = clkspec->args[1];
+
+		if (id >= priv->num_mod_clks)
+			return false;
+
+		id += info->num_total_core_clks;
+
+		for (unsigned int i = 0; i < info->num_no_pm_mod_clks; i++) {
+			if (info->no_pm_mod_clks[i] == id)
+				return false;
+		}
+
+		return true;
+	}
+
+	case CPG_CORE:
+	default:
+		return false;
+	}
+}
+
 static int rzg2l_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
 	struct rzg2l_cpg_pd *pd = container_of(domain, struct rzg2l_cpg_pd, genpd);
-	struct rzg2l_cpg_priv *priv = pd->priv;
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	bool once = true;
 	struct clk *clk;
+	unsigned int i;
 	int error;
-	int i = 0;
-
-	while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
-					   &clkspec)) {
-		if (rzg2l_cpg_is_pm_clk(priv, &clkspec)) {
-			if (once) {
-				once = false;
-				error = pm_clk_create(dev);
-				if (error) {
-					of_node_put(clkspec.np);
-					goto err;
-				}
-			}
-			clk = of_clk_get_from_provider(&clkspec);
+
+	for (i = 0; !of_parse_phandle_with_args(np, "clocks", "#clock-cells", i, &clkspec); i++) {
+		if (!rzg2l_cpg_is_pm_clk(pd, &clkspec)) {
 			of_node_put(clkspec.np);
-			if (IS_ERR(clk)) {
-				error = PTR_ERR(clk);
-				goto fail_destroy;
-			}
+			continue;
+		}
 
-			error = pm_clk_add_clk(dev, clk);
+		if (once) {
+			once = false;
+			error = pm_clk_create(dev);
 			if (error) {
-				dev_err(dev, "pm_clk_add_clk failed %d\n",
-					error);
-				goto fail_put;
+				of_node_put(clkspec.np);
+				goto err;
 			}
-		} else {
-			of_node_put(clkspec.np);
 		}
-		i++;
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (IS_ERR(clk)) {
+			error = PTR_ERR(clk);
+			goto fail_destroy;
+		}
+
+		error = pm_clk_add_clk(dev, clk);
+		if (error) {
+			dev_err(dev, "pm_clk_add_clk failed %d\n", error);
+			goto fail_put;
+		}
 	}
 
 	return 0;
-- 
2.43.0


