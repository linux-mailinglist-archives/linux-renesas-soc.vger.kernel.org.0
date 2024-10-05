Return-Path: <linux-renesas-soc+bounces-9488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E0991669
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 13:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C021F23AC0
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 11:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7B3149DF4;
	Sat,  5 Oct 2024 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="c99gfz6t";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="YlOaQlkD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D7A142E6F;
	Sat,  5 Oct 2024 11:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728127503; cv=none; b=mq1J5A7xvNVDKOdiKrqQQYHge85YXK/eLY9dQ37yL8LzswMWamfAjYhcQvh1EwfN+lOEprSdnkd4qDmAA9WS2tss6HXTamFKNDe6l3+rt9sq4zur5K5mWAJYSy4IdSyGoLvUUA7Q1FDofx9DVl6z1XY7kzeoWVpz3omunLDCRSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728127503; c=relaxed/simple;
	bh=ZJLlj57/1LhQiz2PQbJ2ekoNl6DsBEe76WPyQw1dRoA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lwurqTxdxA1EPa+2qx2BEjVgjJW2idCqKCqeXpPlen/aLI8trAbfJJgXKsKKaMeM8Y5/7RwNhSd9C8Lm6FWxXs6u0QMjr2P1lXhQjHqmOtYM3uegBZ+RqUuNzBSWrBc+a+y5y3N6lhMAq6ICgQfmrTF8twCA3+xlCBOocuMwjVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=c99gfz6t; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=YlOaQlkD; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C636113807FC;
	Sat,  5 Oct 2024 07:24:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 05 Oct 2024 07:24:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728127499;
	 x=1728213899; bh=LozwPcBOIqEgi9bHv790veOpV1INEYKEZCPzvbplhxA=; b=
	c99gfz6t5aeozHzC/1EHR5g7ws4yfm1IvLKbZiMtyloYfpk5eRy+swh1awqN0Wfo
	hQooqrlwCzW9lnOJRo+jRSr2IWsB6pGwShkgqae2kS5zEGAW0pQ5J2FIEdlrTqg0
	xie8x4bJqZHHtdDKeVp4ovZqpJlZUIhivc2r5yEeCBf9hE4FEGzTCISQROL0vDaZ
	Dd4XCbzA0ErEm6hTxxu/SC1rKGWksVjckqLfGBFclVW4QFf6AGhxsdt0hGjeiK7h
	jh+NJ+wAyG2SFP5qgy1rB36sjV8FI7pyC4jvvsDrx32bDxdjXEjEcq9Qppg04On+
	23lEpktTDIdjUoF5RJFzbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728127499; x=
	1728213899; bh=LozwPcBOIqEgi9bHv790veOpV1INEYKEZCPzvbplhxA=; b=Y
	lOaQlkDnI70FRMd2GAE9os4UDlCKGVUYNGNof+glSF4ZzEHXvUCw0l39FvUDtT6B
	OTexZMRdFwJof4AiWGKhdmvP2c6zk0rhNMg6h/98G1BL5t69RrdehQUsCA456grR
	wRoAl0kmbjRIwM0CgvW0Byj8JMRZdqPC1IFV8BdYFswPJFY5SlQyTbCa/ilO4a2z
	Z58lIGXuq3swm4WKuI2FZmrMwdx64xIoUhSZtWhb1uUEUQNFPJWAQS6sXE2w+tN2
	ZsxU2oFSUSsYmNeqz+MeQLu45Y/tj5C6K9hlm3QgdKIlSP0uLZpHYpKDTiX/fdrS
	fd7Ryn6WdJrOK5PGcnh2Q==
X-ME-Sender: <xms:CyIBZ7yHtLeutZzhQjoh0648Ik385MrVJgzoekgF7yeUQC-DtEQa4A>
    <xme:CyIBZzTPFts7XXy6eixucPlDy2laYaL_rORYsf_eVyU4GM_bTWom4A-FKX98RN3vf
    XlMIPoXDFJ-RNsZ7PM>
X-ME-Received: <xmr:CyIBZ1VJL9pVbgl9fo-cI3Usx33OI6rDWHNIHhGWlWIZgtXUAdaO3pWycvAEaLa0Mx5_1zmNfj_11ll_VctvGJGnyw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedufedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifsehl
    uhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivg
    htsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopegvih
    gthhgvshhtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughimhgrrdhfvggurhgruhes
    ghhmrghilhdrtghomh
