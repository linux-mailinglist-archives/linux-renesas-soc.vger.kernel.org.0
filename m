Return-Path: <linux-renesas-soc+bounces-8813-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A7B96F59D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDF12B20DAD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 13:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFCBA1CF289;
	Fri,  6 Sep 2024 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Ggz5DPFf";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FWIZlAzh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh6-smtp.messagingengine.com (fhigh6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD9A1CE6FF;
	Fri,  6 Sep 2024 13:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630036; cv=none; b=ljGxChds4FXLsXZtcN7gd1ou1bpr1e2LWshw6HiKDcC9eW0JCsfQK28SraU9/ZPPxYjTgt78SnKrHmjrb0680lpF24FGa6Ls8BN51t7iipk4cDek78asuSZpftO/cuDZ2f2ReEwH2BRKE/+lMbB0QTsb5BGrBU10xXLtRxVO0cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630036; c=relaxed/simple;
	bh=WENUCUsOv4SBUXx4InO4cxPLfb2dIVYnv9Rr4pUSS/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COcStSs08rKeNTGywunBNrr3XIL/rxOiC+w37r+5gm0wKxPOVazrIW3BbS82C1YeF8SV1NtX6WraJYISJIe7POFcaZ5O21IZ3XSZsiD4KrvHhnDz5CN6wdGycTk8L1lQB3EC+5RzcVjNNeYlxdlVJx/zeHwrMszaDBiOHb60XzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Ggz5DPFf; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FWIZlAzh; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E25441140214;
	Fri,  6 Sep 2024 09:40:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 06 Sep 2024 09:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725630033;
	 x=1725716433; bh=XE7OiKtXXyYqXfuW6/RdUdABlf9okxd8+Nlg4WboFIM=; b=
	Ggz5DPFf3m+BBLHPxAbFIAd5lKgZZCK84sryjhL8ClnDX/In3GN/ZQzTz9+HmnP0
	+tEch8wJQdMT4YRmovprVgkfcxBABi1gm9l+b3MqrcqXlRlL9lCUnaQTH70Lf0vf
	c8DDnm7F683v97Wx8AiIQMI2YUCRdljW53+0Ztmdzw7q59NBK8VNQfa9KeBR4DZJ
	9Skknr+CWtFgXBysIpAkyvUrSPdOJNkWPISx1qtlmqVSeaU358NEUMjXvym4tKBD
	Isz+bCIz9Iy9x8A9eE/7gbxFuoMaL1zbzJCNBhUtw3jyvy6v+zeguwyF/D5+EUkc
	QXYGQ5jwA/+pWVeyFXxavg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725630033; x=
	1725716433; bh=XE7OiKtXXyYqXfuW6/RdUdABlf9okxd8+Nlg4WboFIM=; b=F
	WIZlAzhKKMZOXNln0YzMvNPpN9TO7XNJJgP1bPWHGqy/wnPwwD4cxpHT6sVPKzNM
	P25Xmb9Fs6OVOUEFbvXMZT5TJh4iIyGhRrcCBP744A2UTmQYEwhr/6vDIDtRcekB
	tdH3l4lU0dzlptNjccj6surLlZP5SzMw1pa5YcCAfWZh6MSDPtBl0YTykFQPLcvt
	6RARtsGxcH60B6QrOKaXxpW2u1STS/22Zde+FptJ6HXmWDaPm5JLimbsRf6jRIZr
	4NWsaH/1PMZ2mdu9hP4ThcZRiAuVxQePNiSw1+c0VuApSpdEe029EA0QlDK+q/jd
	F1sOiZV4bMY77kmPnYM8Q==
X-ME-Sender: <xms:UQbbZj7_C4jrvEQ7l0RlK3FPupE-9aQCmgcgymGWk81GuYRuWkFUug>
    <xme:UQbbZo59iw1zDA6E7NRv3QYwbacbH_G7keXsJQpNTmhO9NSahiNySbBulxs46qIgM
    0o4GysRBrVgDRPr6Wo>
