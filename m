Return-Path: <linux-renesas-soc+bounces-3296-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BE986A295
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 23:34:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24A001C25721
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 22:34:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6198D55783;
	Tue, 27 Feb 2024 22:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Hi6O0sey"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E556442
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073231; cv=none; b=W7NEO+f7PnD3TXn8z40ipd4T87phtxeqCX3U7EsFrB+/ywcKuDgNZQzIII2zUoD/11BgAlZLuFcz3PFu8xF9ySuL5q3mUVwtDfjIAa+mTKqNU2KELgkbDwQ7SfTHluFW3rtdZRgdMBkdyq86Wr+KbxiieUgjH2pS1LJfm5SkXE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073231; c=relaxed/simple;
	bh=NsXE/unVpq5BAO/lkjmn97yxLoG1Y7asewC83+dYpv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqYpv3bw4PG4sx6XMuZCZnMoznGdV7nkZI1s2izqxVHgd8qOz5wsbg1eJmKCb0YwMbxiWr+k6lKy4Cg8GhlbA82Zph9yO8pO/0TcbPFIARFNvghBhRYVeGejEQeo7/9n5HtZfLmXuANNpyB/i2DRXeyNCUL3OoXJOiBplcxl7uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Hi6O0sey; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-564fd9eea75so6151385a12.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 14:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709073227; x=1709678027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDliBUu8UHIuU4WtJ8A7X4+oz+6DcP3P5MaIAWkCy/Q=;
        b=Hi6O0seyLsYPS8yXqEfnl+8bRqLHdY7cfuVp5aDLfiZGr4zg4xlWsKaICGN0H9/OyZ
         Uw7ITVrTK+Zt08eNnat2XxBCkGbetO5et0bStJIk+WAkxAsJY+S+fb2YeHLn18snXLdQ
         ZHt1Wv9nar7APMur/WT6QsvVlWaqM7bu/lFAcTIm2gpymvkDkJEs9apH5AzHL6P5YjqS
         o1+zA+NRu5DOiB/Ne8Y6SrRxkdYJL1UE1oSigmwkqsGwo2kB9A5PWokW3lVFn8C6OzJt
         17KUM3vdo6LmcinAP5MLp9mxeGFJcNQ2ZglkRjIvokA8fPcctwYRQRX6SCJr8B7puEs8
         Y+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709073227; x=1709678027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TDliBUu8UHIuU4WtJ8A7X4+oz+6DcP3P5MaIAWkCy/Q=;
        b=shDxcRTpvJsC9a5OdpV92IQLFOiA9pMwJzcY7swxJHDPEETNfxFtsNIRGdx4iTFysO
         Pg7t4dNNg9kUaT/Rjq/OPP4TGp/mTllu9aw0/z8lgnKNqWvgCbS4n+JHYyOh6MDqEoyj
         WAsLtARJDBDYLflwAYwpcms6KUIFEK/FriZ4w2T53jSe8dJaZOWUDGvWeArxgkjfgrV3
         HRn+k70x1Ly/YJp8ZVpIEPIdvYaGK+WwL1adZD9hqvsmvap75Q1JSv3nGsU78S3OUCqc
         JZrYYZwrcLMzgVYIrgv4HyXVGlxa2RDDEvYMSqI2WV3xvmUmPqs3sTrnIKaONRcYhLEq
         irLw==
X-Gm-Message-State: AOJu0YzzFbKxzGgy+hpM27/WnXd865b+sWrjDMSk0ZrCGEA8sneX/2+l
	priC9UGaZMSPHwD6cZa0uo4kV1pADo4fN9sit/ySgQy2+NFbkkmf4qHPemvdaIM=
X-Google-Smtp-Source: AGHT+IEjpFh6OeH00kvO6SSQ9mE4qLwAYtWt7Ah6LH7Pbn5J+vPS0oGbwCloj4ku/dHD9lw27DZ7mw==
X-Received: by 2002:a17:906:1e93:b0:a3f:a009:690 with SMTP id e19-20020a1709061e9300b00a3fa0090690mr7802182ejj.14.1709073227620;
        Tue, 27 Feb 2024 14:33:47 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id jp11-20020a170906f74b00b00a437b467c92sm1195860ejb.177.2024.02.27.14.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:33:47 -0800 (PST)
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
Subject: [net-next,v2 6/6] ravb: Unify Rx ring maintenance code paths
Date: Tue, 27 Feb 2024 23:33:05 +0100
Message-ID: <20240227223305.910452-7-niklas.soderlund+renesas@ragnatech.se>
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

