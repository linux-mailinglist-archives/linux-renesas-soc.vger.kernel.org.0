Return-Path: <linux-renesas-soc+bounces-3039-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE7385D8B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 14:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22E61F23D67
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 13:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DED69DE9;
	Wed, 21 Feb 2024 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GNa/TLIv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92236996B;
	Wed, 21 Feb 2024 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520648; cv=none; b=HB2WFAsVm4xNhxyiZLYPWgdroz956ctZ9Dwd/dqYFls5PiHwdoFYQEaPsGVpkL2VlVfgtb0L5hHrQddi1Q1PEtc7/0L+VrlSEvF7ZXg0zLDc3eMje4I5XSwQxDlQ775SEfhNNKvHHwdw52ZGDpKbclUnu8hi9vfxTD1k5GkL0vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520648; c=relaxed/simple;
	bh=5CSqhD9O0ym5FCKW8n55foSJ41M3C6lXFUpUom3cxv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EtUh/Mw9qudsWp/MXLEoY6QhemeXF1MMBmSMp1nGCsgIzrzqmKSHo/g8FxHnINms0yyV+LLtyjPjM+Ixb6j7xslovy305ssGf+8FDTInMnMo0IglRSGhcL099wJOIAy8LvcL9EjRxGGFSm2ahxnH4mgKvK6bebnMRS/566dMx9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GNa/TLIv; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59B55E0012;
	Wed, 21 Feb 2024 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708520645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/HVv/irSZsVEd7MEnAXEKn02UcIst/9mjY7zWWotaAA=;
	b=GNa/TLIvrmKwcJiM1BoXd/8/HU7QEh7sVmGZPiKI2vsnY3woLYMhp1/3JXGbu0Ip9Ck9u7
	2UmukJX4O2IudlUI3YtW0Vr+zMVRojXi80H5u0W0n7vq0epLfR5PU+BjzzKE5v63p8jJHa
	YVqRHmLCEB7F454fsGvX7agRfcjStaTIeH29XIt8jqqT2IBu70JVajiIQUpWOD+Wo6WaIU
	twVKw/EOfKtLlxQKvIQiBQuOZNz00rOQyx4dLmFVNAYIMYzzZYcZQiKGU0Ts6xRwiGvzX8
	25XoSEHmO+uYmW1p8ocPFvdPc4rVV5hplamUOoHBAfv8Dz0ONXkOjj5CL5R3DA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 21 Feb 2024 14:04:24 +0100
Subject: [PATCH net-next v4 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240221-rxc_bugfix-v4-7-4883ee1cc7b1@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.12.4
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
2.43.0


