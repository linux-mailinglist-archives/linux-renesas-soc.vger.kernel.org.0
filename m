Return-Path: <linux-renesas-soc+bounces-3379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3B786E46E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9AA1F23304
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:35:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 428276FBB8;
	Fri,  1 Mar 2024 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BiVVlX9W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5286EF1B;
	Fri,  1 Mar 2024 15:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307289; cv=none; b=kUGG40vyip851UmY27MHyggI67COc5GZDW5n+Pd4fkEkB8iYBZcugtXd2aFwQOJG4DZmXkzmYpiVSjjFMIJGav33fIDrp0fIwxmg0hiIGMRHWCvVsyQH59PtdFtANHLSU6zB9W9TUW1Q87DqDcme3mD57QhaCdHIlgAA+Lp+dCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307289; c=relaxed/simple;
	bh=D49aXYPQrwkUDZmDeQoqlQjAe7+L9PHpRXAU7ZliBh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujrDfQwGJ5sqAQvOqhpggDpkmtCorN/Gd3irez6ScrOQ3M2pb0QKEtCRYuyVC7sTZKC/5LV7y5EMr8cRFaI6mtv6X2pK1kFQUGybhQ9rHSD50oyENZoWecbMIfJHTMMz9QGl8VozgWh4MxxmiN5vBs6/XEo7kJqSSgMmxejWUNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BiVVlX9W; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B3C51BF20E;
	Fri,  1 Mar 2024 15:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709307285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6LIsy4cmYZytxPJCTBqEXj+r87EQ9cGgcY4Fox5a48=;
	b=BiVVlX9W7Au059KYrwEXFL9D8p2hZurAT58wUJVvgByaXXhuvaCvH2/wSXvORLxvxUU4yR
	KoB+4+9lUtzM5wcJeXZd6DNtiTlLoXJdbbSbYFqTn2WF+P7PILutGZGIV5qERFRvkC/8vp
	YYx9CmA7tZ5mqzyodTzqVcxgOkh065n03B77razG2c38BYnFrNpAdy8teV/rwrqEEGFD2+
	HdYf2S/lDo+FPXqm5iImOLyDGytSj59cLHq0g5xiNngDKO+a0ObNo8lKf3JJbAftciJGiz
	EKSeRhNoSIo/GfaYWeVgnKNGimufAiscMZAamhul8/63gOhitqW4bhxiRKHy+A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 01 Mar 2024 16:35:04 +0100
Subject: [PATCH net-next v5 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240301-rxc_bugfix-v5-7-8dac30230050@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

The GMAC1 controller in the RZN1 IP requires the RX MII clock signal to be
started before it initializes its own hardware, thus before it calls
phylink_start.

Implement the pcs_pre_init() callback so that the RX clock signal can be
enabled early if necessary.

Reported-by: Clément Léger <clement.leger@bootlin.com>
Link: https://lore.kernel.org/linux-arm-kernel/20230116103926.276869-4-clement.leger@bootlin.com/
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index d93f84fbb1fd..8a683c76a0f2 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -279,10 +279,38 @@ static int miic_validate(struct phylink_pcs *pcs, unsigned long *supported,
 	return -EINVAL;
 }
 
+static int miic_pre_init(struct phylink_pcs *pcs)
+{
+	struct miic_port *miic_port = phylink_pcs_to_miic_port(pcs);
+	struct miic *miic = miic_port->miic;
+	u32 val, mask;
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
+		val = FIELD_PREP(MIIC_CONVCTRL_CONV_MODE, CONV_MODE_RMII) |
+		      FIELD_PREP(MIIC_CONVCTRL_CONV_SPEED, CONV_MODE_100MBPS);
+		mask = MIIC_CONVCTRL_CONV_MODE | MIIC_CONVCTRL_CONV_SPEED;
+
+		miic_reg_rmw(miic, MIIC_CONVCTRL(miic_port->port), mask, val);
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
2.43.2


