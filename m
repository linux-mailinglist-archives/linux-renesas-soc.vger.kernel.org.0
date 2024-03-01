Return-Path: <linux-renesas-soc+bounces-3384-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 253EA86E478
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:35:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA832B23CFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6795D70CD8;
	Fri,  1 Mar 2024 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ndvfllSY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B4970AEA;
	Fri,  1 Mar 2024 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307292; cv=none; b=UbGMIgIVOJg7ZKxXX9ljvCrnO5BypEV+FZ93zMIHoiWyr/k/jRy/yvH6V4q8nzgAF1Um7v4CO/pMqmbi1hMi6M0hQkEw5YHk6kKmqd9NeDUw11UmyOh2fpY5uwWVU/BFNlkHh3Cj2xrFkibM3HDOsf9OaPkkIatjYD7pFu9uDaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307292; c=relaxed/simple;
	bh=9t4s9f/0GdQ6rupLeySpFgtu3Q47zJ6vZTUfJFsGm1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G47JZej4jetKtx4qvTYzhtO1dwzqrqvAspJ/gfPOh0yukMULggYpLDX8YK6RrxY2JsITTnToqeGg/EzdKDiOuZ/dZcuKPcQpnxzC2NyZTm5T7USvqkSxjd54b3WOcNS06CAAIqjg2rPQXI1i6AUmH9pC0nGJCTtfnl63fgqN1uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ndvfllSY; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 553071BF214;
	Fri,  1 Mar 2024 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709307283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mPP+dx/u1QlLp7Z98ZPnW3Pcjv5oOqegMlpLj3+UIJM=;
	b=ndvfllSY32eEq2O0+A4kF3t7bdII2sta6fBVypj8LB92rrRUwqtSP4BVvyctivWahO+UmE
	gOxIc+k2/kzSo57HHYo6oqZ7vwM3vcIWCsgjXgS5SbgYrnK7x5+aypg9Ww/c5NvCq07YTX
	qXxfH9gjwnNjS+/Zf46uKQLKHpBsGxnQSAvGy5BsdML7q+tB+tRWTJOnHoPxA3ZivL+DMb
	BBmhgADBPOVigumaBI1YP51l3Nwztr9Wkk6vO7shog7g4HTiz2v644LDQP7zV9uzRcrHat
	xrszVivl3SW0KiAikl5KrMiUu3QQAwMtkcPcVD2aryrft7U9vkIDHdOPVpfqjw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 01 Mar 2024 16:35:02 +0100
Subject: [PATCH net-next v5 5/7] net: stmmac: Signal to PHY/PCS drivers to
 keep RX clock on
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240301-rxc_bugfix-v5-5-8dac30230050@bootlin.com>
References: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
In-Reply-To: <20240301-rxc_bugfix-v5-0-8dac30230050@bootlin.com>
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
X-Mailer: b4 0.13.0
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
index 79844dbe4258..2290f4808d7e 100644
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
@@ -3408,6 +3411,10 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
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
2.43.2


