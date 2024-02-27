Return-Path: <linux-renesas-soc+bounces-3293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F67D86A28F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 23:34:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A32AD1C25888
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 22:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0C355E4E;
	Tue, 27 Feb 2024 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="y1YdxcxF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2B15576B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 22:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073228; cv=none; b=ImR3H1Z+DOPoOM5yXQWCS5wqwKmz0d0hUpKYlMrMfDDkJ3UEXE5iyrl+BDVzLlJP2IBVJJcdKvI8508VKEJKg5oXsgpJlZxeccKUAsQd4ydagVZSxS9w4xiRYCEgm2fQyZJ28gjvpbMBHVTiTvEM2AVh88NHszDgj0SSilDvs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073228; c=relaxed/simple;
	bh=R/dks+o/qMNdEDtyOwBAJVo/BmZLMLLxdKyt8R8XBNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M5kPBQUEYVnf4/TFBTVmi3iWTx/BtSTI3azlhnZ3jzzTrsAmohOPpYOj7g9Qk8CHb0i638NfYx/7nBKS/jD7Jzb/GEMqS0G2QjFcvqKBSLP9Qe0GTlG3k5+fC1vdGxme7W7nA1ldbxI1aIxuL/eBNHdPLvHZaPqp/emDSs0cr90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=y1YdxcxF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5655c7dd3b1so531998a12.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 14:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709073225; x=1709678025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FZZ7ETYqxFAxj0cxv3ZbIbd7pVLeu99pB5XZLfm7rQ=;
        b=y1YdxcxFA94wgPlvAqI0AvUo5tUbjYgtsQv3KsLMx0+v7CgUraXudUc6HXyWUuvCd8
         CSgr5NqhVUWpcK2JRAi+MmsRHmVtkp1F4nxeY4mam0BOCCDLf1KTIbvnLoPS1JQztNwY
         hijzuDjBS2Dmj719diZ2m3LH6l4N8OCIhudB1d+PteE3dBbmo39ZO+druQPmhSKJOORb
         wLPUGT52pAqz+otyBoitRygkKA13DcAG9Z+vZKYATbAfgp5GPiIlnER1N17d+B4irqNw
         e2+ItUS2IX1nrutK/kd+WXe4VdzcSexMYkCXw3Ev32O6UKCs+JEZ+QWCa9mCQGRZT1ip
         yN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709073225; x=1709678025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6FZZ7ETYqxFAxj0cxv3ZbIbd7pVLeu99pB5XZLfm7rQ=;
        b=DD5rKNnwDykC0DPcuxdesAB6QSGrTA2GoanqiJP2pziWyzGCZEogSvKxhI5xsYccp6
         ZBQbOPpNZPQraFWbajbJfpR6ZtVv9cuX5InXCxzrj1kdjMPKWBmgiHTzIWZLVK/ZWNdI
         A5wRKyah3BLLIWfBOQ2pZwqUI0xRSJNnfHA7hMynv/Zw5oQI0QcGo9lbkFQKEWW3h3QD
         6+PpxWBZIIhw2LBScFoj5bgWqL6x9fau0uI/DyNTxRFAIEF6ZH16UTyhEa3oI6BLX7MO
         vOvOeaCcvkElSEUgmMAuLSPI1Z8xBjhPxhOPhrFGbdDBjlsrJl2SelZPf6Afq9gXtoAV
         stpQ==
X-Gm-Message-State: AOJu0Yz1YfFzX3bbCW5P5fnEn6bSyZkXjfBpw2EWoiZrBKnVSUrgM6YL
	wyeTsAl4usT5y5IkmMrdfFuKu4cU8/Y0UPl33g/s//z32RNvvjXVHth2X6a0Ivc=
X-Google-Smtp-Source: AGHT+IFGL3C030jWawV4YmR9a4mtom58TtSeQdaRk9vbc1x9PwafyzaYIWpb6VK52WKku3Wb7bPPYA==
X-Received: by 2002:a17:906:f80d:b0:a3f:365:2276 with SMTP id kh13-20020a170906f80d00b00a3f03652276mr505313ejb.34.1709073224719;
        Tue, 27 Feb 2024 14:33:44 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id jp11-20020a170906f74b00b00a437b467c92sm1195860ejb.177.2024.02.27.14.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:33:44 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next,v2 3/6] ravb: Create helper to allocate skb and align it
