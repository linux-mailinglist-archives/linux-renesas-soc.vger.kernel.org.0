Return-Path: <linux-renesas-soc+bounces-16152-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7FA93900
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 16:58:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C77F24675FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 14:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DCD1D54E9;
	Fri, 18 Apr 2025 14:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cTgOd+XH";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WHCkszTE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B217EEC8;
	Fri, 18 Apr 2025 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744988316; cv=none; b=NSNEzXPl+qJZ88H5NPgx65epMA0JDSuK+L7Beq8j1y6jWICVPUtJXAtGk0DlwwIRpy8GSTUOWifSNlWeVPptuwPSmQYXDudxuhj8kly+hyBYR947M07+gnPKyd+2JdxfemCSZDgWh3uMZilzB+HDrGRgs/oWvnTvrc8zyM3I0Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744988316; c=relaxed/simple;
	bh=to4vLTskpbiKvqT5kJWMbLVAkQC7AU6Qxmy5ZhUwSR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jlP86auJYOxHNOOL5mJVYkjfMl7JSubHSlZL2WmxdZ1+2CLkm6eTskpZefxBtyLKeRRVmq1n1j6BEmnE/MQ0boaW8SRMuEswjnNE5urH9iJEdOmheb3KLPfx5Qmd3Gtte76lBnHsljBHfkxrYBiNWcPb9161sssernByg0Mrgg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cTgOd+XH; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WHCkszTE; arc=none smtp.client-ip=202.12.124.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 1E97411400CD;
	Fri, 18 Apr 2025 10:58:32 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 18 Apr 2025 10:58:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1744988311; x=1745074711; bh=yl
	is+WEKyd0a3O3HzBDgtcXmAtwOcz5A+3gNAm46UAQ=; b=cTgOd+XHdoOON/wl+T
	eNNZVXlqe2A5A2Gp3j5fZRxrlYKu3DsgvtmKuHUiwuULrf/rF9lTpUnPglo6Udd5
	QbeyjS5s+oBlJ7W/wL/04tvgY4TaHGK5uCfdQtCWLoScsh3p6IvldMdi0PIRTEsB
	49yXG1AtkLZmHGdvHe+YwhPt2nssgpXuyAB3Y7YQuujlaoV7LHxA2kb3fuFKDcNl
	z3Ev71/BpYK/GMshEIcmD1sECCzmTK9gwtc7BX4OpdQjkNIIzeqqFu0Wu16HxIXA
	Co7vdyvN/gYfFy8R8U9yx+/XD24gp+FCDWTr8qi5lVqlqaLVIy0KyU18k70YCUBf
	K4aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1744988311; x=1745074711; bh=ylis+WEKyd0a3O3HzBDgtcXmAtwO
	cz5A+3gNAm46UAQ=; b=WHCkszTEaZ0ZZe+EJd08Otx3i65NL0RYUPFiYz//0Edk
	e6k8g1rpS4KbXb3iYKv/kttSwVqKu46MlF/OFcJ28a05N7lA0C1Y2feL9aRtRMOm
	1lGm9k7PWGXDA3fsG2nFK7zxiDFK9ARzj+6azTZB34dXixmZfAJnXUexC18qGKJK
	v1cNDTNWIyu01x4Q7unYA+aNZKmy64Iv3wJBiiSnBNyKErlflrt5B/fRM51GfE9q
	YYKeJpWOcfHa9NKZ/XPymjPasXduLn9PWBmCUgg2eFRm6jF31mMU+HX2oLd3VVIM
	qI/3CPbjCsq6N5uw9mc2OQBJdOAsfh1VC8gMzxeDfQ==
X-ME-Sender: <xms:l2gCaEkbCpEqjZE3OeEatN7FMEVIv5IXcIDtUAttRC15etAo9GMOHQ>
    <xme:l2gCaD1QE5PB5CMMFjfb2cog4F_TGz946KeWfgVcYJlLQWJ5xg5T_DPwurRF94tW8
    QYRZXppiCjZpRcio60>
