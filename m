Return-Path: <linux-renesas-soc+bounces-2646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56798519E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 17:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21E081C212A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Feb 2024 16:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBFF4597D;
	Mon, 12 Feb 2024 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TGcWw4Fg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E305241766;
	Mon, 12 Feb 2024 16:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756114; cv=none; b=pp6E2/whwdoNymDF3abxQQuSkQpLoyXhc+tBg5ivST5jMXmZ1XTDTvF7Mtk3xTbVh9/ma4GaZG/UcwITuIEWyt02fv2PMmylbmX9K3Pv98oIBERPbtlYnxOWeV2ual92jxWmM203bgABjMyEQAXBf9vlHGswz4JWA7cScnKHQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756114; c=relaxed/simple;
	bh=rLcVnFIVegZO8ifJaDDR5V9ohUfozuaSSyCE+PfqTPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXvtCQjBp/QWrHQ6Yp/vGJEzKVt69Ud2NAk4UxUHfAI0PUjv5vTyW2V8jskwmGjhglq1m90k2fkdQ4h3by62O0jRQ/QYLSR6WCyJlw4axxp/jk1iAOMra8J824waTvK8oxck+UW10OZqPcQHO1eoVTpU+tN3+zxowJE5i3CG3H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TGcWw4Fg; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7446E4000D;
	Mon, 12 Feb 2024 16:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707756111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8czDIr08uKTxlGOGsDYPdcJ6cGFJ07B7pYkEvPF76hU=;
	b=TGcWw4FgT4Xnck1YkeBAl9Cni3Dvp+36QFc1wv6p8uJW5WqSNo37BglB8fTV+KIwOMK3tN
	UB75AvHrrgaL3RXUKUqT+VtZtP1x79454w8w8rJ8tW1Nu6WkvLjd/UcLuucXqYRy7BVgBn
	RUaWFoXb4KdzCrykcWWQW5WhmgK1QTmU+HOQ7CEabH/xOi+Uz4a9QhRTwrsNlw0ScLU0VI
	J6/2ZMK/D6mUxtieXPKyWWcGYZk5MS40imsPC+NlL2QyJOKkbw3Wd+vkBrpFylkdVynqXh
	Ka3psvAQIu4YC1d8JZG2UJF7dkubwqABRuqwDYvQXr7nke32l1ejtCYMQoBMxg==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 12 Feb 2024 17:42:14 +0100
Subject: [PATCH net-next v3 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240212-rxc_bugfix-v3-7-e9f2eb6b3b05@bootlin.com>
References: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
In-Reply-To: <20240212-rxc_bugfix-v3-0-e9f2eb6b3b05@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com

The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
started before it initializes its own hardware, thus before it calls
phylink_start.

Check the rxc_always_on pcs flag and enable the clock signal during the
link validation phase.

Reported-by: Clément Léger <clement.leger@bootlin.com>
Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d93f84fbb1fd..b0d9736c678e 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -279,10 +279,37 @@ static int miic_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	return -EINVAL;
 }
 
+static int miic_pre_init(struct phylink_pcs *pcs)
+{
+	struct miic_port *miic_port = phylink_pcs_to_miic_port(pcs);
+	struct miic *miic = miic_port->miic;
+	u32 val;
+
+	/* Start RX clock if required */
+	if (pcs->rxc_always_on) {
+		/* In MII through mode, the clock signals will be driven by the
+		 * external PHY, which might not be initialized yet. Set RMII
+		 * as default mode to ensure that a reference clock signal is
+		 * generated.
+		 */
+		miic_port->interface = PHY_INTERFACE_MODE_RMII;
+
+		val = FIELD_PREP(MIIC_CONVCTRL_CONV_MODE, CONV_MODE_RMII);
+		miic_reg_rmw(miic, MIIC_CONVCTRL(miic_port->port),
+			     MIIC_CONVCTRL_CONV_MODE,
+			     val);
+
+		miic_converter_enable(miic, miic_port->port, 1);
+	}
+
+	return 0;
+}
+
 static const struct phylink_pcs_ops miic_phylink_ops = {
 	.pcs_validate = miic_validate,
 	.pcs_config = miic_config,
 	.pcs_link_up = miic_link_up,
+	.pcs_pre_init = miic_pre_init,
 };
 
 struct phylink_pcs *miic_create(struct device *dev, struct device_node *np)

-- 
2.43.0


