Return-Path: <linux-renesas-soc+bounces-8668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4693396A554
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 19:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A7EA1C20C6A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 17:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED3C18A6CB;
	Tue,  3 Sep 2024 17:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="EFt0qLdT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XJWuJdCL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from pfhigh4-smtp.messagingengine.com (fhigh4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ACE6F315;
	Tue,  3 Sep 2024 17:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725383964; cv=none; b=PkVpkR/9Cxxux4D2JPeHCelCV21jlQFWRqNctGl9BKwj7HM3/ht+6RbQv+2z/GezUD5LrAkSp5nA878BuRqex7qhc+f03qV8XdtI3/E9vTGj8YheMP2ohDNjEVXaYxWG8szelrht3zUSpdoeMRgprwbWRBVSHi9h21os1zsjRzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725383964; c=relaxed/simple;
	bh=zOIYjgDTJnoOkC8/xSpv5LRhUYBTqxhR3qIPa2/e/nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hgZVwVSAKptPc8JV1fHwNHrA8CuwlmqXcRuK081CnVgI35vysY/pCWf5NWzHxaYK4wWR6IhHKU4mh4Czw18z8ZhTR+Kr2g8+KzfeYOQTVlSjpaAThjcFLCD40bKgNizUn+qUtIXfzW2GcloJKkjrX7O0WsN1xvxAte6bipD+YSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=EFt0qLdT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XJWuJdCL; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3AE68114040A;
	Tue,  3 Sep 2024 13:19:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Sep 2024 13:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1725383961; x=1725470361; bh=gr
	aaZdY9PvQKoMwgbzfUY3v2asqgjwD2mv2g++7oiTs=; b=EFt0qLdTuMtvdtSGSF
	rmKaFu9t2AkKclGfMKZegTlVBt9wHqQNfC3A1FYMd/am2qpZnreGPeCpCMyV7J2v
	jVSxlRbb5bKZ2aFJhGfn0b3V9BGG4iWlfNEvf4ORQvfwHKAt5kFY+huHRcAkqOPC
	TGg2BJt95cse/tIAQmhMax0Vrr4YT2NIMaPQ35WsANYAUVWUCxW/NAbX9stOE3DR
	0pH4Dmr0toC+tb4+xYZSXFT6MA9xlwbnWegGrzYjmPpQzMf4aMPnpa5eZHDVOOwl
	5YMK9yUlJMZcIzywlPnHT7kIwCz+8cLMOxUwWVJjR8bPJ+a2zE2lNjF3M8x3Zi82
	SUEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1725383961; x=1725470361; bh=graaZdY9PvQKo
	MwgbzfUY3v2asqgjwD2mv2g++7oiTs=; b=XJWuJdCL/hPKocKvCRYrVNUvAhcj7
	Qpo+L8xHvrDZI4PogirAuk3WrHdSr3h2FEgOsxUGvFdZxXo/HDSoRDuotISsyum6
	4ANWyCdggLkfZ0XBT/MMkMjNexZiqh6swxhSdr7/esJPu8enBECjAnvoC3TBMxHn
	4pjwYB5KmWtsThsK0z/i/anzZAYyNga9vWXClMa9QaEBCjhH0FKDZsedi46eKFlN
	jMNKHEIf0d5K8KU9bPSC6/+v/KVLOxdDHMGOI1EXpGzGvGEwUH/STlzkeYBVxD41
	YgWguIRffYHikoU3UZfYElaISWaDVMJThJmHaPXRADS6vUPPXNjozQKXQ==
X-ME-Sender: <xms:GUXXZmO0jD4WgkJ6I3g4eWwzRKR1B6ZWLxGaDjNGqnUBVSXIoGKmqg>
    <xme:GUXXZk_cM3kF73RZeI8hfkBYWda1Jo1Th0aYO-fgpzSf2PI1Ta789gofOhH_p7kY0
    cXaoyuh9o4uY2hRhhc>
