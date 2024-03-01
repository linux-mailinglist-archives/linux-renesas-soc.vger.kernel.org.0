Return-Path: <linux-renesas-soc+bounces-3377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C7186E46B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 098D41F23754
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5F96F076;
	Fri,  1 Mar 2024 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U7SDI/pC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89CC39FCF;
	Fri,  1 Mar 2024 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307288; cv=none; b=Ch43BjbeWjIDKZ0XLndJI6TaGOEn0eOQXWqtspADNPWCsQ1V7ge2NSGFzaNGhiOO6kTy3Y89S5B7iAKEtDqhgyLS0Pub1YKC50gX8zII7mT2NxLzyaYcbUN6Z9q9weQqL8G3OMu73YGU/4cILr6AJgDCODxQYQOJGfiAMMd4D+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307288; c=relaxed/simple;
	bh=3teBvmWGv2QIb9wnN8Ug62peXilZv+opMKark4W4HdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5YkRyOeJo1dwKmfFjOf5Q8dU++Nk3EqhVpmaPiN5TICd0zZkswAUI5XKRQ4yqKZtLS8804mABoYKLK+Isib0hk351O8uON3689Va66dwD0ag0U3NKX1K8hw2u6wnayCDVKHLoy1HrxinAAPHhhJWDq2yP7sCLfV295DGmKWXus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=U7SDI/pC; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BCB51BF209;
	Fri,  1 Mar 2024 15:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709307284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZIPNbDER9GD1pk643Vo4atb37f/3Xw0jKatEUes035M=;
	b=U7SDI/pC+amED2VmvfQeO70arxWnMp3pYtcJbFEdNkJ8BIu5ix+576uoY7iiDQKYnTkomz
	kLkhIDwqNDT4BWnVjaH1sDcmDgj7yujGJ+2pPKsf7ZQI7fLQ4EB6Q1cGXoCDR3V6X0t786
	crrF63F/TNUxpvGB5PtxJjT/q6PZ64mBsrFcJVeKK5TpuRMVpFWLHQ94uTkgEV1Y7T3sf/
	pMjuhN/PDph90SZMdK7F++VacYHKxOTyg2CLQJMeMU97pySvKMC9COvb5OnGThu/kq+Yd8
	cETWHNco84MnN+Q6B+rNFruIH8n2GL6C0RUNYoNYywcPdwqH/6LSFTHZNpLjVA==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 01 Mar 2024 16:35:03 +0100
Subject: [PATCH net-next v5 6/7] net: phy: qcom: at803x: Avoid hibernating
 if MAC requires RX clock
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-rxc_bugfix-v5-6-8dac30230050@bootlin.com>
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
2.43.2


