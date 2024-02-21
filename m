Return-Path: <linux-renesas-soc+bounces-3037-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DE85D8B2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 14:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B68D1F2431A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 13:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B89D69DE1;
	Wed, 21 Feb 2024 13:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g7ML4NVY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB9769954;
	Wed, 21 Feb 2024 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520648; cv=none; b=iSu2NL6YbV64fFcVFLytRjHn+t2mx2Z361g9h/BdfA2bEoiwcKrLPV/FcrU4zsfYOsrEQW+YGaYXxgrFmW5Rjh6sLvmy1FxcS0+9kiyptotSjBt65A5xHRZCYkp0DD+tBN3K00D374L8IeExaP+SVTABMC1u5c/K1oZIwKtr2gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520648; c=relaxed/simple;
	bh=v9bDpvvX0RKMMrCA98TweMMDMhM4ZPyJFANVu501FdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H6WvOLFF5G1PGZuu6mte8Tvm5shxKqctQiEw4HbHE8OraMpDjphisIu6U3+geQqGBPu7/8NApTBhyfkTQyzf3tgqvniN1btYXpZr3/wmd7qAIkYSMPbGw0XexXv/3MP98dFwCC8rCssYp9//jTZ42/4+zQQTlJI4RfyfPQqVJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g7ML4NVY; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56D4FE0013;
	Wed, 21 Feb 2024 13:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708520643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yRIMbE0unjYrvpCkfTYc04XJCl1PK7tAYUxBqamkw58=;
	b=g7ML4NVY8iyT9O2/IjPMF/YYSbScra98V9Ku/KO8gL7/au/W7HCg8M22XpWJWII132xFR8
	WubZeB1JEQLfXTlP/eqwbwRSNiOqHzkwpW+FPCkBFxJghKXNxdtZeq+h7zooCbAPf9MuzZ
	cbIh2QV1lplkkJW5Q06TYGiXnYgeJIc98H4SqygSyd47sFaCSFL7geSvILBm5IeWbyu0Cz
	EE9Aa6Wr1JNZWBJkBTh2sTmjBQDlC8Jneeotdg1so6HyXk0JAqur6YdEJ7iZmke7NTcooR
	lOBVHovuO6OKjc9fb/T94HsgBWh0S33TermwbQaCEFfAXJE+HfKX0s4kzZT62w==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 21 Feb 2024 14:04:22 +0100
Subject: [PATCH net-next v4 5/7] net: stmmac: Signal to PHY/PCS drivers to
 keep RX clock on
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240221-rxc_bugfix-v4-5-4883ee1cc7b1@bootlin.com>
References: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
In-Reply-To: <20240221-rxc_bugfix-v4-0-4883ee1cc7b1@bootlin.com>
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
index ec4f6377b5ee..caf71a502ff2 100644
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
@@ -3407,6 +3410,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
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


