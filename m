Return-Path: <linux-renesas-soc+bounces-1975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3AE841F8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2CE6B2E99A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:29:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B582860EC4;
	Tue, 30 Jan 2024 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HU5gZCH6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88860BBB;
	Tue, 30 Jan 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606902; cv=none; b=UeELWVqimhCwf3OWtJlFT5cjbbij6EqrMoYIuloToCS0WmnjJJd/h+MeNway4WBJu0lrXhDllrgI8gpKzDAhdMm9a6rxm3QYPJK98FjzJcB1sBvm+mvMVyOOxtk21C8IPVIyGAM4q1/UHGICnH9phwiXVzs5bh5UN9HkOT+3bvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606902; c=relaxed/simple;
	bh=dwQ3riEq0UzGydqbkb7FXthIf97TFkIM8HsHc7k3IU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZX4mxFKLWpmUiwswL7UYC6AIsNxw8kNIOnxO7m8Ge+LE1XrK0ljFmsjO4pKHR38Vrn0nk0uCjI4XfVyL94CZwPB395/9QYKi2c68fPocLAbNgOFNhSq1PP1H2VvA2tma6bJsg6zu1w5BWTVeOoo3JgLj56iPj+Uz+D1dia6XZuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HU5gZCH6; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 098146000C;
	Tue, 30 Jan 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JCIN9PC5AsOKdJhE1Swz0j+trKxzzOsLjLL1WNO/OqY=;
	b=HU5gZCH6CXQVHnfIq3Vvhyl5nAG6Igh4uDVusx1iMqEvkXZbQtsVqDwoMgNGd32mKEbBHE
	moYX3f18TPUtVSb3ueEgVe1NoBNHZSTQcudeJ6QSfkGlFn0cXdRrBsFsqBk8MYxm2ZGrD6
	1yMrE5eJfGx7lmI4PCzeFIgBSM2ki3KebrKfsTqX6NiUdo2TjStLLsxRYW9hJ9j1v6CHAP
	OMVTM1baaTQGBXcIFaE8tThrlvXHxW6yWS4rXKpGrExZwZn2je+Kqg/8igvQMDsFVMwt5Y
	yI5FM7E48EatQtLmLazotQ72v08O2F0Ppjbpox8XJboWCrw0c0BuPkBpw5pAaw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:40 +0100
Subject: [PATCH net-next v2 5/7] net: stmmac: Signal to PHY/PCS drivers to
 keep RX clock on
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240130-rxc_bugfix-v2-5-5e6c3168e5f0@bootlin.com>
References: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
In-Reply-To: <20240130-rxc_bugfix-v2-0-5e6c3168e5f0@bootlin.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 Clark Wang <xiaoning.wang@nxp.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com

There is a reocurring issue with stmmac controllers where the MAC fails to
initialize its hardware if an RX clock signal isn't provided on the MAC/PHY
link.

This causes issues when PHY or PCS devices either go into suspend while
cutting the RX clock or do not bring the clock signal up early enough for
the MAC to initialize successfully.

Set the mac_requires_rxc flag in the stmmac phylink config so that PHY/PCS
drivers know to keep the RX clock up at all times.

Reported-by: Clark Wang <xiaoning.wang@nxp.com>
Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
Reported-by: Clément Léger <clement.leger@bootlin.com>
Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
Suggested-by: Russell King <linux@armlinux.org.uk>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 72e02ef0ee6b..7345e3fa07c4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1218,6 +1218,9 @@ static int stmmac_phy_setup(struct stmmac_priv *priv)
 	priv->phylink_config.type = PHYLINK_NETDEV;
 	priv->phylink_config.mac_managed_pm = true;
 
+	/* Stmmac always requires an RX clock for hardware initialization */
+	priv->phylink_config.mac_requires_rxc = true;
+
 	mdio_bus_data = priv->plat->mdio_bus_data;
 	if (mdio_bus_data)
 		priv->phylink_config.ovr_an_inband =
@@ -3402,6 +3405,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
 	u32 chan;
 	int ret;
 
+	/* Make sure RX clock is enabled */
+	if (priv->hw->phylink_pcs)
+		phylink_pcs_pre_init(priv->phylink, priv->hw->phylink_pcs);
+
 	/* DMA initialization and SW reset */
 	ret = stmmac_init_dma_engine(priv);
 	if (ret < 0) {

-- 
2.43.0


