Return-Path: <linux-renesas-soc+bounces-1757-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70B483A6A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 11:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5723C285D1B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jan 2024 10:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFC018E37;
	Wed, 24 Jan 2024 10:21:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968C21AACF;
	Wed, 24 Jan 2024 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706091695; cv=none; b=HWcUDyP/lNxs+2lO8u3IODjftifC47a8zfLl+dwoH2kGzfpISYxBDRhyYOeiNq0bEzjH3giSsRe6n3z1dtxO0BVVlsrt7VQfWvWgGoF6UIE7/NFqgrBzX1Z3SKrB91wKPZMhd2afuiZ5vMloMQzvKZtgjnchhqxs9m8WA5fP0DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706091695; c=relaxed/simple;
	bh=6WKLpFzfhq09BCRkLtWj32vzbmwp+zHFOnoBQg44CP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pSNTkGBuTYFsyrQqaKcBcvsWI8arHxk63/QC4abG4s7ujNq/b4xPj8cLJIEaSbAB0psd+xng+3fEYY31MDmN8KYQAZjp4S7W8f3uuFJnk9NjqYa7zT3sAglWldzn1v9zKlhbqfAxhWaUXHLxCvBtQUK6nfbbppviqZ8CPzaErt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="191560327"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Jan 2024 19:21:28 +0900
Received: from localhost.localdomain (unknown [10.226.92.243])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6535A400C721;
	Wed, 24 Jan 2024 19:21:23 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH net-next v2 1/2] ravb: Add Rx checksum offload support
Date: Wed, 24 Jan 2024 10:21:14 +0000
Message-Id: <20240124102115.132154-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
References: <20240124102115.132154-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum
for both IPV4 and IPV6.

Add Rx checksum offload supported by TOE for IPV4 and TCP/UDP protocols.

For Rx, the result of checksum calculation is attached to last 4byte
of ethernet frames. First 2bytes is result of IPV4 header checksum
and next 2 bytes is TCP/UDP/ICMP.

If frame does not have error "0000" attached to checksum calculation
result. For unsupported frames "ffff" is attached to checksum calculation
result. Cases like IPV6, IPV4 header is always set to "FFFF".

We can test this functionality by the below commands

ethtool -K eth0 rx on --> to turn on Rx checksum offload
ethtool -K eth0 rx off --> to turn off Rx checksum offload

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Fixed sparse warning by replacing __sum16->__wsum.
---
 drivers/net/ethernet/renesas/ravb.h      | 19 ++++++
 drivers/net/ethernet/renesas/ravb_main.c | 81 +++++++++++++++++++++++-
 2 files changed, 98 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e0f8276cffed..a2c494a85d12 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -44,6 +44,9 @@
 #define RAVB_RXTSTAMP_TYPE_ALL	0x00000006
 #define RAVB_RXTSTAMP_ENABLED	0x00000010	/* Enable RX timestamping */
 
+/* GbEthernet TOE hardware checksum values */
+#define TOE_RX_CSUM_OK	0x0000
+
 enum ravb_reg {
 	/* AVB-DMAC registers */
 	CCC	= 0x0000,
@@ -206,6 +209,7 @@ enum ravb_reg {
 	RFCR	= 0x0760,
 	MAFCR	= 0x0778,
 	CSR0    = 0x0800,	/* RZ/G2L only */
+	CSR2    = 0x0808,	/* RZ/G2L only */
 };
 
 
@@ -978,6 +982,21 @@ enum CSR0_BIT {
 	CSR0_RPE	= 0x00000020,
 };
 
+enum CSR2_BIT {
+	CSR2_RIP4	= 0x00000001,
+	CSR2_RTCP4	= 0x00000010,
+	CSR2_RUDP4	= 0x00000020,
+	CSR2_RICMP4	= 0x00000040,
+	CSR2_RTCP6	= 0x00100000,
+	CSR2_RUDP6	= 0x00200000,
+	CSR2_RICMP6	= 0x00400000,
+	CSR2_RHOP	= 0x01000000,
+	CSR2_RROUT	= 0x02000000,
+	CSR2_RAHD	= 0x04000000,
+	CSR2_RDHD	= 0x08000000,
+	CSR2_ALL	= 0x0F700071,
+};
+
 #define DBAT_ENTRY_NUM	22
 #define RX_QUEUE_OFFSET	4
 #define NUM_RX_QUEUE	2
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 0e3731f50fc2..59c7bedacef6 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -522,6 +522,26 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	return -ENOMEM;
 }
 
