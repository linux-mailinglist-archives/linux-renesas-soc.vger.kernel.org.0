Return-Path: <linux-renesas-soc+bounces-10560-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5869A9D0643
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 22:27:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9253EB219A9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 17 Nov 2024 21:27:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BFC1DDA33;
	Sun, 17 Nov 2024 21:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PD4QxxCd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683EF1DD86E;
	Sun, 17 Nov 2024 21:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731878837; cv=none; b=PMrU+3NSS7Kxj3BovCx7K9U4rQJLV4V85NOVEvmhfyMw3LgyR8Mn6Ic4ZApqCpABdQpXb/lidVWhNnQi7d0etarbX8Wyj0wFK/jCiDT5tuE01U056lrT5iCG/16vt1L/4sQjFCtZNWv0MnZfyQwIZV8Gdio8yQt6uCxnsEHgQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731878837; c=relaxed/simple;
	bh=quAJ0+Xiv2mdjul6jMhvvyNZQdVKw7vu2Sc8utX20io=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+nEcvO7BWrDyJJuDVgLvCyaDFsU0OIz7QV6tJ0kXNk4EFiuLKlwj1yF9SEXROTU32qDe68MBmfgnJuOjZzpzpg9QomK4hh5fPWfFMo1AVpDyeArq+mw8MFGKWqt9dN/H+Y8qOS9K3yU1To34hbo46WJeioUl7zhluKNQCcq8yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PD4QxxCd; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e625b00bcso2047962b3a.3;
        Sun, 17 Nov 2024 13:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731878834; x=1732483634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dc113/JIf3uyVoCWaogY/LdAc8HXsoi5gOuOuhKxLYI=;
        b=PD4QxxCdIkfOuM8NXkQFlEkH8zIIQgs5cFYcJDKoKHteqOFQ2tl/1an/FoEJEFq/Se
         nRDVxrLFFXEO0AR0hN67ePBCNL0vs9M2hlJmkiv6wn221EarNdDOfjBvvpFUVxz1NOk5
         tBsLBGSB00U8Q8wBw0cDmFutJB09KZstBc/tD5EGqTqF+ICzPLRQ5I9VR5z+yP1Mz1ll
         tWJESbJiG6THZy31Vw19UEwuTvRWdJcrwLfv6VFHhu7EkHHBLdTVzwo7+2f92crP5TH8
         1JUjgbFqjvRdZbbRkS/EJ7j7KTLqQsg/09z9Ya0P3LoNCVpIvwZnmv2OHMQ4d4t8JpDf
         i1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731878834; x=1732483634;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dc113/JIf3uyVoCWaogY/LdAc8HXsoi5gOuOuhKxLYI=;
        b=b0L8R3TGG7Q03MFDI+rwAe7ujTHWgSsG2nsqP6BmmLMTH9JmXs15feKZ1JKi8Q9Jzk
         FgwRgTmNFfrdPrsId1h6Tc1weJs+Bdc9nHpkrb4IGGMMuC1V1JX/UrnHFb4EahmZ9qXp
         z5AfglVsbVU/58+QcoCzNguBYVMq/+r+U9dl+x0VL+i3q3KulkomgsaPz11EpWTislW8
         Z8S59NiioGs/TF9KMb5z1pntOK9QKKi/Q5orIQSSAta9zaqeEcxSXTF8GjuDkGf1y0P+
         wTGzy2fkmaMuQnQlFMOy/528CnXy2DJD1Vsfgr10rFTgAnDGFZrcwkLyVMX4Fzsb+8gF
         iqDg==
X-Forwarded-Encrypted: i=1; AJvYcCV9IvhlvPyuIANq9ODcDXoSVpdEwsBFfQWQwttsZNsFokli3WVIAdCXBsZ/krou92ynIg6q4v3JJ9q5jes8o+6H+2U=@vger.kernel.org, AJvYcCXVRhdKbJjErQNSsO9a6SKbgSEBdwMj8RZSdPAGjmzbo8TC/Jr95HUl8oDrmYNvUGd6m4jOSEsbcVpiU1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8Ny/WJqZLePvJ0ea9wdULS4hCLqZ+s59+kgpfvnjJcNJeqJXC
	4LoDOUCNs/Jy1enuXym070n3I5meIZmhwJFYV82wPb0XVc1JIxElTzcGtv6R
