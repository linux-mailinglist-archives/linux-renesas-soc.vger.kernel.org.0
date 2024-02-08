Return-Path: <linux-renesas-soc+bounces-2470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B484E0FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 13:45:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39216289C8B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Feb 2024 12:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5851E7A713;
	Thu,  8 Feb 2024 12:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bjaXyTig"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B6979951
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Feb 2024 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707396243; cv=none; b=a76edV2T3DbJJzOk2e47lLI0xDBbQ+TmhEiAbKGG3nICqY7qppYDh+5S3Q4IUOkJgZCo42TYUChhrqUaSusIeOf0+hvXK/FtD1ULWRjJDPM93xwyUqMyMJau2PtnBxBz+saj59pP4a/HidLxqLS7bEnJClNscmGnacZT1ciafVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707396243; c=relaxed/simple;
	bh=tDOmLAGfhVEz4/QtfXnjHFgiHQJjjE1A7Q52Ka2mBiY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ftZD3YNpykZuQseW6klSKIpTFvOVZD4bIEwfQcjpwPKEmctCyaIlEji05OZnSQXhR1ZwhLyOW9QwIrb2lsn3qxxvSMi1aN6y4+euXMe7wpzEYC9Zz5+Gj+sz0niTv+vt9/jmVRBW2HznoIOzxhjbzGBjZ2HPQEVuHC9jvM6WV5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bjaXyTig; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-511234430a4so3611979e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Feb 2024 04:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396239; x=1708001039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YxpUHAla5Wryw9iIi3tPbE4ZbFceRrwYviiC216IIY=;
        b=bjaXyTigyKx0T6Gt8rNZaJly4nA6SjwiqqqfBOIPASXY+NuzQWKmlzwsnUZXd7BO4e
         RQuBVbegI+BxLFPoN1AS3XKtZeQ59iifX6nSDQddrZodbRguEK7v/5n7rjCHSRERnNW0
         LN5JdM1sTKWk1Gez6o1392zjLDwhIQogvQaNB5jUChdA99IpnC9Bo2n4AcfaMryBODDr
         mZ/fogQL7EXGVdzBR4XO4IxVc+NR3+SDFC1hEfZGurS1s4y/gU+/PQYnDWeqVgSrPHip
         2/YYMTVBbjMpCPSRGqDk4Lm0sU2kUz8iQItJ+exBXBKiODzpr15xVr8FlFgs4wjUxfL3
         Ex/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396239; x=1708001039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YxpUHAla5Wryw9iIi3tPbE4ZbFceRrwYviiC216IIY=;
        b=mkzKpcL9IHcpkrmgfIlOccZMRFhuaT5yZU8nf+h/H+kpd+zNxsMXt6+oG0AxZe008V
         BtGAcC/xfrPgl25GIQmNV38+Q2MrcW6yZBZ38bx3LJ1OAIcCYjGpXYB4r6osNfmSWPrD
         +brAq/EStZQZl5Or3N8dvydYziLnDy0QWKxsaQTKx6c1mXJ6NeN4w/Q4Nsydw0emtR0q
         pTbtK2r9+3CNVQ/UhvlsFJNDdwqFDGYmtN3f4YOmTaFfEj5WbZMRjIewetHqgRYFd6Pj
         tJJB2f+JeklihLCUZOWVXoKc81uRImwq7F5VMp+0Ic8erJqth0521m97T2yVf8T5m7An
         +slg==
X-Gm-Message-State: AOJu0YwVpwlRysY0ddpNrsymGmMSxyjDs1F0vWkOggJP21h5rNPVkxPc
	3VpHjZefBZpYa+RS1h8inbYe/nuQRMQb2T0RFBmCEEjEsip/RkTBPJpslWwUrgxVvbsxMWYxgZz
	7
