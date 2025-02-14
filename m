Return-Path: <linux-renesas-soc+bounces-13177-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B519A364F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 18:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88E4B3A8E20
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2025 17:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F71267710;
	Fri, 14 Feb 2025 17:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JUyu6auA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W/xVz4MX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF25267AEF;
	Fri, 14 Feb 2025 17:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739555366; cv=none; b=XFRYbjxj9dAvo009axHIIuJGIOq30I7Ni9TRQMck2WJX/MCqXWmX+y5TQuk6/YAKCCmH/C3/yxw8RVSCNiFHC7NMzMWhCuxFMgZ21toaJbvdm66eFbsrqPKAz+HBy6zCT5yGGE20SsstHA+VffFAc9BvrwJ2KatkXW1uN24svpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739555366; c=relaxed/simple;
	bh=Pf72miJ/dfjyj0t5j+gDGQX/wP+dRD2UHUYGdVnh1Ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Dd6w02Qcj4qM8/SaKROG0WePYEYkRr4kXNIYbu1L/IPQlnX15g456bwMFPbCunJGEDMFZ/JY0ITVhHGQvWbymWFaNTRY+u8rWkO5bWE3sahC4X+9W+H2NJiSAku6sEz0+C1toHhy1ujNu20u/hzJDB97uNzVrGKg2cxghxxqT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JUyu6auA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W/xVz4MX; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 1542C114012C;
	Fri, 14 Feb 2025 12:49:22 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 14 Feb 2025 12:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1739555361; x=1739641761; bh=nC
	fENLOrYad9VE9K3of+L0hMV0XrOsQQeatjsve3BPI=; b=JUyu6auA36ICkPHr6P
	ICwVB84J0khoR5n3J0w5fIOguZ2poE34pX4m51d7fooKIBSTf6B9AwEE7Zht5PJ/
	LdbgHufL6UQJi/v+Xh9vyEUSMAs7VeKGffj79LG05mXKc6fScNcg1q7x3j0cUqOD
	lqeRBlquCeHLT4gbFO5ArkkiZ6pBn7MgX7jtCbgxgEDezOVOQynLwZnCrBvqhZee
	TqGYfV0GmvDLZjyuRZ2IY3l0p+gnRBxJesVNst+y4+lFgoTJjtt0Vkp0/E2cXiZP
	radbJXzxVE/CZ40x4rte/e6HTXE9V68fDY2Z+1T6teKR/5OuP856aL6QknmxNj1/
	ZCfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1739555361; x=1739641761; bh=nCfENLOrYad9VE9K3of+L0hMV0Xr
	OsQQeatjsve3BPI=; b=W/xVz4MXeRelWDrIQWdtXkg0W37jMXSmkl0usXp/N8A9
	7N8v913hFX7eKaVVkKq0NyxT8IK4B6Hk3gYPh7WVd8lvsW4WSPMo1BJQSV30ViKg
	Vty9dv3ZR2lJz5hAqmYqUq9m/Iyb6v52LnvyEhs6gd6HXazW/B07hFyJilCK4I+t
	Db9GIUfPWm7zPsBdK53hfgnfpaxCu01HCvBAhLrLr1Ook21khKNOci0DPma6SQyW
	eRSRX8cFOteVChQbkzwYQgvpsfIJPaIYVBScpJrCtKqEIrsjvwdet4oeBUAvQ/+a
	rdqDMpXPdCRXswtT/b/sJCOXZMWpApGCT/ywx29qMg==
X-ME-Sender: <xms:IIKvZ1Ly1OWUaf5XCVgKD-HVSpTegH7iuy1PC5WeU2GJppwOOqro9g>
    <xme:IIKvZxL17vTOx2rwNQ8Q0fvi9OEGdaIwRgpe1Oxe1XP28rO-Z0bA7RsvXThd5Ru2W
    xI6bau5r1C-IH0i7j4>
X-ME-Received: <xmr:IIKvZ9vc5HmbHozXNETPBplXqeUiBfnb0WdvtegcJIVP0YXxuLz75XSNyV2ZBeQLHyONBxIHCklMyB9NNlH29OryKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehtddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfieslhhu
    nhhnrdgthhdprhgtphhtthhopehhkhgrlhhlfigvihhtudesghhmrghilhdrtghomhdprh
    gtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtohep
    uggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvth
    esghhoohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvghitg
    hhvghsthesghhmrghilhdrtghomhdprhgtphhtthhopeguihhmrgdrfhgvughrrghusehg
    mhgrihhlrdgtohhm
