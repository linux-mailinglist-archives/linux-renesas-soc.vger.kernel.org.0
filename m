Return-Path: <linux-renesas-soc+bounces-5327-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E21478C3BF0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 09:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A8A281644
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 07:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D1C1474DB;
	Mon, 13 May 2024 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ID+rARiI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2429D146D4E;
	Mon, 13 May 2024 07:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585086; cv=none; b=LLM5npk2uDwS5H+bAe9KAMMsCxa5R8Q5qgBqL1Mhi+1tlzXDdNGDWqCZc4W3a6n/I3YQcuz19fX0VFWL/wI1ZZa23VEhBwPgNfEgPJviO3UZxgwpS6unB/r6/KmlFiHqnHr+/Sq3sVbxqlcEUW0vbdgASc/AeGlSYlvNnPoSrR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585086; c=relaxed/simple;
	bh=809zpZiHBQn4T6cz6Zcq74OpfyWIWzDKKG9A5buW6Tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LYPT+NILmY5cV5sxgiW2SQkygVfsy5wohF5Q3j7jHOaTSOQZTwUNFplrAZzkC4RQa9G9ppKmp/siLZqKznhYbMrSw/J7GwlInpFd/3DmTsEV30cnzSQ/+5THtALiwmPqxW/+586YimLPC2XDCKeoyHnaKX9PVAOdb9ZFoZSPuiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ID+rARiI; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1B13920012;
	Mon, 13 May 2024 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715585082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjvm1N4rOlLPaFBwTCH0gmtHt8LF+Z42yqOPTFZ7WlI=;
	b=ID+rARiIngxxvzk7M9VoU25Vgv3NFdw4HsoU7RoEkmx4aFKNzfzWBy61Nlpx9LXrttcYWR
	JreFlQhQu/73zStBGUaPVVTiaKMYD5yPsRayJCa+hbcsvHOaLVtMh8aYXdiZV9bvuRLVvb
	oX5MrpL7I4JnfHIgRZv7/71xpdj+zLZob5ycmmgcmLYocaKg6DmechSIucr6aLlWMBeHoY
	hCkFYBtIT/2j5RMWvEy+cwYhYEMgvPg5CWYU/6S/kxOT+uTRV9oCrhKX5WaB50WnqYcwBa
	gC277kmPQUa9rozNUkwLAAWUAv+D7OD75j2aLL07pW5UUSUwzfR9EoB/udsmMw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 13 May 2024 09:25:14 +0200
Subject: [PATCH net-next v7 3/7] net: stmmac: Make stmmac_xpcs_setup()
 generic to all PCS devices
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-rzn1-gmac1-v7-3-6acf58b5440d@bootlin.com>
References: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
In-Reply-To: <20240513-rzn1-gmac1-v7-0-6acf58b5440d@bootlin.com>
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 Romain Gantois <romain.gantois@bootlin.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

From: Serge Semin <fancer.lancer@gmail.com>

A pcs_init() callback will be introduced to stmmac in a future patch. This
new function will be called during the hardware initialization phase.
Instead of separately initializing XPCS and PCS components, let's group all
PCS-related hardware initialization logic in the current
stmmac_xpcs_setup() function.

Rename stmmac_xpcs_setup() to stmmac_pcs_setup() and move the conditional
call to stmmac_xpcs_setup() inside the function itself.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 +++-----
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 30 ++++++++++++++---------
 3 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index badfe686a5702..ed38099ca7406 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -360,7 +360,7 @@ enum stmmac_state {
 int stmmac_mdio_unregister(struct net_device *ndev);
 int stmmac_mdio_register(struct net_device *ndev);
 int stmmac_mdio_reset(struct mii_bus *mii);
-int stmmac_xpcs_setup(struct mii_bus *mii);
+int stmmac_pcs_setup(struct net_device *ndev);
 void stmmac_pcs_clean(struct net_device *ndev);
 void stmmac_set_ethtool_ops(struct net_device *netdev);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 0ac99c132733d..ef285b3c56ab9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7754,11 +7754,9 @@ int stmmac_dvr_probe(struct device *device,
 	if (priv->plat->speed_mode_2500)
 		priv->plat->speed_mode_2500(ndev, priv->plat->bsp_priv);
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
-		ret = stmmac_xpcs_setup(priv->mii);
-		if (ret)
-			goto error_xpcs_setup;
-	}
+	ret = stmmac_pcs_setup(ndev);
+	if (ret)
+		goto error_pcs_setup;
 
 	ret = stmmac_phy_setup(priv);
 	if (ret) {
@@ -7791,7 +7789,7 @@ int stmmac_dvr_probe(struct device *device,
 	phylink_destroy(priv->phylink);
 error_phy_setup:
 	stmmac_pcs_clean(ndev);
-error_xpcs_setup:
+error_pcs_setup:
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI)
 		stmmac_mdio_unregister(ndev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 73ba9901a4439..54708440e27b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -495,31 +495,37 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
-int stmmac_xpcs_setup(struct mii_bus *bus)
+int stmmac_pcs_setup(struct net_device *ndev)
 {
-	struct net_device *ndev = bus->priv;
+	struct dw_xpcs *xpcs = NULL;
 	struct stmmac_priv *priv;
-	struct dw_xpcs *xpcs;
+	int ret = -ENODEV;
 	int mode, addr;
 
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
 
-	/* Try to probe the XPCS by scanning all addresses. */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		xpcs = xpcs_create_mdiodev(bus, addr, mode);
-		if (IS_ERR(xpcs))
-			continue;
+	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+		/* Try to probe the XPCS by scanning all addresses */
+		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
+			if (IS_ERR(xpcs))
+				continue;
 
-		priv->hw->xpcs = xpcs;
-		break;
+			ret = 0;
+			break;
+		}
+	} else {
+		return 0;
 	}
 
-	if (!priv->hw->xpcs) {
+	if (ret) {
 		dev_warn(priv->device, "No xPCS found\n");
-		return -ENODEV;
+		return ret;
 	}
 
+	priv->hw->xpcs = xpcs;
+
 	return 0;
 }
 

-- 
2.44.0


