Return-Path: <linux-renesas-soc+bounces-21906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E8B59332
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:17:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B651BC4641
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:18:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87DE1303A21;
	Tue, 16 Sep 2025 10:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="dEav8w7j";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JAUNGZvU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E9530274A;
	Tue, 16 Sep 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017822; cv=none; b=Z54je2VHZc1deyRA1q0rCKcu4Whs/1etJ1MB7SSLMHFSCQl7zIHu50tnP/WC4l2zU2b431XDlw5dvNx56SjAr/V8XMD/0mRp8Tyck/OtxxsI7sn+8JX/Lzoh1PE55liL2cckY1Q0+Kk18iRFgWAEpooCNKPqXxc2QSaaesGa+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017822; c=relaxed/simple;
	bh=NhQJqwko+BNkP7kanUwmA2MZ/l0SjFCqzAmVDzeNSPI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IsAK8GWv6NY3PLnCW5NhfA/yHfHI11bqRSY0U3R3iD4vuFIRuTIYkG22bD0wwMmvB6UjsRLGvBPbUXx1KvfJagE6eebaupOl8bXBM5VOTiGjnCgVdFwQlSbFIcMnWg2ys1Ym14P+ecXsyj4IrcmaWuUmySomz3RPIKoqi+Tj+l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=dEav8w7j; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JAUNGZvU; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 81A971D0025B;
	Tue, 16 Sep 2025 06:16:59 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 16 Sep 2025 06:16:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758017819;
	 x=1758104219; bh=e7D0mH805fffMZNtEPvJ+9Bd181jy35qfSr+dSt8EVs=; b=
	dEav8w7j/c+TMArRy89CRyMzs9VM4PutHGPhHu/kKPfJwXzPqw/i24qh02MPhk2R
	fmfBtMOJKHAR7YuBticIG1DZ+9d10jktcepfXbiViiXNAK1R1h3U9z3FM3NSJQJ1
	CvJuHWKYJmxkPPGhJSrdSYSCzeTKN82UHip6lf2NK73f/s/p7HvbkYHrl0JGOreR
	TBvwTQ+6Rhwb+/MCxc3uCXOUdVfL/Mdlr4XfmQgof7eZwVfQt6fD7k+6YfHkSwdu
	EqX5OMkx6tRcNkKxkh90lmDQQgD4w9cKDgO6Xj6X7rrX1/taVHWRRcTqJEAHLinj
	ms3bYHnmMllq8F31OOxevQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758017819; x=
	1758104219; bh=e7D0mH805fffMZNtEPvJ+9Bd181jy35qfSr+dSt8EVs=; b=J
	AUNGZvUJvx355MsXe25o2szlR9sf/8HJMS1RMs4U+I5TlFxSBjexFg/O5db/Biri
	iK718IAK3+goi8LhADYjdis/yxXW52gNshKcWwz9NNUYLEdaPgPOdFRlB4HjlevQ
	dXHIry+QVehuTziDOmwDvWDqZ6U7gHAAKb0R1R8k8uTc2o1wKtWIZuDJy1yUV6Df
	0UnhPNP4r8XB9E5xjmk9V/D1Q9tIRcVBz5zqzvV0l/BEJv1zWPQ/9zueyFZDNib+
	5E1LIlxA/HzgRcxoFpD2pazbWXHQ7daQLWmw+gtTVnB4yzY3c+VlPLvwUanjWbIk
	WBmlq3mkxlIydDHiqhXpw==
X-ME-Sender: <xms:GjnJaDQqm5Ec5RZA2n3Q-ACCJbEtBeBrxaaX9PjCNfS2QthHmkp3sA>
    <xme:GjnJaO261f-IOrWbHzEWhuW_86XYTQT0Kh8b010B9Ih65oZoke7-K7rQp3C3K2WIG
    LFa31Eyeb5PxYC3vi8>