X-ME-Proxy: <xmx:IIKvZ2Y3pk1dN-0TjKc90XZBGfM_Q7dVmJ0a_UxeuETfIV6iXaYrZQ>
    <xmx:IIKvZ8b-1ieeYIc_QAvXvg8UXwMcw6mjXwYbcl2_tWBi24Koyqx1rw>
    <xmx:IIKvZ6D63jL7PE-c2ff8IPc5ekrtnBVLa5a3lu2dzV8s05tS6Mte2A>
    <xmx:IIKvZ6YHOjyRCeYEMBkNk0dEea9UREnMgb4uJ4BUBocwHwC7YMXciQ>
    <xmx:IYKvZ4Q9rxyhkjzMqWmtywDa0Y0tUM8GuhMlsvPQJEPly-VN6BRM74SA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Feb 2025 12:49:20 -0500 (EST)
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
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: phy: marvell-88q2xxx: Init PHY private structure for mv88q211x
Date: Fri, 14 Feb 2025 18:46:50 +0100
Message-ID: <20250214174650.2056949-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When adding LED support for mv88q222x devices the PHY private data
structure was added to the mv88q211x code path, the data structure is
however only allocated during mv88q222x probe. This results in a nullptr
deference for mv88q2110 devices.

	Unable to handle kernel NULL pointer dereference at virtual address 0000000000000001
	Mem abort info:
	  ESR = 0x0000000096000004
	  EC = 0x25: DABT (current EL), IL = 32 bits
	  SET = 0, FnV = 0
	  EA = 0, S1PTW = 0
	  FSC = 0x04: level 0 translation fault
	Data abort info:
	  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
	  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
	  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
	[0000000000000001] user address but active_mm is swapper
	Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
	CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.14.0-rc1-arm64-renesas-00342-ga3783dbf2574 #7
	Hardware name: Renesas White Hawk Single board based on r8a779g2 (DT)
	pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
	pc : mv88q2xxx_config_init+0x28/0x84
	lr : mv88q2110_config_init+0x98/0xb0
	sp : ffff8000823eb9d0
	x29: ffff8000823eb9d0 x28: ffff000440942000 x27: ffff80008144e400
	x26: 0000000000001002 x25: 0000000000000000 x24: 0000000000000000
	x23: 0000000000000009 x22: ffff8000810534f0 x21: ffff800081053550
	x20: 0000000000000000 x19: ffff0004437d6800 x18: 0000000000000018
	x17: 00000000000961c8 x16: ffff0006bef75ec0 x15: 0000000000000001
	x14: 0000000000000001 x13: ffff000440218080 x12: 071c71c71c71c71c
	x11: ffff000440218080 x10: 0000000000001420 x9 : ffff8000823eb770
	x8 : ffff8000823eb650 x7 : ffff8000823eb750 x6 : ffff8000823eb710
	x5 : 0000000000000000 x4 : 0000000000000800 x3 : 0000000000000001
	x2 : 0000000000000000 x1 : 00000000ffffffff x0 : ffff0004437d6800
	Call trace:
	 mv88q2xxx_config_init+0x28/0x84 (P)
	 mv88q2110_config_init+0x98/0xb0
	 phy_init_hw+0x64/0x9c
	 phy_attach_direct+0x118/0x320
	 phy_connect_direct+0x24/0x80
	 of_phy_connect+0x5c/0xa0
	 rtsn_open+0x5bc/0x78c
	 __dev_open+0xf8/0x1fc
	 __dev_change_flags+0x198/0x220
	 dev_change_flags+0x20/0x64
	 ip_auto_config+0x270/0xefc
	 do_one_initcall+0xe4/0x22c
	 kernel_init_freeable+0x2a8/0x308
	 kernel_init+0x20/0x130
	 ret_from_fork+0x10/0x20
	Code: b907e404 f9432814 3100083f 540000e3 (39400680)
	---[ end trace 0000000000000000 ]---
	Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
	SMP: stopping secondary CPUs
	Kernel Offset: disabled
	CPU features: 0x000,00000070,00801250,8200700b
	Memory Limit: none
	---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

Fix this by using a generic probe function for both mv88q211x and
mv88q222x devices that allocates the PHY private data structure, while
only the mv88q222x probes for LED support.

Fixes: a3783dbf2574 ("net: phy: marvell-88q2xxx: Add support for PHY LEDs on 88q2xxx")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/phy/marvell-88q2xxx.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index bad5e7b2357d..4fca9ffc90fe 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -825,13 +825,24 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
 static int mv88q2xxx_probe(struct phy_device *phydev)
 {
 	struct mv88q2xxx_priv *priv;
-	int ret;
 
 	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
 	phydev->priv = priv;
+
+	return 0;
+}
+
+static int mv88q222x_probe(struct phy_device *phydev)
+{
+	int ret;
+
+	ret = mv88q2xxx_probe(phydev);
+	if (ret)
+		return ret;
+
 	ret = mv88q2xxx_leds_probe(phydev);
 	if (ret)
 		return ret;
@@ -1101,6 +1112,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 		.phy_id			= MARVELL_PHY_ID_88Q2110,
 		.phy_id_mask		= MARVELL_PHY_ID_MASK,
 		.name			= "mv88q2110",
+		.probe			= mv88q2xxx_probe,
 		.get_features		= mv88q2xxx_get_features,
 		.config_aneg		= mv88q2xxx_config_aneg,
 		.config_init		= mv88q2110_config_init,
@@ -1115,7 +1127,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 		.phy_id_mask		= MARVELL_PHY_ID_MASK,
 		.name			= "mv88q2220",
 		.flags			= PHY_POLL_CABLE_TEST,
-		.probe			= mv88q2xxx_probe,
+		.probe			= mv88q222x_probe,
 		.get_features		= mv88q2xxx_get_features,
 		.config_aneg		= mv88q2xxx_config_aneg,
 		.aneg_done		= genphy_c45_aneg_done,
-- 
2.48.1


