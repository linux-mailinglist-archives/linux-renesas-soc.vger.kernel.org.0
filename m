Return-Path: <linux-renesas-soc+bounces-9489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 046B699166C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 13:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64ABFB20B14
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 11:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6436914C5AE;
	Sat,  5 Oct 2024 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KAfbxex2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="btpD5C8M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B7314A616;
	Sat,  5 Oct 2024 11:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728127505; cv=none; b=T5kPMvJaNrnlb0xORwl8w6PQj0K1UzFYubcd+Zo1bYIz97dbFkIK6xcn2X98IzleTKvYaAYguwXNTLzPVFi4LYtOqE3PYiQfkftWTSgfdOOf4Mh8TS5mqaNQ2Sk1JbYWHqDNH/dOfSV5OMToqX3u1YtbALs7D049XEhYmwG0liw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728127505; c=relaxed/simple;
	bh=0bNtQkX7kYfoLwMhzzFDFn6MyLvj2e3yl9sKCecBXPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J+RUjskry2vKctjaPIxk/xfMO6/H4X2ZsnbBYHvLp83gSjNkUjn3hT516Os/tWL4DJ7MM+Wv92VCwkJETmEiLbCfb5ydsAd9oCcoWzrwzw5u3dHqdd8ZV1VDhYlqyzEvwi9Zarp3zCrSE8IYAzk3PX66gyopfPGrWVPmyrhFH0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KAfbxex2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=btpD5C8M; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BC08E11402A7;
	Sat,  5 Oct 2024 07:25:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 05 Oct 2024 07:25:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728127502;
	 x=1728213902; bh=w8HmPOp3L3VVDLxTzHI2jWpxFWM4tP71LE45dpVwmM8=; b=
	KAfbxex22VeDd1gG8Xtr5EzwSPYLlwMEKlEvzrMiklPMnttW9YmfWmrXPkGNzDpC
	cLfndD0iWhXDrpHxw6vpetmXToFHdMhOCWDOUhrql8WOBWHS1OpJRBjKXfXGjPKq
	uYARJ1AOIqh65TyoTvJES8nWCKZVzYzqFRPsrwzCg4mdhQKNFYLwe86TKXtdDKBU
	AIyR5njddZW9uOMvVLmKMuaQpwVkO9e4jsnaas+jbdOgYHNsPRLUJ1JWRi7uW65r
	kyiU12n3q8MxHbhcTUHU6xLj1nZ3cHffO+OMG59qGd9o5m3fkrxcUhtJwvH5fcXV
	Vg2U0MhuNWHNGKRADOMdNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728127502; x=
	1728213902; bh=w8HmPOp3L3VVDLxTzHI2jWpxFWM4tP71LE45dpVwmM8=; b=b
	tpD5C8MDNi+DjSFi0DN5lP/VqbfIQ3DODcvhx2LqYRP9fO2eWYH1pIMxxJnQuU5u
	uWzs+5CX5qQ7QpZTuL+aJubPdJJXJkfc5TX8HE/WbYfyBcMFR+80K8j+OvfSeiZ/
	2LLzbxx1WUhAViCXCHV1PszGuEPfkml8ZqrFIB/3Z698EMr1fvFyLkyqlSsrmehx
	gptc+BYZ+Un+nHDiub/y+Zl7r+maMQbZoASkPnAdQ1gEs1rutRDhqUsjtkYHoRzu
	UJwc5ctVtbXJJdRlF4C9ASN4JT2C4WX1mg/IdhFLOxHnJNBYiOOHfyCyF4gi752k
	c8OCreylljrVu7nbJyDFA==
X-ME-Sender: <xms:DiIBZzZgwLHj8M5mpLVNyn18UeeiCNySSstSnxDhxEnxH2JN8JsvfQ>
    <xme:DiIBZyaXF1NOLIONhekhFsQ2GAFTiTtzBUGCtzRrJyWIGTKjItIr-YCKy7e6nHKkg
    u2F7V4HThF1xBn2QtE>
X-ME-Received: <xmr:DiIBZ1_XP9XPSjybNgk9NeqnIw2qFbDDT20VdNW8KOgwZcM8hPLWYnoFwOf_4hRSOc-ye59ORuoFOdp8tdkRyeDIpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvhedggeduucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:DiIBZ5p5JVoBBAQL3k7UDHRST8l3ndjrDEZ1Sirvp26R6RTEFfyRgw>
    <xmx:DiIBZ-rmcO_qxoiF71Ab3Iz9dUdLqktxuZ-z95zFx3FMsR3nmgaIkg>
    <xmx:DiIBZ_QpJ68UH2uPw2Pu1dxjjr5e8RrPvZzfzZfQCPppg4AxcrKuBw>
    <xmx:DiIBZ2qm63o5741D5Eazp8PPtA0lLk8NNPWaBRs6fhWVqPcB-ga8cg>
    <xmx:DiIBZz47B2ol5GWWRO1uh2BTJcDe16nU0uYU7d92WqqJ0rKoOou3fRmm>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 07:25:01 -0400 (EDT)
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
Subject: [net-next,v2 2/3] net: phy: marvell-88q2xxx: Make register writer function generic
Date: Sat,  5 Oct 2024 13:24:11 +0200
Message-ID: <20241005112412.544360-3-niklas.soderlund+renesas@ragnatech.se>
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

In preparation to adding auto negotiation support to mv88q2110 move and
rename the helper function used to write an array of register values to
the PHY.

Just as for mv88q2220 devices this helper will be needed to for the
initial configuration of the mv88q2110 to support auto negotiation.

The function is moved verbatim, there is no change in behavior.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Dimitri Fedrau <dima.fedrau@gmail.com>
Tested-by: Stefan Eichenberger <eichest@gmail.com>
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
2.46.2


