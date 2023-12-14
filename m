Return-Path: <linux-renesas-soc+bounces-1061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CAF812F55
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 12:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB932830C5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Dec 2023 11:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125A2405E9;
	Thu, 14 Dec 2023 11:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VH2cq5w1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C26171A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:54 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54f4f7e88feso8845049a12.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2023 03:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1702554413; x=1703159213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHdjbrsgC9c7zj7iW7XF4dehsvpJIxxX32noXPZIWvM=;
        b=VH2cq5w1BQ0Zbv/cNEd4CUZaRS8dyZjc4zE+W1wM4RqrCRVoR5xKR4uoz7hWqSGsHA
         DbhoR7p5hQ4v/uDaj0XiLwEjCI+im9ODDaJ9CSsxSGirOfFQ0IAYjV3OL3ZY1Xjv+W9V
         oM3GbU3NOcLAWVjdwTVD0bcLROXGqW4Ke5UpA5y5vTzeJR6EHc/tZ/kLz5yPMtPA+gP8
         xmpv68vR2iJzUeXGGwRKynq1mn12XMVc3AAV2jA2BomxyfhUwe0LvvQYK+Ex311ELynx
         mErJJPbFEnscJrKgnWeDBblsz8C0BxMsYZj+M0bB8BsT4G8swO/IuypMyKS6H4pgQlD+
         DtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702554413; x=1703159213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHdjbrsgC9c7zj7iW7XF4dehsvpJIxxX32noXPZIWvM=;
        b=FmrvzCUl90La4OOemIXvbcfGhuNC0NhHAEZuRMWdlrI5llLkhWKgW4mfRoLpH+xBKe
         37+Nox+/HowjOjo+1Zb+w3GAerH2358qF/wpBZLfMUQW5A2VXpYKQoPieSjfKvhWKdir
         HuQ7gmf9dE7YQFEpQlhJ1wFPB9M0qLGnorLw7R8gS7quTqwFB73uZjDhipSDzZhlranz
         UG1YOh2qaGvDJbGcStY80WeE1IUDL9BAtV91JePtN+1ozQk+1UvftaA4UPHZvNgyVHzj
         IGZtzmIe09/kLsqzfSY4dQNXOGoHp4JLEn9/PspLdNQUnXoWBqFr4dAJrnLvCqiQqu5N
         b/7w==
X-Gm-Message-State: AOJu0Yz2JUTTCTeZw3LEUU1V8TNunwkPDoFzyULlG/wACC1caql5tEFe
	gvSCtzqj8EG6WHf/NR46qy0Qjg==
X-Google-Smtp-Source: AGHT+IFrFS+Z+MB4DKzhISgHNRoGJDDklWTn4/FS7HR5/yJpAYoiauOPD4XcVQ8K730XQ5ToztxooQ==
X-Received: by 2002:a17:906:284:b0:a19:940f:b9d3 with SMTP id 4-20020a170906028400b00a19940fb9d3mr4327540ejf.25.1702554413073;
        Thu, 14 Dec 2023 03:46:53 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ll9-20020a170907190900b00a1da2f7c1d8sm9240877ejc.77.2023.12.14.03.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 03:46:52 -0800 (PST)
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
Subject: [PATCH net-next v2 21/21] net: ravb: Add runtime PM support
Date: Thu, 14 Dec 2023 13:46:00 +0200
Message-Id: <20231214114600.2451162-22-claudiu.beznea.uj@bp.renesas.com>
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

Add runtime PM support for the ravb driver. As the driver is used by
different IP variants, with different behaviors, to be able to have the
runtime PM support available for all devices, the preparatory commits
moved all the resources parsing and allocations in the driver's probe
function and kept the settings for ravb_open(). This is due to the fact
that on some IP variants-platforms tuples disabling/enabling the clocks
will switch the IP to the reset operation mode where registers' content is
lost and reconfiguration needs to be done. For this the rabv_open()
function enables the clocks, switches the IP to configuration mode, applies
all the registers settings and switches the IP to the operational mode. At
the end of ravb_open() IP is ready to send/receive data.

In ravb_close() necessary reverts are done (compared with ravb_open()), the
IP is switched to reset mode and clocks are disabled.

