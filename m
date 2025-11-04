Return-Path: <linux-renesas-soc+bounces-24111-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FEBC33359
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBD0A4E1AB2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3380233CE83;
	Tue,  4 Nov 2025 22:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="lGrxAq8g";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HhshfrsS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47097314A66;
	Tue,  4 Nov 2025 22:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295102; cv=none; b=OXZPYyC6lBdH+ugi9Qnyn0X6oINlC4ISeiMLTw/1hz5w3d7+AZl0F+F9kWx2FP+iNUgdnpOKUoPt9ATlBAMvLy/pMWs5pbFHjx74YtFf4JPO0bL/hawQhavZjQw9ukqE44OYiAA0V2ns9SMkxNU+RbYfaHd7d/eQr3GED/YX99E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295102; c=relaxed/simple;
	bh=l0DV/lSITlKkdsoJYcW2yksRsMDzFGeenVY+QXzI1bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fsu3YNj9QknhCTPONnZnKxDMc1+vM82YD8gHheMPLO/1i02lQVhl9FnjPefKzPngIugpcDiCsVJ8ary/if7+5uC7XOQNDEhHervEv90MEEOWmQgy79+ORLaBSH7iSy4uupy94NcQapUFWljTnj57jCGQwCT36fMFEydnTegIX7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=lGrxAq8g; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HhshfrsS; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 903BB14001F8;
	Tue,  4 Nov 2025 17:24:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 04 Nov 2025 17:24:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295099;
	 x=1762381499; bh=RcS2flCsx3a7OCi0VqyqLM7a4O20hkmr2k+zuH4YgYo=; b=
	lGrxAq8gxTFW0hNYj9cuyMN5wB0Jrol5s9dMDuETBiT3d1At2pw7j/D4Kymd/ER6
	3PUS0H8HwQ5OIWtebAFF2AhvQLVE23ueDYry9Y7NhfB7renIS3k/bs9tnBc8whkF
	pkESc0/ZycYMeC8o0giEsNdpyMaV2TTc/XNdfMO+7/O5pcazwFGa0JqjJHcXfcbu
	bBvR7FqEXtgnCd8Ojk+q/IJ+iaFBvjH9yYTr/i01gQlYQy+pfkV5Zlt6AJy4+g4A
	ZhRwrG8LZOOKyMri/yZ39HdUxgWRBte/89ad7tTCtXyRT07xyAy9PLBvI/WDELP8
	ejizBte3cBRlmiBQXzYhYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295099; x=
	1762381499; bh=RcS2flCsx3a7OCi0VqyqLM7a4O20hkmr2k+zuH4YgYo=; b=H
	hshfrsSrBIMxNbwkUitdlMjonuTWZE0h/3rIvEBbNqfUndqBDvzNUyVRkFQAZwnL
	C4+bc/kRezNB6asf1Hd2E0xLY6BY4EvYzXbCkG3w+yIgVSg1prAOo9SwlAU37XeT
	NHW3MoEo/Wu8H/mMNS10OEIZXS0GqfSifJTTkLN4j6o15Ennzs8NE4RFcuWDb0/d
	GYXafXbjDklAVv0rRDbEGMcT0Zi7AqTh5FA4oVLaBOp85VxhwzQMbOP50vI4Mbwc
	mZMi0Y5ppRBL1lyzAYzJGhwmcUhHs1pHRiCWsPaQq+UPNcfiY3sx5xDZkvtD+UBo
	PnQjv2P9qbkySc4Z7RR9g==
X-ME-Sender: <xms:O30KaTagI_BSuu-267CyhoPya7opZj2b3awuBJ1nOowc1f3BADuvbQ>
    <xme:O30KaY5aUSyYkSzA3JT02c7-Xt6pomLEw5ktYX-0VsohLeFrhzOuZ-vHoWdPptCXq
    2xhzFzJoRZekFRyalOnm4H6_zRZZEZ3N6nTv6EiDVUEKy3NhKaLy__->
X-ME-Received: <xmr:O30KaT8t0S0pm29nTR-IrZiqgas8Fa2jTNnJRX0e-S4YJQgm4Vt4VQ2THZCrcQRBt2IEMXNEqKuX3v4Dj_uRctVs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedufedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhi
    hhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:O30KacYpddZyPWj6-hrlKbxeCCzDiyFaBn_Ab2pa9gjUxvrAMEZIDw>
    <xmx:O30KaU6Q4EPH9krfweAuT8ddTg3DfFMKWf_SyiA-wim4zaQflRRUXA>
    <xmx:O30KaZl48fHPI2weEe78bRyIpAZR-fWoXL9sXb7_5lZE9rZ5R4c2ag>
    <xmx:O30KacEcrZhZ6Ai9Znav1PR81pLSZOJs-x19VJfPxP8NJ8z6-QrTzw>
    <xmx:O30KaRy1__H5SEGOUapAb9OiXwhX9UeRnLNJ5bG6bSBIg3TqNZWKE7dM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:58 -0500 (EST)
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
Subject: [net-next,v2 7/7] net: ravb: Use common defines for time stamping control
Date: Tue,  4 Nov 2025 23:24:20 +0100
Message-ID: <20251104222420.882731-8-niklas.soderlund+renesas@ragnatech.se>
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

