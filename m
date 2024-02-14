Return-Path: <linux-renesas-soc+bounces-2775-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D320854AF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 15:01:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D54C428E01B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316B85BADF;
	Wed, 14 Feb 2024 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PqwY+T3B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F058AA9
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919137; cv=none; b=NiBZqJ2O74C7TYkMbglEjhx27i1sCfxgLoPEMuCTV+bOniGHzMD4TpuZluIgXlzocbXbvwnGa+rK4Y+frqoFEDTcB+zZPmGUVpp5Ittf+ssVHHo02gPUSLAv2n60WcBh8IITvT5fmPvz4KxZhGedcddUZpxC6ik7N7mkr+Y30KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919137; c=relaxed/simple;
	bh=DCOkytDLppS2bYn3RErvOIjLsPi/YOCWIUBoGo2hi0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mWu2ea+rs6Gz5W5PSNb+O4bUhgmN2AmviVt1GwTYVYX96Oo6jppY6kanlRCgi/TWZ1Md5U/N0z1/4pmOQqgBsyI98lcSRR48GCnOA+gXWNQCjHOBb1tQ982GOHtPbUfYfpQa1JmNpHt3k615Hbr9DHxd9r9jrEYh4giT5Ic65Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PqwY+T3B; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33934567777so3559174f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 05:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707919131; x=1708523931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zjiXPc38mpvdFc3Koad2qjD+UloWUSOxb8tDBr5OK4=;
        b=PqwY+T3BgK+ZRZjW/x3inefq7peSvBzf6BHmjvV/vXexaKPWYFPlpNQINna855jr7F
         2ZWBLsEvwyLL4d+Z9eICXk9oONtXZ2Xd4sMaA5FfdhU0DRIunsVLunMXpV4iOq1qbWAu
         aBCwkFHPmtWyzJSBPhCESvDCGKwz6E22H6koq0kbRQn5iZYnHkAWdhst9a08guI5Dnj4
         MwO45kG2mGu2IfsWIvptSZQCzefZd8+P0SVayv9Oe540zdqiRVdXxnNcR7bSJ+66zxay
         q74Yc5R5XXWL+FcdSVLNlcz0KNBmbax1XXtK8hBg0YbArXGAYWydufCjyMmIdPWZokGJ
         5+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707919131; x=1708523931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/zjiXPc38mpvdFc3Koad2qjD+UloWUSOxb8tDBr5OK4=;
        b=AueMNWwOY/Z8PCuWHpCn0QzUNq5mPvoqE+6gB/PZidq3/djUHvHKpeT9QqUCbib9jb
         vY/1kK4x/E9rJOQMmimQPOsYjVrmQRWiXMi1s2dafIZnJkzTJ3i/gNGdl2o3947uPAZ2
         PdyhSyG5+IGdJmFXsx8iGR1dqpu0eRU3Qa/m3bFBnbBwHe5O8hCEwsP7GdVnpFssn98A
         INfOcPB49jVNbwl3mF1Gs5TqITfj1c5J2tMSALX3+fIl2/zZu2OzBW7W6HPHHIa1w78Z
         tJm7FjMt4UdTetuTCPyCIX0UrRNcuOf8js8A2suShouYyVqCG9Ojt1OJejSvs3hw/YY5
         JMHg==
X-Forwarded-Encrypted: i=1; AJvYcCUblSY3x0by0/gE1Q7x1jsulS5kPJkivh4Yr+3kIEcbRLSyjvB66Y4wkNrEAo9S56+fEdo0tEwMn2tC6CaL2iloXd39CwandtDC1SreEC5w4sU=
X-Gm-Message-State: AOJu0Yx+N/QICTmoSaiDhonljdUa1a8j1U+jsu8PymKC4quTZAyCg4uv
	3mrnW98zIfYAMy0cmejas2VOfLfOoDix2lrg3BqAjNIg0ImFEeWZEg6zcyzKqH0=
X-Google-Smtp-Source: AGHT+IEbIprofj1cnMyJXEX5AiYlHF4Wk00M8lDTzMe7s0Qz1nMc7jBS1yKOy5LpTVcQlPPFlfCriw==
X-Received: by 2002:adf:f18e:0:b0:33b:5087:c913 with SMTP id h14-20020adff18e000000b0033b5087c913mr2242505wro.54.1707919131582;
        Wed, 14 Feb 2024 05:58:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVLwJ2RO2UWMIdJhAp4ZOX+nEM6u7OawSEXibKwgIZurbbgG6FeY89PAkWMrsvonE3leWhdvP3H0IHro4PglhJH2in/eFz4JvexoF6IActYBupfvxjZ/e9P+FrlcoosPha8/GdCgPYMa45MTqxnDwnaWvyZsClbLpfa4AgBy5qjkW/L12UmoVQhRiG5LG9pUx15X4i29vZbRW5EqzbdY6ieGCKpFV6vQMJgEV5hR6fzwVesRp5/C1JyCnxhbLLvOCs6SPrJZh1QtgfHmCWwEXDE47V3+wDG6JhWTr7kpcWcpOAG3k4BrCyp5nTXl69QrpdnetW+0CGRQdiykSjD4Ak3rKJz8P7O7V+YiMzw0q1B3+HncYr+
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id f15-20020adff58f000000b0033cdbebfda7sm4282140wro.14.2024.02.14.05.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 05:58:51 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	biju.das.jz@bp.renesas.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH net-next v4 6/6] net: ravb: Add runtime PM support
Date: Wed, 14 Feb 2024 15:58:00 +0200
Message-Id: <20240214135800.2674435-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240214135800.2674435-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240214135800.2674435-1-claudiu.beznea.uj@bp.renesas.com>
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
will switch the IP to the reset operation mode where register contents is
lost and reconfiguration needs to be done. For this the rabv_open()
function enables the clocks, switches the IP to configuration mode, applies
all the register settings and switches the IP to the operational mode. At
the end of ravb_open() IP is ready to send/receive data.