X-ME-Received: <xmr:l2gCaCpQ7M7mzEMfREtjZsm74u5n8gFT-IJC5RtEvWhcnHf0Ti0NZWtSgwXQOODYtuiR5cHgNF0b8ZtTXeFBd283MQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfedvgeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeeghfeffeelgefghfdvveduteeufeduhfevteejjeetfedtveeugfeuveffvd
    duveenucffohhmrghinheprhgvphhorhhtvggurdgtrghtpdhkvghrnhgvlhdrohhrghen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklh
    grshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthho
    peduuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvgifsehluhhnnh
    drtghhpdhrtghpthhtohephhhkrghllhifvghithdusehgmhgrihhlrdgtohhmpdhrtghp
    thhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeguihhmrgdr
    fhgvughrrghusehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:l2gCaAlKPwIznXe8KGvncJl51qiCWSrBxxsvJzZlUBY6jMNF-Aam0A>
    <xmx:l2gCaC1gBhy2CBIc8Aqj3TLw5VMK2x_WiAS8HRbFMHpx5BEuFWDcpQ>
    <xmx:l2gCaHv9gdmXmjLFdezEmjQr6MVKWeTZXXcqbwbQBKAS8ux2WYbOfA>
    <xmx:l2gCaOUAFzB-gJMj3um3NUvJXpeItE08uy-g_9GyxL88DNYr_Vn7-g>
    <xmx:l2gCaHNTJHaaEutR5nXPFvl9FezRBHgfYIsyGvxtT4joUm0Qb0dyE44L>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 18 Apr 2025 10:58:30 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dima.fedrau@gmail.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2] net: phy: marvell-88q2xxx: Enable temperature sensor for mv88q211x
Date: Fri, 18 Apr 2025 16:58:00 +0200
Message-ID: <20250418145800.2420751-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The temperature sensor enabled for mv88q222x devices also functions for
mv88q211x based devices. Unify the two devices probe functions to enable
the sensors for all devices supported by this driver.

The same oddity as for mv88q222x devices exists, the PHY link must be up
for a correct temperature reading to be reported.

    # cat /sys/class/hwmon/hwmon9/temp1_input
    -75000

    # ifconfig end5 up

    # cat /sys/class/hwmon/hwmon9/temp1_input
    59000

Worth noting is that while the temperature register offsets and layout
are the same between mv88q211x and mv88q222x devices their names in the
datasheets are different. This change keeps the mv88q222x names for the
mv88q211x support.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Dimitri Fedrau <dima.fedrau@gmail.com>
---
* Changes since v1
- Clarify in commit message that it's the link that must be up for the
  reporting to work, not just power up. Hopefully this oddity can be
  solved in the future by patch [1].

  This change just aligns the mv88q211x with the current mv88q222x
  behavior.

1. https://lore.kernel.org/all/20250220-marvell-88q2xxx-hwmon-enable-at-probe-v2-0-78b2838a62da@gmail.com/
---
 drivers/net/phy/marvell-88q2xxx.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/net/phy/marvell-88q2xxx.c b/drivers/net/phy/marvell-88q2xxx.c
index 23e1f0521f54..5c687164b8e0 100644
--- a/drivers/net/phy/marvell-88q2xxx.c
+++ b/drivers/net/phy/marvell-88q2xxx.c
@@ -828,6 +828,7 @@ static int mv88q2xxx_leds_probe(struct phy_device *phydev)
 static int mv88q2xxx_probe(struct phy_device *phydev)
 {
 	struct mv88q2xxx_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(&phydev->mdio.dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -835,17 +836,6 @@ static int mv88q2xxx_probe(struct phy_device *phydev)
 
 	phydev->priv = priv;
 
-	return 0;
-}
-
-static int mv88q222x_probe(struct phy_device *phydev)
-{
-	int ret;
-
-	ret = mv88q2xxx_probe(phydev);
-	if (ret)
-		return ret;
-
 	ret = mv88q2xxx_leds_probe(phydev);
 	if (ret)
 		return ret;
@@ -1118,7 +1108,7 @@ static struct phy_driver mv88q2xxx_driver[] = {
 		.phy_id_mask		= MARVELL_PHY_ID_MASK,
 		.name			= "mv88q2220",
 		.flags			= PHY_POLL_CABLE_TEST,
-		.probe			= mv88q222x_probe,
+		.probe			= mv88q2xxx_probe,
 		.get_features		= mv88q2xxx_get_features,
 		.config_aneg		= mv88q2xxx_config_aneg,
 		.aneg_done		= genphy_c45_aneg_done,
-- 
2.49.0