X-Google-Smtp-Source: AGHT+IEKsZUH+UVex+YI3uwJfRxWtfbbPqahbMhEtGb4tIBVaIIfJ40rMF36QBSolr0R8HS2lBa7pA==
X-Received: by 2002:a05:6512:ad5:b0:511:60d0:c0ec with SMTP id n21-20020a0565120ad500b0051160d0c0ecmr6465924lfu.36.1707396238908;
        Thu, 08 Feb 2024 04:43:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUMKC5QQ1BLQI72au2TdIqDut80ECvA/v8OPNWI/SG6QJB2n6yaW9Fu7epCTnz3wjA8QoOy1MfAHzmmqM27jhJo+nVEGEtQBck0AG6oQ0t3fjR2ztEXXoG6a1VulSo47fIsmNW6hAvGyfXVz/KwCF/Xs11OoV2GmkHAXPvWedNQnSixAr0Ce4TVARb1gJe1O5f3HnqtbNxqoi4pT3lSQ5skqAGa7njBuggI78j5e+Y2gnbT31y7JQDLub1jqQEyv+eLEDjQfJrXPK8+CBMV7vy2GG2zqvWzBmqKl9tMnC3wZFcMeA8RCJ6mhtFqMApxyLMKJXM9cY1Zd74kHYX3SqYKsHWna4lbQllT87visC2pBLnlUpum9W2NHaHtw18IewYRRyri+bLDZywHj2J/Ur6nfCnP7OV62ddi31EenKZotCKZlKfZjjG7ZLTIso5GmA3ndpid3/TJyn9P4YOPz9Zj8l75qGNXQwU3IRgwM5CbduM82Kqoo8a+vx9WuFuRuhwXfwH/vH75/2J91GLoihIbxXOs8oELAKKMsiVw5/Juh/RLgAkLp1vXHDNQ+mTGeis=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:43:58 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 07/17] clk: renesas: rzg2l: Extend power domain support
Date: Thu,  8 Feb 2024 14:42:50 +0200
Message-Id: <20240208124300.2740313-8-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

RZ/{G2L, V2L, G3S}-based CPG versions have support for saving extra
power when clocks are disabled by activating module standby. This is done
through MSTOP-specific registers that are part of CPG. Each individual
module has one or more bits associated with one MSTOP register (see table
"Registers for Module Standby Mode" from HW manuals). Hardware manual
associates modules' clocks with one or more MSTOP bits. There are 3 mappings
available (identified by researching RZ/G2L, RZ/G3S, RZ/V2L HW manuals):

case 1: N clocks mapped to N MSTOP bits (with N={0, ..., X})
case 2: N clocks mapped to 1 MSTOP bit  (with N={0, ..., X})
case 3: N clocks mapped to M MSTOP bits (with N={0, ..., X}, M={0, ..., Y})

Case 3 has been currently identified on RZ/V2L for the VCPL4 module.

To cover all three cases, the individual platform drivers will provide to
clock driver MSTOP register offset and associated bits in this register
as a bitmask and the clock driver will apply this bitmask to proper
MSTOP register.

Apart from MSTOP support, RZ/G3S can save more power by powering down the
individual IPs (after MSTOP has been set) if proper bits in
CPG_PWRDN_IP{1,2} registers are set.

