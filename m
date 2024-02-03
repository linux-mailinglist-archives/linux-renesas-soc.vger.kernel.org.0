Return-Path: <linux-renesas-soc+bounces-2303-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7BA8486B7
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 15:26:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD2E1F21CD4
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  3 Feb 2024 14:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476EC5DF18;
	Sat,  3 Feb 2024 14:26:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA6C5D8FB;
	Sat,  3 Feb 2024 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706970390; cv=none; b=Na/y6efRIuDbcBl6jeUEgxUTCGDraI3rIrioPjTDEp3QhZeroQt3aESLB0bW6mRGkpFM3+638vfwFjQEZQX8k+IFFddXcUeYz/bmpR1JT6q7GI8f+8XB0QBdFudSY+Nxo4A20uL1R+4f4qPlNAVIJdPjj7tpfWfWRL3tyVKEAoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706970390; c=relaxed/simple;
	bh=eE3xuSZPnIl68pJXRig8LRtv8gHe+E122lNmvIHg1l4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cLB22ftC4TAaKxcoCcy7Vywefp57hidTnXtE3zicoDgPCFSCgiG5QjGNKo4+jxkleP9VuS2QFrVNKu7xyBylNz57OPba+DahPv8fuEwGsYAmsJ5rbgBT8F7Y10aI+Wc4ThIN3ltAnL4b8EmiMRsxnUhhNA0rmgxoLjSfPBinJAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,240,1701097200"; 
   d="scan'208";a="192732818"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2024 23:26:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B72841F86B1;
	Sat,  3 Feb 2024 23:26:12 +0900 (JST)
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
Subject: [PATCH v4 net-next 2/2] ravb: Add Tx checksum offload support for GbEth
Date: Sat,  3 Feb 2024 14:25:59 +0000
Message-Id: <20240203142559.130466-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240203142559.130466-1-biju.das.jz@bp.renesas.com>
References: <20240203142559.130466-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TOE has hardware support for calculating IP header and TCP/UDP/ICMP
checksum for both IPv4 and IPv6.

Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.

For Tx, the result of checksum calculation is set to the checksum field of
each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
frames, those fields are not changed. If a transmission frame is an UDPv4
frame and its checksum value in the UDP header field is 0x0000, TOE does
not calculate checksum for UDP part of this frame as it is optional
function as per standards.

We can test this functionality by the below commands

ethtool -K eth0 tx on --> to turn on Tx checksum offload
ethtool -K eth0 tx off --> to turn off Tx checksum offload

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Restored NETIF_F_HW_CSUM and associated changes.
 * Dropped enabling IPv6 specific bits in CSR1.
 * Dropped enabling ICMPv4 specific bit and associated handling as linux
   does not support it.
v2->v3:
 * Updated commit header and description as suggested by Sergey.
 * Replaced NETIF_F_IP_CSUM->NETIF_F_HW_CSUM as we are supporting only IPv4.
 * Updated the comment related to UDP header field.
 * Renamed ravb_is_tx_checksum_offload_gbeth_possible()->ravb_is_tx_csum_gbeth().
v1->v2:
 * No change.
---
 drivers/net/ethernet/renesas/ravb.h      | 16 ++++++
 drivers/net/ethernet/renesas/ravb_main.c | 73 +++++++++++++++++++++---
 2 files changed, 82 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 64bf29d01ad0..d7b1c6d15a17 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -208,6 +208,7 @@ enum ravb_reg {
 
 	/* RZ/G2L TOE registers */
 	CSR0    = 0x0800,
+	CSR1    = 0x0804,
 	CSR2    = 0x0808,
 };
 
@@ -981,6 +982,21 @@ enum CSR0_BIT {
 	CSR0_RPE	= 0x00000020,
 };
 
