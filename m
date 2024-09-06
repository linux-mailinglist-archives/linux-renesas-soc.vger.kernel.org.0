Return-Path: <linux-renesas-soc+bounces-8809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE896EFEA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 11:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A6E11F261A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3F51CDFA4;
	Fri,  6 Sep 2024 09:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="AlGUVMie";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U3zXzSlr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459991CBEAD;
	Fri,  6 Sep 2024 09:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615660; cv=none; b=bSSBYAZ7r1mgSZMXERpTBSQplnSr4AJjYYV1nOA408cX2vvYJRaBmzl5iTIuwavM4pgpZQEx3EiOl5sqaxdaU86QTsiOxUOS/zA4Z2JDVAjBSUkfpLf7Xh6tHkBcK+wmKDSRpgjmko3fJZrNH8gwL2leOoIdSMWT4L7SFEAjPXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615660; c=relaxed/simple;
	bh=UcktmCft6cqYHncEMNstLmr5ElEBkpJXSnXHPCL0j2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cYnG3V9gD7r1yJDxLHl8+t/xNy6Pq+BfAIjyA5NwVdIz56vlhF8BPoZsf1SiXuxq5ec6KHU/HbOVveOjhivbW97suJSGKt70CcOPew6N9G6EqThC4+mZcY337XISXPaacn2YPB1ZfD0e2Qxtb8MOGevxz4Z/5Zv2Na4BIqoCK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=AlGUVMie; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=U3zXzSlr; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 51A8A1140358;
	Fri,  6 Sep 2024 05:40:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 06 Sep 2024 05:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725615657;
	 x=1725702057; bh=toIFJlP41E6goXLblveoKyuDvLh5QaLAlC3413pszJY=; b=
	AlGUVMiec+ATndYlBpjaesT41lHcf75oIYpbgXxnKtCbZFsxOeFE1vn+SPtbB4+4
	WKnR34CGyWsg7u9Ze/cFPskZnWmHC7XBP8NPpD94x6JI6FdgTgkVa//To4d8ISe/
	+vpr4hf0U/umaI8JMp6U5ktKdZm35hU5DnzSFSG33BZZj3hW69zZZDqrBdZ7v8mI
	uQegliLNWTpLbtb8KczdGaGi326S2qp70/ZgT7JsG/6vy2959+e4/QLfQ+uCa8dI
	fTuOnMReLXk5js4qtg53zPRnDxIYpV60d1TZI808QjK74aMQS8bnnvEm5emUkXCM
	aqyXdNOG6hoFep3WAvQPAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725615657; x=
	1725702057; bh=toIFJlP41E6goXLblveoKyuDvLh5QaLAlC3413pszJY=; b=U
	3zXzSlrMoCG4CbEdd8j5n1u5o5IlHlg1xtS6izPrIbk+VqO8iz53z95UF2ZM2MAG
	XVSI7RV470S8TJcxV5E3be0eOB4w/wO34e/EOu1G3y98nWarwMCPwACcWXTaqZhM
	y6aXzoARyqeaZBnh2s3um4VKzDklm50T+OVDZkit/lEQcqYzw1NA0Kj6L8GcEL5a
	QKxLJIPqP259yJuJgJ1r1rHFDM2EOpn++4ZNcaJLF45xObcSrCfpeeOqqogu5l+Y
	A7r55/ZcZbkehpW9oexj7LuTJ+xBo14sXQ009WNlprRr0ICfrKYVB8IWuInegStq
	PaIUoNF2KtNdzsbwFKukg==
X-ME-Sender: <xms:Kc7aZqOJFa49SpmztvyJyRASpDOCkZz9E4iQNzLT72jJ4Ua8XekZjQ>
    <xme:Kc7aZo8oDv0xoLJX1_xiZZhEzV_So-HeTaV7GS_gzH2f5OamwwK8MFS731XT1-Hle
    ocAMX3UxcTW3OztXZc>
X-ME-Received: <xmr:Kc7aZhQXrNQvEkILGLKdIDJ9zGAjGdxPo4QLblWoBW-zAz6LatRYwN87ggKd6lV8bScpE5rfp3t9OGhY51Mnz5nY3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehiefgueevuedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffle
    efgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifsehl
    uhhnnhdrtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpd
    hrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthho
    pegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivg
    htsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihoh
    hshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphht
    thhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Kc7aZqs3VQ1p9Nw1VCnMgfTPNPLAEXy37BT6bhKcByh0xsK2dzqasw>
    <xmx:Kc7aZicaNBV2fbpHL02RQxYtcFsouHxlvbwiCyRGR2HxhsuwmKSGYQ>
    <xmx:Kc7aZu3IiEX8ZVnJCqBIxcC4o5IXN8JHpOF7ZHjmXYTOx36AHxh0zA>
    <xmx:Kc7aZm8M3LJy1ceMLoOZ87hkC70teIdZlSEq9_FUeWTOaxQA9j6rDQ>
    <xmx:Kc7aZu3wRuOoA1dt0sNqmtHyA68nsaQDhm89auaKDetaQLKHggN0TvtY>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 05:40:56 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 2/2] net: phy: Fallback to C22 access if needed in phy_mii_ioctl()
Date: Fri,  6 Sep 2024 11:39:55 +0200
Message-ID: <20240906093955.3083245-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240906093955.3083245-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If a C45 only PHY is attached to a driver that only knows how to talk
C22 phylib will fallback and use indirect access. This frees the driver
from having to implement this themself.

The IOCTL implementation for SIOCGMIIREG and SIOCSMIIREG do not use
these convenience functions and instead fail if a C45 PHY is used
together with a driver that only knows how to speak C22.

Fix this by using the two convince functions that knows when to fallback
to indirect access to read/write to the MDIO bus when needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/phy/phy.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index 4f3e742907cb..89f52bb123aa 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -342,9 +342,12 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
 			prtad = mdio_phy_id_prtad(mii_data->phy_id);
 			devad = mdio_phy_id_devad(mii_data->phy_id);
-			ret = mdiobus_c45_read(phydev->mdio.bus, prtad, devad,
-					       mii_data->reg_num);
 
+			mutex_lock(&phydev->mdio.bus->mdio_lock);
+			ret = mmd_phy_read(phydev->mdio.bus, prtad,
+					   phydev->is_c45, devad,
+					   mii_data->reg_num);
+			mutex_unlock(&phydev->mdio.bus->mdio_lock);
 		} else {
 			ret = mdiobus_read(phydev->mdio.bus, mii_data->phy_id,
 					   mii_data->reg_num);
@@ -403,11 +406,14 @@ int phy_mii_ioctl(struct phy_device *phydev, struct ifreq *ifr, int cmd)
 			}
 		}
 
-		if (mdio_phy_id_is_c45(mii_data->phy_id))
-			mdiobus_c45_write(phydev->mdio.bus, prtad, devad,
-					  mii_data->reg_num, val);
-		else
+		if (mdio_phy_id_is_c45(mii_data->phy_id)) {
+			mutex_lock(&phydev->mdio.bus->mdio_lock);
+			mmd_phy_write(phydev->mdio.bus, prtad, phydev->is_c45,
+				      devad, mii_data->reg_num, val);
+			mutex_unlock(&phydev->mdio.bus->mdio_lock);
+		} else {
 			mdiobus_write(phydev->mdio.bus, prtad, devad, val);
+		}
 
 		if (prtad == phydev->mdio.addr &&
 		    devad == MII_BMCR &&
-- 
2.46.0


