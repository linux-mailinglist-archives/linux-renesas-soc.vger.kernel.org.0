Return-Path: <linux-renesas-soc+bounces-9491-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E09916AD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 14:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F5B1C21868
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Oct 2024 12:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1696146592;
	Sat,  5 Oct 2024 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="KOEL0f3i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XGzaskth"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5986B82D91;
	Sat,  5 Oct 2024 12:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728130486; cv=none; b=O81vfwxO2u/ygKYtZlmlRI6Kn0y/f9MUlH4GX0J3Ft/1YEBlWdC9VlsWqwmN8L945KWbnBBCBMnCMbKSUriJEM61TY3V7CFEwl88oVOmylal4DFXCOs8K+UEFbTOHqtFozuFA2CN+eqw4v6BfSHOByf9BO4sWzRCh+q2CDMO+4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728130486; c=relaxed/simple;
	bh=15rpesOcgvReI7DlF8CwMLuBf2Oy95zftQgLhJ9YqCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lGujuhXk/iVKxOMySymGeZur2pi5oQ/oTDUzfxssPiLQ/qBVbBhiMdOyxkFGrrOLuY3Gc7sRLFgBMu91p5anFdHpaOmvkuLfp4pQTtwySzGHkKwj68bk0foAWZR/5r1uxCGxjI3WaXNS5xUpfSSwpTuCfiH8ilEiAmUXshU2nDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=KOEL0f3i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XGzaskth; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id BAC70114009B;
	Sat,  5 Oct 2024 08:14:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 05 Oct 2024 08:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1728130480; x=1728216880; bh=t5
	9E6EE7ArB6eFoiXHmIEDwNFICy/voPCMzqbP1P1y0=; b=KOEL0f3iz2QIj1sPjC
	42IYxxTVpky5u/nZNE0812terRCFj4m3CrQF+x/zdzxEy6h6t9oee3CVd6+YPxq0
	0Z8qKbEpFscOLHAGHM3ItkZp5NRYo92qRcber4Tjk6UU9kW6uVqg6ZhMlJLrSgNN
	XoQvAYALcE5lxWNszTu+qKj+HV0mxf6DHSOo5lLbvu2Gm+emOMZ02FLh6JvELDY5
	WOnCrmSDrIp4kpJgMcAD+D3UNOwm2aQepzhKFBn2TLkMWDSCz+NssqxA95wbphoJ
	GJDR0rZU28XGhBg6azdwKPxtdLhS4lG2XLu0DdWlBUqWbNbTe7q6kpNfrV6Rcg8R
	QqeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1728130480; x=1728216880; bh=t59E6EE7ArB6e
	FoiXHmIEDwNFICy/voPCMzqbP1P1y0=; b=XGzaskthhy3cgzaVpFqGttCYlfkbR
	4T93FSpuelChSKg2JKHe0yQ1t10tCcq3hW8ZaiMFAm0UNoeNPtitgOUZTsmg63FW
	qQ6h4lp8jvWD7N5wv7f4xfpwlqX+tWh5+2D6QU4U7trhJe43EY7rt5QvKlgQrg+R
	onAOx8RwTr/EKCz26FYJ82QPBpaw9eWLijMZAyAKTA4ScG4Ewh+MhjjyouWabA6b
	65IrJy3jGQJiXdcgOkqgu7fennh+oJytoKZfuXuj9VhxovKmQBZWvL5PG/tNSIzE
	aFqlOrANA9gwpfypTqD05z2RjgPMulJsqz+yvc41rWMzp/WJT+cG6alWQ==
X-ME-Sender: <xms:ri0BZ256FAaQW9hKQoqXqR4bvYDqCbQpb-b4JNOILGNZ-PBIEuJLTQ>
    <xme:ri0BZ_4QFYahEUal-Nn6FnVhaGLw_HqcPsyEgvTnLKDfUBJtGAq983Jyrq1nu9-0i
    uupPLR7rByJK1YWHyU>
