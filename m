Return-Path: <linux-renesas-soc+bounces-21908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CDDB5933B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 12:18:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 424F77B433A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Sep 2025 10:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DBE3043A5;
	Tue, 16 Sep 2025 10:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WcS2UvOl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z87+xRGh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75EB304BDE;
	Tue, 16 Sep 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017827; cv=none; b=MUJ9wEEFNBpxz3nSI4le3TeepSGmYDc67GmF07/9VzDPVX7yioeR6jrrNJ8fpZuhYGL7+27w1yeBN9fizAhnHhCgftNgPQFtLEyaky95eEYiyL8veUrgiLv34H+1Vqfv5v+y6vTV9GNz6+fqH+rmlRlh7c33NmOva9foexlmvKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017827; c=relaxed/simple;
	bh=ONFTQAhJ8N2IcV/gDc5KkDTtwxBpmxNKKJjk//LG8sM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=thnmH/pH5eMicR1LYam+dur/FsUsT3AHt+zXfhYTQDIDl172wHbGQQOGY8kClSYioTGakl0wBOqwgG9q3Gbn2ZCX6v8ODbz9JjvQcoSn/nwTNVlKZNSy76knHSKbzHb+duMH3XA6vusiwVZxN53YOz8Yc2yrcTkmOZwty7Gv5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WcS2UvOl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z87+xRGh; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id AB6411D0012C;
	Tue, 16 Sep 2025 06:17:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 16 Sep 2025 06:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1758017824;
	 x=1758104224; bh=ImGP7SqcXzQvr6+iz7rBxGNIK2CoXJ7AF5xi/BOO03k=; b=
	WcS2UvOl3Zvgu2/bfLaiCVN/22R9/9uyRFoOp8mXgb79DynV/RDMF4GVbfasgavV
	0TAxdTDSDjX9XE7FKcuWjjwIIUMXOOKzmw5XesN/inMgy/tD/mCYWGU/rPUm3hy1
	rafomn1xU3x8oi5wuKt/jGncegaSRoJOgseEYyO/gxER9yz3XQK4seBMPyBfLnYH
	bG+JvMMtbSHoR/ZClS4kXZVZ/GacpUQH+zbEvTQxdUOQ+V7SAyhSrI2iED5wv0QW
	ZCGzne209e9Tb+DshPtg/Rjmr5fyKOcGAiE0cgLpsxwhmijOEdoWuunD0Bn+nVie
	YJ/ghb8nY5clbSSmJU9iFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758017824; x=
	1758104224; bh=ImGP7SqcXzQvr6+iz7rBxGNIK2CoXJ7AF5xi/BOO03k=; b=Z
	87+xRGh9EE6MtMw/pM491ECydfSJ+QICjj2/E0AZxVhKJtjM7lb7TBqfzf+EfFU+
	Db6yZP6t3U7q4OASN1qkbGb/iNQ+PpKQtohDPePSqO//Ai8sjnzpW/JLX5Tk0sQf
	PIBJIvY32R/Ywk+aOUBpE7v14NCInZCeG7IT6wdiqkN2WNnclycyYCEpL05iVe4D
	P2p6Er7krUqSODUwhOd6Rb+LDTTmH5QgAfABvPfffAY8TxC2z9OwB2RPyclQ2MhQ
	pglevlmebwy+e5+9WP6ROPRbzkL698U8DZUQbTWk8mfcVBJXHlTSZfg3LJz9CTRw
	TPQOCPO5cidu99bpyUjEA==
X-ME-Sender: <xms:IDnJaP4Pd2dy-qc4rRJXzLlZb1_Bt_ZdlTTa2BLDBwGXK61umWH4Vg>
    <xme:IDnJaBlP4hXIrX370pbpUsE5JbzUCc9FQ01seLN5mMnaxGL3l0PthQ1FThMkZ71xT
    PMMUmMA5xslI5TIwQM>
X-ME-Received: <xmr:IDnJaKUGZrePNmZbYb1YuBW7WDCX1t-tWLgb8x8ZIjWCoFlGOfLLL6-r7gdvPejr-XxLKY0_uL1k37-qOsQRuhG63g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegtdeftdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:IDnJaKQFS5Sl7T3AAlzm5TTjjtMbpv4uR7TDSIw7XYpXSu1VNqTw6w>
    <xmx:IDnJaHAMqr1D7TLbHoIqN5JJqk6ilF8tXm0eAcGo6acKTxzCN02ctg>
    <xmx:IDnJaCszVFAKNyMF-RLIVRXKYj6uLksciaXa-UHNQGkbt_slwK9z6g>
    <xmx:IDnJaF_z4G6qmKKP-LbS35jrjOT116nAE2FCfS-36TXqkYeqaDt-Eg>
    <xmx:IDnJaDJ8VlcGjvJVczreiy7CS3P0sSEjrB2JboQoo9aiUqKn61Cb64Ch>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Sep 2025 06:17:03 -0400 (EDT)
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
Subject: [net-next 6/6] net: ravb: Use common defines for time stamping control
Date: Tue, 16 Sep 2025 12:10:55 +0200
Message-ID: <20250916101055.740518-7-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/net/ethernet/renesas/ravb.h      | 14 +-----
 drivers/net/ethernet/renesas/ravb_main.c | 62 +++++++++++-------------
 2 files changed, 30 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 7b48060c250b..655a9c968ce5 100644
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
index 9d3bd65b85ff..a187a18fb9e6 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -992,7 +992,6 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 			if (desc_status & MSC_CEEF)
 				stats->rx_missed_errors++;
 		} else {
-			u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
 			struct ravb_rx_buffer *rx_buff;
 			void *rx_addr;
 
@@ -1010,18 +1009,27 @@ static int ravb_rx_rcar(struct net_device *ndev, int budget, int q)
 				break;
 			}
 			skb_mark_for_recycle(skb);
