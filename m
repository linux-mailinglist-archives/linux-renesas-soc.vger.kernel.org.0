Return-Path: <linux-renesas-soc+bounces-4041-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B059088C376
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 14:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C695B21AF3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Mar 2024 13:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF1F2757F3;
	Tue, 26 Mar 2024 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CcfOk3nV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A3E74420;
	Tue, 26 Mar 2024 13:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711459905; cv=none; b=pcNTbXBkISSES9iZ2cPLeJIxKLI1Wovk24AqZ763oEh+prIrCl96jld0Z7jbgeyzv3F5ovpTVEUhwX1D8ayDpwzm67cUKidsRQ52+e4T/Mvm7Jns6iajxmJHcpQeRyObJmTlLBm/mQz7ujiPRerwPoJKLchYOtxNQOfMUVP4+Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711459905; c=relaxed/simple;
	bh=b9ie/BFgYZejT3fzU45NYJ1UTBtGro5jd1feeyVUSQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCFnsOowNFyzTsvOXFM+QQQzpSU+2cym1UN8KZVF1mpwcmNwMoBdUziBXkIJC6AZO8XGtC7Wq4oHW3JbuUwCMRvOpENawbIU5XOOGHiPqAl/kuU0faHvUrdYy/aYHexFWc0vMKbfLdyJvw1GOjULFO5hvN128IDSg9PN41sEtsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CcfOk3nV; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9681C000E;
	Tue, 26 Mar 2024 13:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711459902;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOpNMTW/vA5X/6RU5HQH0KSBKcCLzUFZqJhHW5arx8w=;
	b=CcfOk3nV93OLbtj4+ARAgsz9peVRLid64OWvzDW/hQVDqDmmlI6CKIaqpE5i9m4mNvp0Y8
	KUfqeF2eGe02EcLd/966AUraPcY0mefC+uvVXAalC9QHTNF6qLrmL+h+GRkuD8YX9VFBgU
	7CyjeiAghWoHKyCpjS+U0uUMuvn/Ue68ZXpc40Hgh/zbrS+FWJs9oGYKedbtGog9zOqEas
	z7ysPIw7wzrIFhhxstp3lD4+KiHuKWRkshYbfbDGCCHlvi+pf2UyaM5nnBnX7QRxsbHKsG
	y76HiZ2v2zf8nCZPUKsC123IdVxt1nvyMIyUEhocBXEt0ScCPi1Pp8rbtibSKw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 26 Mar 2024 14:32:12 +0100
Subject: [PATCH RESEND net-next v6 6/7] net: phy: qcom: at803x: Avoid
 hibernating if MAC requires RX clock
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-rxc_bugfix-v6-6-24a74e5c761f@bootlin.com>
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
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Clark Wang <xiaoning.wang@nxp.com>, 
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: romain.gantois@bootlin.com

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Stmmac controllers connected to an at803x PHY cannot resume properly after
suspend when WoL is enabled. This happens because the MAC requires an RX
clock generated by the PHY to initialize its hardware properly. But the RX
clock is cut when the PHY suspends and isn't brought up until the MAC
driver resumes the phylink.

Prevent the at803x PHY driver from going into suspend if the attached MAC
driver always requires an RX clock signal.

Reported-by: Clark Wang <xiaoning.wang@nxp.com>
Link: https://lore.kernel.org/all/20230202081559.3553637-1-xiaoning.wang@nxp.com/
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
[rgantois: commit log]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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
2.44.0


