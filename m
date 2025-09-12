Return-Path: <linux-renesas-soc+bounces-21824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA3B54ECC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 15:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 371981C83889
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC0873043D1;
	Fri, 12 Sep 2025 13:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="h+eqyzd2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="B0tqT2+S"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991D3009CB;
	Fri, 12 Sep 2025 13:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757682548; cv=none; b=jP6RIm6mxONYNTxRtbHnH+3XUizqNREnUmew3qLtJg1jpcAfDD9joAB899EhxMqd8tdJmfJtQXrVaAhdCw5EDJr4C19UyzFlGGyggcKOLtLECMjBpParf54Pk4Fef7jziiUcNrX8pda3hNoDr+JpUeWHOKGZlP6XYL4EtYJM1Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757682548; c=relaxed/simple;
	bh=7ElAf8sTQijlHx3haxeZf0p3J8l5v1LuiFmE4Od6Hmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YcXxgBOzJaqq8xG8xz4ZAq66+IFPWGoA5ItRA/UpvR1rDknJMxDhBv/48tC4Qidiv5TEvMz3GSNUWXOgA83TkhshPQQGtp6CiwP8x1pHir0OCzlKxgBkMGw/KpaqbBH+JpBg/BqDqZRsQGBA1j5gbeyzYYHcLDZdJ/FF4xPjEbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=h+eqyzd2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=B0tqT2+S; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CE6111400416;
	Fri, 12 Sep 2025 09:09:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 12 Sep 2025 09:09:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757682544; x=1757768944; bh=5V
	qV6ShM83ZnT+VLBGrssvzUJYQzVIvizvZ43hXPevc=; b=h+eqyzd2oqIS5HBUf+
	dzAKHpPydqZnvdI8OPsA6VHFUTSkhmg8mBB2DvesizLcVymSQJNypZzcB8zGr/8P
	xtGFgoXAbC1x46hrHqTt7j57pPWe6VX4mKb8l9SZ+r5TtRLBlOr/QSRsgbsvZ6/x
	sVH8ZCvgVenZBUadNOnzBmgG05KOfM01epEMzcE8IV+ea7isre6I/wevfHbENv5v
	yoQ5p+l5m3Vh9TZ/XyjZ80M16LOabRltCQ1woODLRj9BcPjT5ppb2PyGP98xxen2
	PAiihnSlRqLUdkDf4FMJcttHNtVWwrpVRwZOtdGRWfhfHge6kmi9S3urbMUtn/x8
	qruw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757682544; x=1757768944; bh=5VqV6ShM83ZnT+VLBGrssvzUJYQz
	VIvizvZ43hXPevc=; b=B0tqT2+SiAiwCu1Fj3uLCsXrWXHeSPDX7ctwNBUttqHi
	pB7SJV1GTctNIQ0tUrRx1ezikFsHTokFXPoue2knISKfpOGkppQLfv4EJXMwIpAL
	Y56PhqAC8gZiUhWdfNairpBTpVHojI3PFLyNZFWE/Ui1HM5z8FKM9tdAJffwwv4T
	qVWIp2rpQbuqNWIev1rYhb81CdmKYuoyyLktvTWTM03OpuzjbCt4C2kn07laCwzx
	jAmqZRxgTG1prTUc8+rGUF4Qf29xscJiJtg5FELJuDSeS/SKlxEt+rT8KUTdPxLR
	fFdnT+0p4J00etx2cDMe/UUhcchRxRPtShNSiANxDA==
X-ME-Sender: <xms:cBvEaHTt11uF7Opfdjneybp_vLvKcp9nU4aarpG8GAddEwiLCi0XSQ>
    <xme:cBvEaDaCthprqhLxXhWvQCw-aiQbZPkDWwAmmafivLrmTRQugnavcLpilAL36WthA
    c3S28jOvNZTM9X7-TE>
X-ME-Received: <xmr:cBvEaC2rG0j4lHNKWEMUJ_9tVz21nJ4Bn90clPyyH_KfGGYQGGoeokLDY2EQhYqPI0MpA5ak_Zf46AAs9hJJ8Z4gKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvledufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghpthhtohep
    rghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmse
    gurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    epphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhg
    vghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrvghnvghsrghsqd
    hsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhikhhlrghsrdhs
    ohguvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:cBvEaGpMFSzsQfIMfKwoPLN-aGtDWCEGJoaYEE8XUZWOLCCwRyB1GQ>
    <xmx:cBvEaBOsPL0vZ5HWukQ8oNt_1-4FKzmwZwkpOePMBfyrJ1LN15ybhA>
    <xmx:cBvEaPqOmKRTdcaNiTjaWPNx5UKvetsiUuRmdo_bQudJ_E3VPa2VHQ>
    <xmx:cBvEaMt9VvAB-Ee0VYIYT3zeIlYH4NyuLYNI0vfGN-gBDcHlOllxmA>
    <xmx:cBvEaCig1tUevxOyXvGNjT3LPg-YSF-ErWDlkgpcQRWAHWKpqRgHhb65>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Sep 2025 09:09:03 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: ravb: Fix -Wmaybe-uninitialized warning
Date: Fri, 12 Sep 2025 15:06:24 +0200
Message-ID: <20250912130624.1022028-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a -Wmaybe-uninitialized warning by initializing the variable to
NULL. The warning is bogus and should not happen, but fixing it allows
running the check on the driver to catch potential future problems.

  $ make CFLAGS_ravb_main.o=-Wmaybe-uninitialized

  In function 'ravb_rx_csum_gbeth',
      inlined from 'ravb_rx_gbeth' at .../linux/drivers/net/ethernet/renesas/ravb_main.c:923:6:
  .../linux/drivers/net/ethernet/renesas/ravb_main.c:765:25: error: 'skb' may be used uninitialized [-Werror=maybe-uninitialized]
    765 |         if (unlikely(skb->len < csum_len))
        |                      ~~~^~~~~
  .../linux/include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
     77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
        |                                             ^
  .../linux/drivers/net/ethernet/renesas/ravb_main.c: In function 'ravb_rx_gbeth':
  .../linux/drivers/net/ethernet/renesas/ravb_main.c:806:25: note: 'skb' was declared here
    806 |         struct sk_buff *skb;
        |                         ^~~
  cc1: all warnings being treated as errors

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 94b6fb94f8f1..9d3bd65b85ff 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -802,7 +802,6 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 	const struct ravb_hw_info *info = priv->info;
 	struct net_device_stats *stats;
 	struct ravb_rx_desc *desc;
-	struct sk_buff *skb;
 	int rx_packets = 0;
 	u8  desc_status;
 	u16 desc_len;
@@ -815,6 +814,8 @@ static int ravb_rx_gbeth(struct net_device *ndev, int budget, int q)
 	stats = &priv->stats[q];
 
 	for (i = 0; i < limit; i++, priv->cur_rx[q]++) {
+		struct sk_buff *skb = NULL;
+
 		entry = priv->cur_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].desc[entry];
 		if (rx_packets == budget || desc->die_dt == DT_FEMPTY)
-- 
2.51.0