The R-Car and RZ/G2L Rx code paths was split in two separate
implementations when support for RZ/G2L was added due to the fact that
R-Car uses the extended descriptor format while RZ/G2L uses normal
descriptors. This has lead to a duplication of Rx logic with the only
difference being the different Rx descriptors types used. The
implementation however neglects to take into account that extended
descriptors are normal descriptors with additional metadata at the end
to carry hardware timestamp information.

The hardware timestamps information is only consumed in the R-Car Rx
loop and all the maintenance code around the Rx ring can be shared
between the two implementations if the difference in descriptor length
is carefully considered.

This change merges the two implementations for Rx ring maintenance by
adding a method to access both types of descriptors as normal
descriptors, as this part covers all the fields needed for Rx ring
maintenance the only difference between using normal or extended
descriptor is the size of the memory region to allocate/free and the
step size between each descriptor in the ring.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Correct the ring size calculation in ravb_rx_ring_format() which was
  not updated in v1.
---
 drivers/net/ethernet/renesas/ravb.h      |   5 +-
 drivers/net/ethernet/renesas/ravb_main.c | 134 ++++++-----------------
 2 files changed, 33 insertions(+), 106 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index b12b379baf5a..b48935ec7e28 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1039,9 +1039,6 @@ struct ravb_ptp {
 };
 
 struct ravb_hw_info {
-	void (*rx_ring_free)(struct net_device *ndev, int q);
-	void (*rx_ring_format)(struct net_device *ndev, int q);
-	void *(*alloc_rx_desc)(struct net_device *ndev, int q);
 	bool (*receive)(struct net_device *ndev, int *quota, int q);
 	void (*set_rate)(struct net_device *ndev);
 	int (*set_feature)(struct net_device *ndev, netdev_features_t features);
@@ -1055,6 +1052,7 @@ struct ravb_hw_info {
 	u32 tccr_mask;
 	u32 rx_max_frame_size;
 	u32 rx_max_desc_use;
+	u32 rx_desc_size;
 	unsigned aligned_tx: 1;
 
 	/* hardware features */
@@ -1090,6 +1088,7 @@ struct ravb_private {
 	union {
 		struct ravb_rx_desc *desc;
 		struct ravb_ex_rx_desc *ex_desc;
+		void *raw;
 	} rx_ring[NUM_RX_QUEUE];
 	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
 	void *tx_align[NUM_TX_QUEUE];
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4ef4be9e152e..fa48ff4aba2d 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -202,6 +202,13 @@ static const struct mdiobb_ops bb_ops = {
 	.get_mdio_data = ravb_get_mdio_data,
 };
 
+static struct ravb_rx_desc *
+ravb_rx_get_desc(struct ravb_private *priv, unsigned int q,
+		 unsigned int i)
+{
+	return priv->rx_ring[q].raw + priv->info->rx_desc_size * i;
+}
+
 /* Free TX skb function for AVB-IP */
 static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
 {
@@ -246,17 +253,17 @@ static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
 	return free_num;
 }
 
-static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
+static void ravb_rx_ring_free(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned int ring_size;
 	unsigned int i;
 
-	if (!priv->rx_ring[q].desc)
+	if (!priv->rx_ring[q].raw)
 		return;
 
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		struct ravb_rx_desc *desc = &priv->rx_ring[q].desc[i];
+		struct ravb_rx_desc *desc = ravb_rx_get_desc(priv, q, i);
 
 		if (!dma_mapping_error(ndev->dev.parent,
 				       le32_to_cpu(desc->dptr)))
@@ -265,48 +272,21 @@ static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
 					 priv->info->rx_max_frame_size,
 					 DMA_FROM_DEVICE);
 	}
-	ring_size = sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1);
-	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].desc,
+	ring_size = priv->info->rx_desc_size * (priv->num_rx_ring[q] + 1);
+	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].raw,
 			  priv->rx_desc_dma[q]);
