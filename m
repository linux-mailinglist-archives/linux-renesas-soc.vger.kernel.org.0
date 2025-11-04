Return-Path: <linux-renesas-soc+bounces-24107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF5C33347
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:25:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1FD5734B09F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CD131327F;
	Tue,  4 Nov 2025 22:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BXh9ShqK";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pp0a/Guy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0322C15BC;
	Tue,  4 Nov 2025 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295093; cv=none; b=jxr8TwHfVxIQMdndP3AR9DYdbaDsv4o1/NmkKyl0ISx1lmBRnzjqGWVj4F7WZrZ4keVx2sZxMkCizs6mPzI49qOOmWSICuifh280ib2Ic63SoiodGqvHWCKvVplP/M6SXYPC/Z5MQ8Op+9xa1gFPXTI6jE5hrYyDDs0xNe6elZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295093; c=relaxed/simple;
	bh=hp7Tl77baBvBZsO9nXZ10kX7oZp7fn+SNNYPTm6S8JE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IHmXFcg7pecvjIWoiAhHICa/3J72OMdnKcsjuuzhzvCVfJNzQXMcLkHMYBs4ERm8xYzjg5MDsK7l87h+Fq2zKcyV8qSGiEtFBZvnYGNw1GJCFETyOgqoibGpmYSnOl0okCeb0txkBbvT3ChwrlXOqTZ7VwOgRt90Mk1Tw2NUKNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BXh9ShqK; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pp0a/Guy; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 5CCB9EC051A;
	Tue,  4 Nov 2025 17:24:51 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 04 Nov 2025 17:24:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295091;
	 x=1762381491; bh=JzqAmrDmKl6HM9QaTge6ZU2DA0s9oVXuEQ9zBhYkhaQ=; b=
	BXh9ShqK0t7yfmmKlXbhSHMh1r+ttall/Y1Dmrib1VEulpZzls/ZPtKcBcmHcg+J
	g0B+ynqrcxOd9IbMHuxlZCs2ii+BTh3vj93NunI2/gMo69Wx8uKZPOxYFcqp6Fi+
	omhVcUDVYWe7qZ/cWxsK0uiIjFtif8G0ZTgR+0mp8KW2SnfS07fD7WBLF0BIRrfK
	x1w4UoMWMjHFUAGqSkESfxFvBmZiF4iSHlbB8Kk2VOli9+e91aHnGWx1p0OZEH/T
	vEdX9sjXA5RpSSxayWAPvOurBwuhrmlTF9YRFJFGyPDG+V4T6dGfRyQ3JWE6mKBE
	gnRt6E1B3uVQv6j69V2EbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295091; x=
	1762381491; bh=JzqAmrDmKl6HM9QaTge6ZU2DA0s9oVXuEQ9zBhYkhaQ=; b=P
	p0a/Guyq4s0sWKi2JyIXl7UwRn9zTKlfoVnCb2GQ/yxT12GEZMcGKg7QtX8a56ot
	RPww3vcmRz4IpYXCsSsanWqNZNUmKj+KJuyQk+DTqdlvTf7lzBSkUjHzvg6qOgK0
	Db5W4H760feCUtaD3SQsFR4sFat6S3pm6f2dbP0PxRW+wSWp5J0gnDqiWKLCT/An
	F5uSWvk6l4d5cdQ8eS0LWws4Es3JlwDgRgxU7TV4CwIAFAQSUP9Gg0oqihpJfeCN
	qVY1u+5SKf7qNEu5I1fW3Y/GMIUvxtbwFA4bl9xyDdqxeHHYVDEQAsbhAEuUVdUI
	tjA9d+Rk2oIghkIbbc0WA==
