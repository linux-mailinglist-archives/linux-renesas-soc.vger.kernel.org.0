Return-Path: <linux-renesas-soc+bounces-1976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC2C841F85
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00870B23CB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7053D6167F;
	Tue, 30 Jan 2024 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="afy97cw7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856905D8F7;
	Tue, 30 Jan 2024 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606903; cv=none; b=YN/hT7heasi/ritLT0KNYiULA+rKwcaynM4Pnx8i6eewfkigq/IaD7Cr0Tq0YSnG+X3jvr4tSqy7IA/dceQretmVTiHx5/J0Brl6d+fcSEaCyhqxHu9SuJJuCVoSg6C8lP5xYGy0X8pHWGnCltu9qN8R58Sx2mzIIMiK2T18c20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606903; c=relaxed/simple;
	bh=GrAEfjjCPdqyCpyRBwS0a7Gcf/jDBY2vXHbe6FtpqD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXd3mszChPEX9c4OK1878A1WqXK5JnY1mIUo5ykLNloARKHsoQeadoaeHYYWJHww+iPOMfTnXgdd4G5i+PHIdoRl4XztpUUcShlIoDDYTnqZZlfqM44Ljj4pbIRwsaygIzKUFSC/MVqJAUqGd5AImwKRNzSaD90NdAc/lj021QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=afy97cw7; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5E766000B;
	Tue, 30 Jan 2024 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=659Q4W8azKnN0NL3XJSqa+ypYYVmj/XL2tJEr9VDJX8=;
	b=afy97cw7XMyiosoW0oOMFKcGD1vXE5jENd2SXWG8oKO3NpkIEQOSVSBOOzO/jWMe104+BR
	6/xIkeaFw9t+pJr9QVkYr7MurlxpWXNy/b4Zg8KbDHcw1Jgd6CEDzvj5Zkcx2J4pTtiOCu
	x4qcS7dcgQZzv9FuInCDmU9yQ8wnoh0RqTkyVnQy7KFu4LjnxN4m4kovNRLJeB7Z6RoRFS
	wvSaI702jrZjxPGHUihvoEGOHh40yhO29m9Nlb29CJkSf4fFh0ijHbivf3m8Y0ridGlkJb
	61pwRlR1Iujg+mmMm4lNY1WG0dr8qWEaQV4cHJhxqE6QGrqrGq8Bevs0hYv//A==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:41 +0100
Subject: [PATCH net-next v2 6/7] net: phy: at803x: Avoid hibernating if MAC
 requires RX clock
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-rxc_bugfix-v2-6-5e6c3168e5f0@bootlin.com>
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

From: Russell King <linux@armlinux.org.uk>

Stmmac controllers connected to an at803x PHY cannot resume properly after
suspend when WoL is enabled. This happens because the MAC requires an RX
clock generated by the PHY to initialize its hardware properly. But the RX
clock is cut when the PHY suspends and isn't brought up until the MAC
driver resumes the phylink.

Prevent the at803x PHY driver from going into suspend if the attached MAC
driver always requires an RX clock signal.

Reported-by: Clark Wang <xiaoning.wang@nxp.com>
Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
Signed-off-by: Russell King <linux@armlinux.org.uk>
[rgantois: commit log]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/phy/at803x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/at803x.c b/drivers/net/phy/at803x.c
index 9c07a6cc6e67..5d8d6b89a162 100644
--- a/drivers/net/phy/at803x.c
+++ b/drivers/net/phy/at803x.c
@@ -895,7 +895,8 @@ static int at803x_hibernation_mode_config(struct phy_device *phydev)
 	/* The default after hardware reset is hibernation mode enabled. After
 	 * software reset, the value is retained.
 	 */
-	if (!(priv->flags & AT803X_DISABLE_HIBERNATION_MODE))
+	if (!(priv->flags & AT803X_DISABLE_HIBERNATION_MODE) &&
+	    !(phydev->dev_flags & PHY_F_RXC_ALWAYS_ON))
 		return 0;
 
 	return at803x_debug_reg_mask(phydev, AT803X_DEBUG_REG_HIB_CTRL,

-- 
2.43.0