Date: Tue, 27 Feb 2024 23:33:02 +0100
Message-ID: <20240227223305.910452-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240227223305.910452-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The RAVB device requires the SKB data to be aligned to 128 bytes. The
alignment is done by allocating a skb 128 bytes larger than the maximum
frame size supported by the device and adjusting the headroom to fit the
requirement.

This code has been refactored a few times and small issues have been
added along the way. The issues are not harmful but prevents merging
parts of the Rx code which have been split in two implementations with
the addition of RZ/G2L support, a device that supports larger frame
sizes.

This change removes the need for duplicated and somewhat inaccurate
hardware alignment constrains stored in the hardware information struct
by creating a helper to handle the allocation of a skb and alignment of
a skb data.

For the R-Car class of devices the maximum frame size is 4K and each
descriptor is limited to 2K of data. The current implementation does not
support split descriptors, this limits the frame size to 2K. The
current hardware information however records the descriptor size just
under 2K due to bad understanding of the device when larger MTUs where
added.

For the RZ/G2L device the maximum frame size is 8K and each descriptor
is limited to 4K of data. The current hardware information records this
correctly, but it gets the alignment constrains wrong as just aligns it
by 128, it does not extend it by 128 bytes to allow the full frame to be
stored. This works because the RZ/G2L device supports split descriptors
and allocates each skb to 8K and aligns each 4K descriptor in this
space.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Add a GFP mask argument to ravb_alloc_skb() to preserve GFP_KERNEL at
  init time.
---
 drivers/net/ethernet/renesas/ravb.h      |  1 -
 drivers/net/ethernet/renesas/ravb_main.c | 43 +++++++++++++-----------
 2 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 7f9e8b2c012a..751bb29cd488 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1057,7 +1057,6 @@ struct ravb_hw_info {
 	netdev_features_t net_hw_features;
 	netdev_features_t net_features;
 	int stats_len;
-	size_t max_rx_len;
 	u32 tccr_mask;
 	u32 rx_max_frame_size;
 	unsigned aligned_tx: 1;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 5c72b780d623..e6b025058847 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -113,12 +113,23 @@ static void ravb_set_rate_rcar(struct net_device *ndev)
 	}
 }
 
