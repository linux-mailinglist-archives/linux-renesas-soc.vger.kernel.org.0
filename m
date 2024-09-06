Return-Path: <linux-renesas-soc+bounces-8814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F6196F59E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 15:40:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40B6A1F2543E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Sep 2024 13:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98B91CF5FF;
	Fri,  6 Sep 2024 13:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="qKQsxfVE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EjN2KwmQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1841CF2BC;
	Fri,  6 Sep 2024 13:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725630039; cv=none; b=mXlzFWyHMEfgCbXb+p4d9svT66K088MvwqgzOindSAWxEshgo9ie66ZO8xR4AHy3hVP9/7PIQXxgxWD1WKF+dT8qIISaCWUack83cUkSzoXqddgMgbiUeBOPjxy7ts9lWFJSra7qu+gjY3b+yOomdi+tTBUmH0V9X9jPW+gN1E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725630039; c=relaxed/simple;
	bh=poLIc/JGze3v0Qw99IeHz3Q45Ew076I0AvFjqHNckBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kT76HBxUG5z47gZJ5SX9Y/Pdv/eah+pakL4vulN7jOUsQMw8eBaiUhQk6E9fc17sm5ME/DfrZXj+7VU+Ac1Cf9p//rTRYNd3r8tHSbr8oCAoljCxLPjLLHWyPsC1Y8RNPplj9AbsJIpZMYWy24UwePW5emOmOgkdaletbLvi28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=qKQsxfVE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EjN2KwmQ; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id F19831380294;
	Fri,  6 Sep 2024 09:40:35 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Fri, 06 Sep 2024 09:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725630035;
	 x=1725716435; bh=hSHakV4+ssdUCjUuOrsnbWqn675rtFZNx6dWWjov1CA=; b=
	qKQsxfVEF97gFrvi3K8GGqoJHxXePIlMeUqsMEzTeLAaRJw9qtkhGph9g/kn1q5o
	MciXwCGD4FSj4ZHrTWZ8tQd2Ithbs9/30+qhKKsfO4fuaht73uySF5R1sF2oy78A
	lr8mPzyd0Bg6yvN6Ky3xHWzsPuI7xDe/ekIp2YlYc37ckHvv6ieeIuPeyVmEmpHs
	vQq1eNloA3M0/akf05T9YjkJUb2nQpomoHWW5/GDUGfHGDFw5o5PkpYhBPNzUuu+
	M+EUhpBjcxCnQPdEvU3hxuU1H0sly+M17PAHUFabhV4M2eXvhnWaw7I8VVq38aLu
	b/jb9jQ74KQF6XC9CBBOpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725630035; x=
	1725716435; bh=hSHakV4+ssdUCjUuOrsnbWqn675rtFZNx6dWWjov1CA=; b=E
	jN2KwmQvcDtya5z5GA0BIjdVE/9HaSAsK3v0XM0ciTV2disenJjz/QYQUvj97uCb
	6iSmFsV/g8gRlO8xKg4XzReMmVM5ta1G1yAiLSMv/k9FLpjaFqbD3Mt+eqe3VuAT
	ZfAQRx8HbghAGYwODb90onDbsYSPComcTRT2XtNNhj9oXrzX+1Yhe9tKqppzsLYQ
	+zQzYwxjeWWJMYY8QoaZOclMjo7obSRpa4Js9SnIMIQXQkYH8ruXFlKAHsivQ3HD
	T8NCobOHsQoiE7/lCmJoy9G0xd46xSehLpboNhD3Z06E3gfb5VnyFXuk/yC/iVdT
	0IU1eTEDN2YWzjeSpB8og==
X-ME-Sender: <xms:UwbbZkjLQLB_EfqRnqVZA0uAOdjK-OShAAJXXAvGMO4g6T-Q33QjdA>
    <xme:UwbbZtBZj2BTi5L0eFLSjsmJxIwvop9J3JirIrFLj7ETgMlqwtYI3hXQurFOcZrxG
    _PYp5BzKakHG3YeC3I>
X-ME-Received: <xmr:UwbbZsF12gpFDvcbFgV1LsZMDhhiirsPTu_U2ibUxizlmgR_Fs0K2Olcpx04W-iO4A-ivthL78Y-ACf_rhyOcnOB7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiuddgieekucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:UwbbZlT1nhWkm4p9L2IUJf3Pqf0H_qcNVI2em5LWHT7dPcVRWzthyw>
    <xmx:UwbbZhyxy0J9QlxjoFyqwMYvep1gYBIHzLPtFrAMuCp9-nNmt0pjIA>
    <xmx:UwbbZj4tkID5GJD8zcxsmgz7olb0CeHlV-yES028IjSbVziyuKDWmA>
    <xmx:UwbbZuyIzjH-ytuU7xdHI9-7jNZshqoO6WfZ4yYZOcM0OG1tGfR4gw>
    <xmx:UwbbZhiDDJwg63HRnK_aRY2tDRCDU2hZgQ_5wSOwYTNonRLPK96dczkF>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Sep 2024 09:40:35 -0400 (EDT)
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
Subject: [net-next 3/3] net: phy: marvell-88q2xxx: Enable auto negotiation for mv88q2110
Date: Fri,  6 Sep 2024 15:39:51 +0200
Message-ID: <20240906133951.3433788-4-niklas.soderlund+renesas@ragnatech.se>
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
2.46.0


