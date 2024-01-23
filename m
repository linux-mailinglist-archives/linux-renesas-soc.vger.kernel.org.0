Return-Path: <linux-renesas-soc+bounces-1714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDEF838F37
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 14:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C9451C26062
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 13:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68796086F;
	Tue, 23 Jan 2024 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XHtv7cSj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E9605B2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014788; cv=none; b=XwOmp4IY11Q0G2v5GqnQeU7873fjh4E4nnmGQC64zSSIRpoi0MG08KNIjC/fgEDoo5DLG1h76Ub0EfaUXksUIJ1S1wLxNndz+NVJhKCAib1u0mBUDQILg+tkznbcjP3okaKM/uo42RON8PV21FHZzOGdUqPaVR0IgQMnXKVNxIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014788; c=relaxed/simple;
	bh=BVKHfjjAvYftCSiWzzn5WbjbFsP7wBJZK7YKMMKP/aA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f4r+dhqK2W81j8QqWHrCuhAsmYKedlaqgsl+883ghXaRhialjZNg7atHBWpCZUp2ME5ExHM4sSIbaTP3QY21+NCA+EpvIuoxwB2REbV6iGrV+bojRSwI07tsuLHaZME9kh1P2hbrYsDNAFhSu7UbktOWOK2eD+2TERkvCavFXGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XHtv7cSj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40e490c2115so32381095e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706014785; x=1706619585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErNfF/Xc9qsj3D+ti7spZOyCJXcg8kBzLgnUTUWSxO4=;
        b=XHtv7cSjJ5YJ12yQlgvvplZajiXf0Rot5IK/dJK9x5Aoo51ofbDazEfyWhFnnCT1mF
         oHLJiSKnUD5jmkZX957EowbYznSCuQ73SIrj5mqX1qpD7iSZekYp3Nto0knTQy9Yt1dQ
         UvD5ASJaLN1y6qhhfTNGpqN4JczMqrH8C6zZfbmARXiZfvxa0lMRKYh4cGbeQV0+I/gn
         yUJgDLgdkUG5fyXwxMM0Jjh+dke8Dio56EtWqAfLTqCKE2SyhMbetjUKPdtCgWpKXMY1
         4AuwOvc/GnLkqKSIrFDA55L5uXIhPJaIgOWRDSS48rQijaZr/vun5AIuqQa7mor4e/6r
         phFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014785; x=1706619585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ErNfF/Xc9qsj3D+ti7spZOyCJXcg8kBzLgnUTUWSxO4=;
        b=Wz2Nz0TvNVfeY7Vh6WuVscDelVZqcpqVLemk2b9j3eEu9sz5KLtYYWz6i10My7k7ts
         qfqpjkE8AYmq9ArhCo+djtlrWfCtHOz6836zNBjJ0t5jl8GrNkDC3/Q+BOlFbvmxQle/
         o+sse+s+FT8e50sluvpbq0ZfxKdEHAQH8qQitVHd30+bE42GJ2h+4wzBnKobF82iHoka
         Wy3OPhUEPLpXZjnIg3pXgaH2oAssvuJbOyUs9UgqltJeRRgnTqI5lFrlBNT2K/+Mdsxb
         eBF5bHPJlq/trJJ0CKnleIDE4E5M/jPm+v89hH3KRGsXm5cvV9z2sMwQP8rkI/PDuhEo
         WCuQ==
X-Gm-Message-State: AOJu0YwO4QesCR3veh80JXawgAK+bsO2qteAyM5nktsIuSM3hmyWYN9W
	macHiK/qjtBrXyKO/AAzbG8R07licdtWiyGZ9wzk+Ag8FWK6hSjA6p3VC581R1o=
X-Google-Smtp-Source: AGHT+IH+LKGHmd2bBdPiQV5jphH09OG4u0W4qecANFyz1rsQeq9nfIL9uGXldWE23j2xP1KsJVeURg==
X-Received: by 2002:a05:600c:68cd:b0:40e:a565:3ce2 with SMTP id jd13-20020a05600c68cd00b0040ea5653ce2mr117549wmb.73.1706014784838;
        Tue, 23 Jan 2024 04:59:44 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.135])
        by smtp.gmail.com with ESMTPSA id s4-20020a05600c45c400b0040e6ff60057sm33655711wmo.48.2024.01.23.04.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:59:44 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v4 10/15] net: ravb: Move delay mode set in the driver's ndo_open API
Date: Tue, 23 Jan 2024 14:58:24 +0200
Message-Id: <20240123125829.3970325-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240123125829.3970325-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Delay parsing and setting were done in the driver's probe API. As some IP
variants switch to reset mode (and thus registers content is lost) when
setting clocks (due to module standby functionality) to be able to
implement runtime PM keep the delay parsing in the driver's probe function
and move the delay applying function to the driver's ndo_open API.

