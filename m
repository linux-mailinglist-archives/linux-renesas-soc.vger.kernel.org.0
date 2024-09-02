Return-Path: <linux-renesas-soc+bounces-8609-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B871C9688B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 15:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF271F232AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Sep 2024 13:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D5220FA99;
	Mon,  2 Sep 2024 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Hf7ltMRz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B9205E32
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Sep 2024 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283460; cv=none; b=iqfxV4YygT9MyUKvNCTxFg/8+uO9TfVDRHg8kBDxYpwRdSkkLZBgmCRjuI7uRFDK6laC5gZzJfXdf/3LknzlN6+jegRHWGhXNBoo8OFLqbzt9x3QsDHX1w7J2oIFC3hZsjrQkSD6V9v968SfWnr46bHOhzoPVOMOwzXUC+hMLDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283460; c=relaxed/simple;
	bh=hSKgjt3EBWjP45FbU4C2sCk9ILvRF/ojwSa99/tgsqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AfsmpOzVSlVOkN3S1itaooKsZ58CRtHNY3cqEPbapvqQkN+RqcJQq69nWE2RAGvgTxUJxNCUxcL4knnjKd+/rncF2XuIU/2tmW9fUTwqrtgSyrRnbB7GIOAXxNTxoqsl97PuONmnQvzDuty9J2ivYzfuA1UkeXg1g6bYVYRHePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Hf7ltMRz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a86859e2fc0so474594166b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Sep 2024 06:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725283457; x=1725888257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6azxJCjDWX/W/JD/7WWC1DKIy2YY4VelIOhDD2eaK5w=;
        b=Hf7ltMRz8G9TEaDo7sjP7B/KyqqXNMfbj2lBMXniaLaFRZu2ZGMG53kcfVbtto/vyt
         lhYBEcYy5wqv8RR86YG5VekGkSz+ek5PgiEbB84nittaJO+H4h7H+tLenmyrPQ/vnD29
         USUCQpuAJAnqJvB9HugaSv3MhwN90g/gMWiAgsJSVsW9maj3JlvNEEqK+Z/7cg9dLT0R
         HI7vBKuPkIcKFC7tOIta/dU27FwugEcgUYjnXXxp4MIQLiMazZasoYbyTgG18/mooBn1
         p+wYkDClMDIpGbaCOQtnE3LJdHu/OmZ4YhlafE/9xx8seLrxZAS9rCp3apxlzIBc97sP
         P/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725283457; x=1725888257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6azxJCjDWX/W/JD/7WWC1DKIy2YY4VelIOhDD2eaK5w=;
        b=m370CjtCn69MFkH0EwANF6tNUlsj2KEJeT+LC6bg8AgSBUAfVYwsV969pyGpm87r34
         OLJg3G51nvOE0JmYijP2xgCYqElnMOii8x9qHi2I8zsOqYx0fXvCjx5lTAl+V2Pxp/l3
         DqnsnSUiDgAg5b2ffWdnjpSJFw9a17hi2tI8go8qCLdQZdutthkqsFz+FRGek6TZpghS
         XXWj7HJARS+04m3E7eA87uI2VmKbWOlQw8LPubJ9kAYci903j8xdCxrYA6pv8yx94uTk
         uzNTvpye+Ww/BG4ofNP5zqbDxWHsUtQM49uDfADiocJtpZ/1A+MWwIK5dnl02hgfAccJ
         8JbA==
X-Gm-Message-State: AOJu0YwCZgt36mf3LX6/m09Pls+zpKXjvK1l9QXvvDkgMnyUEK7wVLzr
	Susi0AM+AHxlnK5AFMDl4qCBWQ33Df35X7/rcj4KKVaIUejKE9Vcj2PaqkFZ8t8=
