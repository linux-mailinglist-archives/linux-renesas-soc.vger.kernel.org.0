Return-Path: <linux-renesas-soc+bounces-24220-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D945C3B1F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C87D4FEC7D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 768E3345CC9;
	Thu,  6 Nov 2025 12:56:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4892E338590;
	Thu,  6 Nov 2025 12:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433803; cv=none; b=AUgb1MQnOFAdoXtVHpakFp9iXqAJllIseZS0jw+VP03uCxC0/VFfbBgme8lkrE1AUnc4gZH3R3mJc7AoybzPZJxMzedHOBdlN2bgriUtakIJXG1lFG0B2on/Zb/Y1UmelntN77092SLzwuDILdLKjfLQFhgWi9SztEVv5wxRj48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433803; c=relaxed/simple;
	bh=kO1Ui7xjSKskPdQ11rpXlp4ByoWUj7DJ86m5TCPomAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rv6wyXvvlCTHtIvtFeNnthmlvxyD0FxRi4417yNktdU8JpiqFFQnSZlyTGLCB0heU4HVuu0cEXlJQZPYTUx1BOp+TgXEG+L/pbPQxGF7o8WuTTapSN6BsNTN8QmTCfSCDYJTreHC0yDgPdqiXDHOC/xVs91TVEfIWTO0RFSCiqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 8CobPaMpQ96Q5otWza+blA==
X-CSE-MsgGUID: JZ/WS85zS1eC1DJE0jk3qg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:56:40 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F1ECB4006DE3;
	Thu,  6 Nov 2025 21:56:34 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:34 +0100
Subject: [PATCH net-next 10/10] net: renesas: rswitch: update error
 handling of probe
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-10-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=2934;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=KDH1JsZOXiQbxgTynfSlueti3VJdmkeZOnA1SQPwfw8=;
 b=H7uMs2BdzpKAtkELEmI9qu3bDHo98ng8Cmdl3Ti/xcOvYA7xTJwSc74SKSEbTKenFBJg5Kbpj
 RiBjiu09uQbDJVrA7RHJp841tNR9uKJA5hUOl2fuvqCojSRE4DUCH55
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Update error handling of probe function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 63 ++++++++++++++++-------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 8d56ef037a8d..1d8f141a25d3 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2231,6 +2231,30 @@ static const struct soc_device_attribute rswitch_soc_no_speed_change[]  = {
 	{ /* Sentinel */ }
 };
 
+static void rswitch_deinit(struct rswitch_private *priv)
+{
+	unsigned int i;
+
+	rswitch_gwca_hw_deinit(priv);
+	rcar_gen4_ptp_unregister(priv->ptp_priv);
+
+	rswitch_for_each_enabled_port(priv, i) {
+		struct rswitch_device *rdev = priv->rdev[i];
+
+		unregister_netdev(rdev->ndev);
+		rswitch_ether_port_deinit_one(rdev);
+		phy_exit(priv->rdev[i]->serdes);
+	}
+
+	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
+		rswitch_device_free(priv, i);
+
+	rswitch_gwca_ts_queue_free(priv);
+	rswitch_gwca_linkfix_free(priv);
+
+	rswitch_clock_disable(priv);
+}
+
 static int renesas_eth_sw_probe(struct platform_device *pdev)
 {
 	const struct soc_device_attribute *attr;
@@ -2294,11 +2318,8 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	pm_runtime_get_sync(&pdev->dev);
 
 	ret = rswitch_init(priv);
-	if (ret < 0) {
-		pm_runtime_put(&pdev->dev);
-		pm_runtime_disable(&pdev->dev);
-		return ret;
-	}
+	if (ret < 0)
+		goto err_disable_pm_runtime;
 
 	if (list_empty(&priv->port_list))
 		dev_warn(&pdev->dev, "could not initialize any ports\n");
@@ -2306,36 +2327,20 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	ret = rswitch_register_notifiers();
 	if (ret) {
 		dev_err(&pdev->dev, "could not register notifiers\n");
-		return ret;
+		goto err_deinit_rswitch;
 	}
 
 	device_set_wakeup_capable(&pdev->dev, 1);
 
-	return ret;
-}
-
-static void rswitch_deinit(struct rswitch_private *priv)
-{
-	unsigned int i;
-
-	rswitch_gwca_hw_deinit(priv);
-	rcar_gen4_ptp_unregister(priv->ptp_priv);
-
-	rswitch_for_each_enabled_port(priv, i) {
-		struct rswitch_device *rdev = priv->rdev[i];
-
-		unregister_netdev(rdev->ndev);
-		rswitch_ether_port_deinit_one(rdev);
-		phy_exit(priv->rdev[i]->serdes);
-	}
-
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
-		rswitch_device_free(priv, i);
+	return 0;
 
-	rswitch_gwca_ts_queue_free(priv);
-	rswitch_gwca_linkfix_free(priv);
+err_deinit_rswitch:
+	rswitch_deinit(priv);
+err_disable_pm_runtime:
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
 
-	rswitch_clock_disable(priv);
+	return ret;
 }
 
 static void renesas_eth_sw_remove(struct platform_device *pdev)

-- 
2.43.0