In ravb_close() necessary reverts are done (compared with ravb_open()), the
IP is switched to reset mode and clocks are disabled.

The ethtool APIs or IOCTLs that might execute while the interface is down
are either cached (and applied in ravb_open()) or rejected (as at that time
the IP is in reset mode). Keeping the IP in the reset mode also increases
the power saved (according to the hardware manual).

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---

Changes in v4:
- none

Changes in v3:
- fixed typo in patch description

Changes in v2:
- none

Changes since [2]:
- none
- didn't returned directly the ret code of pm_runtime_put_autosuspend()
  as, in theory, it might return 1 in case device is suspended through
  this calltrace:
  pm_runtime_put_autosuspend() ->
    __pm_runtime_suspend() ->
      rpm_suspend() ->
        rpm_check_suspend_allowed()

Changes in v3 of [2]:
- this was patch 21/21 in v2
- collected tags
- fixed typos in patch description

Changes in v2 of [2]:
- keep RPM support for all platforms

[2] https://lore.kernel.org/all/20240105082339.1468817-1-claudiu.beznea.uj@bp.renesas.com/

 drivers/net/ethernet/renesas/ravb_main.c | 54 ++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 6f0677d1adee..289d6482cd72 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1939,16 +1939,21 @@ static int ravb_open(struct net_device *ndev)
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
@@ -1982,6 +1987,9 @@ static int ravb_open(struct net_device *ndev)
 	ravb_stop_dma(ndev);
 out_set_reset:
 	ravb_set_opmode(ndev, CCC_OPC_RESET);
+out_rpm_put:
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 out_napi_off:
 	if (info->nc_queues)
 		napi_disable(&priv->napi[RAVB_NC]);
@@ -2322,6 +2330,8 @@ static int ravb_close(struct net_device *ndev)
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *info = priv->info;
 	struct ravb_tstamp_skb *ts_skb, *ts_skb2;
+	struct device *dev = &priv->pdev->dev;
+	int error;
 
 	netif_tx_stop_all_queues(ndev);
 
@@ -2371,7 +2381,14 @@ static int ravb_close(struct net_device *ndev)
 	ravb_get_stats(ndev);
 
 	/* Set reset mode. */
-	return ravb_set_opmode(ndev, CCC_OPC_RESET);
+	error = ravb_set_opmode(ndev, CCC_OPC_RESET);
+	if (error)
+		return error;
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return 0;
 }
 
 static int ravb_hwtstamp_get(struct net_device *ndev, struct ifreq *req)
@@ -2926,6 +2943,8 @@ static int ravb_probe(struct platform_device *pdev)
 	clk_prepare(priv->refclk);
 
 	platform_set_drvdata(pdev, ndev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	error = pm_runtime_resume_and_get(&pdev->dev);
 	if (error < 0)
@@ -3031,6 +3050,9 @@ static int ravb_probe(struct platform_device *pdev)
 	netdev_info(ndev, "Base address at %#x, %pM, IRQ %d.\n",
 		    (u32)ndev->base_addr, ndev->dev_addr, ndev->irq);
 
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
 	return 0;
 
 out_napi_del:
@@ -3048,6 +3070,7 @@ static int ravb_probe(struct platform_device *pdev)
 	pm_runtime_put(&pdev->dev);
 out_rpm_disable:
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	clk_unprepare(priv->refclk);
 out_reset_assert:
 	reset_control_assert(rstc);
@@ -3061,6 +3084,12 @@ static void ravb_remove(struct platform_device *pdev)
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
@@ -3072,8 +3101,9 @@ static void ravb_remove(struct platform_device *pdev)
 	dma_free_coherent(ndev->dev.parent, priv->desc_bat_size, priv->desc_bat,
 			  priv->desc_bat_dma);
 
-	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_put_sync_suspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_dont_use_autosuspend(dev);
 	clk_unprepare(priv->refclk);
 	reset_control_assert(priv->rstc);
 	free_netdev(ndev);
@@ -3155,6 +3185,10 @@ static int ravb_suspend(struct device *dev)
 	if (ret)
 		return ret;
 
+	ret = pm_runtime_force_suspend(&priv->pdev->dev);
+	if (ret)
+		return ret;
+
 reset_assert:
 	return reset_control_assert(priv->rstc);
 }
@@ -3177,16 +3211,28 @@ static int ravb_resume(struct device *dev)
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


