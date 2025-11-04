Return-Path: <linux-renesas-soc+bounces-24106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C935C3335F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 23:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682C018927FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 22:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B0172D12EF;
	Tue,  4 Nov 2025 22:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="beHuZGkd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vMjZc2CG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6283430CD94;
	Tue,  4 Nov 2025 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762295092; cv=none; b=nXhIGmlF69/IydPAsQZRoHQ2KwW1O8UsIYMzJd/RBdeFK1JwnteQW1JuKXOpnM4wJT2EqlYSOANG7tSDPYjuKAshUBu/CeF07wz2Qb6T6JOIYro+FJjsN33uqnecMWTJ3yzJ/qcbycf1HiCt/gs6WGsC47JZRjUQcVCgshwSqYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762295092; c=relaxed/simple;
	bh=2j0+TkQIX+HQLoN1BSoz92apBHtc9wQXIvQk/NqpMh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZuUrvU0Kvt38BRaUJfxVk3QcWEQ74oJBILDxTV+PiDD8N5q6h9ppX2ddco9b+qq5d+pHFBF6JCCwBCVfajH/qoGjIcpWeQjYv2BUlakVrm2emfwNwZ742XgVJ9tAx7arQiMOD38oZsnK74T5VuWgr+8MWlSjhSacDVjI4pI8Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=beHuZGkd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vMjZc2CG; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 698E8EC049B;
	Tue,  4 Nov 2025 17:24:49 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 04 Nov 2025 17:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762295089;
	 x=1762381489; bh=CfaH+AGcv1RCZut47AYks1siCPUG/mylrWLFcbx+pNg=; b=
	beHuZGkdyrWxePiGG34H/XxURz4BFge0ynHyODBtUXS3RfeCFZGYbVnzqsvo+fM3
	w3FVWKsfe7rKadoHQuZxkfIbMvonaGdmvnpINnIaa/ahPhQZxeDLawu0n+uNvi5N
	HErMRFy8tzMtDkzXnVfVJIU20wMXTGajWPTItytKb8LUqrQQZlX4qqBEIG6KC/x4
	N5/rNhZDh5/LaiR0VkNtIre7ZG89v/mbYOuGgkVvIzc92I+83LNBa/cI9kEaaV86
	kSSesVaG6KIOt+/LClP4yl9xqRyZyD7bjhFIbchKZl6WLiDk/CMizaSNOATyZD8U
	/nRnGVkwMY3tP5blhOiPBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762295089; x=
	1762381489; bh=CfaH+AGcv1RCZut47AYks1siCPUG/mylrWLFcbx+pNg=; b=v
	MjZc2CGeSr87LLKIuvJZVG5dq9G1lUEk2pTrKQOY0IpLN5/jmVJ6jgnS4yg+Apln
	LxEuwC9jZ7VgxDK9yCLlVJ7dx7vBk2xwpHLOYhUhSvTZ2R1frNbNTlBSjLTQiYo/
	ALfdsuDA0+QR71akv6pJSEZnRS9k8rYWjRaKIAfSzCxHm0LC/Wo6wpQx6uvlqe+R
	GnYk6jZFMV5oEPpYNKtHcqNizALX51s12w4nZwYu1SmQCK60Ad4XyyrTz9C/cgk5
	gWkfPwpmteIO1uEd5RtldPUSG5jKyHrpEfQYj2vntzlfYWroxdOmM+bpBlWoWDo3
	rG7W1fgMnDQrxTef8jVqQ==
X-ME-Sender: <xms:MX0KaZfLyi_gGGUZ8Pti4yIZHM3q7i_64rK5hlhnSsz8eHli7rJrWQ>
    <xme:MX0Kacag9l0JbbWrBQ4FOBDUgODCNbt8nfi2Jg1l_RMvh6oK37RfFolfv-f-NceKw
    3ptIn7B1QB3spC1dFkxy5K9-frJ9zdeyq_nkO3LGajUR5pITOm8fn65>
