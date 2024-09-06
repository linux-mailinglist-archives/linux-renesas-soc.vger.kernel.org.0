Return-Path: <linux-renesas-soc+bounces-8812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FC2896F599
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37177285D14
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 13:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7046E1CEE9D;
	Fri,  6 Sep 2024 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QI1Xjskp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OnxKsVlE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BA51CEAD6;
	Fri,  6 Sep 2024 13:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630036; cv=none; b=Jk/xgig3ZniVlCW0Hqs9VSvg0LIxXxegvSJ8PbF7p8QvCZ/QiKrCnC/yQkbDlWg8NjdF4k2J3iPHq5EN5zDyNzAO155rpTtGd9I7n9PudAz+TKBph334Q/vC6psvg10IrIW+oamnw9Kbv+qmwLjMtzrDJB7En9fn8DKABDCbpyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630036; c=relaxed/simple;
	bh=AQEE5fDspnnTDhrCMn5tJW3pOfRCp5Fmy7jgbd9B7Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EYh0Cvqgns13pr5WMP1pE0RpQsdizkwWP16ikYnTG25NzAJ2nQ3fKXluNMTNakfheBQN/UCrCeFm6LeP2fvWkAJWGepf1inq/mds3LxpSba1hGyDhiwdglxEGrlgugUTLbIOEReMVcL5+wicZSMhoEJeHHCiiXMHeT4zW++gWM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QI1Xjskp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OnxKsVlE; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id C3011138025F;
	Fri,  6 Sep 2024 09:40:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 06 Sep 2024 09:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725630031;
	 x=1725716431; bh=FM0PnGJElLICnGdwe5dojHrZcD64SeT1T/l8yB1nYjo=; b=
	QI1XjskpzgcJPWbUVlzx6edRUlv7FpYHK+Y5+huGQq9AEyq+YjCBm6g+xeiNV0zJ
	mx++m/BVGmIXJ6W+hSKEWK5dNxEcDHIFfEKYM9kTm/E5umXx4jirL/j2UsTO4Tlv
	OFbupQJfm0PcmrIwhmwZOBMbhRjaTbAPHkfpFMzCPh5EZk/CYTMqTAzVpV/Mvg5A
	lHOBKWZPWoJM28Lbjxgdp60yAqDNTfjvCpKBmcL+Qow0CjMmG1hWcysyIUDGMoly
	bP+UysqOuz2lGApn41pCsghPrEGUaFK/wZB8N/X1EbqZJjucMTpoFrHo0ExQPor/
	lz91oeGxXWtzHxS7RRGMTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725630031; x=
	1725716431; bh=FM0PnGJElLICnGdwe5dojHrZcD64SeT1T/l8yB1nYjo=; b=O
	nxKsVlE1YC6pL+vK0Fc9gRcXr+tMcCcT2UhAJN7fLGP9wduAwp32S45buIiHFroS
	D9W98oPJ3WWhFW+2GopLlZ3uKC712qe+bQT/efYr2hoKNJ0Sh+kVeFL4Bpl/u5bC
	ZSy5NLCRtbaJYeMl1BT26X6U20uHBoLvkPB+5p6TWTMjlqi6/nOgGPuXFa1c3svP
	MER84/YpVKhB2sUIQOBf9n6+PUEjL2vnrnoYy0mES68/CS1U3vo8I1gdK+DP1+8W
	D7ADF9fZgtBw0XnSJQq9kJqICCVrr3UrzKm1Z2oAOg2iu1ThIAdfRW5bgc6OIPQk
	U9OjyjNaT4At4IArpbzuA==
X-ME-Sender: <xms:TwbbZog1fHZHe0nWGghXbcLnkJb2i3Sb-tNjnOAkbNPnee6mgX8B6Q>
    <xme:TwbbZhAXUZzNatMQX_ueE6mkhp_GY4YUFyOo_SIuhWNvFt_GZN0hN9-gJSVTxSuxv
    QNR82FtJnC3wdqUKjY>
X-ME-Received: <xmr:TwbbZgGKX4Pz_m27os_s7r7Le12rfmE6_FBTprmevN6JwxlwkP3Yx0H3G2iv7dYxK-Vx9Y_EVqXV9q1yiF7Wdasawg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgieelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:TwbbZpQUeiHywUclKaElUUmMR8T4HzTNBmMpyfpn-K4BldsyHk6Z0w>
    <xmx:TwbbZlx_K3zxCZMGAw1B6wRgXwT-LS-KScKtQdzjyRfDOjr9jimkpA>
    <xmx:TwbbZn5-qKT5PTgfRuHvR6CXPyZLX8754bc4VbiqD003RGoXdDqeVQ>
    <xmx:TwbbZiyhKNDtOKvbJyerHoEcofaLVtCWTiM0WHT6YfjxeV5h4k2gTg>
    <xmx:TwbbZlimTSM4ACs7GmY_pQMGuXzJQa0aS8EceSN8PY1hRcu8hVIFoXY5>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 09:40:31 -0400 (EDT)
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
Subject: [net-next 1/3] net: phy: marvell-88q2xxx: Align soft reset for mv88q2110 and mv88q2220
Date: Fri,  6 Sep 2024 15:39:49 +0200
Message-ID: <20240906133951.3433788-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240906133951.3433788-1-niklas.soderlund+renesas@ragnatech.se>
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
2.46.0