+enum CSR1_BIT {
+	CSR1_TIP4	= 0x00000001,
+	CSR1_TTCP4	= 0x00000010,
+	CSR1_TUDP4	= 0x00000020,
+	CSR1_TICMP4	= 0x00000040,
+	CSR1_TTCP6	= 0x00100000,
+	CSR1_TUDP6	= 0x00200000,
+	CSR1_TICMP6	= 0x00400000,
+	CSR1_THOP	= 0x01000000,
+	CSR1_TROUT	= 0x02000000,
+	CSR1_TAHD	= 0x04000000,
+	CSR1_TDHD	= 0x08000000,
+	CSR1_ALL	= 0x0F700071,
+};
+
 enum CSR2_BIT {
 	CSR2_RIP4	= 0x00000001,
 	CSR2_RTCP4	= 0x00000010,
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4f310bcee7c0..fee771f14fc5 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -29,6 +29,7 @@
 #include <linux/spinlock.h>
 #include <linux/reset.h>
 #include <linux/math64.h>
+#include <net/ip.h>
 
 #include "ravb.h"
 
@@ -524,16 +525,29 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 
 static void ravb_csum_init_gbeth(struct net_device *ndev)
 {
-	if (!(ndev->features & NETIF_F_RXCSUM))
+	bool tx_enable = ndev->features & NETIF_F_HW_CSUM;
+	bool rx_enable = ndev->features & NETIF_F_RXCSUM;
+
+	if (!(tx_enable || rx_enable))
 		goto done;
 
 	ravb_write(ndev, 0, CSR0);
-	if (ravb_wait(ndev, CSR0, CSR0_RPE, 0)) {
+	if (ravb_wait(ndev, CSR0, CSR0_TPE | CSR0_RPE, 0)) {
 		netdev_err(ndev, "Timeout enabling hardware checksum\n");
-		ndev->features &= ~NETIF_F_RXCSUM;
+
+		if (tx_enable)
+			ndev->features &= ~NETIF_F_HW_CSUM;
+
+		if (rx_enable)
+			ndev->features &= ~NETIF_F_RXCSUM;
 	} else {
-		ravb_write(ndev, CSR2_ALL & ~(CSR2_RTCP6 | CSR2_RUDP6 |
-					      CSR2_RICMP6), CSR2);
+		if (tx_enable)
+			ravb_write(ndev, CSR1_ALL & ~(CSR1_TICMP4 | CSR1_TTCP6 |
+						      CSR1_TUDP6 | CSR1_TICMP6), CSR1);
+
+		if (rx_enable)
+			ravb_write(ndev, CSR2_ALL & ~(CSR2_RTCP6 | CSR2_RUDP6 |
+						      CSR2_RICMP6), CSR2);
 	}
 
 done:
@@ -1986,6 +2000,36 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 	rtnl_unlock();
 }
 
+static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
+{
+	struct iphdr *ip = ip_hdr(skb);
+
+	/* TODO: Need to add support for VLAN tag 802.1Q */
+	if (skb_vlan_tag_present(skb))
+		return false;
+
+	/* TODO: Need to add hardware checksum for IPv6 */
+	if (skb->protocol != htons(ETH_P_IP))
+		return false;
+
+	switch (ip->protocol) {
+	case IPPROTO_TCP:
+		break;
+	case IPPROTO_UDP:
+		/* If the checksum value in the UDP header field is 0, TOE does
+		 * not calculate checksum for UDP part of this frame as it is
+		 * optional function as per standards.
+		 */
+		if (udp_hdr(skb)->check == 0)
+			return false;
+		break;
+	default:
+		return false;
+	}
+
+	return true;
+}
+
 /* Packet transmit function for Ethernet AVB */
 static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 {
@@ -2001,6 +2045,9 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	u32 entry;
 	u32 len;
 
+	if (skb->ip_summed == CHECKSUM_PARTIAL && !ravb_can_tx_csum_gbeth(skb))
+		skb_checksum_help(skb);
+
 	spin_lock_irqsave(&priv->lock, flags);
 	if (priv->cur_tx[q] - priv->dirty_tx[q] > (priv->num_tx_ring[q] - 1) *
 	    num_tx_desc) {
@@ -2418,6 +2465,18 @@ static int ravb_set_features_gbeth(struct net_device *ndev,
 			goto done;
 	}
 
+	if (changed & NETIF_F_HW_CSUM) {
+		if (features & NETIF_F_HW_CSUM)
+			val = CSR1_ALL & ~(CSR1_TICMP4 | CSR1_TTCP6 |
+					   CSR1_TUDP6 | CSR1_TICMP6);
+		else
+			val = 0;
+
+		ret = ravb_endisable_csum_gbeth(ndev, CSR1, val, CSR0_TPE);
+		if (ret)
+			goto done;
+	}
+
 	ndev->features = features;
 done:
 	spin_unlock_irqrestore(&priv->lock, flags);
@@ -2602,8 +2661,8 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.emac_init = ravb_emac_init_gbeth,
 	.gstrings_stats = ravb_gstrings_stats_gbeth,
 	.gstrings_size = sizeof(ravb_gstrings_stats_gbeth),
-	.net_hw_features = NETIF_F_RXCSUM,
-	.net_features = NETIF_F_RXCSUM,
+	.net_hw_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
+	.net_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.max_rx_len = ALIGN(GBETH_RX_BUFF_MAX, RAVB_ALIGN),
 	.tccr_mask = TCCR_TSRQ0,
-- 
2.25.1


