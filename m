Return-Path: <linux-renesas-soc+bounces-2238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 974D4846144
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 20:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAC581C25180
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 19:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1D285638;
	Thu,  1 Feb 2024 19:45:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D25441760;
	Thu,  1 Feb 2024 19:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706816744; cv=none; b=pjiA/bReF24+oTDNporggwPsAWh3ww8PobRagwiYKJr9JxoECPzwCMeZXl4aENbp+ZVQSackpkrpdR/PIUNbLgIads64kcR7fLQdGErmBNrf9ti76dSbQYXlil3Dn8Yu4nozs9ImxcksEVppKl6eQgBDk2Q78CV6qYXXjAAljCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706816744; c=relaxed/simple;
	bh=3+DfA2G9GAhiy2aSeLexKehUjz5+EhJuO2Fy6LQbvCI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZE+SJXow3OfMFXE+0qcSWvZJpdIF54RthEIh5+yCexyJv3Y5SAXSrvdIh4qqsx1YWYPt7RHcqOQ74iH9MIU5nPi/PYwggS9oQ0E2W1HH/DbDpkAKgnaZNSWUEhowSLZAgdYnynXbhw0SS3SD/vxQLXarb/6j+WUbYhylH6qv9YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,236,1701097200"; 
   d="scan'208";a="192551618"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Feb 2024 04:45:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.227])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 17BA040741B5;
	Fri,  2 Feb 2024 04:45:29 +0900 (JST)
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
Subject: [PATCH v3 net-next 1/2] ravb: Add Rx checksum offload support for GbEth
Date: Thu,  1 Feb 2024 19:45:20 +0000
Message-Id: <20240201194521.139472-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
References: <20240201194521.139472-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TOE has hardware support for calculating IP header and TCP/UDP/ICMP
checksum for both IPv4 and IPv6.

Add Rx checksum offload supported by TOE for IPv4 and TCP/UDP protocols.

For Rx, the 4-byte result of checksum calculation is attached to the
Ethernet frames.First 2-bytes is result of IPv4 header checksum and next
2-bytes is TCP/UDP/ICMP checksum.

If a frame does not have checksum error, 0x0000 is attached as checksum
calculation result. For unsupported frames 0xFFFF is attached as checksum
calculation result. In case of an IPv6 packet, IPv4 checksum is always set
to 0xFFFF.

We can test this functionality by the below commands

ethtool -K eth0 rx on --> to turn on Rx checksum offload
ethtool -K eth0 rx off --> to turn off Rx checksum offload

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Updated commit header and description suggested by Sergey.
 * Dropped TOE_RX_CSUM_OK macro.
 * Renamed ravb_csum_offload_init_gbeth()->ravb_csum_init_gbeth().
 * Moved enabling {RPE,TPE} in ravb_csum_init_gbeth().
 * Updated the error message in ravb_csum_init_gbeth() as
   "Timeout enabling hardware checksum"
 * Introduced ravb_endisable_csum_gbeth() for enabling/disabling CSR{1,2} registers.
   
v1->v2:
 * Fixed sparse warning by replacing __sum16->__wsum.
---
 drivers/net/ethernet/renesas/ravb.h      | 16 ++++
 drivers/net/ethernet/renesas/ravb_main.c | 93 +++++++++++++++++++++++-
 2 files changed, 106 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index e0f8276cffed..a7fe9d8b6b41 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -206,6 +206,7 @@ enum ravb_reg {
 	RFCR	= 0x0760,
 	MAFCR	= 0x0778,
 	CSR0    = 0x0800,	/* RZ/G2L only */
+	CSR2    = 0x0808,	/* RZ/G2L only */
 };
 
 
@@ -978,6 +979,21 @@ enum CSR0_BIT {
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
index 0e3731f50fc2..c4dc6ec54287 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -522,6 +522,23 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	return -ENOMEM;
 }
 
