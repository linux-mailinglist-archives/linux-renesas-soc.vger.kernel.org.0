Return-Path: <linux-renesas-soc+bounces-3229-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 322EF86862C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 02:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF2E61F25596
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 01:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B576AA1;
	Tue, 27 Feb 2024 01:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="oFL2VjK6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB05672
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 01:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998125; cv=none; b=O04kxJBEuq+frjLu8yJccKs3CpWcnyKujmNEodd2qu9KC5XuwBe5Ki+ytTt8tYSkrQ9CHcybVMpnfkpJInzsZusxV4if9TaLyLaXoiGDE/Ajm2arHA0O06AuXQ690q283Wb9jvbTYtH9hakCpJD5lmtO7xaGMWG2n/ncQmD7eGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998125; c=relaxed/simple;
	bh=u1rKXH9MEvSVg7z0ovNe6vfDyDHM2mnuWRI9llDxLEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J38rP+u1nbf9pWfWp8QE6MlBudxalOigv+zz59syTij9sVJE/rpuQtx9r6ShwlRBkriYx+u1CnNUssgsN05RViPv+sTg6EAK+ieie2LU+FGWI3PT/CISMzltguKAhFmOlMbjHyNPKw3fBh9GJp+6fY7AG8KyP5w4LYUptWGQOHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=oFL2VjK6; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4129e8bc6c8so20019455e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 17:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708998122; x=1709602922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Haxzg+6S48ZNhss1vHotACzALgiNr9ml+YJyk8dls4E=;
        b=oFL2VjK6M1uydrS1mkXwMdjZxNOznZx3N6rgWMP87Ny3LyCRItt5O7VKpBagNRT3x6
         Bn4YFSRMj8zY51penZDwXJKPrBtlW09XrLT3o/2Rq8wpisAzFc9OUfKHHuUREHG5Dx2V
         09fvtHL95P+BdCYLRnu9HDD1NMvYb0wm1p0rcx1BjiLhh7s26nruVELEhEL2Pdr5cKtj
         aZ71f1jLBLEQnp9GxggvB+F0n1kDUb/U7uSEbFiMIb+dlly1zWsLK5c+/IMcVbNPote3
         +h4OyUPeeGd9z0Jew+0IzLgscNqoaavP5/KSoVEDjrWCsdfSpzmcKWn36FdQSRk1/rOq
         ed9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998122; x=1709602922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Haxzg+6S48ZNhss1vHotACzALgiNr9ml+YJyk8dls4E=;
        b=Fb7bqo84suL4UR0lGCbXSxPOZD5WE0hlU0TgOj36CwGcTjozf6NBk0Xj4e2egYH+RG
         FWRt+G8MgNN54CVliGMHPh8EzNdrBxTIbpp5YNRv4GgfeOwZkAM6SkbD1EXE5kFqDLh7
         /NU5qjlnYWI6GvXhC8MWCtzhB0T/WGNvJ93N+Xp9Z+yzc/MMNsDoGEAFa0pVTyRLNgi6
         wFsW/+aaJcILGhgjnv/byzW0PvfscE53ctx+cXRbzLlK8Heapp0xR0usDOgw+7uoe1Cs
         SLIPnUa0VO7ft48qpbZxf1f0gi4k/pO84JP9lP1Pp190bsEIQy4F8ku4FCm9Vvx3ps7b
         rulQ==
X-Gm-Message-State: AOJu0YwNwEkC+JIa1AR+45efrQHa9VSvvoR6BzPTuQYOL7E9bHUx1pqO
	ynYlTxNzpm3G9e9dduton+tmRa79PYhc3SpWpuPl/oeXjyHlhndRVh+I1eF8yhI=
X-Google-Smtp-Source: AGHT+IHry4xt8PLHMedDr3bdwAW4SBBzXFdefMYlz8zOa14JskFYDz0FjX4rOwnCYlbIeTjj+5z2iw==
X-Received: by 2002:a05:600c:5592:b0:412:6de0:69a9 with SMTP id jp18-20020a05600c559200b004126de069a9mr5452392wmb.39.1708998121933;
        Mon, 26 Feb 2024 17:42:01 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id w15-20020a05600c474f00b004129860d532sm9827918wmo.2.2024.02.26.17.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:42:01 -0800 (PST)
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
Subject: [net-next 6/6] ravb: Unify Rx ring maintenance code paths
Date: Tue, 27 Feb 2024 02:40:14 +0100
Message-ID: <20240227014014.44855-7-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240227014014.44855-1-niklas.soderlund+renesas@ragnatech.se>
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
 drivers/net/ethernet/renesas/ravb.h      |   5 +-
 drivers/net/ethernet/renesas/ravb_main.c | 132 ++++++-----------------
 2 files changed, 32 insertions(+), 105 deletions(-)

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
index dee51a78cf36..2702455b6cc6 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -200,6 +200,13 @@ static const struct mdiobb_ops bb_ops = {
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
@@ -244,17 +251,17 @@ static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
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
@@ -263,48 +270,21 @@ static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
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
@@ -335,7 +315,7 @@ static void ravb_ring_free(struct net_device *ndev, int q)
 	priv->tx_skb[q] = NULL;
 }
 