-			get_ts &= (q == RAVB_NC) ?
-					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
-					~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
-			if (get_ts) {
-				struct skb_shared_hwtstamps *shhwtstamps;
-
-				shhwtstamps = skb_hwtstamps(skb);
-				memset(shhwtstamps, 0, sizeof(*shhwtstamps));
-				ts.tv_sec = ((u64) le16_to_cpu(desc->ts_sh) <<
-					     32) | le32_to_cpu(desc->ts_sl);
-				ts.tv_nsec = le32_to_cpu(desc->ts_n);
-				shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
+
+			if (priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_NONE) {
+				bool get_ts = false;
+
+				if (q == RAVB_NC)
+					get_ts = priv->tstamp_rx_ctrl ==
+						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+				else
+					get_ts = priv->tstamp_rx_ctrl !=
+						HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
+
+				if (get_ts) {
+					struct skb_shared_hwtstamps *shhwtstamps;
+
+					shhwtstamps = skb_hwtstamps(skb);
+					memset(shhwtstamps, 0, sizeof(*shhwtstamps));
+					ts.tv_sec = ((u64)le16_to_cpu(desc->ts_sh) << 32)
+						| le32_to_cpu(desc->ts_sl);
+					ts.tv_nsec = le32_to_cpu(desc->ts_n);
+					shhwtstamps->hwtstamp = timespec64_to_ktime(ts);
+				}
 			}
 
 			skb_put(skb, pkt_len);
@@ -2396,18 +2404,8 @@ static int ravb_hwtstamp_get(struct net_device *ndev, struct ifreq *req)
 	struct hwtstamp_config config;
 
 	config.flags = 0;
-	config.tx_type = priv->tstamp_tx_ctrl ? HWTSTAMP_TX_ON :
-						HWTSTAMP_TX_OFF;
-	switch (priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE) {
-	case RAVB_RXTSTAMP_TYPE_V2_L2_EVENT:
-		config.rx_filter = HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
-		break;
-	case RAVB_RXTSTAMP_TYPE_ALL:
-		config.rx_filter = HWTSTAMP_FILTER_ALL;
-		break;
-	default:
-		config.rx_filter = HWTSTAMP_FILTER_NONE;
-	}
+	config.tx_type = priv->tstamp_tx_ctrl;
+	config.rx_filter = priv->tstamp_rx_ctrl;
 
 	return copy_to_user(req->ifr_data, &config, sizeof(config)) ?
 		-EFAULT : 0;
@@ -2417,19 +2415,17 @@ static int ravb_hwtstamp_get(struct net_device *ndev, struct ifreq *req)
 static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
+	enum hwtstamp_rx_filters tstamp_rx_ctrl;
+	enum hwtstamp_tx_types tstamp_tx_ctrl;
 	struct hwtstamp_config config;
-	u32 tstamp_rx_ctrl = RAVB_RXTSTAMP_ENABLED;
-	u32 tstamp_tx_ctrl;
 
 	if (copy_from_user(&config, req->ifr_data, sizeof(config)))
 		return -EFAULT;
 
 	switch (config.tx_type) {
 	case HWTSTAMP_TX_OFF:
-		tstamp_tx_ctrl = 0;
-		break;
 	case HWTSTAMP_TX_ON:
-		tstamp_tx_ctrl = RAVB_TXTSTAMP_ENABLED;
+		tstamp_tx_ctrl = config.tx_type;
 		break;
 	default:
 		return -ERANGE;
@@ -2437,14 +2433,12 @@ static int ravb_hwtstamp_set(struct net_device *ndev, struct ifreq *req)
 
 	switch (config.rx_filter) {
 	case HWTSTAMP_FILTER_NONE:
-		tstamp_rx_ctrl = 0;
-		break;
 	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
-		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
+		tstamp_rx_ctrl = config.rx_filter;
 		break;
 	default:
 		config.rx_filter = HWTSTAMP_FILTER_ALL;
-		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_ALL;
+		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
 	}
 
 	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
-- 
2.51.0


