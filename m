Return-Path: <linux-renesas-soc+bounces-1054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE63812F45
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 49B8DB2152D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:47:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3644541227;
	Thu, 14 Dec 2023 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Eeq6inLy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6BAD47
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:41 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a1f33c13ff2so689005866b.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554399; x=1703159199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7dNH0yi6XzttRpIS4P56ybelKHS8ihp5wjWT0GHLak=;
        b=Eeq6inLy5W2mrO354iuSXJVYQZU/JiVrKYFzyhVi0WPclNViMhg9B8TBysbWHKTEBM
         BO283Wx5dxCl5T99e6p6RjiULDAwOEmZV0ND3POX9y42nc76z5pqs330Fwna97we1+72
         KadgywhLlXigJ7PTw3nsGHgUgCjXxa94c/864bIA70I4X8bkf9nBrBFt489t3vayRfXz
         98YZWuw2e53qwqbZexp7HV9WLRgl6vKh0Pv83Gx2UhKn2t7wEL2dJXSCxwpUk7Y3UUqV
         x1dYzLSgFAuGseRQuZZggs5CTHO9TwzQ98P9PCUQm4w2CriGOE31U07WTToPKdSHKp8w
         4CPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554399; x=1703159199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n7dNH0yi6XzttRpIS4P56ybelKHS8ihp5wjWT0GHLak=;
        b=KBxlSrqOzI7rp7U3FJSrAlV/0ljoD1abL+J0oQtJzZoO7g+Mkub1GvNINzCDp+R8Hq
         rCst6ijqMYaR0NzxJsyFiPu3OgZzfqucymqMUAHBr3ubT8I1ufQt2YU/ff39snU0YMqC
         GYdytuR1TE3p92iMhOEaXeYX7xt0aj3diG3sVFz4zPXsbjc/C0D/NKOfkbugxCR3bKWE
         9cYMMgIwICixA6jFDYSNDil1AAeYHYO0kkNxrGsD1e5ztuLIFa2hXezPjkhq8MaZNw9W
         ewD/O+QrVlsLBDYRq8fuWlf5BZ32pp7vHqsNPB0Z6pjbOc/oZcHZn/QPiaAm8mGBiGxp
         0Byg==
X-Gm-Message-State: AOJu0Yx1sNq8S0fv6wwW1qOnPAm73G0U/0XFtazIRlloDebvXi9Qla9x
	KwahVXCnLPGqjmD9Hkkc9cSo5Q==
X-Google-Smtp-Source: AGHT+IEwULcW6kIbUcVj2dm26sY++GOUztxBHkNp2Xd5nW0QXKxtbqRqRpO6mxt8JWERKWyBfds/1w==
X-Received: by 2002:a17:906:dfc7:b0:a1c:aebe:ff2 with SMTP id jt7-20020a170906dfc700b00a1caebe0ff2mr5282957ejc.37.1702554399757;
        Thu, 14 Dec 2023 03:46:39 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:39 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	yoshihiro.shimoda.uh@renesas.com,
	wsa+renesas@sang-engineering.com,
	geert+renesas@glider.be
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v2 13/21] net: ravb: Set config mode in ndo_open and reset mode in ndo_close
Date: Thu, 14 Dec 2023 13:45:52 +0200
Message-Id: <20231214114600.2451162-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
References: <20231214114600.2451162-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

As some IP variants switch to reset mode (and thus registers' content is
lost) when setting clocks (due to module standby functionality) to be able
to implement runtime PM and save more power, set the IP's operation mode to
reset at the end of the probe. Along with it, in the ndo_open API the IP
will be switched to configuration, then operational mode. In the ndo_close
API, the IP will be switched back to reset mode. This allows implementing
runtime PM and, along with it, save more power when the IP is not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/net/ethernet/renesas/ravb_main.c | 91 ++++++++++++++----------
 1 file changed, 54 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index db9222fc57c2..31a1f8a83652 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1738,6 +1738,30 @@ static inline int ravb_hook_irq(unsigned int irq, irq_handler_t handler,
 	return error;
 }
 
