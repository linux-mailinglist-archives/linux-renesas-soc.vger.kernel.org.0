Return-Path: <linux-renesas-soc+bounces-5305-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FE48C1F32
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 09:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFEB6281C7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 May 2024 07:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7C916C443;
	Fri, 10 May 2024 07:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GFDmGkT1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB016079D;
	Fri, 10 May 2024 07:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715326665; cv=none; b=MktR+AtN8LDI9mtEBdyk8P5Sg5w54DBKT+5kKjjfaY+gPZT2ktJEpQ8x1ON7W+5JM+oEEAOC7skT2Ykei31dlHAJmRElzdfBR982L1gXTp+nr6kJQ3TXnA5/5qbyW1yOEDOJA7VA/K++W2D3ISGKNqtZfU4u3Ih6RPzQIxqMOt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715326665; c=relaxed/simple;
	bh=LrzkcTg0ziAo1281NHtial15InJnlwTYePwWReG4hx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qoFou1YnEzotngvKOg3NLvNzPy6t2sRLi/q5inMYnMvkej4rVWJdDVyGMBLtP99z0ZW6hzoaGDe22RgOByF8Pa/ncYk41OK/Ic9dUwdCm0orzWWFZYgakGZz7fYvtRc3ucoEiPvfP7AkChCsUzwLdedVgQEIgIEteGZDKCJeSn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GFDmGkT1; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2788C240005;
	Fri, 10 May 2024 07:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715326656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6lX9CFr+i5aMsyivdRLP1OBs4c+aSnEvczm3xZsmeE=;
	b=GFDmGkT1j2bOE1KvvqCzhvy0d8K7ntQAg/UGwL8XK8uZqmuMfayeWbpBT7C/5IZwoIBZn/
	vwk3b7vXDCiBmBqBmzjVzBNGWsu2auIWzIhn4bi1jLYjCMXfFjqWIkMkUgciPuiAXszhvw
	puy/6KA3H/wyS/jdQgdoF1BRQ+Pb02yvZWlD/z0lWOfWFd0XkwmH/nQ8ieZlAzfwszgQ+w
	HZtBl7eNNe7Wmb5tAywqBaicPXkeXYKazQwq7x1o2xGJugptB/E9AQl/B3HCDXKLRKU1TP
	VS+Z+mSoHMa9MRlBMe+D2QNLW2mDZfe7g0BenGV2QhyHKKN0WFuAXvOzSkIqFQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 10 May 2024 09:38:11 +0200
Subject: [PATCH net-next v6 4/7] net: stmmac: introduce pcs_init/pcs_exit
 stmmac operations
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240510-rzn1-gmac1-v6-4-b63942be334c@bootlin.com>
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
index 778d79cdb2e6d..f562c563aab55 100644
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


