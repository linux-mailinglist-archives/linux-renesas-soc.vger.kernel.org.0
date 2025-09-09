Return-Path: <linux-renesas-soc+bounces-21613-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4123DB4A641
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 10:59:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B8554094B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Sep 2025 08:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5D6D276045;
	Tue,  9 Sep 2025 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="PlbiCqP6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="KPk9qzeu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA4E482F2;
	Tue,  9 Sep 2025 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408373; cv=none; b=h2g0/Gs0FD23xbyNyrpyIpWVrS/A9Iv37iNWAO32CKsdfJh4PAzX7+f3GqbVD1G/vX8zy/29QkzJhz31Ek2F4bgqV5P75xdt8xZDu2i+SdsolOsvH9UdsJq3mrQDm1ahch3bXlLqKYhCkKE9Q1xvo2j9V3TCuzrsyln2Sgos5yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408373; c=relaxed/simple;
	bh=acmpm+zG+d17rTEz27BnarToCEJrE+eC78/VU4oMNWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oG0QwP74gnclx4fedmGjH/uwpH/WYuH768+zSC8+h1JTJJ4CUoS6lhGdH0NoNTBJq3Y0lOKbRpZVINbP9wPdOyCj5UeSH/zBQg0udktx9tUUHi5pmPbe94jeNQqfiq+JDx/yrXEZKK9T0QnUjgCvs77WE9APcBUyRNfuCn/+BuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=PlbiCqP6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KPk9qzeu; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 23F397A011B;
	Tue,  9 Sep 2025 04:59:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Tue, 09 Sep 2025 04:59:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757408369; x=1757494769; bh=w+
	fg+H01yy0rXYRzUoDqsmkrZgolWHvjg8Tc5044ZfI=; b=PlbiCqP6ovLvNVARsN
	MIju2CQqXaGpd5xFrZrF31W87CDgo8UUtubMkTuF76NX+KcSFWnmyji6ag8VQ6qo
	EXCPOJqo4OdZOCVn45YhiOvs/04YLSLftUqAaw14heLsVQYBLINUHsxbRWoT58u2
	JyQzrjtsAzbBYmWfaJcNl6dU2+WAaBWomKLiw8aMaQ7xTYHChC43Q90vHYknCt0K
	sh6omhoq2V2jgtQr7sZs4Ozk4TV0f3/lx4JynnqGMkYycYJCkaAyR+uC9kNzkKIf
	G3dTJcJGIM9/vUZ/hYomn0kGgLJbgelK7WdlFSJFIoS6OrqpN/cBRfVJbR1znWIR
	W1KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757408369; x=1757494769; bh=w+fg+H01yy0rXYRzUoDqsmkrZgol
	WHvjg8Tc5044ZfI=; b=KPk9qzeutHBrWl6DmfiO8Ol5liYylI42c68heet66++E
	7ohrwrF+mcObIdPjn+1tQpAW7/x/QBrC2poCbRCqm/GzxcVdhx+KDm2OfnlvENB/
	LsxU/9R3eZOMlgrZyzhMFujxgnw6TIMZ5NyLgHy7Ou5mb/BhC9uD2WNdO4cpDtVT
	mR3Hc8kNYP3xucoeuCu0NqLCAF71uRvHhvDfs8hDBcnWlR9ftjTBojsKqeqg944E
	gekKulSU78M0wsO+HDii6h4SQ/MBOc3rt1HWdQffgD3FakFsB4xwikEW7OICXiXR
	n/erdGlYaq/DEDTr4N+dvFjsS1gqX43rfnlKbpMZ0Q==
X-ME-Sender: <xms:cey_aHAFZo7HOTgWf3O1HhPPliUCMHKSqEpyBLAZqzHQWC0IDYI4JA>
    <xme:cey_aCt_0ZUsL1PXPiV05FUhC8yj2yT_uiZFF3S2BhyKHf79PHiXxyezDzh-OnmbX
    OsNZ6TZM_l7hoX11X8>
X-ME-Received: <xmr:cey_aDfFz2gOQJstPeuDyQUjz7sztPBoG_puJQK1TvbQ8iBGsgxn2gwS_a6XlhBrl9wm8g5Hxz0vchzVfN58BoXMoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvtddttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgt
    phhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuh
    hmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtth
    hopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgv
    tghhrdhsvg
X-ME-Proxy: <xmx:cey_aP-yHU_CUc5W88ocS06EOCoEHpHL7veZ7QEp1bRfNY5PJ8TC2A>
    <xmx:cey_aOQwPrauZ4J3Ezm9neb9aEUnwy-NVoHyO3NITJ7dwyRGtf3NVg>
    <xmx:cey_aAp-tcn5IiaRn98uENJ-_i7Q4mDqRXwGbjeIH2StwvA9DOzyMA>
    <xmx:cey_aLlbSNzy7Cr3f1EbJ_hjuvNMy04uANLUAR_GEnDYuvkr0QXtxw>
    <xmx:cey_aILZ0Ck2rzMDyOoyu5A3wG4F0bB3cWADsk2A80k8xPl6r7hVtV3y>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 9 Sep 2025 04:59:28 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: sh_eth: Disable WoL if system can not suspend
Date: Tue,  9 Sep 2025 10:58:49 +0200
Message-ID: <20250909085849.3808169-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAC can't facilitate WoL if the system can't go to sleep. Gate the
WoL support callbacks in ethtool at compile time using CONFIG_PM_SLEEP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hi,

Recent rework of the PM suspend operations by Geert revealed that the
WoL setup code was gated behind CONFIG_PM_SLEEP, but that the driver
still broadcaster support for it.

With the PM suspend operations improved by Geert this just fixes up the
WoL support showed thru ethtool. A system now compiled without
CONFIG_PM_SLEEP gives.

    # ethtool -s eth0 wol g
    netlink error: Operation not supported
---
 drivers/net/ethernet/renesas/sh_eth.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index 5a367c5523bb..6fb0ffc1c844 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -2360,6 +2360,7 @@ static int sh_eth_set_ringparam(struct net_device *ndev,
 	return 0;
 }
 
+#ifdef CONFIG_PM_SLEEP
 static void sh_eth_get_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 {
 	struct sh_eth_private *mdp = netdev_priv(ndev);
@@ -2386,6 +2387,7 @@ static int sh_eth_set_wol(struct net_device *ndev, struct ethtool_wolinfo *wol)
 
 	return 0;
 }
+#endif
 
 static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.get_regs_len	= sh_eth_get_regs_len,
@@ -2401,8 +2403,10 @@ static const struct ethtool_ops sh_eth_ethtool_ops = {
 	.set_ringparam	= sh_eth_set_ringparam,
 	.get_link_ksettings = phy_ethtool_get_link_ksettings,
 	.set_link_ksettings = phy_ethtool_set_link_ksettings,
+#ifdef CONFIG_PM_SLEEP
 	.get_wol	= sh_eth_get_wol,
 	.set_wol	= sh_eth_set_wol,
+#endif
 };
 
 /* network device open function */
-- 
2.51.0


