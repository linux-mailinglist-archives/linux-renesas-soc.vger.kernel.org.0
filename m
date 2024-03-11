Return-Path: <linux-renesas-soc+bounces-3672-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5D877D66
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 10:55:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58BDC1F2205A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Mar 2024 09:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B32224D1;
	Mon, 11 Mar 2024 09:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="l17wbK5B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8901C199AD;
	Mon, 11 Mar 2024 09:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710150927; cv=none; b=O6UrKaLG2rHAljFzIiY1Ea9BcrTM+zkXYMTQMgsnnmzdXYOLJnilLDDgDyqpj0TJ5Rg+I+UNezmGCd+ew34lsLixUXV4ByEZ7XXE67pTIXQt0ILeYzi71rxsWCLGz2fLkxBo49TlbOepA+dmdWq6/0gpUGErZdU9svsoSQz5fd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710150927; c=relaxed/simple;
	bh=rvrImScrre1QyGkyNvp89/1N9MkOxvI5xA8HqVsAHKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URYB8849AzU+cNmHAF0QEAb4xPye1zc4nzTiD+/Dy6kuTuQJmFX5ZDj/TC314CcZ3BlQ7TsXoJ2IcYwqq+KuXxQGU8rhTS59L7QAkO1wenmZ5NY0jeBegweU2EJOMuGSC7tDeZnGeuRUdFtc93nocnHjoFRTSCL3879BQPlEhMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=l17wbK5B; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11D90E000D;
	Mon, 11 Mar 2024 09:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710150924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O8MBjRw+XjYP4AGNDE/5givq5CD6fzEROYjULWNw0vo=;
	b=l17wbK5BJQVM/h4alNuTUS8p+qSeFP7D1MlWeKY2o2Cg9O8EDoYZJ/f0yBObu85uB5f7pI
	6V16FTiSYweJHOvvXHzX32krAApJW2nbNYsErNmxPbHvz1ywAD2ymt97W3yFQ3hDBJos+E
	u5W3UwwpbAkS8FTuAF/hxWiZBi1dUs+/HM+5EAfVzkP/aBKvo8k6K1hSJlhh7sbGvPuqcJ
	dxf2nRBmCChBX97MF+jfqJ2ocbklsWobhU4m4wSOUNTUxUlKjd28F7Wqbn+V3CSbhHN7Ly
	SMVPBQ85E5xafPp4YU0IMBbmtu2QDYWDzkCP3mLs3g1m3qUPLElFt+QjhAOm9g==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Mon, 11 Mar 2024 10:55:50 +0100
Subject: [PATCH net-next v6 7/7] net: pcs: rzn1-miic: Init RX clock early
 if MAC requires it
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240311-rxc_bugfix-v6-7-adf5133829a2@bootlin.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 4bd66fdde367..d0a722d43368 100644
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
2.44.0


