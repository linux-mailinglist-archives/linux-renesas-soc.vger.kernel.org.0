Return-Path: <linux-renesas-soc+bounces-5328-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A488C3BF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 09:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5B79281442
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2024 07:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8FA147C82;
	Mon, 13 May 2024 07:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="atvZ28IO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B82F146D7F;
	Mon, 13 May 2024 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715585087; cv=none; b=Wz7+hoqocdqCpRpPeJdA6IvV4sPlTl6VX+k5+v3etDSReajj8oGW4ibUf/BhXKiZ/V0aqfNQV+2upC2S40NdQWPTMG/Iu3ignPx5KUxU0mRa1IBC4n7q/mZ2HF+NWVcPkKCrlWQEa6/2pkMIS8LjpvU2xxNBM/w+P5zmsvwqIeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715585087; c=relaxed/simple;
	bh=dheHqiZnkFTbcdak8Es4kqGAatIQ1tnP4WdYf2N3TTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKka0TZp9hYBJQl6wwA3u9N9Eb4azf5ceWCd9dr37AuFh/Z3pe2FNZE6bQYlgLfE36tgft8nBNzqT0yRKuvrUO1FmHdfq1dCIdoSA+1viSvbONrbjQHZtUe23/J8LG1Ozq008AptJ1hNK2d8XsiSG4uLUbLg8jytb/pSUVJdw4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=atvZ28IO; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68D3420013;
	Mon, 13 May 2024 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715585083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8DEnR7Vsu1dYEHLUDLUrKJDthlP0UhWogu5sP7ZpV0=;
	b=atvZ28IOPJ/7gXI9wJ5lOWl7GABpMIq+CO7/O7bl3xETKTRzYg33zdSH/rg665n80gdgNb
	ngFsZZtiLPjQoo7+uPvC/Ty9Rw3zSlQ4P8nRoMFtto6fsS/aicFDFVnhIOJV62dEaNRGwF
	8SkwuWcTCtoGyYCcz4PLxXZvXF9Rizxad+YNhSrQyYzn67Kn86KVJBATjtMLRFmddbF58f
	MxRUZKyLD4tBZ5s1tPMeza3C6znnjzm3sfYNQ3afGfCk5g0WnkHmkRUqJmB8W630wUHwJB
	3cv12XOgg+HI1hGLxbZHJI8xjjnsw8GEyy37wM+tuomQxqsQPfmOisj1a7eLzQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 13 May 2024 09:25:15 +0200
Subject: [PATCH net-next v7 4/7] net: stmmac: introduce pcs_init/pcs_exit
 stmmac operations
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-rzn1-gmac1-v7-4-6acf58b5440d@bootlin.com>
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
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Introduce a mechanism whereby platforms can create their PCS instances
prior to the network device being published to userspace, but after
some of the core stmmac initialisation has been completed. This means
that the data structures that platforms need will be available.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
Co-developed-by: Romain Gantois <romain.gantois@bootlin.com>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 8 +++++++-
 include/linux/stmmac.h                            | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 54708440e27b8..aa43117134d38 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -505,7 +505,10 @@ int stmmac_pcs_setup(struct net_device *ndev)
 	priv = netdev_priv(ndev);
 	mode = priv->plat->phy_interface;
 
-	if (priv->plat->mdio_bus_data && priv->plat->mdio_bus_data->has_xpcs) {
+	if (priv->plat->pcs_init) {
+		ret = priv->plat->pcs_init(priv);
+	} else if (priv->plat->mdio_bus_data &&
+		   priv->plat->mdio_bus_data->has_xpcs) {
 		/* Try to probe the XPCS by scanning all addresses */
 		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
 			xpcs = xpcs_create_mdiodev(priv->mii, addr, mode);
@@ -533,6 +536,9 @@ void stmmac_pcs_clean(struct net_device *ndev)
 {
 	struct stmmac_priv *priv = netdev_priv(ndev);
 
+	if (priv->plat->pcs_exit)
+		priv->plat->pcs_exit(priv);
+
 	if (!priv->hw->xpcs)
 		return;
 
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index dfa1828cd756a..4a24a246c617d 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -285,6 +285,8 @@ struct plat_stmmacenet_data {
 	int (*crosststamp)(ktime_t *device, struct system_counterval_t *system,
 			   void *ctx);
 	void (*dump_debug_regs)(void *priv);
+	int (*pcs_init)(struct stmmac_priv *priv);
+	void (*pcs_exit)(struct stmmac_priv *priv);
 	void *bsp_priv;
 	struct clk *stmmac_clk;
 	struct clk *pclk;

-- 
2.44.0