X-ME-Received: <xmr:UQbbZqdhevFHtJWgauq3sebygWsL2-D14reA1k-M9vXM5iASkXZkceWrJXGpgg6Gi2b8JkANzU9B65rrW7avxhpGcQ>
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
X-ME-Proxy: <xmx:UQbbZkIKr-Ewex4islFXecTgMvftVfigy8NHfzy4_-4qN56iOTog2A>
    <xmx:UQbbZnJu2kdc5P0aEFGHZlN57yzrFYA6rjYEtXXGbAUSfunMx-d6vw>
    <xmx:UQbbZtwOOgVbxEmMkaYG5gP1EbipyEJUzsLGEyL42vRDOFylfFKRKQ>
    <xmx:UQbbZjKNf1Dcv-bojvB04oUs8RxopUS8iWZRGBJmVVyUiGTgU12a8g>
    <xmx:UQbbZmZI-2e45ppzAQxAbnwde0hsYPeAw2Zd3AfsxXwGNzsT_XazHI4_>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 09:40:33 -0400 (EDT)
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
Subject: [net-next 2/3] net: phy: marvell-88q2xxx: Make register writer function generic
Date: Fri,  6 Sep 2024 15:39:50 +0200
Message-ID: <20240906133951.3433788-3-niklas.soderlund+renesas@ragnatech.se>
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

In preparation to adding auto negotiation support to mv88q2110 move and
rename the helper function used to write an array of register values to
the PHY.

Just as for mv88q2220 devices this helper will be needed to for the
initial configuration of the mv88q2110 to support auto negotiation.

The function is moved verbatim, there is no change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/phy/marvell-88q2xxx.c | 40 +++++++++++++++----------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index 850beb4b1722..31f8c976e387 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -174,6 +174,21 @@ static const struct mmd_val mv88q222x_revb1_revb2_init_seq1[] = {
 	{ MDIO_MMD_PCS, 0xfe11, 0x1105 },
 };
 
+static int mv88q2xxx_write_mmd_vals(struct phy_device *phydev,
+				    const struct mmd_val *vals, size_t len)
+{
+	int ret;
+
+	for (; len; vals++, len--) {
+		ret = phy_write_mmd(phydev, vals->devad, vals->regnum,
+				    vals->val);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int mv88q2xxx_soft_reset(struct phy_device *phydev)
 {
 	int ret;
@@ -724,33 +739,18 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
 	return mv88q2xxx_hwmon_probe(phydev);
 }
 
-static int mv88q222x_write_mmd_vals(struct phy_device *phydev,
-				    const struct mmd_val *vals, size_t len)
-{
-	int ret;
-
-	for (; len; vals++, len--) {
-		ret = phy_write_mmd(phydev, vals->devad, vals->regnum,
-				    vals->val);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int mv88q222x_revb0_config_init(struct phy_device *phydev)
 {
 	int ret;
 
-	ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb0_init_seq0,
+	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb0_init_seq0,
 				       ARRAY_SIZE(mv88q222x_revb0_init_seq0));
 	if (ret < 0)
 		return ret;
 
 	usleep_range(5000, 10000);
 
-	ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb0_init_seq1,
+	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb0_init_seq1,
 				       ARRAY_SIZE(mv88q222x_revb0_init_seq1));
 	if (ret < 0)
 		return ret;
@@ -764,17 +764,17 @@ static int mv88q222x_revb1_revb2_config_init(struct phy_device *phydev)
 	int ret;
 
 	if (is_rev_b1)
-		ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb1_init_seq0,
+		ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb1_init_seq0,
 					       ARRAY_SIZE(mv88q222x_revb1_init_seq0));
 	else
-		ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb2_init_seq0,
+		ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb2_init_seq0,
 					       ARRAY_SIZE(mv88q222x_revb2_init_seq0));
 	if (ret < 0)
 		return ret;
 
 	usleep_range(3000, 5000);
 
-	ret = mv88q222x_write_mmd_vals(phydev, mv88q222x_revb1_revb2_init_seq1,
+	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q222x_revb1_revb2_init_seq1,
 				       ARRAY_SIZE(mv88q222x_revb1_revb2_init_seq1));
 	if (ret < 0)
 		return ret;
-- 
2.46.0


