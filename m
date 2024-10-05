Return-Path: <linux-renesas-soc+bounces-9490-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1309D99166D
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 13:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 377D31C220F3
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 11:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C737614C59C;
	Sat,  5 Oct 2024 11:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lcEufPjW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W96fgeXX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2714C5B0;
	Sat,  5 Oct 2024 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728127507; cv=none; b=hU4W8/6LXDs1zWa9x27qd7H9JIZbmF2pcAFewl3IzfDwIMlqwSp8/QNXtcJzV7griz+9Xg6FI7VmOxacuY4+Trw71gUqFazJruyoFi032goM4yKzkz7UJz3/2zTqLGitFX0NCjlJ4WEvnyvpFxOWXb2xiJTO4qgEOd3qLtcg2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728127507; c=relaxed/simple;
	bh=SVvpERmt7MkIl8JqIb62JB7KcvKr7jXIM4HI07vMmIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Irx0hDNQtdz8pNTGdg3hFBDS2renGJZBBuvAFRHn2oJ9aHTuFlZwjPLVGJjRTBGc1kNzrCWlyO0e4L5sgy0eN0EuBFKTwWzvHyciXYh7sq+QLgLR+IsFIIeLwS1K5A0hsxuu4Rxrq4Pv2wLPfvaS5tQ2VsvVykfNtB7sVGDN6Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lcEufPjW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W96fgeXX; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfout.phl.internal (Postfix) with ESMTP id C0F241380777;
	Sat,  5 Oct 2024 07:25:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Sat, 05 Oct 2024 07:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728127504;
	 x=1728213904; bh=DQpsluBHTr7pCSHv7TEo8nhJulmwbrfe1EGzJvHHUqU=; b=
	lcEufPjWPkPrwnj4W4pS9QbnSVyIakewPKkyvATICxGr31gI/4lOPYZxNnOINUwm
	ve6P6GgnZGDQyADmq15XX9kUuu75E2jG/dWvO5/b17Cogwxqw51aoLMH4gKj2N+r
	4WrZgLijCj+Vu7E7rzWrbG8MCmuhzBdLcl4/fPTuIz/IscXY4rCDgjb9IVwQma6Z
	gwhCY02zkJaR2ptsV6L1URdZi+8niQVHdj2iPWx+zwXd181JnLZxhhnZgZlgEJ0Q
	x6PjmXt/ZYc+VZ+E1YDOFHUWzhly9Jo3CLiIsfsaKfCzpWyOaSfHHnbMqXpl67jp
	rKK6FlutX2BLnbCDmiH1FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728127504; x=
	1728213904; bh=DQpsluBHTr7pCSHv7TEo8nhJulmwbrfe1EGzJvHHUqU=; b=W
	96fgeXXYmCRoxpazI8PhFLwN8f4k/rSTVvgVFdL0+ApvpZSGADmchds7ioqiNVFE
	9HBttWqWP7sr5Qvi1C/sneEDxj7AY/OuceE74X9/Za0UZJ48K1+/Uz9nAEClxwrm
	Iz12yvv1kDv806besxrbFIjL+XZaG8q1ThDFvd6RS1QgxiensALtoP8BRR5fdmU8
	xDI47O6/1n7aLiZ/ljaGjoThUgdbiosTgOJSPxMzp64b6FBK27R9YNdTVYJFHJd/
	u+JZ8QwisdRbnjBGIGH+D/RA/bAQ9nF2ESsX99KcymNu036nON6hiEV0cEyi326K
	MFUjl5f9FH6yX0fDf6Flg==
X-ME-Sender: <xms:ECIBZ6Q28tSb2QXEcfFkBeKBdLVrtOVsQCZv0Hm3ZWgXcAabhTWgjA>
    <xme:ECIBZ_y3Xic0MbCio3-YH2m_gqyHA2uit7u_3aBky08twkZ3z_0jMH8X_bQLTmqA9
    IALPlYUZyL4kZrcILI>
