Return-Path: <linux-renesas-soc+bounces-4039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF74288C371
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 14:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05E731C28A4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 13:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B4F745DC;
	Tue, 26 Mar 2024 13:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XHGFRCra"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208C6D1C1;
	Tue, 26 Mar 2024 13:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711459904; cv=none; b=cWGFc7+A1+EY4EvoHeohRrphBdB2wXQe4DRafSL2N0xfXqf9cZyI2vTjBxwYBNgSdrqJ7Gj0aBTyeveTHqnDj072lC7Cf+Oc5sroHJHOhDYZKLZwfVc4//E+iMTHLZj0XZPi3zw0mNShFKHIdYt2hl+eNjr7mC94eZStGpeXMhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711459904; c=relaxed/simple;
	bh=zkKjf/c8JwMi7XB286FG0JwvrRIvg/jN2F9USNeJxWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJfVgdz7I9AsjuMvb86udgYSjQhUShSWi33l3wMSyjJtaFoQA5AUaqDHCyvDvnF0q28Fe2t4nKtNOskc+VrEuj4mMcBFhu3+mpC2NUKWSj1kw6j5rmqJjOd8fdS7nD/II/sGWIWBsY34g7XTQIIHLzgcR1VpNIADZpgda8ANsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XHGFRCra; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D690BC000D;
	Tue, 26 Mar 2024 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711459900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5X4Vqf5dMNOvdBRrjTCmAMrnSKF3wTY7sOX12e/v6N8=;
	b=XHGFRCraGoleTe74a8fvapXFBTEXRh3K3ZoBTFdNIdkfhhnASEnrfrHfnK3bszQ+fuHN1f
	+z55lo2LOAlSTmIU8WC4XfwEVaozluB97JWYzXNcd3WPq4FqtQMMog2mJH0Jcd/fVmzphe
	4cxRzNIs95/b3kd4t+UyOb1yIaPh3OqMB/oipDEIuOYbwOFj8rkXgRXpJZ/7gX9Fjnbfvt
	NWrV6eIrMfDCdXTOArq0eHmlOrPRNLx7QmxrwgLqAJ2KuoDxI0JSDGk9LHLSfaOomw7mNE
	u9gk4MiU4+pEoUv3+VlBSnEzJalSUms6zQVuRqZFY+DRL7LXSkFklWXQ4jSaMQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 26 Mar 2024 14:32:11 +0100
Subject: [PATCH RESEND net-next v6 5/7] net: stmmac: Signal to PHY/PCS
 drivers to keep RX clock on
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240326-rxc_bugfix-v6-5-24a74e5c761f@bootlin.com>
References: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
In-Reply-To: <20240326-rxc_bugfix-v6-0-24a74e5c761f@bootlin.com>
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
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
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
Co-developed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
2.44.0


