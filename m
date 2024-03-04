Return-Path: <linux-renesas-soc+bounces-3440-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746986FFED
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 12:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B07C1B24464
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 11:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D7443BB2E;
	Mon,  4 Mar 2024 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="xXVLio2D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68613A1D1
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 11:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550580; cv=none; b=WVonQBvjzZ8IeGE/YOGQjCk8jCsRE5LttqodIfEKhBh1gUhrpi5hqrvQUTXuqxTQTVvtKaxeJjPOHI6VZ6gPCP8BUrx25PP8twMaKEA9CrO/SBRIaNWlGKHnXQesfRPy/AR5wPnBZSCs6T/JlB8FcEizhKTleeEQlUZFawmv9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550580; c=relaxed/simple;
	bh=hkBsZswP4SLZ0fO+1zJSWpFWs6sN6ItMQD7hvy1akIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YFDFbnQi5Jk5FAV1YoyhXF4sfN/osOuR4+iBGfHwD9eCCyODbsBMA/1pPBZQO/R4Luz6tlT2pc6a/3MBiXzCtA3S6tteNp46MssIdfVhhPmIIcv0E+GapV6EaRIZqz+/ACeLo6J7K+HGNS38WzJ1FFR6vmfHN0JOR8pE3Qravyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=xXVLio2D; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so247480266b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2024 03:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709550576; x=1710155376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuI5YuZGQuQBgMJaVl9OwdG56lR7h/R4KTW+eq+jGhU=;
        b=xXVLio2DYlkRn3jdzBQKV0HFZ00yVHeFD6q1nSm6bCUAiA0HcEDwh5YkKljDUPAprA
         nAyyzKA+Sxq9VjLxfUjel4B/XOMGu3k25dUcZjIHtv+m8plrrfMo77fK6p3VgVlG17Xq
         Luo4qciENIIDIBiGwTqXlF4n8O8EaNoUtFlgogM7Mhc7uPi/0KjmDTHHtsVW8gusTKSO
         uMpfQbzbAfoOwGq254J9U8sT1C3OP56vGEnsqRLbuHmulrYJBUICwzWbhrooXUd9uVHh
         tRnUUu5kFeG+C7ScZZxGO1Ietz+27hXm1nTJb5W2ROW2IzGYRQg7edPt31ef1iXCsSf0
         hNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550576; x=1710155376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuI5YuZGQuQBgMJaVl9OwdG56lR7h/R4KTW+eq+jGhU=;
        b=SXvrWnA8bIna8WooNRCeOeg6avWrrbLyiBoY0HdkCYRjkERKG2UjuRB5rdhPLzsxAv
         wTp1YLEWrSbkhkg4HrZ6nyqqVfqmaCliS3cLcqeFLdydTYPLYDCM84/9UGUqhyEfAzYS
         PZ1qJPqEt/RqJScwuxGDHg7106krotg7hX+0CPM6KgvwCYiiKDHGre2q7usQjjqH3X0/
         A5noGtzisxmVnxdLcUOqjacJc8WLHtZr9NZWh43NEanzkLnl7r/o53Zr2Dkd4Et94mfl
         uxF/kT3/Iy0RcqV2bt2bIqPOP0vubt1YBN3bNKcY5VEpHCQUK5aN007n2vdvWUp69Mug
         Fbjg==
X-Gm-Message-State: AOJu0YwPnQ4PT6KpaFAulvSiItUN1BkaFvQU8Fs6d8kxmgjfp5iQJlpK
	BEYp+vIdR4StkKtykLmkFyKvYgdmzoDLJ4YcEbbobIdmUdEgEYN2KcoKIp/nSOs=
X-Google-Smtp-Source: AGHT+IFxF+MX00N7Tfy1puR1P3WzdikhCh4NXrOOxjfd6GYOv9sgsDS8nIzxHAnf1hXuzQPLSDZ1DA==
X-Received: by 2002:a17:906:894:b0:a45:5371:f0d6 with SMTP id n20-20020a170906089400b00a455371f0d6mr1218654eje.61.1709550576435;
        Mon, 04 Mar 2024 03:09:36 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id v23-20020a170906565700b00a455ff77e7bsm688420ejr.88.2024.03.04.03.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:09:36 -0800 (PST)
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
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [net-next,v3 6/6] ravb: Unify Rx ring maintenance code paths
Date: Mon,  4 Mar 2024 12:08:58 +0100
Message-ID: <20240304110858.117100-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240304110858.117100-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The R-Car and RZ/G2L Rx code paths were split in two separate
implementations when support for RZ/G2L was added due to the fact that
R-Car uses the extended descriptor format while RZ/G2L uses normal
descriptors. This has led to a duplication of Rx logic with the only
difference being the different Rx descriptors types used. The
implementation however neglects to take into account that extended
descriptors are normal descriptors with additional metadata at the end
to carry hardware timestamp information.

The hardware timestamp information is only consumed in the R-Car Rx
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
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
* Changes since v1
- Correct the ring size calculation in ravb_rx_ring_format() which was
  not updated in v1.

* Changes since v2
- Fix spelling in commit message.
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
2.44.0