+static void ravb_csum_init_gbeth(struct net_device *ndev)
+{
+	if (!(ndev->features & NETIF_F_RXCSUM))
+		goto done;
+
+	ravb_write(ndev, 0, CSR0);
+	if (ravb_wait(ndev, CSR0, CSR0_RPE, 0)) {
+		netdev_err(ndev, "Timeout enabling hardware checksum\n");
+		ndev->features &= ~NETIF_F_RXCSUM;
+	} else {
+		ravb_write(ndev, CSR2_ALL, CSR2);
+	}
+
+done:
+	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);
+}
+
 static void ravb_emac_init_gbeth(struct net_device *ndev)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
@@ -553,7 +570,8 @@ static void ravb_emac_init_gbeth(struct net_device *ndev)
 
 	/* E-MAC status register clear */
 	ravb_write(ndev, ECSR_ICD | ECSR_LCHNG | ECSR_PFRI, ECSR);
-	ravb_write(ndev, CSR0_TPE | CSR0_RPE, CSR0);
+
+	ravb_csum_init_gbeth(ndev);
 
 	/* E-MAC interrupt enable register */
 	ravb_write(ndev, ECSIPR_ICDIP, ECSIPR);
@@ -734,6 +752,31 @@ static void ravb_get_tx_tstamp(struct net_device *ndev)
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
+	if (skb->protocol == htons(ETH_P_IP) && !csum_ip_hdr && !csum_proto)
+		/* Hardware validated our checksum */
+		skb->ip_summed = CHECKSUM_UNNECESSARY;
+}
+
 static void ravb_rx_csum(struct sk_buff *skb)
 {
 	u8 *hw_csum;
@@ -819,6 +862,8 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 				skb = ravb_get_skb_gbeth(ndev, entry, desc);
 				skb_put(skb, pkt_len);
 				skb->protocol = eth_type_trans(skb, ndev);
+				if (ndev->features & NETIF_F_RXCSUM)
+					ravb_rx_csum_gbeth(skb);
 				napi_gro_receive(&priv->napi[q], skb);
 				stats->rx_packets++;
 				stats->rx_bytes += pkt_len;
@@ -846,6 +891,8 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 				dev_kfree_skb(skb);
 				priv->rx_1st_skb->protocol =
 					eth_type_trans(priv->rx_1st_skb, ndev);
+				if (ndev->features & NETIF_F_RXCSUM)
+					ravb_rx_csum_gbeth(skb);
 				napi_gro_receive(&priv->napi[q],
 						 priv->rx_1st_skb);
 				stats->rx_packets++;
@@ -2334,11 +2381,49 @@ static void ravb_set_rx_csum(struct net_device *ndev, bool enable)
 	spin_unlock_irqrestore(&priv->lock, flags);
 }
 
+static int ravb_endisable_csum_gbeth(struct net_device *ndev, enum ravb_reg reg,
+				     u32 val, u32 mask)
+{
+	u32 csr0;
+	int ret;
+
+	csr0 = ravb_read(ndev, CSR0);
+	ravb_write(ndev, csr0 & ~mask, CSR0);
+	ret = ravb_wait(ndev, CSR0, mask, 0);
+	if (!ret)
+		ravb_write(ndev, val, reg);
+
+	ravb_write(ndev, csr0, CSR0);
+
+	return ret;
+}
+
 static int ravb_set_features_gbeth(struct net_device *ndev,
 				   netdev_features_t features)
 {
-	/* Place holder */
-	return 0;
+	netdev_features_t changed = ndev->features ^ features;
+	struct ravb_private *priv = netdev_priv(ndev);
+	unsigned long flags;
+	int ret = 0;
+	u32 val;
+
+	spin_lock_irqsave(&priv->lock, flags);
+	if (changed & NETIF_F_RXCSUM) {
+		if (features & NETIF_F_RXCSUM)
+			val = CSR2_ALL;
+		else
+			val = 0;
+
+		ret = ravb_endisable_csum_gbeth(ndev, CSR2, val, CSR0_RPE);
+		if (ret)
+			goto done;
+	}
+
+	ndev->features = features;
+done:
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return ret;
 }
 
 static int ravb_set_features_rcar(struct net_device *ndev,
@@ -2518,6 +2603,8 @@ static const struct ravb_hw_info gbeth_hw_info = {
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


