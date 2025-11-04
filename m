Return-Path: <linux-renesas-soc+bounces-24108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3773C33368
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:26:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F4B118980D1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 334F82FD1BC;
	Tue,  4 Nov 2025 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="SW0/eX4R";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="1WIShCCR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1B30CD94;
	Tue,  4 Nov 2025 22:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295096; cv=none; b=gSUyBYrcy8ETph1ubxgLzlkEKtZKRrXqHq5JuvkBiRL7eEEeitIXippy96ZT6p4wfX8DsCfxEZ63dLVgIu6TKLsbrgx4K7M2D77NK5VgH5sTU+H8GFSQ1/zj3eu6V391jX/sY+JklXCgjwwj6GLed4dDE3hFKm8vJHfy8nnHGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295096; c=relaxed/simple;
	bh=/D7lUPjnFT136z8COBQTZAcm/TdzeTQ7PZWIu2Qb218=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z/BKksTHmw08X/uwGOxhDk2xLtJyX8sLbHsPgthV4tyw9+fILCXPSWYAG8JHQFtIqBxKyE0eUhxMqF5MHxQYaT8kmFJ7/CbvgKlsHDYUC35tCvCnjgoQuUZqhKRnui7Bl9HFfB5Wm/bw8N5wEyvpkoiyO5I2TeCTF6sSgI8nMDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=SW0/eX4R; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=1WIShCCR; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 623EC14001F8;
	Tue,  4 Nov 2025 17:24:53 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Tue, 04 Nov 2025 17:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295093;
	 x=1762381493; bh=S8WAn15FgHBX5w3BG4pkg00em4UEkqUgTDXL4oc9FI4=; b=
	SW0/eX4RRaDvfTBtiLHyxQIpBbbN/m0QRroactXmma7CSAknYfNPRyVt6G8Yi9vO
	kB7B2MAsvHWfyavg1cCE9wgS0fWQTvK4X6VnfRRnQZXM3uQj8iDqojcO5dO3QY7u
	KKcQOnJLjNE3kakBSnTDZA8zeAB53455XMaHP3vDEpAyputk1fWteID/Lhf3t2o6
	IWSilbs9mjMRZvgxm6fevvxXHKXO6BUhlk6Gu/fOF87H08f+BMwz6uYZMExB65Al
	iWWVUXHaUGCmmQrn7IHeB3HACxOuEax9KqIZyFGthJ31qzamiDrbb8to8FBEqNQw
	o1MWauVwils5Dz0wuvBS7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295093; x=
	1762381493; bh=S8WAn15FgHBX5w3BG4pkg00em4UEkqUgTDXL4oc9FI4=; b=1
	WIShCCRITKrSIVRgBOb3tufMheh0zKTWHMqzAZQUDc+mJKKQqn5sHINFx31LNc00
	urYewYd3weyD5XPuUSnwiTLDggQSB+uT8hU1xnK29iQakMEqpRx/5B6rzyOoGdw9
	nQfFGp81hxG5yAu6mWshGqC7Qf6U9RuCggLmo84rO88mfdUT208BUs8/6rm+WWKO
	/kS6ugnKOm9AWBtRvFEkmjRF7Gx/lYfdf7a2s/nngrkVH6bHp6xQ3O+IEPG6l/6C
	01nqPgooBnktSdfFmqH/ctIfFKisGxdwzUd2ZzT4X3G9BXu+8mOJrVkUldlAdiN7
	h9NExbeXaIhyPrkeTMKKw==
X-ME-Sender: <xms:NX0KaVaFNobW7ZoorVPurHV506UaIaQYsYDjaXdkof_h6ERq4b8eCg>
    <xme:NX0KaS6ptwVqKgL7zbGMszqgtQFdSQW9lFpzbShqMJWckrs9asu9G9XaWLdE5FvUa
    sD56OgjvkHXZgaeJlenwnYt0H8KqPRoq08K6n1Biig162VVmvxilegF>
X-ME-Received: <xmr:NX0KaV9nhOQid5v9FNTjSFjX8Zlt3NwkbnoJW3OEIH7X1XT7fGuHecMwcxJdCvNjtrQBwXx9OTLTKLZ7mqMQ2vib>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhi
    hhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:NX0KaWapffz89z1IW8AyRvKTep-y3__NhQGo3X57NUesP_CGQfpphw>
    <xmx:NX0KaW6nqH9ViEc9XHMFbQ5Glf0YalCdyurkVYwILFOS4dQCmGFkAQ>
    <xmx:NX0KaTkRajzTP_myGJ1n1BwLE29gsn_5Fks5TbbOTVDuSTeOytAZWg>
    <xmx:NX0KaeHYpRpKVhCl27hN9Who4jg45huumUF6huLpFhx62IW7TeTjyw>
    <xmx:NX0KabwY6Faz5cI8pzusN52t3Y9RUQYaxL4WGy9EA15e9_I-tWd3k7Cv>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:52 -0500 (EST)
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
Subject: [net-next,v2 4/7] net: rtsn: Use common defines for time stamping control
Date: Tue,  4 Nov 2025 23:24:17 +0100
Message-ID: <20251104222420.882731-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
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

One thing to note is that the bit-wise and check in rtsn_rx() of
RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT is replaced with a not set check of
HWTSTAMP_FILTER_NONE. This is okay as the bit of device specific event
replaced was set for all modes except HWTSTAMP_FILTER_NONE.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Expand commit message about the non-obvious transformation of of
  'priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVET' to
  'priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE'.
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
2.51.1


