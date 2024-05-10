Return-Path: <linux-renesas-soc+bounces-5304-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE578C1F2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 09:38:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9AE5283009
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 07:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F969165FD3;
	Fri, 10 May 2024 07:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="heLlFnaM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84B415FA62;
	Fri, 10 May 2024 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715326665; cv=none; b=K4gKWXL1QADU+DN3vWWupkbob1VfOxO8wPVolYEuL3cRzICvA9fVjupjDfQnIo5laTzFmbDP729OWXNnDM8M3YioK8Wpb+Rl9RFROZYCQHC3N9IrZGg5gMzVbVAyfu+zwfR/pehEDvrQJpN/Q+P+CnyOnaLruOakHRJGIGVnasM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715326665; c=relaxed/simple;
	bh=q0ODQo1/fKkt5jwjA8LMTgrwpxwI3PEWS6up4ckYCN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rBYfhiACOqWIALmF/AshpUXYL8FSHgrWqNN9MYPcrUk4CLTuN9hYRf6qRkpzDprA7jP3G1c4ofTmX9TwQQzOkQmHWkDobe1mObbfJWoP0GG8W3Ds2dOoMfMoYOg0+IEiA77tIgOIZoHqONdLRo5+vVl5iuI7Qi5VoWrq5NCYqqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=heLlFnaM; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E6E0D240007;
	Fri, 10 May 2024 07:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715326655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R70rkyRP1Hf1pp49vShPfEGxoK1eDHjp1Cs21gNxWro=;
	b=heLlFnaMMiSW6jgN/C5enaGjr6fn6SrEoe5RGt8BIgAwJDNd+ln2EFWgjywe0FpYb00RAB
	+QUYBt4Kp8daKpNb8wruc/L75oaDtKLMIVkwaQWhbRgGYllWs8u9lhv9ut88SqaDDKzvwQ
	96inZQ1FlFy5rd4MSDBQ+QDVu9y1RTU9KjJpWhd8q3v07OSOyzcEmfQTUMjnK2FN7Q2gMR
	U3ph/NWuTgprwVUMqKSJFkkkIoT9RcMPnnyZ8jby4bSny7+LA+mUXgl4CE9sQP6BeCvRvL
	VE+47LiVVWSHtWYDr8VdSKgRvlkttNcL9+0k8EoF0n5hWbHob1X3lIoNv8t/rA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 10 May 2024 09:38:10 +0200
Subject: [PATCH net-next v6 3/7] net: stmmac: Make stmmac_xpcs_setup()
 generic to all PCS devices
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-rzn1-gmac1-v6-3-b63942be334c@bootlin.com>
References: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
In-Reply-To: <20240510-rzn1-gmac1-v6-0-b63942be334c@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
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
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 28 ++++++++++++++---------
 3 files changed, 22 insertions(+), 18 deletions(-)

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
index 73ba9901a4439..778d79cdb2e6d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -495,31 +495,37 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	return 0;
 }
 
-int stmmac_xpcs_setup(struct mii_bus *bus)
+int stmmac_pcs_setup(struct net_device *ndev)
 {
-	struct net_device *ndev = bus->priv;
 	struct stmmac_priv *priv;
 	struct dw_xpcs *xpcs;
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