X-ME-Proxy: <xmx:CyIBZ1gDRPeblUg3u3-Csgsg4o8SLgrmtO4oLK-UnwBke7_ElQSTGw>
    <xmx:CyIBZ9BAWgTeKTmTrHyg_2yLfpLoWdnN19H0t68diUj40DPMwwzOdw>
    <xmx:CyIBZ-IUT5GmWSUrSG8BnrJdzmIfZ5erBd3BYnSHLL0Ur12Nf9kR4g>
    <xmx:CyIBZ8CBZJqc5nCZx8yOAjF-s35kucv-J1pZw_pEzNqqKENIX3imnw>
    <xmx:CyIBZ1wG5axw1SnIHqEwTzGU2mhcy9CvQg3VNzHOSvMmG0iFCsABOlTA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 07:24:59 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2 1/3] net: phy: marvell-88q2xxx: Align soft reset for mv88q2110 and mv88q2220
Date: Sat,  5 Oct 2024 13:24:10 +0200
Message-ID: <20241005112412.544360-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241005112412.544360-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241005112412.544360-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The soft reset implementations for mv88q2110 and mv88q2220 differ as the
later need to consider that auto negation is supported on mv88q2220
devices. In preparation of enabling auto negotiation on mv88q2110 merge
the two rest functions into a device generic one.

The mv88q2220 behavior is kept as is but extended to wait for the reset
bit to be clears before continuing, as was done previously on mv88q2220.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Dimitri Fedrau <dima.fedrau@gmail.com>
Tested-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/net/phy/marvell-88q2xxx.c | 60 ++++++++++++++-----------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index c812f16eaa3a..850beb4b1722 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -179,15 +179,34 @@ static int mv88q2xxx_soft_reset(struct phy_device *phydev)
 	int ret;
 	int val;
 
-	ret = phy_write_mmd(phydev, MDIO_MMD_PCS,
-			    MDIO_PCS_1000BT1_CTRL, MDIO_PCS_1000BT1_CTRL_RESET);
+	/* Enable RESET of DCL */
+	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000) {
+		ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x48);
+		if (ret < 0)
+			return ret;
+	}
+
+	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_CTRL,
+			    MDIO_PCS_1000BT1_CTRL_RESET);
+	if (ret < 0)
+		return ret;
+
+	ret = phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
+					MDIO_PCS_1000BT1_CTRL, val,
+					!(val & MDIO_PCS_1000BT1_CTRL_RESET),
+					50000, 600000, true);
 	if (ret < 0)
 		return ret;
 
-	return phy_read_mmd_poll_timeout(phydev, MDIO_MMD_PCS,
-					 MDIO_PCS_1000BT1_CTRL, val,
-					 !(val & MDIO_PCS_1000BT1_CTRL_RESET),
-					 50000, 600000, true);
+	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xffe4, 0xc);
+	if (ret < 0)
+		return ret;
+
+	/* Disable RESET of DCL */
+	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000)
+		return phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x58);
+
+	return 0;
 }
 
 static int mv88q2xxx_read_link_gbit(struct phy_device *phydev)
@@ -705,33 +724,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
 	return mv88q2xxx_hwmon_probe(phydev);
 }
 
-static int mv88q222x_soft_reset(struct phy_device *phydev)
-{
-	int ret;
-
-	/* Enable RESET of DCL */
-	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000) {
-		ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x48);
-		if (ret < 0)
-			return ret;
-	}
-
-	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, MDIO_PCS_1000BT1_CTRL,
-			    MDIO_PCS_1000BT1_CTRL_RESET);
-	if (ret < 0)
-		return ret;
-
-	ret = phy_write_mmd(phydev, MDIO_MMD_PCS, 0xffe4, 0xc);
-	if (ret < 0)
-		return ret;
-
-	/* Disable RESET of DCL */
-	if (phydev->autoneg == AUTONEG_ENABLE || phydev->speed == SPEED_1000)
-		return phy_write_mmd(phydev, MDIO_MMD_PCS, 0xfe1b, 0x58);
-
-	return 0;
-}
-
 static int mv88q222x_write_mmd_vals(struct phy_device *phydev,
 				    const struct mmd_val *vals, size_t len)
 {
@@ -906,7 +898,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 		.aneg_done		= genphy_c45_aneg_done,
 		.config_init		= mv88q222x_config_init,
 		.read_status		= mv88q2xxx_read_status,
-		.soft_reset		= mv88q222x_soft_reset,
+		.soft_reset		= mv88q2xxx_soft_reset,
 		.config_intr		= mv88q2xxx_config_intr,
 		.handle_interrupt	= mv88q2xxx_handle_interrupt,
 		.set_loopback		= genphy_c45_loopback,
-- 
2.46.2