-	priv->rx_ring[q].desc = NULL;
-}
-
-static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	unsigned int ring_size;
-	unsigned int i;
-
-	if (!priv->rx_ring[q].ex_desc)
-		return;
-
-	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		struct ravb_ex_rx_desc *desc = &priv->rx_ring[q].ex_desc[i];
-
-		if (!dma_mapping_error(ndev->dev.parent,
-				       le32_to_cpu(desc->dptr)))
-			dma_unmap_single(ndev->dev.parent,
-					 le32_to_cpu(desc->dptr),
-					 priv->info->rx_max_frame_size,
-					 DMA_FROM_DEVICE);
-	}
-	ring_size = sizeof(struct ravb_ex_rx_desc) *
-		    (priv->num_rx_ring[q] + 1);
-	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].ex_desc,
-			  priv->rx_desc_dma[q]);
-	priv->rx_ring[q].ex_desc = NULL;
+	priv->rx_ring[q].raw = NULL;
 }
 
 /* Free skb's and DMA buffers for Ethernet AVB */
 static void ravb_ring_free(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	unsigned int num_tx_desc = priv->num_tx_desc;
 	unsigned int ring_size;
 	unsigned int i;
 
-	info->rx_ring_free(ndev, q);
+	ravb_rx_ring_free(ndev, q);
 
 	if (priv->tx_ring[q]) {
 		ravb_tx_free(ndev, q, false);
@@ -337,7 +317,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 	priv->tx_skb[q] = NULL;
 }
 
-static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
+static void ravb_rx_ring_format(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	struct ravb_rx_desc *rx_desc;
@@ -345,12 +325,12 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 	dma_addr_t dma_addr;
 	unsigned int i;
 
-	rx_ring_size = sizeof(*rx_desc) * priv->num_rx_ring[q];
-	memset(priv->rx_ring[q].desc, 0, rx_ring_size);
+	rx_ring_size = priv->info->rx_desc_size * priv->num_rx_ring[q];
+	memset(priv->rx_ring[q].raw, 0, rx_ring_size);
 	/* Build RX ring buffer */
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
-		rx_desc = &priv->rx_ring[q].desc[i];
+		rx_desc = ravb_rx_get_desc(priv, q, i);
 		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  priv->info->rx_max_frame_size,
@@ -363,37 +343,7 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 		rx_desc->dptr = cpu_to_le32(dma_addr);
 		rx_desc->die_dt = DT_FEMPTY;
 	}
-	rx_desc = &priv->rx_ring[q].desc[i];
-	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma[q]);
-	rx_desc->die_dt = DT_LINKFIX; /* type */
-}
-
-static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	struct ravb_ex_rx_desc *rx_desc;
-	unsigned int rx_ring_size = sizeof(*rx_desc) * priv->num_rx_ring[q];
-	dma_addr_t dma_addr;
-	unsigned int i;
-
-	memset(priv->rx_ring[q].ex_desc, 0, rx_ring_size);
-	/* Build RX ring buffer */
-	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		/* RX descriptor */
-		rx_desc = &priv->rx_ring[q].ex_desc[i];
-		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
-		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
-					  priv->info->rx_max_frame_size,
-					  DMA_FROM_DEVICE);
-		/* We just set the data size to 0 for a failed mapping which
-		 * should prevent DMA from happening...
-		 */
-		if (dma_mapping_error(ndev->dev.parent, dma_addr))
-			rx_desc->ds_cc = cpu_to_le16(0);
-		rx_desc->dptr = cpu_to_le32(dma_addr);
-		rx_desc->die_dt = DT_FEMPTY;
-	}
-	rx_desc = &priv->rx_ring[q].ex_desc[i];
+	rx_desc = ravb_rx_get_desc(priv, q, i);
 	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma[q]);
 	rx_desc->die_dt = DT_LINKFIX; /* type */
 }
