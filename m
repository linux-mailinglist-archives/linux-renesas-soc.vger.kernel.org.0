Return-Path: <linux-renesas-soc+bounces-3676-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6EF877D6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E26A31F22041
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E4C36AEF;
	Mon, 11 Mar 2024 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VHq2XSWy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241202C861;
	Mon, 11 Mar 2024 09:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150931; cv=none; b=NNDlcFcOUl/O84PXXJpiNsmI7U1SVc6j+zbQWh4g+gJ7R13ouZ6BnY25FJXcMn69b26chc5s1886oaUQ5LzC/sj1ijlvSYL9AjGhDOifac3Nrt78kLMESjsPRj0IcNEptDBhiHobgy4JYaoP9LK9iphy2M+eYvxNku8ryClQf4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150931; c=relaxed/simple;
	bh=zkKjf/c8JwMi7XB286FG0JwvrRIvg/jN2F9USNeJxWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BhutFcZePflMwhtvD5fEzBpKAxjkH1DlcPlGaBTlYv1Be7o1dmuWeJi6KfWk7BcThx9X/iL3jwmQqsw7q50N87j2rO4zzmBepKjhOT/uFkyEwSjp0ZUg8yEgjUcaCzpUOZoGu+hugTBIUGAbpa+38F3vNDpjEfDPtbFzU3Pze6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VHq2XSWy; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id B45F2E0002;
	Mon, 11 Mar 2024 09:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710150921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5X4Vqf5dMNOvdBRrjTCmAMrnSKF3wTY7sOX12e/v6N8=;
	b=VHq2XSWyLTwqugolTBbNtNpUUrcQfUiEapqyjnr+XWAqQp7Bg9DlDhgbRGEm3KW/JYFDuA
	KJXTrUrEQhlpbZR4FdIHzGGh+wc4AbijpAtSkKs809PvURwbvs2CrxGdraLqked3FgNnKu
	d6IOHl/FjmC8uuuVqp+eAy9YvVUXw00IvNTKTTvD71r+tJcMhyCZIxl1k78E4f2i3RMPxy
	JBMOk8qbbgygfA17A6dGnBVMZYt0hvpP2WP1n0EFGoOw7q5Y+MOHY7bL4qXMUoSEyElp0X
	iv5YTFSEhFGpM8HtvuAnRix8QqGs8fTn8U8Wtp4XzPv1jJtn3a3ftQv0XuSSfw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 11 Mar 2024 10:55:48 +0100
Subject: [PATCH net-next v6 5/7] net: stmmac: Signal to PHY/PCS drivers to
 keep RX clock on
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240311-rxc_bugfix-v6-5-adf5133829a2@bootlin.com>
References: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
In-Reply-To: <20240311-rxc_bugfix-v6-0-adf5133829a2@bootlin.com>
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