X-ME-Received: <xmr:ECIBZ30WUfhs8KzvHYRXiQ-MmDmRaBOX9O_PpXIGBqsVi44tGRyDLLp1gRvuyhLSddFM8ULjPR50XY6ZH7K5GnJrNQ>
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
X-ME-Proxy: <xmx:ECIBZ2BN2vp6z0zBrIl-eBVDauaarRB3fKbLNxy_6uw99oVcdiVl2A>
    <xmx:ECIBZzj2OsGFSaq_7su5hzw7IgVATMqTnVcx14L7RjJASRspSOJzKA>
    <xmx:ECIBZyrC10vE2YalXQg3lcauSA7-J2bGTthsTjZ1dW9qbRtL-A3GHA>
    <xmx:ECIBZ2j5pADTR0N8oN6MwB6d_0oBMl7K_zI6HbC6HExCu9f6XFRfPg>
    <xmx:ECIBZ-SaFmOS2fp32EcVr3Ec7dyQvS6Xm5NuKSIv7w2O8R3XnpfNZedK>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 07:25:04 -0400 (EDT)
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
Subject: [net-next,v2 3/3] net: phy: marvell-88q2xxx: Enable auto negotiation for mv88q2110
Date: Sat,  5 Oct 2024 13:24:12 +0200
Message-ID: <20241005112412.544360-4-niklas.soderlund+renesas@ragnatech.se>
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

The initial marvell-88q2xxx driver only supported the Marvell 88Q2110
PHY without auto negotiation support. The reason documented states that
the provided initialization sequence did not to work. Now a method to
enable auto negotiation have been found by comparing the initialization
of other supported devices and an out-of-tree PHY driver.

Perform the minimal needed initialization of the PHY to get auto
negotiation working and remove the limitation that disables the auto
negotiation feature for the mv88q2110 device.

With this change a 1000Mbps full duplex link is able to be negotiated
between two mv88q2110 and the link works perfectly. The other side also
reflects the manually configure settings of the master device.

    # ethtool eth0
    Settings for eth0:
            Supported ports: [  ]
            Supported link modes:   100baseT1/Full
                                    1000baseT1/Full
            Supported pause frame use: Symmetric Receive-only
            Supports auto-negotiation: Yes
            Supported FEC modes: Not reported
            Advertised link modes:  100baseT1/Full
                                    1000baseT1/Full
            Advertised pause frame use: No
            Advertised auto-negotiation: Yes
            Advertised FEC modes: Not reported
            Link partner advertised link modes:  100baseT1/Full
                                                 1000baseT1/Full
            Link partner advertised pause frame use: No
            Link partner advertised auto-negotiation: Yes
            Link partner advertised FEC modes: Not reported
            Speed: 1000Mb/s
            Duplex: Full
            Auto-negotiation: on
            master-slave cfg: preferred master
            master-slave status: slave
            Port: Twisted Pair
            PHYAD: 0
            Transceiver: external
            MDI-X: Unknown
            Link detected: yes
            SQI: 15/15