Along with it, both delay specific functions were kept together.

Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- fixed typos in patch description

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 107 ++++++++++++-----------
 1 file changed, 56 insertions(+), 51 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 8956c33c60e2..69d4854d6738 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1800,6 +1800,59 @@ static int ravb_compute_gti(struct net_device *ndev)
 	return 0;
 }
 
+/* Set tx and rx clock internal delay modes */
+static void ravb_parse_delay_mode(struct device_node *np, struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	bool explicit_delay = false;
+	u32 delay;
+
+	if (!priv->info->internal_delay)
+		return;
+
+	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay)) {
+		/* Valid values are 0 and 1800, according to DT bindings */
+		priv->rxcidm = !!delay;
+		explicit_delay = true;
+	}
+	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay)) {
+		/* Valid values are 0 and 2000, according to DT bindings */
+		priv->txcidm = !!delay;
+		explicit_delay = true;
+	}
+
+	if (explicit_delay)
+		return;
+
+	/* Fall back to legacy rgmii-*id behavior */
+	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
+	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID) {
+		priv->rxcidm = 1;
+		priv->rgmii_override = 1;
+	}
+
+	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
+	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
+		priv->txcidm = 1;
+		priv->rgmii_override = 1;
+	}
+}
+
+static void ravb_set_delay_mode(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	u32 set = 0;
+
+	if (!priv->info->internal_delay)
+		return;
+
+	if (priv->rxcidm)
+		set |= APSR_RDM;
+	if (priv->txcidm)
+		set |= APSR_TDM;
+	ravb_modify(ndev, APSR, APSR_RDM | APSR_TDM, set);
+}
+
 /* Network device open function for Ethernet AVB */
 static int ravb_open(struct net_device *ndev)
 {
@@ -1811,6 +1864,8 @@ static int ravb_open(struct net_device *ndev)
 	if (info->nc_queues)
 		napi_enable(&priv->napi[RAVB_NC]);
 
+	ravb_set_delay_mode(ndev);
+
 	/* Device init */
 	error = ravb_dmac_init(ndev);
 	if (error)
@@ -2531,41 +2586,6 @@ static int ravb_set_config_mode(struct net_device *ndev)
 	return error;
 }
 
-/* Set tx and rx clock internal delay modes */
-static void ravb_parse_delay_mode(struct device_node *np, struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	bool explicit_delay = false;
-	u32 delay;
-
-	if (!of_property_read_u32(np, "rx-internal-delay-ps", &delay)) {
-		/* Valid values are 0 and 1800, according to DT bindings */
-		priv->rxcidm = !!delay;
-		explicit_delay = true;
-	}
-	if (!of_property_read_u32(np, "tx-internal-delay-ps", &delay)) {
-		/* Valid values are 0 and 2000, according to DT bindings */
-		priv->txcidm = !!delay;
-		explicit_delay = true;
-	}
-
-	if (explicit_delay)
-		return;
-
-	/* Fall back to legacy rgmii-*id behavior */
-	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
-	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID) {
-		priv->rxcidm = 1;
-		priv->rgmii_override = 1;
-	}
-
-	if (priv->phy_interface == PHY_INTERFACE_MODE_RGMII_ID ||
-	    priv->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) {
-		priv->txcidm = 1;
-		priv->rgmii_override = 1;
-	}
-}
-
 static int ravb_setup_irq(struct ravb_private *priv, const char *irq_name,
 			  const char *ch, int *irq, irq_handler_t handler)
 {
@@ -2650,18 +2670,6 @@ static int ravb_setup_irqs(struct ravb_private *priv)
 	return ravb_setup_irq(priv, "ch19", "ch19:tx_nc", &irq, ravb_nc_interrupt);
 }
 
-static void ravb_set_delay_mode(struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	u32 set = 0;
-
-	if (priv->rxcidm)
-		set |= APSR_RDM;
-	if (priv->txcidm)
-		set |= APSR_TDM;
-	ravb_modify(ndev, APSR, APSR_RDM | APSR_TDM, set);
-}
-
 static int ravb_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -2785,10 +2793,7 @@ static int ravb_probe(struct platform_device *pdev)
 	if (error)
 		goto out_rpm_put;
 
-	if (info->internal_delay) {
-		ravb_parse_delay_mode(np, ndev);
-		ravb_set_delay_mode(ndev);
-	}
+	ravb_parse_delay_mode(np, ndev);
 
 	/* Allocate descriptor base address table */
 	priv->desc_bat_size = sizeof(struct ravb_desc) * DBAT_ENTRY_NUM;
-- 
2.39.2