+static void ravb_csum_offload_init_gbeth(struct net_device *ndev)
+{
+	bool rx_enable = ndev->features & NETIF_F_RXCSUM;
+	u32 csr0;
+
+	if (!rx_enable)
+		return;
+
+	csr0 = ravb_read(ndev, CSR0);
+	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);
+	if (ravb_wait(ndev, CSR0, CSR0_RPE | CSR0_TPE, 0)) {
+		netdev_err(ndev, "Timeout Enabling HW CSUM failed\n");
+		ndev->features &= ~NETIF_F_RXCSUM;
+	} else {
+		ravb_write(ndev, CSR2_ALL, CSR2);
+	}
+
+	ravb_write(ndev, csr0, CSR0);
+}
+
 static void ravb_emac_init_gbeth(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -543,6 +563,7 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 			 ECMR_TE | ECMR_RE | ECMR_RCPT |
 			 ECMR_TXF | ECMR_RXF, ECMR);
 
+	ravb_csum_offload_init_gbeth(ndev);
 	ravb_set_rate_gbeth(ndev);
 
 	/* Set MAC address */
@@ -734,6 +755,32 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
 	}
 }
 
+static void ravb_rx_csum_gbeth(struct sk_buff *skb)
+{
+	__wsum csum_ip_hdr, csum_proto;
+	u8 *hw_csum;
+
+	/* The hardware checksum status is contained in sizeof(__sum16) * 2 = 4
+	 * bytes appended to packet data. First 2 bytes is ip header csum and
+	 * last 2 bytes is protocol csum.
+	 */
+	if (unlikely(skb->len < sizeof(__sum16) * 2))
+		return;
+
+	hw_csum = skb_tail_pointer(skb) - sizeof(__sum16);
+	csum_proto = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
+
+	hw_csum -= sizeof(__sum16);
+	csum_ip_hdr = csum_unfold((__force __sum16)get_unaligned_le16(hw_csum));
+	skb_trim(skb, skb->len - 2 * sizeof(__sum16));
+
+	/* TODO: IPV6 Rx csum */
+	if (skb->protocol == htons(ETH_P_IP) && csum_ip_hdr == TOE_RX_CSUM_OK &&
+	    csum_proto == TOE_RX_CSUM_OK)
+		/* Hardware validated our checksum */
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+}
+
 static void ravb_rx_csum(struct sk_buff *skb)
 {
 	u8 *hw_csum;
@@ -819,6 +866,8 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 				skb = ravb_get_skb_gbeth(ndev, entry, desc);
 				skb_put(skb, pkt_len);
 				skb->protocol = eth_type_trans(skb, ndev);
+				if (ndev->features & NETIF_F_RXCSUM)
+					ravb_rx_csum_gbeth(skb);
 				napi_gro_receive(&priv->napi[q], skb);
 				stats->rx_packets++;
 				stats->rx_bytes += pkt_len;
@@ -846,6 +895,8 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 				dev_kfree_skb(skb);
 				priv->rx_1st_skb->protocol =
 					eth_type_trans(priv->rx_1st_skb, ndev);
+				if (ndev->features & NETIF_F_RXCSUM)
+					ravb_rx_csum_gbeth(skb);
 				napi_gro_receive(&priv->napi[q],
 						 priv->rx_1st_skb);
 				stats->rx_packets++;
@@ -2337,8 +2388,32 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
 static int ravb_set_features_gbeth(struct net_device *ndev,
 				   netdev_features_t features)
 {
-	/* Place holder */
-	return 0;
+	netdev_features_t changed = ndev->features ^ features;
+	struct ravb_private *priv = netdev_priv(ndev);
+	unsigned long flags;
+	u32 csr0;
+	int ret;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	csr0 = ravb_read(ndev, CSR0);
+	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);
+	ret = ravb_wait(ndev, CSR0, CSR0_RPE | CSR0_TPE, 0);
+	if (ret)
+		goto err_wait;
+
+	if (changed & NETIF_F_RXCSUM) {
+		if (features & NETIF_F_RXCSUM)
+			ravb_write(ndev, CSR2_ALL, CSR2);
+		else
+			ravb_write(ndev, 0, CSR2);
+	}
+
+	ndev->features = features;
+err_wait:
+	ravb_write(ndev, csr0, CSR0);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return ret;
 }
 
 static int ravb_set_features_rcar(struct net_device *ndev,
@@ -2518,6 +2593,8 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.emac_init = ravb_emac_init_gbeth,
 	.gstrings_stats = ravb_gstrings_stats_gbeth,
 	.gstrings_size = sizeof(ravb_gstrings_stats_gbeth),
+	.net_hw_features = NETIF_F_RXCSUM,
+	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.max_rx_len = ALIGN(GBETH_RX_BUFF_MAX, RAVB_ALIGN),
 	.tccr_mask = TCCR_TSRQ0,
-- 
2.25.1


