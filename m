Return-Path: <linux-renesas-soc+bounces-1973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8204F841F7A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 10:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5D261C22AA9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Jan 2024 09:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65F160DC0;
	Tue, 30 Jan 2024 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m1T7nW+b"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA729604B7;
	Tue, 30 Jan 2024 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706606900; cv=none; b=euMxLF41B1Ibx/FHbFN8Wx0M8SsIwRguAX5MiIZh3IHvtX/Kv4g2BmgB7P0EBvfuv0bI9kO8hFfw7cNemglSMZcQHWH5G8T+g5dP3CQVjy9VlcxzscGKX1+Cgz2PZobHbNdTauEvYHzq8iBv0gx+AZL/Fzogy/9OsZAL5vm4ftw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706606900; c=relaxed/simple;
	bh=69LIq5fAqa6dEr5+ztIQByCimMRhSNd0FmgOOfon8lM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6FLVSU5VvcbJdeN1PfjibiFXQPTok1vXVwI9y4S0WaBZTqNQkvTKHHi0vxZK1PsAellYZfAW94lLWUk9uLxIXlbbwsuOrV2paTSrHh8FxoB+WZqTkEI4xWob25+tinT361s7B2hb0tsWl+kAxMsfRsyD3iiaeMYyFVHM6tMo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m1T7nW+b; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B95D6000E;
	Tue, 30 Jan 2024 09:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706606897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z1rEc2x1Xw5kU2zMQPLLg1FffYOTNZVyoqaN2YLglyM=;
	b=m1T7nW+b5TG09bRQv/t3Olu40lXYDbburKAes2pyi2pN4ODnjTZjLMk4lIIIA6+BBdNEqN
	0oGDUqEN4yktpP2fEYrCxhvp1Om9q9XZ7Bq04QPqJmwhsT1gaA5WfAMdm5zJUBZA4wxKzu
	yb05XBIIjvRSp83U5FYM0nC8aU6ugY6LZn0pMRVGTJglzGi/aD9gdPtnPm/IPgGn5iMuGJ
	jLfe1L//8Hmu+Dx9UknY/I0YsQntzZjT9etQypex2CpYGLk2Zk5BHF8HIqs6PBvYf40Inr
	5UZzPzePY+ix4gZY+8nXOdgYxaE+rF7ETM+KaLIcosM0BvusobgYSBW2iX7+cQ==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Tue, 30 Jan 2024 10:28:38 +0100
Subject: [PATCH net-next v2 3/7] net: stmmac: don't rely on lynx_pcs
 presence to check for a PHY
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-rxc_bugfix-v2-3-5e6c3168e5f0@bootlin.com>
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
 Romain Gantois <romain.gantois@bootlin.com>
X-Mailer: b4 0.12.4
X-GND-Sasl: romain.gantois@bootlin.com

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

When initializing attached PHYs, there are some cases where we don't expect
any PHY to be connected. The logic uses conditions based on various local
PCS configuration, but also calls-in phylink_expects_phy() via
stmmac_init_phy(), which is enough to ensure we don't try to initialize a
PHY when using a Lynx PCS, as long as we have the phy_interface set to a
802.3z mode and are using inband negociation.

Drop the lynx check, making the stmmac generic code more pcs_lynx-agnostic.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
[rgantois: commit log]
Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index b334eb16da23..7f0900f53248 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3918,8 +3918,7 @@ static int __stmmac_open(struct net_device *dev,
 	if (priv->hw->pcs != STMMAC_PCS_TBI &&
 	    priv->hw->pcs != STMMAC_PCS_RTBI &&
 	    (!priv->hw->xpcs ||
-	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73) &&
-	    !priv->hw->lynx_pcs) {
+	     xpcs_get_an_mode(priv->hw->xpcs, mode) != DW_AN_C73)) {
 		ret = stmmac_init_phy(dev);
 		if (ret) {
 			netdev_err(priv->dev,

-- 
2.43.0