+static int ravb_set_config_mode(struct net_device *ndev)
+{
+	struct ravb_private *priv = netdev_priv(ndev);
+	const struct ravb_hw_info *info = priv->info;
+	int error;
+
+	if (info->gptp) {
+		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
+		/* Set CSEL value */
+		ravb_modify(ndev, CCC, CCC_CSEL, CCC_CSEL_HPB);
+	} else if (info->ccc_gac) {
+		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG |
+			    CCC_GAC | CCC_CSEL_HPB);
+	} else {
+		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
+	}
+
+	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_CONFIG);
+	if (error)
+		netdev_err(ndev, "failed to switch device to config mode\n");
+
+	return error;
+}
+
 static int ravb_set_reset_mode(struct net_device *ndev)
 {
 	int error;
@@ -1821,13 +1845,19 @@ static int ravb_open(struct net_device *ndev)
 	if (info->nc_queues)
 		napi_enable(&priv->napi[RAVB_NC]);
 
+	/* Set AVB config mode */
+	error = ravb_set_config_mode(ndev);
+	if (error)
+		goto out_napi_off;
+
 	ravb_set_delay_mode(ndev);
 	ravb_write(ndev, priv->desc_bat_dma, DBAT);
 
 	/* Device init */
 	error = ravb_dmac_init(ndev);
 	if (error)
-		goto out_napi_off;
+		goto out_set_reset;
+
 	ravb_emac_init(ndev);
 
 	error = ravb_set_gti(ndev);
@@ -1853,6 +1883,8 @@ static int ravb_open(struct net_device *ndev)
 		ravb_ptp_stop(ndev);
 out_dma_stop:
 	ravb_stop_dma(ndev);
+out_set_reset:
+	ravb_set_reset_mode(ndev);
 out_napi_off:
 	if (info->nc_queues)
 		napi_disable(&priv->napi[RAVB_NC]);
@@ -2187,6 +2219,9 @@ static int ravb_close(struct net_device *ndev)
 	if (info->nc_queues)
 		ravb_ring_free(ndev, RAVB_NC);
 
+	/* Set reset mode. */
+	ravb_set_reset_mode(ndev);
+
 	return 0;
 }
 
@@ -2517,30 +2552,6 @@ static const struct of_device_id ravb_match_table[] = {
 };
 MODULE_DEVICE_TABLE(of, ravb_match_table);
 
-static int ravb_set_config_mode(struct net_device *ndev)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
-	int error;
-
-	if (info->gptp) {
-		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
-		/* Set CSEL value */
-		ravb_modify(ndev, CCC, CCC_CSEL, CCC_CSEL_HPB);
-	} else if (info->ccc_gac) {
-		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG |
-			    CCC_GAC | CCC_CSEL_HPB);
-	} else {
-		ravb_modify(ndev, CCC, CCC_OPC, CCC_OPC_CONFIG);
-	}
-
-	error = ravb_wait(ndev, CSR, CSR_OPS, CSR_OPS_CONFIG);
-	if (error)
-		netdev_err(ndev, "failed to switch device to config mode\n");
-
-	return error;
-}
-
 /* Set tx and rx clock internal delay modes */
 static void ravb_parse_delay_mode(struct device_node *np, struct net_device *ndev)
 {
@@ -2818,11 +2829,6 @@ static int ravb_probe(struct platform_device *pdev)
 	ndev->netdev_ops = &ravb_netdev_ops;
 	ndev->ethtool_ops = &ravb_ethtool_ops;
 
-	/* Set AVB config mode */
-	error = ravb_set_config_mode(ndev);
-	if (error)
-		goto out_rpm_put;
-
 	error = ravb_compute_gti(ndev);
 	if (error)
 		goto out_rpm_put;
@@ -2857,11 +2863,16 @@ static int ravb_probe(struct platform_device *pdev)
 		eth_hw_addr_random(ndev);
 	}
 
+	/* Set config mode as this is needed for PHY initialization. */
+	error = ravb_config(ndev);
+	if (error)
+		goto out_rpm_put;
+
 	/* MDIO bus init */
 	error = ravb_mdio_init(priv);
 	if (error) {
 		dev_err(&pdev->dev, "failed to initialize MDIO\n");
-		goto out_dma_free;
+		goto out_reset_mode;
 	}
 
 	netif_napi_add(ndev, &priv->napi[RAVB_BE], ravb_poll);
@@ -2875,19 +2886,30 @@ static int ravb_probe(struct platform_device *pdev)
 
 	device_set_wakeup_capable(&pdev->dev, 1);
 
+	/* Reset MAC as the module will be runtime disabled at this moment.
+	 * This saves power. MAC will be switched back to configuration mode
+	 * in ravb_open().
+	 */
+	error = ravb_set_reset_mode(ndev);
+	if (error)
+		goto out_netdev_unregister;
+
 	/* Print device information */
 	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
 		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
 
 	return 0;
 
+out_netdev_unregister:
+	unregister_netdev(ndev);
 out_napi_del:
 	if (info->nc_queues)
 		netif_napi_del(&priv->napi[RAVB_NC]);
 
 	netif_napi_del(&priv->napi[RAVB_BE]);
 	ravb_mdio_release(priv);
-out_dma_free:
+out_reset_mode:
+	ravb_set_reset_mode(ndev);
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 out_rpm_put:
@@ -2907,7 +2929,6 @@ static void ravb_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
-	int error;
 
 	unregister_netdev(ndev);
 	if (info->nc_queues)
@@ -2919,10 +2940,6 @@ static void ravb_remove(struct platform_device *pdev)
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 
-	error = ravb_set_reset_mode(ndev);
-	if (error)
-		netdev_err(ndev, "Failed to reset ndev\n");
-
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	clk_unprepare(priv->refclk);
-- 
2.39.2