X-Google-Smtp-Source: AGHT+IEdMz8uRtkMuxBjLFc8Jl6IwAPlV1iErNuRBhzNh16Dwy4QFAx06ao4jHuCzdE7cjxPLjR1ng==
X-Received: by 2002:a17:90b:380a:b0:2ea:5fed:4a37 with SMTP id 98e67ed59e1d1-2ea5fed4bd9mr3022550a91.21.1731878834525;
        Sun, 17 Nov 2024 13:27:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ec7c3asm44287745ad.65.2024.11.17.13.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 13:27:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Kurt Kanzenbach <kurt@linutronix.de>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS ETHERNET SWITCH DRIVER)
Subject: [PATCHv3 net-next] net: modernize ioremap in probe
Date: Sun, 17 Nov 2024 13:27:11 -0800
Message-ID: <20241117212711.13612-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert platform_get_resource_bynam + devm_ioremap_resource to
devm_platform_ioremap_resource_byname.

Convert platform_get_resource + devm_ioremap_resource to
devm_platform_ioremap_resource.

resource aquisition and ioremap can be performed in one step.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: reworded commit message again. Also removed devm_ioremap
 conversions. Even though they use normal resource, they are not
 the same.
 v2: fixed compilation errors on PPC and reworded commit message
 drivers/net/dsa/hirschmann/hellcreek.c         | 18 +++---------------
 drivers/net/ethernet/atheros/ag71xx.c          | 13 +++++--------
 drivers/net/ethernet/broadcom/bcm63xx_enet.c   |  6 ++----
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c    | 14 +++++---------
 drivers/net/ethernet/renesas/rswitch.c         |  9 +--------
 drivers/net/ethernet/renesas/rtsn.c            | 10 ++--------
 drivers/net/mdio/mdio-ipq4019.c                |  5 +----
 7 files changed, 19 insertions(+), 56 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index 283ec5a6e23c..940c4fa6a924 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -1932,7 +1932,6 @@ static int hellcreek_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hellcreek *hellcreek;
-	struct resource *res;
 	int ret, i;
 
 	hellcreek = devm_kzalloc(dev, sizeof(*hellcreek), GFP_KERNEL);
@@ -1982,23 +1981,12 @@ static int hellcreek_probe(struct platform_device *pdev)
 
 	hellcreek->dev = dev;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "tsn");
-	if (!res) {
-		dev_err(dev, "No memory region provided!\n");
-		return -ENODEV;
-	}
-
-	hellcreek->base = devm_ioremap_resource(dev, res);
+	hellcreek->base = devm_platform_ioremap_resource_byname(pdev, "tsn");
 	if (IS_ERR(hellcreek->base))
 		return PTR_ERR(hellcreek->base);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ptp");
-	if (!res) {
-		dev_err(dev, "No PTP memory region provided!\n");
-		return -ENODEV;
-	}
-
-	hellcreek->ptp_base = devm_ioremap_resource(dev, res);
+	hellcreek->ptp_base =
+		devm_platform_ioremap_resource_byname(pdev, "ptp");
 	if (IS_ERR(hellcreek->ptp_base))
 		return PTR_ERR(hellcreek->ptp_base);
 
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 3d4c3d8698e2..928d27b51b2a 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1798,15 +1798,16 @@ static int ag71xx_probe(struct platform_device *pdev)
 	if (!ndev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -EINVAL;
-
 	dcfg = of_device_get_match_data(&pdev->dev);
 	if (!dcfg)
 		return -EINVAL;
 
 	ag = netdev_priv(ndev);
+
+	ag->mac_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(ag->mac_base))
+		return PTR_ERR(ag->mac_base);
+
 	ag->mac_idx = -1;
 	for (i = 0; i < ARRAY_SIZE(ar71xx_addr_ar7100); i++) {
 		if (ar71xx_addr_ar7100[i] == res->start)
@@ -1836,10 +1837,6 @@ static int ag71xx_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(ag->mac_reset),
 				     "missing mac reset");
 