-static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
+static void ravb_rx_ring_format(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	struct ravb_rx_desc *rx_desc;
@@ -344,11 +324,11 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 	unsigned int i;
 
 	rx_ring_size = sizeof(*rx_desc) * priv->num_rx_ring[q];
-	memset(priv->rx_ring[q].desc, 0, rx_ring_size);
+	memset(priv->rx_ring[q].raw, 0, rx_ring_size);
 	/* Build RX ring buffer */
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
-		rx_desc = &priv->rx_ring[q].desc[i];
+		rx_desc = ravb_rx_get_desc(priv, q, i);
 		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  priv->info->rx_max_frame_size,
@@ -361,37 +341,7 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
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
@@ -400,7 +350,6 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 static void ravb_ring_format(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
-	const struct ravb_hw_info *info = priv->info;
 	unsigned int num_tx_desc = priv->num_tx_desc;
 	struct ravb_tx_desc *tx_desc;
 	struct ravb_desc *desc;
@@ -413,7 +362,7 @@ static void ravb_ring_format(struct net_device *ndev, int q)
 	priv->dirty_rx[q] = 0;
 	priv->dirty_tx[q] = 0;
 
-	info->rx_ring_format(ndev, q);
+	ravb_rx_ring_format(ndev, q);
 
 	memset(priv->tx_ring[q], 0, tx_ring_size);
 	/* Build TX ring buffer */
@@ -439,31 +388,18 @@ static void ravb_ring_format(struct net_device *ndev, int q)
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
@@ -500,7 +436,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
 	}
 
 	/* Allocate all RX descriptors. */
-	if (!info->alloc_rx_desc(ndev, q))
+	if (!ravb_alloc_rx_desc(ndev, q))
 		goto error;
 
 	priv->dirty_rx[q] = 0;
@@ -2677,9 +2613,6 @@ static int ravb_mdio_release(struct ravb_private *priv)
 }
 
 static const struct ravb_hw_info ravb_gen3_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_rcar,
-	.rx_ring_format = ravb_rx_ring_format_rcar,
-	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2693,6 +2626,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.rx_max_desc_use = 2048 - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2703,9 +2637,6 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 };
 
 static const struct ravb_hw_info ravb_gen2_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_rcar,
-	.rx_ring_format = ravb_rx_ring_format_rcar,
-	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2719,6 +2650,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.rx_max_desc_use = 2048 - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.aligned_tx = 1,
 	.gptp = 1,
 	.nc_queues = 1,
@@ -2726,9 +2658,6 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 };
 
 static const struct ravb_hw_info ravb_rzv2m_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_rcar,
-	.rx_ring_format = ravb_rx_ring_format_rcar,
-	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rx_rcar,
 	.set_rate = ravb_set_rate_rcar,
 	.set_feature = ravb_set_features_rcar,
@@ -2742,6 +2671,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
 	.rx_max_desc_use = 2048 - ETH_FCS_LEN + sizeof(__sum16),
+	.rx_desc_size = sizeof(struct ravb_ex_rx_desc),
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
 	.gptp = 1,
@@ -2751,9 +2681,6 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 };
 
 static const struct ravb_hw_info gbeth_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free_gbeth,
-	.rx_ring_format = ravb_rx_ring_format_gbeth,
-	.alloc_rx_desc = ravb_alloc_rx_desc_gbeth,
 	.receive = ravb_rx_gbeth,
 	.set_rate = ravb_set_rate_gbeth,
 	.set_feature = ravb_set_features_gbeth,
@@ -2767,6 +2694,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.tccr_mask = TCCR_TSRQ0,
 	.rx_max_frame_size = SZ_8K,
 	.rx_max_desc_use = 4080,
+	.rx_desc_size = sizeof(struct ravb_rx_desc),
 	.aligned_tx = 1,
 	.tx_counters = 1,
 	.carrier_counters = 1,
-- 
2.43.2


