Return-Path: <linux-renesas-soc+bounces-3034-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD5D85D8AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 14:04:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F69B1F23B10
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 13:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B851469D02;
	Wed, 21 Feb 2024 13:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IoHri9sx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422C69967;
	Wed, 21 Feb 2024 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708520647; cv=none; b=Vf84XL0LSevTYlMlRf8Fyd0fGWhC1333Qv6OdfTTVo8YisjCqJ3ZjfuNl4w/P/sSD5SNwKnW0FDu3ktp1hH4cwJJLh7H+5CR6ykXIjtnE38dcTXp7PoH52CdoBWwSzvQJWRljui78QsrkfqiMvGocURz/wpzWuon5k0ExJfWpb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708520647; c=relaxed/simple;
	bh=5VzaDDVtiqqrz1Mwcj/UC006nFz4sJadQdlOvLwqDmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAPgJ9zhaOe2ZRhSR7exuGD9dnd7xpkt3PlCUUon1uPnxdSQaN4wU4nQMfmo37YkXvkoUOX1Y9JxBb0vSEWhX1F6bH8ulBox0grRLMCx+r4Ur8xAVLGfNSOYsXQwSAggIHwHFnEfvp2c+5K11iFLSg6+WNEA46+PpXzjQT58NWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IoHri9sx; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CF2CE0018;
	Wed, 21 Feb 2024 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1708520644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTYOICYJuQ5UIisiBLtAqZAhBd/IR4LXyUg6LvrTYmk=;
	b=IoHri9sxwMNAnWPqnA3xstbMYeRTaDORCIVdTDIdWSOOY46N5X0Q2/MueHepcQ6lBoZGsL
	tsgnufiv/ay44+kVWJvL3yNReTvtp9ZVowD0+F2qBUJXaa5Cc9uj+4SUMl0xwtMi03MhYe
	VjXtL55U7QvKlyMeDPdCKFzFV1ev3I2XX3pxgIVx/cCxkT7MDoyglrC8ZNlsEk0Vcz3qHB
	p8WFzaGRcjyijkCMn8G/JQVrWK5DsvTYhhyglASWI5OlVKPy/x+iG0xRB/EILqytIGz+lw
	8+h4Qbe1M/ixyZHEARSTlE873B8Z3bLRvuMunsyjfyms2KcwtVAYXU56U2GwjQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Wed, 21 Feb 2024 14:04:23 +0100
Subject: [PATCH net-next v4 6/7] net: phy: qcom: at803x: Avoid hibernating
 if MAC requires RX clock
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240221-rxc_bugfix-v4-6-4883ee1cc7b1@bootlin.com>
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
 drivers/net/phy/qcom/at803x.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 4717c59d51d0..2a221b81cf37 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -426,7 +426,8 @@ static int at803x_hibernation_mode_config(struct phy_device *phydev)
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