X-ME-Received: <xmr:ri0BZ1fIxOkjpkDD54cpBRD737wOTK5zievd5RFpwO6rgx7yUFC3Nw5DXtB9XeTSH7SrZKnXWgMUriqlgtmyO1EZMQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvhedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecu
    hfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrh
    hluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgv
    rhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfeetge
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhk
    lhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtth
    hopeduvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshdrshhhthihlhihohhv
    sehomhhprdhruhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpd
    hrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehk
    uhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgrsggvnhhisehrvgguhhgrth
    drtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgdruhhjsegsphdrrhgv
    nhgvshgrshdrtghomhdprhgtphhtthhopehprghulhdrsggrrhhkvghrrdgtthessghprd
    hrvghnvghsrghsrdgtohhmpdhrtghpthhtohepsghijhhurdgurghsrdhjiiessghprdhr
    vghnvghsrghsrdgtohhmpdhrtghpthhtohepphhrrggshhgrkhgrrhdrmhgrhhgruggvvh
    dqlhgrugdrrhhjsegsphdrrhgvnhgvshgrshdrtghomh
X-ME-Proxy: <xmx:ri0BZzLj3rt-gL4i5pNsTPvKWk0byFa0CkOZx-MGl25_BXt2LttbZQ>
    <xmx:ri0BZ6JsYUiYfljQsPcNWsRHDB-wurSpC2djxoI0a-Pa0mh_yPlI-w>
    <xmx:ri0BZ0xpU3smcDBFXpyDEP_APFctxvqZJnpnq3hTXmo92riQ7TmGKg>
    <xmx:ri0BZ-Kuy99w7IZMIYkokstvFva0RIS2NoSpccejpXUomMANgCgzjQ>
    <xmx:sC0BZ8ArKQ94W-jX1F3qg3K34E84I1XcjS5x5ZndoA94d9SJF3MJ8jGL>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Oct 2024 08:14:38 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next] net: ravb: Only advertise Rx/Tx timestamps if hardware supports it
Date: Sat,  5 Oct 2024 14:14:11 +0200
Message-ID: <20241005121411.583121-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Recent work moving the reporting of Rx software timestamps to the core
[1] highlighted an issue where hardware time stamping where advertised
for the platforms where it is not supported.

Fix this by covering advertising support for hardware timestamps only if
the hardware supports it. Due to the Tx implementation in RAVB software
Tx timestamping is also only considered if the hardware supports
hardware timestamps. This should be addressed in future, but this fix
only reflects what the driver currently implements.

1. Commit 277901ee3a26 ("ravb: Remove setting of RX software timestamp")

Fixes: 7e09a052dc4e ("ravb: Exclude gPTP feature support for RZ/G2L")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb_main.c | 25 ++++++++++++------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index d2a6518532f3..907af4651c55 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -1750,20 +1750,19 @@ static int ravb_get_ts_info(struct net_device *ndev,
 	struct ravb_private *priv = netdev_priv(ndev);
 	const struct ravb_hw_info *hw_info = priv->info;
 
-	info->so_timestamping =
-		SOF_TIMESTAMPING_TX_SOFTWARE |
-		SOF_TIMESTAMPING_TX_HARDWARE |
-		SOF_TIMESTAMPING_RX_HARDWARE |
-		SOF_TIMESTAMPING_RAW_HARDWARE;
-	info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
-	info->rx_filters =
-		(1 << HWTSTAMP_FILTER_NONE) |
-		(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
-		(1 << HWTSTAMP_FILTER_ALL);
-	if (hw_info->gptp || hw_info->ccc_gac)
+	if (hw_info->gptp || hw_info->ccc_gac) {
+		info->so_timestamping =
+			SOF_TIMESTAMPING_TX_SOFTWARE |
+			SOF_TIMESTAMPING_TX_HARDWARE |
+			SOF_TIMESTAMPING_RX_HARDWARE |
+			SOF_TIMESTAMPING_RAW_HARDWARE;
+		info->tx_types = (1 << HWTSTAMP_TX_OFF) | (1 << HWTSTAMP_TX_ON);
+		info->rx_filters =
+			(1 << HWTSTAMP_FILTER_NONE) |
+			(1 << HWTSTAMP_FILTER_PTP_V2_L2_EVENT) |
+			(1 << HWTSTAMP_FILTER_ALL);
 		info->phc_index = ptp_clock_index(priv->ptp.clock);
-	else
-		info->phc_index = 0;
+	}
 
 	return 0;
 }
-- 
2.46.2