-	ag->mac_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(ag->mac_base))
-		return PTR_ERR(ag->mac_base);
-
 	/* ensure that HW is in manual polling mode before interrupts are
 	 * activated. Otherwise ag71xx_interrupt might call napi_schedule
 	 * before it is initialized by netif_napi_add.
diff --git a/drivers/net/ethernet/broadcom/bcm63xx_enet.c b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
index 65e3a0656a4c..420317abe3d2 100644
--- a/drivers/net/ethernet/broadcom/bcm63xx_enet.c
+++ b/drivers/net/ethernet/broadcom/bcm63xx_enet.c
@@ -2646,16 +2646,14 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 	struct bcm_enet_priv *priv;
 	struct net_device *dev;
 	struct bcm63xx_enetsw_platform_data *pd;
-	struct resource *res_mem;
 	int ret, irq_rx, irq_tx;
 
 	if (!bcm_enet_shared_base[0])
 		return -EPROBE_DEFER;
 
-	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	irq_rx = platform_get_irq(pdev, 0);
 	irq_tx = platform_get_irq(pdev, 1);
-	if (!res_mem || irq_rx < 0)
+	if (irq_rx < 0)
 		return -ENODEV;
 
 	dev = alloc_etherdev(sizeof(*priv));
@@ -2688,7 +2686,7 @@ static int bcm_enetsw_probe(struct platform_device *pdev)
 	if (ret)
 		goto out;
 
-	priv->base = devm_ioremap_resource(&pdev->dev, res_mem);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
 		ret = PTR_ERR(priv->base);
 		goto out;
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 571631a30320..faf853edc0db 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -7425,21 +7425,17 @@ static int mvpp2_init(struct platform_device *pdev, struct mvpp2 *priv)
 static int mvpp2_get_sram(struct platform_device *pdev,
 			  struct mvpp2 *priv)
 {
-	struct resource *res;
 	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
-	if (!res) {
+	base = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(base)) {
 		if (has_acpi_companion(&pdev->dev))
 			dev_warn(&pdev->dev, "ACPI is too old, Flow control not supported\n");
 		else
-			dev_warn(&pdev->dev, "DT is too old, Flow control not supported\n");
-		return 0;
-	}
-
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
+			dev_warn(&pdev->dev,
+				 "DT is too old, Flow control not supported\n");
 		return PTR_ERR(base);
+	}
 
 	priv->cm3_base = base;
 	return 0;
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 8d18dae4d8fb..8ef52fc46a01 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -2046,15 +2046,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *attr;
 	struct rswitch_private *priv;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "secure_base");
-	if (!res) {
-		dev_err(&pdev->dev, "invalid resource\n");
-		return -EINVAL;
-	}
-
 	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
@@ -2074,7 +2067,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 	priv->pdev = pdev;
-	priv->addr = devm_ioremap_resource(&pdev->dev, res);
+	priv->addr = devm_platform_ioremap_resource_byname(pdev, "secure_base");
 	if (IS_ERR(priv->addr))
 		return PTR_ERR(priv->addr);
 
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 6b3f7fca8d15..bfe08facc707 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1297,14 +1297,8 @@ static int rtsn_probe(struct platform_device *pdev)
 	ndev->netdev_ops = &rtsn_netdev_ops;
 	ndev->ethtool_ops = &rtsn_ethtool_ops;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gptp");
-	if (!res) {
-		dev_err(&pdev->dev, "Can't find gptp resource\n");
-		ret = -EINVAL;
-		goto error_free;
-	}
-
-	priv->ptp_priv->addr = devm_ioremap_resource(&pdev->dev, res);
+	priv->ptp_priv->addr =
+		devm_platform_ioremap_resource_byname(pdev, "gptp");
 	if (IS_ERR(priv->ptp_priv->addr)) {
 		ret = PTR_ERR(priv->ptp_priv->addr);
 		goto error_free;
diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
index 859302b0d38c..50afef293649 100644
--- a/drivers/net/mdio/mdio-ipq4019.c
+++ b/drivers/net/mdio/mdio-ipq4019.c
@@ -327,7 +327,6 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 {
 	struct ipq4019_mdio_data *priv;
 	struct mii_bus *bus;
-	struct resource *res;
 	int ret;
 
 	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(*priv));
@@ -351,9 +350,7 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 
 	/* The platform resource is provided on the chipset IPQ5018 */
 	/* This resource is optional */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (res)
-		priv->eth_ldo_rdy = devm_ioremap_resource(&pdev->dev, res);
+	priv->eth_ldo_rdy = devm_platform_ioremap_resource(pdev, 1);
 
 	bus->name = "ipq4019_mdio";
 	bus->read = ipq4019_mdio_read_c22;
-- 
2.47.0


