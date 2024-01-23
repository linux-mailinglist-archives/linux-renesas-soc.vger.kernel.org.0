Return-Path: <linux-renesas-soc+bounces-1725-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1190483927B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 16:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B568828BCE5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jan 2024 15:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F5C5FDC1;
	Tue, 23 Jan 2024 15:19:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93C55FDB0;
	Tue, 23 Jan 2024 15:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023185; cv=none; b=uYtFHsirEFRhK3R9Z5A2Ii6pe4Vz5FhUKBdjx7r7Bijmd4Hm5NRG8qzIwuV8e9fm9GMkLoxS4NfYjlNWfOK6zguAbUd1OJ6lMQT2NYzjumxEestSZGz251EGIdp33WUi2FHY+/xdmnChl5YggNc0fMZRDP3qReu0PKMqRK28Ps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023185; c=relaxed/simple;
	bh=Gp7mNC18xZNy1/TNn+K6lLYAOEMe+R+Oxkvn48KoLf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OMpK5V/+Eutuzqur0ErJKVDG1U/ipPOVB4Qua8dQoF8wcJBODTNHxeYd2mleU9ea44FVfS/hL9GO0I8Vy8dhu/5CCMS/b91B2cdf4fbQqMG6PbHg0fUug3he4Kq+XS4sUU67KSXp0xukonRRZp7yoEckKKyqdPZ72C9FZGzbySA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,214,1701097200"; 
   d="scan'208";a="195355006"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2024 00:19:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.36])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 34D3F400F33D;
	Wed, 24 Jan 2024 00:19:36 +0900 (JST)
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
Subject: [PATCH net-next 2/2] ravb: Add Tx checksum offload support
Date: Tue, 23 Jan 2024 15:19:24 +0000
Message-Id: <20240123151924.373917-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
References: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

TOE has hw support for calculating IP header and TCP/UDP/ICMP checksum for
both IPV4 and IPV6.

Add Tx checksum offload supported by TOE for IPv4 and TCP/UDP.

For Tx, the result of checksum calculation is set to the checksum field of
each IPv4 Header/TCP/UDP/ICMP of ethernet frames. For the unsupported
frames, those fields are not changed. If a transmission frame is an UDP
frame of IPv4 and its checksum value in the UDP header field is H’0000,
TOE does not calculate checksum for UDP part of this frame as it is
optional function as per standards.

We can test this functionality by the below commands

ethtool -K eth0 tx on --> to turn on Tx checksum offload
ethtool -K eth0 tx off --> to turn off Tx checksum offload

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      | 16 ++++++
 drivers/net/ethernet/renesas/ravb_main.c | 66 ++++++++++++++++++++++--
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index a2c494a85d12..3cf869fb9a68 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -209,6 +209,7 @@ enum ravb_reg {
 	RFCR	= 0x0760,
 	MAFCR	= 0x0778,
 	CSR0    = 0x0800,	/* RZ/G2L only */
+	CSR1    = 0x0804,	/* RZ/G2L only */
 	CSR2    = 0x0808,	/* RZ/G2L only */
 };
 
@@ -982,6 +983,21 @@ enum CSR0_BIT {
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
index 219eb9f0391c..7f7a26f698cb 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -29,6 +29,7 @@
 #include <linux/spinlock.h>
 #include <linux/reset.h>
 #include <linux/math64.h>
+#include <net/ip.h>
 
 #include "ravb.h"
 
@@ -524,19 +525,29 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 
 static void ravb_csum_offload_init_gbeth(struct net_device *ndev)
 {
+	bool tx_enable = ndev->features & NETIF_F_HW_CSUM;
 	bool rx_enable = ndev->features & NETIF_F_RXCSUM;
 	u32 csr0;
 
-	if (!rx_enable)
+	if (!(tx_enable || rx_enable))
 		return;
 
 	csr0 = ravb_read(ndev, CSR0);
 	ravb_write(ndev, csr0 & ~(CSR0_RPE | CSR0_TPE), CSR0);
 	if (ravb_wait(ndev, CSR0, CSR0_RPE | CSR0_TPE, 0)) {
 		netdev_err(ndev, "Timeout Enabling HW CSUM failed\n");
-		ndev->features &= ~NETIF_F_RXCSUM;
+
+		if (tx_enable)
+			ndev->features &= ~NETIF_F_HW_CSUM;
+
+		if (rx_enable)
+			ndev->features &= ~NETIF_F_RXCSUM;
 	} else {
-		ravb_write(ndev, CSR2_ALL, CSR2);
+		if (tx_enable)
+			ravb_write(ndev, CSR1_ALL, CSR1);
+
+		if (rx_enable)
+			ravb_write(ndev, CSR2_ALL, CSR2);
 	}
 
 	ravb_write(ndev, csr0, CSR0);
@@ -1990,6 +2001,39 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 	rtnl_unlock();
 }
 
+static bool ravb_is_tx_checksum_offload_gbeth_possible(struct sk_buff *skb)
+{
+	struct iphdr *ip = ip_hdr(skb);
+
+	/* TODO: Need to add support for VLAN tag 802.1Q */
+	if (skb_vlan_tag_present(skb))
+		return false;
+
+	/* TODO: Need to add HW checksum for IPV6 */
+	if (skb->protocol != htons(ETH_P_IP))
+		return false;
+
+	switch (ip->protocol) {
+	case IPPROTO_TCP:
+		break;
+	case IPPROTO_UDP:
+		/* If the checksum value in the UDP header field is “H’0000”,
+		 * TOE does not calculate checksum for UDP part of this frame
+		 * as it is optional function as per standards.
+		 */
+		if (udp_hdr(skb)->check == 0)
+			return false;
+		break;
+	/* TODO: Need to add HW checksum for ICMP */
+	case IPPROTO_ICMP:
+		fallthrough;
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
@@ -2005,6 +2049,11 @@ static netdev_tx_t ravb_start_xmit(struct sk_buff *skb, struct net_device *ndev)
 	u32 entry;
 	u32 len;
 
+	if (skb->ip_summed == CHECKSUM_PARTIAL) {
+		if (!ravb_is_tx_checksum_offload_gbeth_possible(skb))
+			skb_checksum_help(skb);
+	}
+
 	spin_lock_irqsave(&priv->lock, flags);
 	if (priv->cur_tx[q] - priv->dirty_tx[q] > (priv->num_tx_ring[q] - 1) *
 	    num_tx_desc) {
@@ -2408,6 +2457,13 @@ static int ravb_set_features_gbeth(struct net_device *ndev,
 			ravb_write(ndev, 0, CSR2);
 	}
 
+	if (changed & NETIF_F_HW_CSUM) {
+		if (features & NETIF_F_HW_CSUM)
+			ravb_write(ndev, CSR1_ALL, CSR1);
+		else
+			ravb_write(ndev, 0, CSR1);
+	}
+
 	ndev->features = features;
 err_wait:
 	ravb_write(ndev, csr0, CSR0);
@@ -2593,8 +2649,8 @@ static const struct ravb_hw_info gbeth_hw_info = {
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