Before this change I was not able to manually configure 1000Mbps link,
only a 100Mpps link so this change providers an improvement in
performance for this device.

    [  5] local 10.1.0.2 port 5201 connected to 10.1.0.1 port 38346
    [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
    [  5]   0.00-1.00   sec  96.8 MBytes   812 Mbits/sec    0    469 KBytes
    [  5]   1.00-2.00   sec  94.3 MBytes   791 Mbits/sec    0    469 KBytes
    [  5]   2.00-3.00   sec  96.1 MBytes   806 Mbits/sec    0    469 KBytes
    [  5]   3.00-4.00   sec  98.3 MBytes   825 Mbits/sec    0    469 KBytes
    [  5]   4.00-5.00   sec  98.4 MBytes   825 Mbits/sec    0    469 KBytes
    [  5]   5.00-6.00   sec  98.4 MBytes   826 Mbits/sec    0    469 KBytes
    [  5]   6.00-7.00   sec  98.9 MBytes   830 Mbits/sec    0    469 KBytes
    [  5]   7.00-8.00   sec  91.7 MBytes   769 Mbits/sec    0    469 KBytes
    [  5]   8.00-9.00   sec  99.4 MBytes   834 Mbits/sec    0    747 KBytes
    [  5]   9.00-10.00  sec   101 MBytes   851 Mbits/sec    0    747 KBytes

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Tested-by: Stefan Eichenberger <eichest@gmail.com>
---
 drivers/net/phy/marvell-88q2xxx.c | 46 ++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index 31f8c976e387..5107f58338af 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -101,6 +101,22 @@ struct mmd_val {
 	u16 val;
 };
 
+static const struct mmd_val mv88q2110_init_seq0[] = {
+	{ MDIO_MMD_PCS, 0xffe4, 0x07b5 },
+	{ MDIO_MMD_PCS, 0xffe4, 0x06b6 },
+};
+
+static const struct mmd_val mv88q2110_init_seq1[] = {
+	{ MDIO_MMD_PCS, 0xffde, 0x402f },
+	{ MDIO_MMD_PCS, 0xfe34, 0x4040 },
+	{ MDIO_MMD_PCS, 0xfe2a, 0x3c1d },
+	{ MDIO_MMD_PCS, 0xfe34, 0x0040 },
+	{ MDIO_MMD_AN, 0x8032, 0x0064 },
+	{ MDIO_MMD_AN, 0x8031, 0x0a01 },
+	{ MDIO_MMD_AN, 0x8031, 0x0c01 },
+	{ MDIO_MMD_PCS, 0xffdb, 0x0010 },
+};
+
 static const struct mmd_val mv88q222x_revb0_init_seq0[] = {
 	{ MDIO_MMD_PCS, 0x8033, 0x6801 },
 	{ MDIO_MMD_AN, MDIO_AN_T1_CTRL, 0x0 },
@@ -424,15 +440,6 @@ static int mv88q2xxx_get_features(struct phy_device *phydev)
 	if (ret)
 		return ret;
 
-	/* The PHY signalizes it supports autonegotiation. Unfortunately, so
-	 * far it was not possible to get a link even when following the init
-	 * sequence provided by Marvell. Disable it for now until a proper
-	 * workaround is found or a new PHY revision is released.
-	 */
-	if (phydev->drv->phy_id == MARVELL_PHY_ID_88Q2110)
-		linkmode_clear_bit(ETHTOOL_LINK_MODE_Autoneg_BIT,
-				   phydev->supported);
-
 	return 0;
 }
 
@@ -739,6 +746,25 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
 	return mv88q2xxx_hwmon_probe(phydev);
 }
 
+static int mv88q2110_config_init(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q2110_init_seq0,
+				       ARRAY_SIZE(mv88q2110_init_seq0));
+	if (ret < 0)
+		return ret;
+
+	usleep_range(5000, 10000);
+
+	ret = mv88q2xxx_write_mmd_vals(phydev, mv88q2110_init_seq1,
+				       ARRAY_SIZE(mv88q2110_init_seq1));
+	if (ret < 0)
+		return ret;
+
+	return mv88q2xxx_config_init(phydev);
+}
+
 static int mv88q222x_revb0_config_init(struct phy_device *phydev)
 {
 	int ret;
@@ -880,7 +906,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 		.name			= "mv88q2110",
 		.get_features		= mv88q2xxx_get_features,
 		.config_aneg		= mv88q2xxx_config_aneg,
-		.config_init		= mv88q2xxx_config_init,
+		.config_init		= mv88q2110_config_init,
 		.read_status		= mv88q2xxx_read_status,
 		.soft_reset		= mv88q2xxx_soft_reset,
 		.set_loopback		= genphy_c45_loopback,
-- 
2.46.2