The change from a device specific bit-field track variable to the common
enum datatypes forces us to touch the ravb_rx_rcar_hwstamp() in a non
trivial way. To make this cleaner and easier to understand expand the
nested conditions.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      | 14 ++-------
 drivers/net/ethernet/renesas/ravb_main.c | 37 ++++++++----------------
 2 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index d65cd83ddd16..5e56ec9b1013 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -35,16 +35,6 @@
 /* Driver's parameters */
 #define RAVB_ALIGN	128
 
-/* Hardware time stamp */
-#define RAVB_TXTSTAMP_VALID	0x00000001	/* TX timestamp valid */
-#define RAVB_TXTSTAMP_ENABLED	0x00000010	/* Enable TX timestamping */
-
-#define RAVB_RXTSTAMP_VALID	0x00000001	/* RX timestamp valid */
-#define RAVB_RXTSTAMP_TYPE	0x00000006	/* RX type mask */
-#define RAVB_RXTSTAMP_TYPE_V2_L2_EVENT 0x00000002
-#define RAVB_RXTSTAMP_TYPE_ALL	0x00000006
-#define RAVB_RXTSTAMP_ENABLED	0x00000010	/* Enable RX timestamping */
-
 enum ravb_reg {
 	/* AVB-DMAC registers */
 	CCC	= 0x0000,
@@ -1114,8 +1104,8 @@ struct ravb_private {
 	u32 rx_over_errors;
 	u32 rx_fifo_errors;
 	struct net_device_stats stats[NUM_RX_QUEUE];
-	u32 tstamp_tx_ctrl;
-	u32 tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
 	struct list_head ts_skb_list;
 	u32 ts_skb_tag;
 	struct ravb_ptp ptp;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 5477bb5c69ae..1680e94b9242 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -950,13 +950,14 @@ static void ravb_rx_rcar_hwstamp(struct ravb_private *priv, int q,
 				 struct ravb_ex_rx_desc *desc,
 				 struct sk_buff *skb)
 {
-	u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
 	struct skb_shared_hwtstamps *shhwtstamps;
 	struct timespec64 ts;
+	bool get_ts;
 
-	get_ts &= (q == RAVB_NC) ?
-		RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
-		~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
+	if (q == RAVB_NC)
+		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+	else
+		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 
 	if (!get_ts)
 		return;
@@ -2424,18 +2425,8 @@ static int ravb_hwtstamp_get(struct net_device *ndev,
 	struct ravb_private *priv = netdev_priv(ndev);
 
 	config->flags = 0;
-	config->tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
-						 HWTSTAMP_TX_OFF;
-	switch (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE) {
-	case RAVB_RXTSTAMP_TYPE_V2_L2_EVENT:
-		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
-		break;
-	case RAVB_RXTSTAMP_TYPE_ALL:
-		config->rx_filter = HWTSTAMP_FILTER_ALL;
-		break;
-	default:
-		config->rx_filter = HWTSTAMP_FILTER_NONE;
-	}
+	config->tx_type = priv->tstamp_tx_ctrl;
+	config->rx_filter = priv->tstamp_rx_ctrl;
 
 	return 0;
 }
@@ -2446,15 +2437,13 @@ static int ravb_hwtstamp_set(struct net_device *ndev,
 			     struct netlink_ext_ack *extack)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	u32 tstamp_rx_ctrl = RAVB_RXTSTAMP_ENABLED;
-	u32 tstamp_tx_ctrl;
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
 
 	switch (config->tx_type) {
 	case HWTSTAMP_TX_OFF:
-		tstamp_tx_ctrl = 0;
-		break;
 	case HWTSTAMP_TX_ON:
-		tstamp_tx_ctrl = RAVB_TXTSTAMP_ENABLED;
+		tstamp_tx_ctrl = config->tx_type;
 		break;
 	default:
 		return -ERANGE;
@@ -2462,14 +2451,12 @@ static int ravb_hwtstamp_set(struct net_device *ndev,
 
 	switch (config->rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
-		tstamp_rx_ctrl = 0;
-		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
+		tstamp_rx_ctrl = config->rx_filter;
 		break;
 	default:
 		config->rx_filter = HWTSTAMP_FILTER_ALL;
-		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_ALL;
+		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
 	}
 
 	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
-- 
2.51.1


