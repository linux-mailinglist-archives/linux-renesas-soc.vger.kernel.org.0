Return-Path: <linux-renesas-soc+bounces-10871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD59E2F0E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 23:27:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ACB1283382
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 22:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B422208978;
	Tue,  3 Dec 2024 22:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwOopNkR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06E31F890E;
	Tue,  3 Dec 2024 22:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733264875; cv=none; b=pPVJhOk4cYqjdeGKMfWW8aVVlTHfE4Crjj/v7S78EBkvUAw0itL8naeaEFHxpIvf810CKC1Q9XKMmAzhgisiIO3J2aq61HOrE7shZcgK8RD1dcOLBpEY45MKho/8f37h0jIV/SQMoF/OkHyLR+uA5/34LVhsofxVlRRnNRBfC1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733264875; c=relaxed/simple;
	bh=u4MrMb8pP0ycl910YF+Oe+hHb6ctrhR5zZlQMGqw8Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fs9xTb1WE9dBitqYByV09QWqiBWfimF6uyZE+C29Y4MkqYEExI3GWylojocjD1n/6rSKqF89TtNLBWiaRpiY83g7W5+HxsePZMVXKdjAFhEIVoffqhZRh98gIA5HVO2Wa5idy0XeSgPzly6p8EpXYD0wJqpnhkNHMtzgdY01+5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwOopNkR; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-724d23df764so5333306b3a.1;
        Tue, 03 Dec 2024 14:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733264873; x=1733869673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E3cL6Sw5bup7Yp4Jpnuubd25iPid2aDxt+wRriORF54=;
        b=UwOopNkRSKoI4WUhtNGcy4IJUjdK5XbRwZ6IL+FWmcMy1Oa06UEnOuII4sfz9UNx5x
         7qIHnTFkPHF4WGOcMuG+m4MIUZyyx3P6vjyT/vwhWmtZC7grLokw91HPrEO/e/680CSV
         8KnwDcT/9W6LiqEPHLpmEPA45KTMRQco4fGA0Qf7qihphdPNQT+f0NiEf2IObaStihUt
         UZs7cRy+1oF3c2xpv6Crbtqqd9MlZwtvf9OFTpyRubj9qlFHOvipZGGHBZqYquY3L1hc
         8SOaMOBjDgyudRkpK5oS+60r+Z5BWpx79bR99VLa0PAh/Pgt87m5FivlKUez5tGHc7CI
         7rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733264873; x=1733869673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3cL6Sw5bup7Yp4Jpnuubd25iPid2aDxt+wRriORF54=;
        b=teZuaco0PsVr8kq9wh48S+ItZSVTmKHglgfZCao2X17UJR/5ZvZ5/VA4OARZpjyfM7
         49QztFTmHZmoIwWtF8BisJjtcFz4Wiicds0fCK98MDUQRtT9R8Fw5Xs+S7a1ssvR52L3
         t7cISs6R8OifXFJBYZUwUf8n3xz8RyJI6z/pg2kqNZZiSjlNKs0ShBXP+vi8sombs+4U
         Qee+LWTWwZ0JOnsWyYQCz9fnp7nzYTrnbEiOeTQwSsmCvMKbyIipHEpkBk2u7qP0xCpT
         rgTt3RsSVhM8ozhd5Lbu9yFQonNo65adNhpFaQHvuvJ2ZCar4wC18Rjs1jpwBqP5DK7e
         uZmg==
X-Forwarded-Encrypted: i=1; AJvYcCUrunR488LQcGO9CbuIHAbkBa5FDDaQ8zEq6PieGEXRwU4rui8bFgrSV/W/PPF1h9XwwunbfAKgEAwowF0=@vger.kernel.org, AJvYcCVsxa21frtckD6KvPYfWvPJ/Czwr12x6GtJnY8obUCMXfaU2MWio5B68Ek6rlumsdjfPaANZdR04M9SevK3jo5aB3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmcH1GHY8l0QgiaDQQcCFTlkvaGteeSV3QGvM5cuiDuH/Q97l7
	7od+L8NHjA7AwZ2bFGj1xDg1RQ+ycXl9+1ImbPD/nNXV8/s9sSF95vSLX7L7z2c=
X-Gm-Gg: ASbGncurqbyx0rOlh00TuE0iVSG+Wq9NVYB8UpQs/HQHk+QF1kNt2faUs25TxKYntHL
	MfbNweqVeDE4RhnfJbLacNIG6TPupxkK9rmIB8AfMIMRPbMNqFSkn8eSjUWMzpVaqMRxkv53VNu
	H7al5rjd4oj82vI7gLF3f5EU9ePyYQkbgo/nk4cyKj5FElywnLv479rSOqqIQu23RHlhTAR7wJF
	Ob8omoXMCMuO0YM8WziRupAkQ==
X-Google-Smtp-Source: AGHT+IGkp54KERaTLBSrOUDh1m6JJksoi0KcqKrWmnQ6FCRgUKOFSjF+PwDj4dKjUYawAtCTh+vHxA==
X-Received: by 2002:a17:902:f687:b0:215:b9a6:5cb9 with SMTP id d9443c01a7336-215bcfbce83mr51069785ad.5.1733264872732;
        Tue, 03 Dec 2024 14:27:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215a04dc249sm35172245ad.203.2024.12.03.14.27.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 14:27:52 -0800 (PST)
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
	Richard Cochran <richardcochran@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS ETHERNET SWITCH DRIVER)
Subject: [PATCHv4 net-next] net: modernize ioremap in probe
Date: Tue,  3 Dec 2024 14:27:50 -0800
Message-ID: <20241203222750.153272-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

resource aquisition and ioremap can be performed in one step.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: reformatted to 100 column limit
 v3: reworded commit message again. Also removed devm_ioremap
 conversions. Even though they use normal resource, they are not
 the same.
 v2: fixed compilation errors on PPC and reworded commit message
 drivers/net/dsa/hirschmann/hellcreek.c          | 17 ++---------------
 drivers/net/ethernet/atheros/ag71xx.c           | 13 +++++--------
 drivers/net/ethernet/broadcom/bcm63xx_enet.c    |  6 ++----
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 11 +++--------
 drivers/net/ethernet/renesas/rswitch.c          |  9 +--------
 drivers/net/ethernet/renesas/rtsn.c             |  9 +--------
 6 files changed, 14 insertions(+), 51 deletions(-)

diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index 283ec5a6e23c..3a3e34c1d423 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -1932,7 +1932,6 @@ static int hellcreek_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct hellcreek *hellcreek;
-	struct resource *res;
 	int ret, i;
 
 	hellcreek = devm_kzalloc(dev, sizeof(*hellcreek), GFP_KERNEL);
@@ -1982,23 +1981,11 @@ static int hellcreek_probe(struct platform_device *pdev)
 
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
+	hellcreek->ptp_base = devm_platform_ioremap_resource_byname(pdev, "ptp");
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
index 571631a30320..af9291574931 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -7425,21 +7425,16 @@ static int mvpp2_init(struct platform_device *pdev, struct mvpp2 *priv)
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
 			dev_warn(&pdev->dev, "DT is too old, Flow control not supported\n");
-		return 0;
-	}
-
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
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
index 6b3f7fca8d15..6a2e9a9cef25 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -1297,14 +1297,7 @@ static int rtsn_probe(struct platform_device *pdev)
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
+	priv->ptp_priv->addr = devm_platform_ioremap_resource_byname(pdev, "gptp");
 	if (IS_ERR(priv->ptp_priv->addr)) {
 		ret = PTR_ERR(priv->ptp_priv->addr);
 		goto error_free;
-- 
2.47.0