The ethtool APIs or IOCTLs that might execute while the interface is down
are either cached (and applied in ravb_open()) or rejected (as at that time
the IP is in reset mode). Keeping the IP in the reset mode also increases
the power saved (according to the hardware manual).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- keep RPM support for all platforms

 drivers/net/ethernet/renesas/ravb_main.c | 47 ++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 9ff943dff522..0733b63ff910 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1839,16 +1839,21 @@ static int ravb_open(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
+	struct device *dev = &priv->pdev->dev;
 	int error;
 
 	napi_enable(&priv->napi[RAVB_BE]);
 	if (info->nc_queues)
 		napi_enable(&priv->napi[RAVB_NC]);
 
+	error = pm_runtime_resume_and_get(dev);
+	if (error < 0)
+		goto out_napi_off;
+
 	/* Set AVB config mode */
 	error = ravb_set_config_mode(ndev);
 	if (error)
-		goto out_napi_off;
+		goto out_rpm_put;
 
 	ravb_set_delay_mode(ndev);
 	ravb_write(ndev, priv->desc_bat_dma, DBAT);
@@ -1894,6 +1899,9 @@ static int ravb_open(struct net_device *ndev)
 	ravb_stop_dma(ndev);
 out_set_reset:
 	ravb_set_reset_mode(ndev);
+out_rpm_put:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 out_napi_off:
 	if (info->nc_queues)
 		napi_disable(&priv->napi[RAVB_NC]);
@@ -2189,6 +2197,7 @@ static int ravb_close(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
 	struct ravb_tstamp_skb *ts_skb, *ts_skb2;
+	struct device *dev = &priv->pdev->dev;
 
 	netif_tx_stop_all_queues(ndev);
 
@@ -2237,6 +2246,9 @@ static int ravb_close(struct net_device *ndev)
 	/* Set reset mode. */
 	ravb_set_reset_mode(ndev);
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -2808,6 +2820,8 @@ static int ravb_probe(struct platform_device *pdev)
 	clk_prepare(priv->refclk);
 
 	platform_set_drvdata(pdev, ndev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	error = pm_runtime_resume_and_get(&pdev->dev);
 	if (error < 0)
@@ -2916,6 +2930,9 @@ static int ravb_probe(struct platform_device *pdev)
 	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
 		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
 
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
 	return 0;
 
 out_netdev_unregister:
@@ -2934,6 +2951,7 @@ static int ravb_probe(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 out_rpm_disable:
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	clk_unprepare(priv->refclk);
 out_reset_assert:
 	reset_control_assert(rstc);
@@ -2947,6 +2965,12 @@ static void ravb_remove(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
+	struct device *dev = &priv->pdev->dev;
+	int error;
+
+	error = pm_runtime_resume_and_get(dev);
+	if (error < 0)
+		return;
 
 	unregister_netdev(ndev);
 	if (info->nc_queues)
@@ -2958,8 +2982,9 @@ static void ravb_remove(struct platform_device *pdev)
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	clk_unprepare(priv->refclk);
 	reset_control_assert(priv->rstc);
 	free_netdev(ndev);
@@ -3041,6 +3066,10 @@ static int ravb_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = pm_runtime_force_suspend(&priv->pdev->dev);
+	if (ret)
+		return ret;
+
 reset_assert:
 	return reset_control_assert(priv->rstc);
 }
@@ -3063,16 +3092,28 @@ static int ravb_resume(struct device *dev)
 		ret = ravb_wol_restore(ndev);
 		if (ret)
 			return ret;
+	} else {
+		ret = pm_runtime_force_resume(dev);
+		if (ret)
+			return ret;
 	}
 
 	/* Reopening the interface will restore the device to the working state. */
 	ret = ravb_open(ndev);
 	if (ret < 0)
-		return ret;
+		goto out_rpm_put;
 
 	ravb_set_rx_mode(ndev);
 	netif_device_attach(ndev);
 
+	return 0;
+
+out_rpm_put:
+	if (!priv->wol_enabled) {
+		pm_runtime_mark_last_busy(dev);
+		pm_runtime_put_autosuspend(dev);
+	}
+
 	return ret;
 }
 
-- 
2.39.2


