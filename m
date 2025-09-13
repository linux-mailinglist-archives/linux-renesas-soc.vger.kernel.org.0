Return-Path: <linux-renesas-soc+bounces-21840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9159BB5612A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 15:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04A367AF5F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Sep 2025 13:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E55D2EC546;
	Sat, 13 Sep 2025 13:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ingkWitM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Jb2s8g1C"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B231635;
	Sat, 13 Sep 2025 13:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757770379; cv=none; b=t9JTeAO3ymbRpgluoNddZtxBmAcwIsFadvdqUf/NvtsRw5gfotS/sQogov9bK4OVXuHeaLimB2nrmRS2c8XBAkH6M2zcaAKxJJFPabITF7P3E63/U4MMcjBPp/mSG4YPB17S5pgvbW1OttSnauT0eLulZAf+9yOqgNIhFmENeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757770379; c=relaxed/simple;
	bh=yhPN77Gzk8EDCOoaTy1ZfLn6b+mAK1mh5nIHLRWPFck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i12qRX26A4R7CfSJ59Ylo4BaggfEFUbXPcCo2OMuMq0k+P4xsc+lxI4AW8Lu0/cLhNgHKVBkXIAofCIDSvvcDam/dtjAwwPwDF4A0s/O301QHfyFGP2GGbNNND6TtWUyfsbJBJEFzAx58vsR36nPKcEKYaYSSmQWy+3K28AsyCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ingkWitM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Jb2s8g1C; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1BA3E7A00AC;
	Sat, 13 Sep 2025 09:32:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 13 Sep 2025 09:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1757770374; x=1757856774; bh=PP
	i3Q8QR9RpPHucQcYMxCZHsSxLhkFKzDd5oXQp94Bg=; b=ingkWitMYgwq0otpMm
	FCyJrq1fknGJFEDoIiijGG2iYDBuMSHk35WDz7OWFZmDmfIy+yRxOcviEyIM3ysH
	Qs8Tc/TuuDRFJ4+1Q1Z0rdMQpCgs/lrT2GJPTgq77kYdZ8TEl/B5DA+wWYoCrUBC
	KpL0QvLk5xj6w9p5aoOAeoJ8tSEByBXrIsEQBo244+Yh5fj3+V3Ys7RGmUL1tjL/
	vCCf8RHf1ztMtHtadN3dw2hWKANUhrxu2NdrK0JS2VVOr7pfX8bAn3hTUNtOC0L3
	hPue1wOGrIcFrLGP3ieYIID/ugVAONk9x4eQl45/RFlNU+Xdbm/Q6gw3jf717X6C
	pw2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1757770374; x=1757856774; bh=PPi3Q8QR9RpPHucQcYMxCZHsSxLh
	kFKzDd5oXQp94Bg=; b=Jb2s8g1Cw6TN5yF/nzmcJeIUxxQ7TUAbNbA6ZNMmyM6G
	amzGQ0Y7oaS5PKH+8Xzc0bYAr0LoaKvUDbtqg65838bsBUu1s4HOkkOk7mXwfjy1
	bLmd2dLpgsQHCdKEvHu2Z1JAhZb3aoJpkw6T/7ZKjU6Ib/upmbSagLr62oO2/wK+
	nAVLnn/bnwWHgVGEJYFcwWciP9filpf7QAgGZgN9fQJUZNVcHzZJP/L23gXPV3Qd
	HsVdMQ+GHhti0GFTym0oTORCxVDybdhrceSxHcctPCXnij/2gTMxJ+6Dcy3+XeJM
	pAnzdymHO3G4OcirkT71ONT2BFJN9GKNPycPAs8oDg==
X-ME-Sender: <xms:hnLFaGx6b8r-3XGyIBnrD7rMO6XRL0yjt82G_bbSlCHvL3BHDpGBlw>
    <xme:hnLFaPr_ITljrenwdpmTC0KYHGi5q1KJRcNivCj6joZtCxchryeRv7tPksRV9Tq2S
    lkSQuBJ_A0WaWQo1iU>
X-ME-Received: <xmr:hnLFaPoQ734N2QZTCe8-Q4yze_GKNWJuZW9W681n__vPvHZnVXWKfHX7RULZE6vyJAP9idA-nCBzFsSkPKjoXZaiYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefvddtiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphhtthho
    pegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvhgvmh
    esuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghhoohhg
    lhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepnhgvthguvghvsehv
    ghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrsh
    dqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdr
    shhouggvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:hnLFaHA_Q9uIiIpla5UJXpGDBRtFSFbUp52aZW1TyWOjH0qBeaPbig>
    <xmx:hnLFaFuzUiR1tDH-1uhOsijwnsZJnC7eKkYE42SztLj--dNe83Avdg>
    <xmx:hnLFaOLhuI_npxSpV5CCMBXPXV8nTSWuY349KqGZ0bSKdney6FlBRQ>
    <xmx:hnLFaEa_eeear1GtTkCwoL5BvBBY6eEveJl4iRitbItTzOSqeY4KMw>
    <xmx:hnLFaPD3cca31YtLhYXquWrQXuFgEHjhpvFckh0E-b4XOKqod1ryxhYa>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Sep 2025 09:32:53 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>
Subject: [net-next,v2] net: ravb: Fix -Wmaybe-uninitialized warning
Date: Sat, 13 Sep 2025 15:32:29 +0200
Message-ID: <20250913133229.2087822-1-niklas.soderlund+renesas@ragnatech.se>
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

Warning was found when cross compiling using aarch64-linux-gnu-gcc (GCC)
15.1.0.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
---
* Changes since v1
- Expand commit message with compiler version used to produce the
  warning.
- Added tag from Przemek Kitszel, thanks!
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