X-ME-Received: <xmr:MX0KaV7gZqAyS6Q-AGs-HJbfkytiMvi3t5Q5o9OH9QuvmNhucsx0J6DM53KkaqxDfEPyydhk5XdU37YQCD-iA8hb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueevuedt
    fefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhopedugedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepphgruhhlsehpsggrrhhkvghrrdguvghvpdhrtghp
    thhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurg
    hvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehg
    ohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepphgrsggvnhhisehrvgguhhgrthdrtghomhdprhgtphhtthhopeihohhshhhi
    hhhirhhordhshhhimhhouggrrdhuhhesrhgvnhgvshgrshdrtghomhdprhgtphhtthhope
    hgvggvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtohepmhgrghhn
    uhhsrdgurghmmhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:MX0KaSc7KLJkGw-KOdtxP6VcVHiIoNgHCMWHn-0ANkP4F8vIDNYu2Q>
    <xmx:MX0KaQzNtTzwtsZLgo5-oQaAZ1y8-Bk8r45XNLKPYXnaG6LpnK0PSw>
    <xmx:MX0KaQqWkd878qmVnPT4C6joVtWQ2ksYHWfKx9K6w5ZeTLXnNZlWaQ>
    <xmx:MX0KaWxvvT2RAgUQ8l3T8_5wTWUVb5qCBy3GUSSgr2g8Y-t5DkjigQ>
    <xmx:MX0KaWxbgWpa6ma2I5UQUH_UzQB6P86Dwy7Mxnii5-aEXj6-v0Li27tk>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 17:24:48 -0500 (EST)
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
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [net-next,v2 2/7] net: rcar_gen4_ptp: Move control fields to users
Date: Tue,  4 Nov 2025 23:24:15 +0100
Message-ID: <20251104222420.882731-3-niklas.soderlund+renesas@ragnatech.se>
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

The struct rcar_gen4_ptp_private provides two fields for convenience of
its users, tstamp_tx_ctrl and tstamp_rx_ctrl. These fields are not used
by the rcar_gen4_ptp driver itself but only by the drivers using it.

Upcoming work will enable the RAVB driver currently only supporting gPTP
on pre-Gen4 SoCs to use the Gen4 implementation as well. To facilitate
this the convenience of having these fields in struct
rcar_gen4_ptp_private becomes a problem as the RAVB driver already have
it's own driver specific fields for the same thing.

Move the fields from struct rcar_gen4_ptp_private to each driver using
the Gen4 gPTP clocks own private data structures. There is no functional
change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  2 --
 drivers/net/ethernet/renesas/rswitch.h       |  3 +++
 drivers/net/ethernet/renesas/rswitch_main.c  | 17 ++++++++---------
 drivers/net/ethernet/renesas/rtsn.c          | 17 ++++++++---------
 4 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
index 536badd798cc..1a1e43add129 100644
--- a/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
+++ b/drivers/net/ethernet/renesas/rcar_gen4_ptp.h
@@ -23,8 +23,6 @@ struct rcar_gen4_ptp_private {
 	struct ptp_clock *clock;
 	struct ptp_clock_info info;
 	spinlock_t lock;	/* For multiple registers access */
-	u32 tstamp_tx_ctrl;
-	u32 tstamp_rx_ctrl;
 	s64 default_addend;
 	bool initialized;
 };
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index a1d4a877e5bd..3b348ebf6742 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1063,6 +1063,9 @@ struct rswitch_private {
 	bool etha_no_runtime_change;
 	bool gwca_halt;
 	struct net_device *offload_brdev;
+
+	u32 tstamp_tx_ctrl;
+	u32 tstamp_rx_ctrl;
 };
 
 bool is_rdev(const struct net_device *ndev);
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 24ed33ac4bcd..31aabc6fc462 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -845,7 +845,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 		if (!skb)
 			goto out;
 