The MSTOP and IP power down support were implemented through power
domains. Platform-specific clock drivers will register an array of
type struct rzg2l_cpg_pm_domain_init_data, which will be used to
instantiate properly the power domains.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 227 ++++++++++++++++++++++++++++++--
 drivers/clk/renesas/rzg2l-cpg.h |  68 ++++++++++
 2 files changed, 281 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3d2daa4ba2a4..3a7168c314c2 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -139,7 +139,6 @@ struct rzg2l_pll5_mux_dsi_div_param {
  * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @info: Pointer to platform data
- * @genpd: PM domain
  * @mux_dsi_div_params: pll5 mux and dsi div parameters
  */
 struct rzg2l_cpg_priv {
@@ -156,8 +155,6 @@ struct rzg2l_cpg_priv {
 
 	const struct rzg2l_cpg_info *info;
 
-	struct generic_pm_domain genpd;
-
 	struct rzg2l_pll5_mux_dsi_div_param mux_dsi_div_params;
 };
 
@@ -1559,9 +1556,34 @@ static bool rzg2l_cpg_is_pm_clk(struct rzg2l_cpg_priv *priv,
 	return true;
 }
 
+/**
+ * struct rzg2l_cpg_pm_domain - RZ/G2L PM domains data structure
+ * @domains: generic PM domains
+ * @onecell_data: cell data
+ */
+struct rzg2l_cpg_pm_domain {
+	struct generic_pm_domain **domains;
+	struct genpd_onecell_data onecell_data;
+};
+
+/**
+ * struct rzg2l_cpg_pd - RZ/G2L power domain data structure
+ * @priv: pointer to CPG private data structure
+ * @genpd: generic PM domain
+ * @conf: CPG PM domain configuration info
+ * @id: RZ/G2L power domain ID
+ */
+struct rzg2l_cpg_pd {
+	struct rzg2l_cpg_priv *priv;
+	struct generic_pm_domain genpd;
+	struct rzg2l_cpg_pm_domain_conf conf;
+	u16 id;
+};
+
 static int rzg2l_cpg_attach_dev(struct generic_pm_domain *domain, struct device *dev)
 {
-	struct rzg2l_cpg_priv *priv = container_of(domain, struct rzg2l_cpg_priv, genpd);
+	struct rzg2l_cpg_pd *pd = container_of(domain, struct rzg2l_cpg_pd, genpd);
+	struct rzg2l_cpg_priv *priv = pd->priv;
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args clkspec;
 	bool once = true;
@@ -1617,31 +1639,208 @@ static void rzg2l_cpg_detach_dev(struct generic_pm_domain *unused, struct device
 }
 
 static void rzg2l_cpg_genpd_remove(void *data)
+{
+	struct genpd_onecell_data *celldata = data;
+
+	for (unsigned int i = 0; i < celldata->num_domains; i++)
+		pm_genpd_remove(celldata->domains[i]);
+}
+
+static void rzg2l_cpg_genpd_remove_simple(void *data)
 {
 	pm_genpd_remove(data);
 }
 
+static int rzg2l_cpg_power_on(struct generic_pm_domain *domain)
+{
+	struct rzg2l_cpg_pd *pd = container_of(domain, struct rzg2l_cpg_pd, genpd);
+	struct rzg2l_cpg_priv *priv = pd->priv;
+	u32 off, mask;
+
+	/* Set PWRDN. */
+	if (pd->conf.pwrdn) {
+		off = PWRDN_OFF(pd->conf.pwrdn);
+		mask = PWRDN_MASK(pd->conf.pwrdn) << 16;
+		writel(mask, priv->base + off);
+	}
+
+	/* Set MSTOP. */
+	if (pd->conf.mstop) {
+		off = MSTOP_OFF(pd->conf.mstop);
+		mask = MSTOP_MASK(pd->conf.mstop) << 16;
+		writel(mask, priv->base + off);
+	}
+
+	return 0;
+}
+
+static int rzg2l_cpg_power_off(struct generic_pm_domain *domain)
+{
+	struct rzg2l_cpg_pd *pd = container_of(domain, struct rzg2l_cpg_pd, genpd);
+	struct rzg2l_cpg_priv *priv = pd->priv;
+	u32 off, mask;
+
+	/* Set MSTOP. */
+	if (pd->conf.mstop) {
+		off = MSTOP_OFF(pd->conf.mstop);
+		mask = MSTOP_MASK(pd->conf.mstop);
+		writel(mask | (mask << 16), priv->base + off);
+	}
+
+	/* Set PWRDN. */
+	if (pd->conf.pwrdn) {
+		off = PWRDN_OFF(pd->conf.pwrdn);
+		mask = PWRDN_MASK(pd->conf.pwrdn);
+		writel(mask | (mask << 16), priv->base + off);
+	}
+
+	return 0;
+}
+
+static int __init rzg2l_cpg_pd_setup(struct rzg2l_cpg_pd *pd, bool always_on)
+{
+	struct dev_power_governor *governor;
+
+	pd->genpd.flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
+	pd->genpd.attach_dev = rzg2l_cpg_attach_dev;
+	pd->genpd.detach_dev = rzg2l_cpg_detach_dev;
+	if (always_on) {
+		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+		governor = &pm_domain_always_on_gov;
+	} else {
+		pd->genpd.power_on = rzg2l_cpg_power_on;
+		pd->genpd.power_off = rzg2l_cpg_power_off;
+		governor = &simple_qos_governor;
+	}
+
+	return pm_genpd_init(&pd->genpd, governor, false);
+}
+
 static int __init rzg2l_cpg_add_clk_domain(struct rzg2l_cpg_priv *priv)
 {
 	struct device *dev = priv->dev;
 	struct device_node *np = dev->of_node;
-	struct generic_pm_domain *genpd = &priv->genpd;
+	struct rzg2l_cpg_pd *pd;
 	int ret;
 
-	genpd->name = np->name;
-	genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ALWAYS_ON |
-		       GENPD_FLAG_ACTIVE_WAKEUP;
-	genpd->attach_dev = rzg2l_cpg_attach_dev;
-	genpd->detach_dev = rzg2l_cpg_detach_dev;
-	ret = pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
+	pd = devm_kzalloc(priv->dev, sizeof(*pd), GFP_KERNEL);
+	if (!pd)
+		return -ENOMEM;
+
+	pd->genpd.name = np->name;
+	pd->priv = priv;
+	ret = rzg2l_cpg_pd_setup(pd, true);
 	if (ret)
 		return ret;
 
-	ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, genpd);
+	ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove_simple, &pd->genpd);
 	if (ret)
 		return ret;
 
-	return of_genpd_add_provider_simple(np, genpd);
+	return of_genpd_add_provider_simple(np, &pd->genpd);
+}
+
+static struct generic_pm_domain *
+rzg2l_cpg_pm_domain_xlate(struct of_phandle_args *spec, void *data)
+{
+	struct generic_pm_domain *domain = ERR_PTR(-ENOENT);
+	struct genpd_onecell_data *genpd = data;
+
+	if (spec->args_count != 1)
+		return ERR_PTR(-EINVAL);
+
+	for (unsigned int i = 0; i < genpd->num_domains; i++) {
+		struct rzg2l_cpg_pd *pd = container_of(genpd->domains[i], struct rzg2l_cpg_pd,
+						       genpd);
+
+		if (pd->id == spec->args[0]) {
+			domain = &pd->genpd;
+			break;
+		}
+	}
+
+	return domain;
+}
+
+static int __init rzg2l_cpg_add_pm_domains(struct rzg2l_cpg_priv *priv)
+{
+	const struct rzg2l_cpg_info *info = priv->info;
+	struct device *dev = priv->dev;
+	struct device_node *np = dev->of_node;
+	struct rzg2l_cpg_pm_domain *domains;
+	struct generic_pm_domain *parent;
+	u32 ncells;
+	int ret;
+
+	ret = of_property_read_u32(np, "#power-domain-cells", &ncells);
+	if (ret)
+		return ret;
+
+	/* For backward compatibility. */
+	if (!ncells)
+		return rzg2l_cpg_add_clk_domain(priv);
+
+	domains = devm_kzalloc(priv->dev, sizeof(*domains), GFP_KERNEL);
+	if (!domains)
+		return -ENOMEM;
+
+	domains->domains = devm_kcalloc(priv->dev, info->num_pm_domains,
+					sizeof(struct generic_pm_domain *), GFP_KERNEL);
+	if (!domains->domains)
+		return -ENOMEM;
+
+	domains->onecell_data.domains = domains->domains;
+	domains->onecell_data.num_domains = info->num_pm_domains;
+	domains->onecell_data.xlate = rzg2l_cpg_pm_domain_xlate;
+
+	ret = devm_add_action_or_reset(dev, rzg2l_cpg_genpd_remove, &domains->onecell_data);
+	if (ret)
+		return ret;
+
+	for (unsigned int i = 0; i < info->num_pm_domains; i++) {
+		bool always_on = !!(info->pm_domains[i].flags & RZG2L_PD_F_ALWAYS_ON);
+		struct rzg2l_cpg_pd *pd;
+
+		pd = devm_kzalloc(priv->dev, sizeof(*pd), GFP_KERNEL);
+		if (!pd)
+			return -ENOMEM;
+
+		pd->genpd.name = info->pm_domains[i].name;
+		pd->conf = info->pm_domains[i].conf;
+		pd->id = info->pm_domains[i].id;
+		pd->priv = priv;
+
+		ret = rzg2l_cpg_pd_setup(pd, always_on);
+		if (ret)
+			return ret;
+
+		if (always_on) {
+			ret = rzg2l_cpg_power_on(&pd->genpd);
+			if (ret)
+				return ret;
+		}
+
+		domains->domains[i] = &pd->genpd;
+		/* Parent should be on the very first entry of info->pm_domains[]. */
+		if (info->pm_domains[i].flags & RZG2L_PD_F_PARENT) {
+			parent = &pd->genpd;
+			continue;
+		}
+
+		ret = pm_genpd_add_subdomain(parent, &pd->genpd);
+		if (ret)
+			return ret;
+	}
+
+	ret = of_genpd_add_provider_onecell(np, &domains->onecell_data);
+	if (ret)
+		return ret;
+
+	/* Prepare for power down the BUSes in power down mode. */
+	if (info->pm_domain_pwrdn_mstop)
+		writel(CPG_PWRDN_MSTOP_ENABLE, priv->base + CPG_PWRDN_MSTOP);
+
+	return 0;
 }
 
 static int __init rzg2l_cpg_probe(struct platform_device *pdev)
@@ -1697,7 +1896,7 @@ static int __init rzg2l_cpg_probe(struct platform_device *pdev)
 	if (error)
 		return error;
 
-	error = rzg2l_cpg_add_clk_domain(priv);
+	error = rzg2l_cpg_add_pm_domains(priv);
 	if (error)
 		return error;
 
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 6e38c8fc888c..00d12b04ba2f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -27,6 +27,16 @@
 #define CPG_PL6_ETH_SSEL	(0x418)
 #define CPG_PL5_SDIV		(0x420)
 #define CPG_RST_MON		(0x680)
+#define CPG_ACPU_MSTOP		(0xB60)
+#define CPG_MCPU2_MSTOP		(0xB68)
+#define CPG_PERI_COM_MSTOP	(0xB6C)
+#define CPG_PERI_CPU_MSTOP	(0xB70)
+#define CPG_PERI_DDR_MSTOP	(0xB74)
+#define CPG_REG1_MSTOP		(0xB80)
+#define CPG_TZCDDR_MSTOP	(0xB84)
+#define CPG_PWRDN_IP1		(0xBB0)
+#define CPG_PWRDN_IP2		(0xBB4)
+#define CPG_PWRDN_MSTOP		(0xBC0)
 #define CPG_OTHERFUNC1_REG	(0xBE8)
 
 #define CPG_SIPLL5_STBY_RESETB		BIT(0)
@@ -70,6 +80,8 @@
 
 #define EXTAL_FREQ_IN_MEGA_HZ	(24)
 
+#define CPG_PWRDN_MSTOP_ENABLE		(BIT(16) | BIT(0))
+
 /**
  * Definitions of CPG Core Clocks
  *
@@ -234,6 +246,54 @@ struct rzg2l_reset {
 #define DEF_RST(_id, _off, _bit)	\
 	DEF_RST_MON(_id, _off, _bit, -1)
 
+/**
+ * struct rzg2l_cpg_pm_domain_conf - PM domain configuration data structure
+ * @mstop: MSTOP configuration (MSB = register offset, LSB = bitmask)
+ * @pwrdn: PWRDN configuration (MSB = register offset, LSB = register bit)
+ */
+struct rzg2l_cpg_pm_domain_conf {
+	u32 mstop;
+	u32 pwrdn;
+};
+
+/**
+ * struct rzg2l_cpg_pm_domain_init_data - PM domain init data
+ * @name: PM domain name
+ * @conf: PM domain configuration
+ * @flags: RZG2L PM domain flags (see RZG2L_PD_F_*)
+ * @id: PM domain ID (similar to the ones defined in
+ *      include/dt-bindings/clock/<soc-id>-cpg.h)
+ */
+struct rzg2l_cpg_pm_domain_init_data {
+	const char * const name;
+	struct rzg2l_cpg_pm_domain_conf conf;
+	u32 flags;
+	u16 id;
+};
+
+#define DEF_PD(_name, _id, _mstop_conf, _pwrdn_conf, _flags) \
+	{ \
+		.name = (_name), \
+		.id = (_id), \
+		.conf = { \
+			.mstop = (_mstop_conf), \
+			.pwrdn = (_pwrdn_conf), \
+		}, \
+		.flags = (_flags), \
+	}
+
+#define MSTOP(name, bitmask)	((CPG_##name##_MSTOP) << 16 | (bitmask))
+#define MSTOP_OFF(conf)		((conf) >> 16)
+#define MSTOP_MASK(conf)	((conf) & GENMASK(15, 0))
+
+#define PWRDN(name, bit)	((CPG_PWRDN_##name) << 16 | BIT(bit))
+#define PWRDN_OFF(conf)		((conf) >> 16)
+#define PWRDN_MASK(conf)	((conf) & GENMASK(15, 0))
+
+/* Power domain flags. */
+#define RZG2L_PD_F_PARENT	BIT(0)
+#define RZG2L_PD_F_ALWAYS_ON	BIT(1)
+
 /**
  * struct rzg2l_cpg_info - SoC-specific CPG Description
  *
@@ -252,6 +312,9 @@ struct rzg2l_reset {
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+ * @pm_domains: PM domains init data array
+ * @num_pm_domains: Number of PM domains
+ * @pm_domain_pwrdn_mstop: Specifies if PWRDN MSTOP is supported
  * @has_clk_mon_regs: Flag indicating whether the SoC has CLK_MON registers
  */
 struct rzg2l_cpg_info {
@@ -278,6 +341,11 @@ struct rzg2l_cpg_info {
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
 
+	/* Power domain. */
+	const struct rzg2l_cpg_pm_domain_init_data *pm_domains;
+	unsigned int num_pm_domains;
+	bool pm_domain_pwrdn_mstop;
+
 	bool has_clk_mon_regs;
 };
 
-- 
2.39.2


