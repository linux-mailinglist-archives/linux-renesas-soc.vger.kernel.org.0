Return-Path: <linux-renesas-soc+bounces-9224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE2D98A978
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 18:13:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE7391C23A8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 16:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 583D6193417;
	Mon, 30 Sep 2024 16:09:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD1E19B3C1;
	Mon, 30 Sep 2024 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727712598; cv=none; b=o/RbgCBeasl4zx8hgmGA/kBHbdjQYaqbcj1I5KY0k0V88zJ+XXIkkfHGj6uJikyzNl9IoeWDBuFEpmReiGgWg10kuEdyV3wgqEuYiERxeV/ciLM3BcKtlKSorbNV3xo4uvAG9q4+2kvF/14DowGXkk/LiYyGG6zFpkXHPl5z7z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727712598; c=relaxed/simple;
	bh=0RR7Us/iLVVmyrygYAhgJANRosrqiUaP9lw1FvynpUg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAA0Iuxo27buU+ifYtzfqCZ7Awzpkiiefq+3ueEIGGz5Rv9Ey5VsMPdzGai7ZJs6D1x+EoY/MGwokrT5Gbx1L5tLSOL9WT5LNTh1yhDhvylMQDm2ogOktWaGxulrZ+RGuvostphGAw+U92/zQ4vfN+srm6x7SDhVc1ZFCZPabo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev; spf=fail smtp.mailfrom=pbarker.dev; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pbarker.dev
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pbarker.dev
X-IronPort-AV: E=Sophos;i="6.11,166,1725289200"; 
   d="scan'208";a="220371981"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2024 01:09:55 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.93.43])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AB3974014DD8;
	Tue,  1 Oct 2024 01:09:50 +0900 (JST)
From: Paul Barker <paul@pbarker.dev>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH 11/11] net: ravb: Add VLAN checksum support
Date: Mon, 30 Sep 2024 17:08:45 +0100
Message-Id: <20240930160845.8520-12-paul@pbarker.dev>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930160845.8520-1-paul@pbarker.dev>
References: <20240930160845.8520-1-paul@pbarker.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Barker <paul.barker.ct@bp.renesas.com>

The GbEth IP supports offloading checksum calculation for VLAN-tagged
packets, provided that the EtherType is 0x8100 and only one VLAN tag is
present.

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      |  1 +
 drivers/net/ethernet/renesas/ravb_main.c | 27 +++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 2cb6c4ef1330..bfa834afc03a 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1056,6 +1056,7 @@ struct ravb_hw_info {
 	size_t gstrings_size;
 	netdev_features_t net_hw_features;
 	netdev_features_t net_features;
+	netdev_features_t vlan_features;
 	int stats_len;
 	u32 tccr_mask;
 	u32 tx_max_frame_size;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 832132d44fb4..eb7499d42a9b 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2063,11 +2063,30 @@ static void ravb_tx_timeout_work(struct work_struct *work)
 
 static bool ravb_can_tx_csum_gbeth(struct sk_buff *skb)
 {
-	/* TODO: Need to add support for VLAN tag 802.1Q */
-	if (skb_vlan_tag_present(skb))
+	u16 net_protocol = ntohs(skb->protocol);
+
+	/* GbEth IP can calculate the checksum if:
+	 * - there are zero or one VLAN headers with TPID=0x8100
+	 * - the network protocol is IPv4 or IPv6
+	 * - the transport protocol is TCP, UDP or ICMP
+	 * - the packet is not fragmented
+	 */
+
+	if (skb_vlan_tag_present(skb) &&
+	    (skb->vlan_proto != ETH_P_8021Q || net_protocol == ETH_P_8021Q))
 		return false;
 
-	switch (ntohs(skb->protocol)) {
+	if (net_protocol == ETH_P_8021Q) {
+		struct vlan_hdr vhdr, *vh;
+
+		vh = skb_header_pointer(skb, ETH_HLEN, sizeof(vhdr), &vhdr);
+		if (!vh)
+			return false;
+
+		net_protocol = ntohs(vh->h_vlan_encapsulated_proto);
+	}
+
+	switch (net_protocol) {
 	case ETH_P_IP:
 		switch (ip_hdr(skb)->protocol) {
 		case IPPROTO_TCP:
@@ -2772,6 +2791,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.gstrings_size = sizeof(ravb_gstrings_stats_gbeth),
 	.net_hw_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.net_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
+	.vlan_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.tccr_mask = TCCR_TSRQ0,
 	.tx_max_frame_size = 1522,
@@ -2914,6 +2934,7 @@ static int ravb_probe(struct platform_device *pdev)
 
 	ndev->features = info->net_features;
 	ndev->hw_features = info->net_hw_features;
+	ndev->vlan_features = info->vlan_features;
 
 	error = reset_control_deassert(rstc);
 	if (error)
-- 
2.43.0