-		get_ts = rdev->priv->ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
+		get_ts = rdev->priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
 		if (get_ts) {
 			struct skb_shared_hwtstamps *shhwtstamps;
 			struct timespec64 ts;
@@ -1799,14 +1799,13 @@ static int rswitch_hwstamp_get(struct net_device *ndev,
 			       struct kernel_hwtstamp_config *config)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
-	struct rcar_gen4_ptp_private *ptp_priv;
-
-	ptp_priv = rdev->priv->ptp_priv;
+	struct rswitch_private *priv = rdev->priv;
 
 	config->flags = 0;
-	config->tx_type = ptp_priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
-						    HWTSTAMP_TX_OFF;
-	switch (ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
+	config->tx_type =
+		priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+
+	switch (priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
 	case RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT:
 		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 		break;
@@ -1856,8 +1855,8 @@ static int rswitch_hwstamp_set(struct net_device *ndev,
 		break;
 	}
 
-	rdev->priv->ptp_priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
-	rdev->priv->ptp_priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
+	rdev->priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
+	rdev->priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/renesas/rtsn.c b/drivers/net/ethernet/renesas/rtsn.c
index 15a043e85431..958c19808472 100644
--- a/drivers/net/ethernet/renesas/rtsn.c
+++ b/drivers/net/ethernet/renesas/rtsn.c
@@ -62,6 +62,9 @@ struct rtsn_private {
 
 	int tx_data_irq;
 	int rx_data_irq;
+
+	u32 tstamp_tx_ctrl;
+	u32 tstamp_rx_ctrl;
 };
 
 static u32 rtsn_read(struct rtsn_private *priv, enum rtsn_reg reg)
@@ -162,7 +165,7 @@ static int rtsn_rx(struct net_device *ndev, int budget)
 	unsigned int i;
 	bool get_ts;
 
-	get_ts = priv->ptp_priv->tstamp_rx_ctrl &
+	get_ts = priv->tstamp_rx_ctrl &
 		RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT;
 
 	ndescriptors = priv->dirty_rx + priv->num_rx_ring - priv->cur_rx;
@@ -1122,21 +1125,19 @@ static int rtsn_do_ioctl(struct net_device *ndev, struct ifreq *ifr, int cmd)
 static int rtsn_hwtstamp_get(struct net_device *ndev,
 			     struct kernel_hwtstamp_config *config)
 {
-	struct rcar_gen4_ptp_private *ptp_priv;
 	struct rtsn_private *priv;
 
 	if (!netif_running(ndev))
 		return -ENODEV;
 
 	priv = netdev_priv(ndev);
-	ptp_priv = priv->ptp_priv;
 
 	config->flags = 0;
 
 	config->tx_type =
-		ptp_priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
+		priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON : HWTSTAMP_TX_OFF;
 
-	switch (ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
+	switch (priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
 	case RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT:
 		config->rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 		break;
@@ -1155,7 +1156,6 @@ static int rtsn_hwtstamp_set(struct net_device *ndev,
 			     struct kernel_hwtstamp_config *config,
 			     struct netlink_ext_ack *extack)
 {
-	struct rcar_gen4_ptp_private *ptp_priv;
 	struct rtsn_private *priv;
 	u32 tstamp_rx_ctrl;
 	u32 tstamp_tx_ctrl;
@@ -1164,7 +1164,6 @@ static int rtsn_hwtstamp_set(struct net_device *ndev,
 		return -ENODEV;
 
 	priv = netdev_priv(ndev);
-	ptp_priv = priv->ptp_priv;
 
 	if (config->flags)
 		return -EINVAL;
@@ -1195,8 +1194,8 @@ static int rtsn_hwtstamp_set(struct net_device *ndev,
 		break;
 	}
 
-	ptp_priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
-	ptp_priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
+	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
+	priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
 
 	return 0;
 }
-- 
2.51.1