X-ME-Received: <xmr:GUXXZtQfOMWuWz9NbpJFNF3boEMocJSbhVUcgOokvgpv2GKGSkhKMYC2SmUVgIH3zo5jK1eA3nWrRjVSwMnvoiGZ5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehhedgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheduleetteekgffffedufeeuvdejiedvkefhveeifeegffehledtvdevhfefte
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhgvmhesuggrvhgv
    mhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhglhgvrdgtoh
    hmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprggs
    vghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotges
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:GUXXZmtx0dkKm9mcA-BY9I7UHUzxzYY0DLzcaO5RvldBcmysf08HRg>
    <xmx:GUXXZucw-35IPyfLpAtDw_aErBxRtOCwXOpD0hhWRZnysMPDUvks5A>
    <xmx:GUXXZq34vabdbCcplxTfdXmk1htRAX9q9hI2JZ5EwJnJPD3beaKy1Q>
    <xmx:GUXXZi_hZ2S_gtJDgJBMjgsAljJFFz3LV4mTO-IizAKLgzGiWhAhLg>
    <xmx:GUXXZksYGZSnQ-HyUaldYjcH4N-9r2JjvfTmiYAJTq8C_OBcouvbyEmf>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Sep 2024 13:19:20 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: ethernet: rtsn: Add MDIO read/write support for C45
Date: Tue,  3 Sep 2024 19:18:53 +0200
Message-ID: <20240903171853.631343-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add C45 specific read and write implementations to support C45 PHY
access using SIOCGMIIREG and SIOCSMIIREG IOCTLs.

While the core can handle a C45 PHY using only the MDIO bus C22 read()
and write() callbacks there are PHY interactions that are not possible
without them. One use-case is accessing PHY registers using the
SIOCGMIIREG and SIOCSMIIREG IOCTLs. Without these callbacks trying to
access C45 PHY registers using these IOCTLs result in -EOPNOTSUPP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rtsn.c | 40 +++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 0e6cea42f007..8d6ffaa13e5b 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -771,6 +771,32 @@ static int rtsn_mii_access(struct mii_bus *bus, bool read, int phyad,
 	return ret;
 }
 
+static int rtsn_mii_access_indirect(struct mii_bus *bus, bool read, int phyad,
+				    int devnum, int regnum, u16 data)
+{
+	int ret;
+
+	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_CTRL, devnum);
+	if (ret)
+		return ret;
+
+	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_DATA, regnum);
+	if (ret)
+		return ret;
+
+	ret = rtsn_mii_access(bus, false, phyad, MII_MMD_CTRL,
+			      devnum | MII_MMD_CTRL_NOINCR);
+	if (ret)
+		return ret;
+
+	if (read)
+		ret = rtsn_mii_access(bus, true, phyad, MII_MMD_DATA, 0);
+	else
+		ret = rtsn_mii_access(bus, false, phyad, MII_MMD_DATA, data);
+
+	return ret;
+}
+
 static int rtsn_mii_read(struct mii_bus *bus, int addr, int regnum)
 {
 	return rtsn_mii_access(bus, true, addr, regnum, 0);
@@ -781,6 +807,18 @@ static int rtsn_mii_write(struct mii_bus *bus, int addr, int regnum, u16 val)
 	return rtsn_mii_access(bus, false, addr, regnum, val);
 }
 
+static int rtsn_mii_read_c45(struct mii_bus *bus, int addr, int devnum,
+			     int regnum)
+{
+	return rtsn_mii_access_indirect(bus, true, addr, devnum, regnum, 0);
+}
+
+static int rtsn_mii_write_c45(struct mii_bus *bus, int addr, int devnum,
+			      int regnum, u16 val)
+{
+	return rtsn_mii_access_indirect(bus, false, addr, devnum, regnum, val);
+}
+
 static int rtsn_mdio_alloc(struct rtsn_private *priv)
 {
 	struct platform_device *pdev = priv->pdev;
@@ -818,6 +856,8 @@ static int rtsn_mdio_alloc(struct rtsn_private *priv)
 	mii->priv = priv;
 	mii->read = rtsn_mii_read;
 	mii->write = rtsn_mii_write;
+	mii->read_c45 = rtsn_mii_read_c45;
+	mii->write_c45 = rtsn_mii_write_c45;
 	mii->parent = dev;
 
 	ret = of_mdiobus_register(mii, mdio_node);
-- 
2.46.0


