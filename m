Return-Path: <linux-renesas-soc+bounces-8808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8D396EFE9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 11:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A7AE28839D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 09:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB231CBEA1;
	Fri,  6 Sep 2024 09:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JiRUsU6O";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qtO9cIzD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D791CBE8B;
	Fri,  6 Sep 2024 09:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725615658; cv=none; b=GwOaLxj/KrUBNdouXOwXwhdtxiTIgXOv+KBfZVxWIshR6rafiUCCOLkOkNt+VtVf2f4J40+/bgN4/T+fAH7f6zaSB5Q1I0ZsKRylu6FImzY59T4Oqy/viNsos7dl/WmMdEx6WjiWdWb+JkeOeGW4pdc2+bBtRovKUrmOP+Av5fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725615658; c=relaxed/simple;
	bh=kLB/Wn6rE+ZqmX3Yfd6fuixjc3CxaBmkdWnUTgQWgQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qExV5J54nuFM0xIdDDRMNqZ51CVtR6i710nvUe9EI3H+jrPP1A0YE13pYwfFKtdWVMGdzo1e9CM+0c5q/SUELlNzNNHRdEDabBMpRI9fU3eYfKwAlPV+2vZwDipdrkPlubOMKx9j6pDWFVKQbHDUwZXRA691/7ZDO3xynFkraMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JiRUsU6O; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qtO9cIzD; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 623E91140350;
	Fri,  6 Sep 2024 05:40:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Fri, 06 Sep 2024 05:40:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725615655;
	 x=1725702055; bh=ykG5dYqIHxzf95CtT5qtRbEJ/JTemLDU7J2+tcjYA9I=; b=
	JiRUsU6OyNGaAL1Tfl+sv7qaTVJHNE016qSjH2OCl+it8kXG+abhd1ln6798UVur
	IChKE9ct+WRkf+p3+tvjx7PMD7HNZBfPW4lvoA6RcjlC3YKvd3EnkZagYme92TYT
	p1HQXgeOH9ZtjRFOJMjUkH20h/L4yiM96ijRvmMP5OWPvX3V0VlfLEhRFCAobKIb
	XM+gHCn3I1Bq7QS9nfLdfrxalAk5eroN8HrwJ9B8PcOykiiJnmuuhHEiqmu/uHRj
	U9UmcbzBuaiaP9Tabd4FsADoNqEU+eUUk2uPzIqxsjvzyLS9M45Tr2qaDx7hM37y
	oPpDKNXJM9EopAcO7MS5OQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725615655; x=
	1725702055; bh=ykG5dYqIHxzf95CtT5qtRbEJ/JTemLDU7J2+tcjYA9I=; b=q
	tO9cIzDOPUqdyjslizA+Hi5wQxpLU6fJXhi8bL9IpWmIoeLpyP04Q8MAzZVbyOfI
	bq10SgpN3RmCCY1OSofZrLNgoZ9+wOFjg241MtKyjknN5kvxAypbT7epvC8VBX5w
	H0YB9zkc+l6/9UXa24gIMHW3OAV0AMb7P+E9YdcOPb/lEgHwnd08c5eT/xmlMFpd
	WtIo2/GadpVHw70/thOyN0BsBzj/FJXUACo3qrwNUHE0kMXEfgkqepVcBH5SROvY
	y/HbP6OKW2jZM7zL5vzb6xOuEgsFjcXtLeTKpbto/eICtHuIKPRDl/O0Fs1+juDe
	osFp5kWsC4J/zvke83RmQ==
X-ME-Sender: <xms:J87aZrR4mYOVdJ1V6LWCcizQYOIarif0kl6IDRxwZBU685_QB0SVsg>
    <xme:J87aZsw4sJBDSofi_wpWfVrGQOx1iv_T97bZFmJFRiIYlWTsZyYUaaOgVk68149oT
    qL49tbMBX5RWl3LR14>
X-ME-Received: <xmr:J87aZg3PfykkX7vdpVOi-CEHVK45hRGIfvIWLtjr8naOP7CUzPgIK6_dMaFVPPwU7dCljQQZYSWJDyIoIrlnVn5LrA>
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
X-ME-Proxy: <xmx:J87aZrBCUOodN49hSdpIdUQrRuaIJE3mFhmSTZXvkdbnvKcL9alVUA>
    <xmx:J87aZkhJmjYgOPEJluZOqeJeiOF81Z-cli6uW3Edduawy8WoKu_1vA>
    <xmx:J87aZvp_zlz5pUG9fPai62MnMztxd7o4n8IGLgaJz1B5bY14scJNyA>
    <xmx:J87aZviq_EP5Q2Ipt0VTy4MNCXl_pyJS23FqJ24LOTTuiwyGyus-HQ>
    <xmx:J87aZjqFTCn8FWnMwMtYIH_wWv3W4GiYcgaflyaudLNvrfShzwjBDsMS>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 05:40:54 -0400 (EDT)
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
Subject: [net-next 1/2] net: phy: Expose the direct mdiobus access functions
Date: Fri,  6 Sep 2024 11:39:54 +0200
Message-ID: <20240906093955.3083245-2-niklas.soderlund+renesas@ragnatech.se>
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

Expose the direct mdiobus read and write functions. These will be needed
to refactor the SIOCGMIIREG and SIOCSMIIREG IOCTLs to fallback to
indirect C45 access if needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/phy/phy-core.c | 10 ++++++----
 include/linux/phy.h        | 12 ++++++++++++
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 1f98b6a96c15..2845294053eb 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -542,8 +542,8 @@ static void mmd_phy_indirect(struct mii_bus *bus, int phy_addr, int devad,
 			devad | MII_MMD_CTRL_NOINCR);
 }
 
-static int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
-			int devad, u32 regnum)
+int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
+		 int devad, u32 regnum)
 {
 	if (is_c45)
 		return __mdiobus_c45_read(bus, phy_addr, devad, regnum);
@@ -552,9 +552,10 @@ static int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45,
 	/* Read the content of the MMD's selected register */
 	return __mdiobus_read(bus, phy_addr, MII_MMD_DATA);
 }
+EXPORT_SYMBOL(mmd_phy_read);
 
-static int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
-			 int devad, u32 regnum, u16 val)
+int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
+		  int devad, u32 regnum, u16 val)
 {
 	if (is_c45)
 		return __mdiobus_c45_write(bus, phy_addr, devad, regnum, val);
@@ -563,6 +564,7 @@ static int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
 	/* Write the data into MMD's selected register */
 	return __mdiobus_write(bus, phy_addr, MII_MMD_DATA, val);
 }
+EXPORT_SYMBOL(mmd_phy_write);
 
 /**
  * __phy_read_mmd - Convenience function for reading a register
diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..10af3e3711fa 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1402,6 +1402,18 @@ int phy_read_mmd(struct phy_device *phydev, int devad, u32 regnum);
 	__ret; \
 })
 
+/*
+ * mmd_phy_read - Convenience function for direct mdiobus read.
+ */
+int mmd_phy_read(struct mii_bus *bus, int phy_addr, bool is_c45, int devad,
+		 u32 regnum);
+
+/*
+ * mmd_phy_write - Convenience function for direct mdiobus write.
+ */
+int mmd_phy_write(struct mii_bus *bus, int phy_addr, bool is_c45,
+		  int devad, u32 regnum, u16 val);
+
 /*
  * __phy_read_mmd - Convenience function for reading a register
  * from an MMD on a given PHY.
-- 
2.46.0


