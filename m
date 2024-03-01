Return-Path: <linux-renesas-soc+bounces-3382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9361786E475
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 16:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C418B1C21B56
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Mar 2024 15:35:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8793670CAD;
	Fri,  1 Mar 2024 15:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bzCSuejX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F9223AD;
	Fri,  1 Mar 2024 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709307290; cv=none; b=e9dEbo1IDS9YOQ8bbCLN6MiJcrVsjs16ir/C8xuQPDCgdThfXu3HeONh+Y9GKlpW844clKKQvo8TZ0WrrQoMRjMmkoGJy2YDQqYR0L31tL7j0SC+zNPRgEwTB/ruJoS4BJt0m3FEnjz7kYXR5jPoevGWxcVol2dNn0Ec+Iq3O04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709307290; c=relaxed/simple;
	bh=HoN9SYxlcC5LVXK7IObl4vHqULtBjTr/pRpIfm2uX+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjWJDXmAAJM4lRiODfIvLVyGn3ORFItLF98YzB79blRWqAVWbllqvOFr60HdXjJEzrQTkcgF7R5JgcY8DUDSy2PwJTkhg06RI+D4nUoDwNY8HvYPkrrVhtK1pHBIS8VCpF8OzbojcNzvkk+EXpQMpqFbGLs3UwOpyU0UTjM2xxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bzCSuejX; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2F1A31BF20F;
	Fri,  1 Mar 2024 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709307281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jC25vqdZfopyzKfAOsmqFvC+QwsT1bDvBX0PBzMDySo=;
	b=bzCSuejXIAO/S9zxyyAOC96gP4lFkMpIV3zLML4DndWdaZjMXlW5tpK2maHeRdS3lRYSXk
	ADdfwpGqsEgybHoCIsrtztGqtWfeoFnF5AX9AElh1sF3zCXdkX6qVK3s6oFhkMnMUmAQ0K
	LpD2Ogowyd1C2Ylsxbvb7nQFXcgJjoATIyInM/bm6TnXn22PyOvq6AXQ8gLLKEVi9LlwML
	QKqMbyWaaOg6dGB0vX4jfXYaXRWYNZXm/6uboQfIaPJz6oFUe3qg4JVR6HSVrOfIM+ioS9
	12epftB1wgMEkSPTwK+Pl35LxMarROWcns5wHm1hcQEtsTpT+ep+k/2874Qzkw==
From: Romain Gantois <romain.gantois@bootlin.com>
Date: Fri, 01 Mar 2024 16:35:00 +0100
Subject: [PATCH net-next v5 3/7] net: stmmac: don't rely on lynx_pcs
 presence to check for a PHY
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240301-rxc_bugfix-v5-3-8dac30230050@bootlin.com>
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
index 24cd80490d19..d78c625d33eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3960,8 +3960,7 @@ static int __stmmac_open(struct net_device *dev,
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
2.43.2