@@ -402,7 +352,6 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 static void ravb_ring_format(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	unsigned int num_tx_desc = priv->num_tx_desc;
 	struct ravb_tx_desc *tx_desc;
 	struct ravb_desc *desc;
@@ -415,7 +364,7 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	priv->dirty_rx[q] = 0;
 	priv->dirty_tx[q] = 0;
 
-	info->rx_ring_format(ndev, q);
+	ravb_rx_ring_format(ndev, q);
 
 	memset(priv->tx_ring[q], 0, tx_ring_size);
 	/* Build TX ring buffer */
@@ -441,31 +390,18 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	desc->dptr = cpu_to_le32((u32)priv->tx_desc_dma[q]);
 }
 
-static void *ravb_alloc_rx_desc_gbeth(struct net_device *ndev, int q)
+static void *ravb_alloc_rx_desc(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned int ring_size;
 
-	ring_size = sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1);
+	ring_size = priv->info->rx_desc_size * (priv->num_rx_ring[q] + 1);
 
-	priv->rx_ring[q].desc = dma_alloc_coherent(ndev->dev.parent, ring_size,
-						   &priv->rx_desc_dma[q],
-						   GFP_KERNEL);
-	return priv->rx_ring[q].desc;
-}
+	priv->rx_ring[q].raw = dma_alloc_coherent(ndev->dev.parent, ring_size,
+						  &priv->rx_desc_dma[q],
+						  GFP_KERNEL);
 
-static void *ravb_alloc_rx_desc_rcar(struct net_device *ndev, int q)
-{
-	struct ravb_private *priv = netdev_priv(ndev);
-	unsigned int ring_size;
-
-	ring_size = sizeof(struct ravb_ex_rx_desc) * (priv->num_rx_ring[q] + 1);
-
-	priv->rx_ring[q].ex_desc = dma_alloc_coherent(ndev->dev.parent,
-						      ring_size,
-						      &priv->rx_desc_dma[q],
-						      GFP_KERNEL);
-	return priv->rx_ring[q].ex_desc;
+	return priv->rx_ring[q].raw;
 }
 
 /* Init skb and descriptor buffer for Ethernet AVB */
@@ -502,7 +438,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	}
 
 	/* Allocate all RX descriptors. */
-	if (!info->alloc_rx_desc(ndev, q))
+	if (!ravb_alloc_rx_desc(ndev, q))
 		goto error;
 
 	priv->dirty_rx[q] = 0;
@@ -2679,9 +2615,6 @@ static int ravb_mdio_release(struct ravb_private *priv)
 }
 
 static const struct ravb_hw_info ravb_gen3_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_rcar,
-	.rx_ring_format = ravb_rx_ring_format_rcar,
-	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2695,6 +2628,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2705,9 +2639,6 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 };
 
 static const struct ravb_hw_info ravb_gen2_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_rcar,
-	.rx_ring_format = ravb_rx_ring_format_rcar,
-	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2721,6 +2652,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.aligned_tx = 1,
 	.gptp = 1,
 	.nc_queues = 1,
@@ -2728,9 +2660,6 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 };
 
 static const struct ravb_hw_info ravb_rzv2m_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_rcar,
-	.rx_ring_format = ravb_rx_ring_format_rcar,
-	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2744,6 +2673,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
 	.gptp = 1,
@@ -2753,9 +2683,6 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 };
 
 static const struct ravb_hw_info gbeth_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_gbeth,
-	.rx_ring_format = ravb_rx_ring_format_gbeth,
-	.alloc_rx_desc = ravb_alloc_rx_desc_gbeth,
 	.receive = ravb_rx_gbeth,
 	.set_rate = ravb_set_rate_gbeth,
 	.set_feature = ravb_set_features_gbeth,
@@ -2769,6 +2696,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.tccr_mask = TCCR_TSRQ0,
 	.rx_max_frame_size = SZ_8K,
 	.rx_max_desc_use = 4080,
+	.rx_desc_size = sizeof(struct ravb_rx_desc),
 	.aligned_tx = 1,
 	.tx_counters = 1,
 	.carrier_counters = 1,
-- 
2.43.2