X-ME-Sender: <xms:M30Kad351slmNp9pToEGbGcQU_7BRYD0ISwCbVX76LVEDk3gJvybbg>
    <xme:M30KaamQLng0NG493sXiuRe4aAhmwwlPpLGG1FkxUtPLUiGMekBkjvOmzbj091-L4
    shdDmdxg73ykmqiVyCNzkmCCwO376VaHnItCJKY_TxCE5XKhzFJQm6e>
X-ME-Received: <xmr:M30Kab54gYQ_o7rrmPXquDXS-gyW01YvxBj7VxULjBZj65dx7kIySazJ494zWucQSD7vjADwdo8YY8oyRG_dAyGk>
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
X-ME-Proxy: <xmx:M30Kadlobd5fEJBfNqx9xnfco6C2V1kWfc_N69gWJHflw4RPISHjXw>
    <xmx:M30KaWV9wlCekY1SbFDzXuLj0nRpi_sq4I1sK3M9SIyWzV20SFX3nQ>
    <xmx:M30KaWQVWuz0cPK83Jbs2F6DIZX83gFAPvRdkuLi_JAXkKTdX4xPpw>
    <xmx:M30KaTBBOsmoEz0rJVRmE82ZLfjABVkwSRxr3zP_bRL86I8vMWUZ5A>
    <xmx:M30KaQ8vzywFH9u7QReXApRUA6WjkpcET1OdMdVQ6abOdSpYvVyDifQr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:50 -0500 (EST)
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
Subject: [net-next,v2 3/7] net: rswitch: Use common defines for time stamping control
Date: Tue,  4 Nov 2025 23:24:16 +0100
Message-ID: <20251104222420.882731-4-niklas.soderlund+renesas@ragnatech.se>
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

One thing to note is that the bit-wise and check in rswitch_rx() of
RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT is replaced with a not set check of
HWTSTAMP_FILTER_NONE. This is okay as the bit of device specific event
replaced was set for all modes except HWTSTAMP_FILTER_NONE.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Expand commit message about the non-obvious transformation of of
  'rdev->priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVET' to
  'rdev->priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE'.
---
 drivers/net/ethernet/renesas/rswitch.h      |  4 +--
 drivers/net/ethernet/renesas/rswitch_main.c | 32 ++++++---------------
 2 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 3b348ebf6742..aa605304fed0 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1064,8 +1064,8 @@ struct rswitch_private {
 	bool gwca_halt;
 	struct net_device *offload_brdev;
 
-	u32 tstamp_tx_ctrl;
-	u32 tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
 };
 
 bool is_rdev(const struct net_device *ndev);
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 31aabc6fc462..e14b21148f27 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -845,7 +845,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 		if (!skb)
 			goto out;
 
-		get_ts = rdev->priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		get_ts = rdev->priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE;
 		if (get_ts) {
 			struct skb_shared_hwtstamps *shhwtstamps;
 			struct timespec64 ts;
@@ -1802,20 +1802,8 @@ static int rswitch_hwstamp_get(struct net_device *ndev,
 	struct rswitch_private *priv = rdev->priv;
 
 	config->flags = 0;
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
@@ -1825,18 +1813,16 @@ static int rswitch_hwstamp_set(struct net_device *ndev,
 			       struct netlink_ext_ack *extack)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
-	u32 tstamp_rx_ctrl = RCAR_GEN4_RXTSTAMP_ENABLED;
-	u32 tstamp_tx_ctrl;
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
 
 	if (config->flags)
 		return -EINVAL;
 
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
@@ -1844,14 +1830,12 @@ static int rswitch_hwstamp_set(struct net_device *ndev,
 
 	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
-		tstamp_rx_ctrl = 0;
-		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		tstamp_rx_ctrl |= RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		tstamp_rx_ctrl = config->rx_filter;
 		break;
 	default:
 		config->rx_filter = HWTSTAMP_FILTER_ALL;
-		tstamp_rx_ctrl |= RCAR_GEN4_RXTSTAMP_TYPE_ALL;
+		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
 		break;
 	}
 
-- 
2.51.1