-static void ravb_set_buffer_align(struct sk_buff *skb)
+static struct sk_buff *
+ravb_alloc_skb(struct net_device *ndev, const struct ravb_hw_info *info,
+	       gfp_t gfp_mask)
 {
-	u32 reserve = (unsigned long)skb->data & (RAVB_ALIGN - 1);
+	struct sk_buff *skb;
+	u32 reserve;
 
+	skb = __netdev_alloc_skb(ndev, info->rx_max_frame_size + RAVB_ALIGN - 1,
+				 gfp_mask);
+	if (!skb)
+		return NULL;
+
+	reserve = (unsigned long)skb->data & (RAVB_ALIGN - 1);
 	if (reserve)
 		skb_reserve(skb, RAVB_ALIGN - reserve);
+
+	return skb;
 }
 
 /* Get MAC address from the MAC address registers
@@ -251,7 +262,7 @@ static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
 				       le32_to_cpu(desc->dptr)))
 			dma_unmap_single(ndev->dev.parent,
 					 le32_to_cpu(desc->dptr),
-					 GBETH_RX_BUFF_MAX,
+					 priv->info->rx_max_frame_size,
 					 DMA_FROM_DEVICE);
 	}
 	ring_size = sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1);
@@ -276,7 +287,7 @@ static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
 				       le32_to_cpu(desc->dptr)))
 			dma_unmap_single(ndev->dev.parent,
 					 le32_to_cpu(desc->dptr),
-					 RX_BUF_SZ,
+					 priv->info->rx_max_frame_size,
 					 DMA_FROM_DEVICE);
 	}
 	ring_size = sizeof(struct ravb_ex_rx_desc) *
@@ -342,7 +353,7 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 		rx_desc = &priv->rx_ring[q].desc[i];
 		rx_desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
-					  GBETH_RX_BUFF_MAX,
+					  priv->info->rx_max_frame_size,
 					  DMA_FROM_DEVICE);
 		/* We just set the data size to 0 for a failed mapping which
 		 * should prevent DMA from happening...
@@ -372,7 +383,7 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 		rx_desc = &priv->rx_ring[q].ex_desc[i];
 		rx_desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
-					  RX_BUF_SZ,
+					  priv->info->rx_max_frame_size,
 					  DMA_FROM_DEVICE);
 		/* We just set the data size to 0 for a failed mapping which
 		 * should prevent DMA from happening...
@@ -476,10 +487,9 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 		goto error;
 
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		skb = __netdev_alloc_skb(ndev, info->max_rx_len, GFP_KERNEL);
+		skb = ravb_alloc_skb(ndev, info, GFP_KERNEL);
 		if (!skb)
 			goto error;
-		ravb_set_buffer_align(skb);
 		priv->rx_skb[q][i] = skb;
 	}
 
@@ -805,7 +815,8 @@ static struct sk_buff *ravb_get_skb_gbeth(struct net_device *ndev, int entry,
 	skb = priv->rx_skb[RAVB_BE][entry];
 	priv->rx_skb[RAVB_BE][entry] = NULL;
 	dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
-			 ALIGN(GBETH_RX_BUFF_MAX, 16), DMA_FROM_DEVICE);
+			 ALIGN(priv->info->rx_max_frame_size, 16),
+			 DMA_FROM_DEVICE);
 
 	return skb;
 }
@@ -912,13 +923,12 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 		desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
 
 		if (!priv->rx_skb[q][entry]) {
-			skb = netdev_alloc_skb(ndev, info->max_rx_len);
+			skb = ravb_alloc_skb(ndev, info, GFP_ATOMIC);
 			if (!skb)
 				break;
-			ravb_set_buffer_align(skb);
 			dma_addr = dma_map_single(ndev->dev.parent,
 						  skb->data,
-						  GBETH_RX_BUFF_MAX,
+						  priv->info->rx_max_frame_size,
 						  DMA_FROM_DEVICE);
 			skb_checksum_none_assert(skb);
 			/* We just set the data size to 0 for a failed mapping
@@ -992,7 +1002,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 			skb = priv->rx_skb[q][entry];
 			priv->rx_skb[q][entry] = NULL;
 			dma_unmap_single(ndev->dev.parent, le32_to_cpu(desc->dptr),
-					 RX_BUF_SZ,
+					 priv->info->rx_max_frame_size,
 					 DMA_FROM_DEVICE);
 			get_ts &= (q == RAVB_NC) ?
 					RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
@@ -1028,10 +1038,9 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 		desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
 
 		if (!priv->rx_skb[q][entry]) {
-			skb = netdev_alloc_skb(ndev, info->max_rx_len);
+			skb = ravb_alloc_skb(ndev, info, GFP_ATOMIC);
 			if (!skb)
 				break;	/* Better luck next round. */
-			ravb_set_buffer_align(skb);
 			dma_addr = dma_map_single(ndev->dev.parent, skb->data,
 						  le16_to_cpu(desc->ds_cc),
 						  DMA_FROM_DEVICE);
@@ -2682,7 +2691,6 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.net_hw_features = NETIF_F_RXCSUM,
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
-	.max_rx_len = RX_BUF_SZ + RAVB_ALIGN - 1,
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.internal_delay = 1,
@@ -2708,7 +2716,6 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.net_hw_features = NETIF_F_RXCSUM,
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
-	.max_rx_len = RX_BUF_SZ + RAVB_ALIGN - 1,
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.aligned_tx = 1,
@@ -2731,7 +2738,6 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.net_hw_features = NETIF_F_RXCSUM,
 	.net_features = NETIF_F_RXCSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
-	.max_rx_len = RX_BUF_SZ + RAVB_ALIGN - 1,
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.multi_irqs = 1,
@@ -2756,7 +2762,6 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.net_hw_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.net_features = NETIF_F_RXCSUM | NETIF_F_HW_CSUM,
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
-	.max_rx_len = ALIGN(GBETH_RX_BUFF_MAX, RAVB_ALIGN),
 	.tccr_mask = TCCR_TSRQ0,
 	.rx_max_frame_size = SZ_8K,
 	.aligned_tx = 1,
-- 
2.43.2


