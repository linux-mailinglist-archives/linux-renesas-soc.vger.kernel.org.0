Return-Path: <linux-renesas-soc+bounces-21904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4646AB5932F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:17:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E55E916234C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:17:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A852304963;
	Tue, 16 Sep 2025 10:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Co6RQVfx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gkjeur0i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68603043C7;
	Tue, 16 Sep 2025 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017817; cv=none; b=LaoMWrX4FthzEUC84dFK+mjoz3TUGy4d31A/bDzUj2MsnLzEkEKZepD/hnU/+5xuqcXauSdRShy206iZiF4JBSIZBB2c6wVmoii570sUVBEIWup1iiY9YaaOcZbI5TUAHdq8q4Ts4hfRYbYowKgJgmnEnednyHdqcSaOSmfRKAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017817; c=relaxed/simple;
	bh=r6WLifVTNtBHzy2ntHi4hcsGCQ32iBEu+ZSQoeP3iDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BVf6/yhyeRWtLAH3DBYdSGRST0XfGxDjOIJRAew6lxZVgwXxNKPjpa4r1ZDQLkfkHFGpCnXkUCAJLLiuJJutpVxy4iq6V18rVbekzTto5vnVU0I0NehDoWrhRE+jbeQPXYWfK8sYWJktX1sMhLIHdiodb+nUgjqz+EkY7fdoguo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Co6RQVfx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gkjeur0i; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id 5A1391D0012C;
	Tue, 16 Sep 2025 06:16:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 16 Sep 2025 06:16:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758017814;
	 x=1758104214; bh=ZukDiHcNUNhsZmt81p6mqqVUJ+R6oWyBQbRurWBGxbE=; b=
	Co6RQVfx9HPjRho50jKbtiRSsisxGmDS+Jsp/ZzDxx0FYA2G9s4DyBDTurZGwrI4
	swtbkAK6U3FGGqiRf/wVEGw11ml1rK7PnWP4UaFk7SUD/GHw7+EJEA5k6Y4FZYYS
	9rqRWhxcqET6a7SNXmKUWCjASclMxLEEUTGwsEIe+PCpMYNwTpFpyuLsfeo2aVSv
	PWk6amZqW08D0toWhx7sjG7tfoazbKysW5LC7uXz0RnZwPIUCQi0ofCIlYHjOWVk
	QY1jNkLUcHv9mfWbsTDIAh4Q6XnzLRbzQ8fpjV+DVcE0pX4ExNlUG135Ha4SiVV6
	sjtD/QgxXGElEKiJn1DQdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758017814; x=
	1758104214; bh=ZukDiHcNUNhsZmt81p6mqqVUJ+R6oWyBQbRurWBGxbE=; b=g
	kjeur0itrPSEf17CEZQrJXG+y8Ks/xrezVLV8fvR6iQwvfuJBNYEa7DIRGatNj0M
	/uKKXc4dToWiuOk7lhhB3gfC+H+dRKV5l0LzU0hUCq80GZhoZgWsN1FRAB31wntv
	OpOX9l3ifuPY1e91bkV3v595CoTTP10BhrduK7Z9tJDqHrB5sKteu82aFjxC+YsZ
	AYZ/pdst7eBewj8+9+/7Lhyp7h6yNaBoT7LQJXU3NTYrq9liD1iDfQnMuzNk3j1E
	Eq+yOI/8v/yEZ1xpBaX0BzoKtx7QVFZObrAtZygTmzV41H9rZX7LyeQL8ZE5D/SC
	k7c2aw0Xg+9tbbAaZ+x1g==
X-ME-Sender: <xms:FTnJaDt-_LtYPwFRLlWyxyaxz0h7arAs8WVm3OhSfot4rx-LOxK-mw>
    <xme:FTnJaBIN-XmGcevVzFL-IHIjX1dRkiUmOFSw0FjCzG1G0-w-e8aZXWbQagyEAPHYX
    eOAgYsOipvyYl7ETEE>
X-ME-Received: <xmr:FTnJaKqfTtNLaD3VfrOvBF2I3K4w50PcZRqz7m-1JKomM0VpxpULAgfAcSM--HS-H8twzlGJytVWtayMmDi06he6HA>
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
X-ME-Proxy: <xmx:FjnJaMWqatZJflky9PN_ennEsMRt9D-bGaelZN87DtiDxA0TshS7MA>
    <xmx:FjnJaH0B6yt0XzXLhdKMP5Q6-4w-57Tl4gGTO86dsXvFVSS6JmMYKw>
    <xmx:FjnJaLQ3IsxJJ03rOCfvAqaX4VhKYjJsBld5HbEvUuc3f8YhNk6xhw>
    <xmx:FjnJaLT39zlp8IUvnCyxR63CQrVa73v8b8823JCvYo7cZ-dgU3stsA>
    <xmx:FjnJaPPKGNXy7bgrANwUk5OM6LIF4aiqnHAD4Ag3wFFYGjK1rUKeCx9A>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:16:53 -0400 (EDT)
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
Subject: [net-next 2/6] net: rcar_gen4_ptp: Move control fields to users
Date: Tue, 16 Sep 2025 12:10:51 +0200
Message-ID: <20250916101055.740518-3-niklas.soderlund+renesas@ragnatech.se>
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
---
 drivers/net/ethernet/renesas/rcar_gen4_ptp.h |  2 --
 drivers/net/ethernet/renesas/rswitch.h       |  3 +++
 drivers/net/ethernet/renesas/rswitch_main.c  | 16 +++++++---------
 drivers/net/ethernet/renesas/rtsn.c          | 17 ++++++++---------
 4 files changed, 18 insertions(+), 20 deletions(-)

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
index 72fa31008144..b541202b8f3e 100644
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
@@ -1800,15 +1800,13 @@ static struct net_device_stats *rswitch_get_stats(struct net_device *ndev)
 static int rswitch_hwstamp_get(struct net_device *ndev, struct ifreq *req)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
-	struct rcar_gen4_ptp_private *ptp_priv;
+	struct rswitch_private *priv = rdev->priv;
 	struct hwtstamp_config config;
 
-	ptp_priv = rdev->priv->ptp_priv;
-
 	config.flags = 0;
-	config.tx_type = ptp_priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
-						    HWTSTAMP_TX_OFF;
-	switch (ptp_priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
+	config.tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
+		HWTSTAMP_TX_OFF;
+	switch (priv->tstamp_rx_ctrl & RCAR_GEN4_RXTSTAMP_TYPE) {
 	case RCAR_GEN4_RXTSTAMP_TYPE_V2_L2_EVENT:
 		config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
 		break;
@@ -1860,8 +1858,8 @@ static int rswitch_hwstamp_set(struct net_device *ndev, struct ifreq *req)
 		break;
 	}
 
-	rdev->priv->ptp_priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
-	rdev->priv->ptp_priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
+	rdev->priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
+	rdev->priv->tstamp_rx_ctrl = tstamp_rx_ctrl;
 
 	return copy_to_user(req->ifr_data, &config, sizeof(config)) ? -EFAULT : 0;
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
2.51.0


