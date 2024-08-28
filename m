Return-Path: <linux-renesas-soc+bounces-8433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 722859624BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FBC71F27B1D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 10:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B3616C690;
	Wed, 28 Aug 2024 10:22:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BE916B3BF;
	Wed, 28 Aug 2024 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724840568; cv=none; b=duNkfkChM4ytHqvEGzfPXivOQPYiosL4joNhmLpGSLyunA3a+AkDp8IWhtxJvBxlwONONtmeEaTzw9R7/3NkHn3koLU8N1F1+4lsxwwtVn47pHrixHUGIWL7/UC8qmXQlKqg6fJ4dL6vtvqU/4hTDBo56QdY3qQzABqrXiadHFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724840568; c=relaxed/simple;
	bh=w/G0COS/h+gn9Pp0mROo326eCUP6rKAG+ohs6H1hlHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXDVso28ldHXr0WKLFUur1tazgRi+6tJql0DCCYAgwIDZAaWXL3l9Y7XALWzyGl+KwiVVXqTR4TYd5jebuk24fambZljeM93iS70+DtYti35zBityRjRuNrsDMVMDez+K0z/UotaIhxT3/dE7StWg+JzhmRO8a3+DiCHPaiQ2jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="216828077"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2024 19:22:45 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.92.33])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3B15D4007206;
	Wed, 28 Aug 2024 19:22:39 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mitsuhiro Kimura <mitsuhiro.kimura.kc@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net PATCH v2 1/2] net: ravb: Fix maximum TX frame size for GbEth devices
Date: Wed, 28 Aug 2024 11:22:25 +0100
Message-Id: <20240828102226.223-2-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828102226.223-1-paul.barker.ct@bp.renesas.com>
References: <20240828102226.223-1-paul.barker.ct@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The datasheets for all SoCs using the GbEth IP specify a maximum
transmission frame size of 1.5 kByte. I've confirmed through internal
discussions that support for 1522 byte frames has been validated, which
allows us to support the default MTU of 1500 bytes after reserving space
for the Ethernet header, frame checksums and an optional VLAN tag.

Fixes: 2e95e08ac009 ("ravb: Add rx_max_buf_size to struct ravb_hw_info")
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 drivers/net/ethernet/renesas/ravb.h      | 1 +
 drivers/net/ethernet/renesas/ravb_main.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 9893c91af105..a7de5cf6b317 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1052,6 +1052,7 @@ struct ravb_hw_info {
 	netdev_features_t net_features;
 	int stats_len;
 	u32 tccr_mask;
+	u32 tx_max_frame_size;
 	u32 rx_max_frame_size;
 	u32 rx_buffer_size;
 	u32 rx_desc_size;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index c02fb296bf7d..471a68b0146e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2674,6 +2674,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
+	.tx_max_frame_size = SZ_2K,
 	.rx_max_frame_size = SZ_2K,
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
@@ -2696,6 +2697,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
+	.tx_max_frame_size = SZ_2K,
 	.rx_max_frame_size = SZ_2K,
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
@@ -2721,6 +2723,7 @@ static const struct ravb_hw_info ravb_gen4_hw_info = {
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
+	.tx_max_frame_size = SZ_2K,
 	.rx_max_frame_size = SZ_2K,
 	.rx_buffer_size = SZ_2K +
 			  SKB_DATA_ALIGN(sizeof(struct skb_shared_info)),
@@ -2770,6 +2773,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.net_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.tccr_mask = TCCR_TSRQ0,
+	.tx_max_frame_size = 1522,
 	.rx_max_frame_size = SZ_8K,
 	.rx_buffer_size = SZ_2K,
 	.rx_desc_size = sizeof(struct ravb_rx_desc),
@@ -2981,7 +2985,7 @@ static int ravb_probe(struct platform_device *pdev)
 	priv->avb_link_active_low =
 		of_property_read_bool(np, "renesas,ether-link-active-low");
 
-	ndev->max_mtu = info->rx_max_frame_size -
+	ndev->max_mtu = info->tx_max_frame_size -
 		(ETH_HLEN + VLAN_HLEN + ETH_FCS_LEN);
 	ndev->min_mtu = ETH_MIN_MTU;
 
-- 
2.43.0