X-Google-Smtp-Source: AGHT+IGCVB4BVkV5YpqoydeVP7BcnAjpWVuJ1Yby+IiLAWIsgokgFRAedap2Bs2NfpNdpuevDQI4jA==
X-Received: by 2002:a17:907:6094:b0:a7a:adac:57d5 with SMTP id a640c23a62f3a-a897f84d7efmr981426266b.18.1725283456611;
        Mon, 02 Sep 2024 06:24:16 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f6e0sm556060266b.77.2024.09.02.06.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 06:24:16 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-pm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 1/4] clk: renesas: rzg2l-cpg: Move PM domain power on in rzg2l_cpg_pd_setup()
Date: Mon,  2 Sep 2024 16:23:59 +0300
Message-Id: <20240902132402.2628900-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240902132402.2628900-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move the PM domain power on in rzg2l_cpg_pd_setup(). With this the
previously always-on power domains got
struct generic_pm_domain::{power_on, power_off} populated (and
registered with simple_qos_governor if #power-domain-cells = <1> and
with pm_domain_always_on_gov if #power-domain-cells = <0>). The values for
struct generic_pm_domain::{power_on, power_off} are now populated for
all registered domains but used by core only for the domains that can
use them (the PM domain should be non always-on and registered with
simple_qos_governor). Moreover, the power on/off functions check if the
mstop support is valid. The mstop is populated only by the RZ/G3S
initialization code at the moment.

This approach was chosen to keep the code simple and use the same code
across different implementations. There should be no issues with this
approach as the always on domains are registered with GENPD_FLAG_ALWAYS_ON
and the PM domain core takes care of it.

This approach allows doing further cleanups on the rzg2l_cpg power domain
registering code that will be handled by the next commit.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/clk/renesas/rzg2l-cpg.c | 38 ++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 88bf39e8c79c..51ee1b063d9f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1680,23 +1680,26 @@ static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
 	return 0;
 }
 
-static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
+static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd,
+				     struct dev_power_governor *governor)
 {
-	struct dev_power_governor *governor;
+	bool always_on = !!(pd->genpd.flags & GENPD_FLAG_ALWAYS_ON);
+	int ret;
 
 	pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	pd->genpd.attach_dev = rzg2l_cpg_attach_dev;
 	pd->genpd.detach_dev = rzg2l_cpg_detach_dev;
-	if (always_on) {
-		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
-		governor = &pm_domain_always_on_gov;
-	} else {
-		pd->genpd.power_on = rzg2l_cpg_power_on;
-		pd->genpd.power_off = rzg2l_cpg_power_off;
-		governor = &simple_qos_governor;
-	}
+	pd->genpd.power_on = rzg2l_cpg_power_on;
+	pd->genpd.power_off = rzg2l_cpg_power_off;
+
+	ret = pm_genpd_init(&pd->genpd, governor, !always_on);
+	if (ret)
+		return ret;
+
+	if (governor == &simple_qos_governor && always_on)
+		ret = rzg2l_cpg_power_on(&pd->genpd);
 
-	return pm_genpd_init(&pd->genpd, governor, !always_on);
+	return ret;
 }
 
 static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
@@ -1711,8 +1714,9 @@ static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 		return -ENOMEM;
 
 	pd->genpd.name = np->name;
+	pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
 	pd->priv = priv;
-	ret = rzg2l_cpg_pd_setup(pd, true);
+	ret = rzg2l_cpg_pd_setup(pd, &pm_domain_always_on_gov);
 	if (ret)
 		return ret;
 
@@ -1785,20 +1789,16 @@ static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
 			return -ENOMEM;
 
 		pd->genpd.name = info->pm_domains[i].name;
+		if (always_on)
+			pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
 		pd->conf = info->pm_domains[i].conf;
 		pd->id = info->pm_domains[i].id;
 		pd->priv = priv;
 
-		ret = rzg2l_cpg_pd_setup(pd, always_on);
+		ret = rzg2l_cpg_pd_setup(pd, &simple_qos_governor);
 		if (ret)
 			return ret;
 
-		if (always_on) {
-			ret = rzg2l_cpg_power_on(&pd->genpd);
-			if (ret)
-				return ret;
-		}
-
 		domains->domains[i] = &pd->genpd;
 		/* Parent should be on the very first entry of info->pm_domains[]. */
 		if (!i) {
-- 
2.39.2