X-ME-Received: <xmr:GjnJaNzQF9oPa84qnS7MvgPkjm6v2p5QJJboRLjm1fi48CTMT74UMZeB3MC3vYNN_ytVIxbtZmcm0zp5ScQk-1Howg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdefudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeutdef
    hfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepudefpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehprghulhesphgsrghrkhgvrhdruggvvhdprhgtphht
    thhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdrtghhpdhrtghpthhtohepuggrvh
    gvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopegvughumhgriigvthesghho
    ohhglhgvrdgtohhmpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehprggsvghnihesrhgvughhrghtrdgtohhmpdhrtghpthhtohephihoshhhihhh
    ihhrohdrshhhihhmohgurgdruhhhsehrvghnvghsrghsrdgtohhmpdhrtghpthhtohepgh
    gvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdprhgtphhtthhopehmrghgnhhu
    shdruggrmhhmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:GznJaKx4hw4KqwzBuJuaGXhUMb9TCHs055VV63jDn13arXf5liTeLw>
    <xmx:GznJaJ_cburCgkdJUJzWs7-MsNTOt6cGGn3hEYCFPsoYZWuvtaSx4Q>
    <xmx:GznJaE8Xdnc1eVdJmyrWhuvR_I89t04p1YxH3MkvuL5Q-rR36NP2Sg>
    <xmx:GznJaB4ujSVdUfSD-p7iK0fiC6WJ6eJ4845kefGkdDxjEzAo5IOgAw>
    <xmx:GznJaMgvaFBpXaufbkl8eXt1hZyyYOlxPE3gPmwWtTxneXup8CJRZZJ4>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:16:58 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Paul Barker <paul@pbarker.dev>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 4/6] net: rtsn: Use common defines for time stamping control
Date: Tue, 16 Sep 2025 12:10:53 +0200
Message-ID: <20250916101055.740518-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
References: <20250916101055.740518-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of translating to/from driver specific flags for packet time
stamp control use the common flags directly. This simplifies the driver
as the translating code can be removed while at the same time making it
clear the flags are not flags written to hardware registers.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/rtsn.c | 36 +++++++----------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 958c19808472..fdb1e7b7fb06 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -165,8 +165,7 @@ static int rtsn_rx(struct net_device *ndev, int budget)
 	unsigned int i;
 	bool get_ts;
 
-	get_ts = priv->tstamp_rx_ctrl &
-		RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+	get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
 
 	ndescriptors = priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
 	rx_packets = 0;
@@ -1133,21 +1132,8 @@ static int rtsn_hwtstamp_get(struct net_device *ndev,
 	priv = netdev_priv(ndev);
 
 	config->flags = 0;
-
-	config->tx_type =
-		priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
-
-	switch (priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
-	case RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT:
-		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
-		break;
-	case RCAR_GEN4_RXTSTAMP_TYPE_ALL:
-		config->rx_filter = HWTSTAMP_FILTER_ALL;
-		break;
-	default:
-		config->rx_filter = HWTSTAMP_FILTER_NONE;
-		break;
-	}
+	config->tx_type = priv->tstamp_tx_ctrl;
+	config->rx_filter = priv->tstamp_rx_ctrl;
 
 	return 0;
 }
@@ -1156,9 +1142,9 @@ static int rtsn_hwtstamp_set(struct net_device *ndev,
 			     struct kernel_hwtstamp_config *config,
 			     struct netlink_ext_ack *extack)
 {
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
 	struct rtsn_private *priv;
-	u32 tstamp_rx_ctrl;
-	u32 tstamp_tx_ctrl;
 
 	if (!netif_running(ndev))
 		return -ENODEV;
@@ -1170,10 +1156,8 @@ static int rtsn_hwtstamp_set(struct net_device *ndev,
 
 	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
-		tstamp_tx_ctrl = 0;
-		break;
 	case HWTSTAMP_TX_ON:
-		tstamp_tx_ctrl = RCAR_GEN4_TXTSTAMP_ENABLED;
+		tstamp_tx_ctrl = config->tx_type;
 		break;
 	default:
 		return -ERANGE;
@@ -1181,16 +1165,12 @@ static int rtsn_hwtstamp_set(struct net_device *ndev,
 
 	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
-		tstamp_rx_ctrl = 0;
-		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		tstamp_rx_ctrl = RCAR_GEN4_RXTSTAMP_ENABLED |
-			RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		tstamp_rx_ctrl = config->rx_filter;
 		break;
 	default:
 		config->rx_filter = HWTSTAMP_FILTER_ALL;
-		tstamp_rx_ctrl = RCAR_GEN4_RXTSTAMP_ENABLED |
-			RCAR_GEN4_RXTSTAMP_TYPE_ALL;
+		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
 		break;
 	}
 
-- 
2.51.0


