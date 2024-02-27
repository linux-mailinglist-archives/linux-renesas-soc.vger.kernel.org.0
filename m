Return-Path: <linux-renesas-soc+bounces-3224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B374C868620
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 02:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D63D21C26964
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 01:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DFED304;
	Tue, 27 Feb 2024 01:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="OdtSny3e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1545C82
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 01:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998121; cv=none; b=ZfHfVZenM24uDbJX5J6++U1mPxkTDIgmHPU2qXdiqDOuCEi/y8LSOsSbAc751+YrCPfenkt3FrbiFTnzqImlH+vf71WROpyrL4h/BueOMUaMIdVJynbSYp1gEJhU0mwIVEzLRhRhqM1G/mFlbbPJDWtg7EwFUKjTarfrzOGG7oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998121; c=relaxed/simple;
	bh=FylOFo9RfnXHV9EQ7wt+WpmHfZyRTWtmSmAtnRbVm0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m78D9LjtPZoHowry1HQ+QajjOYncjeo4vVXfiGk5juCF4bOf9RS8aPwDzxyf5WushOqZFZyGf9NGMqFGeRPsaTWypMfVmT3k+IEb2nXrsKDVtR4npOlu39voIOQst3raOneM0cCbk+pnWB8l2yoh7nfBJarVh1LxO8osNNxloQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=OdtSny3e; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-412a80d7f42so7955355e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 17:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708998117; x=1709602917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xAMsdRq2CCVLSK0J5TCOOSXhHRp3Zy11izA1aiVcHbE=;
        b=OdtSny3eBeon/nRgcFgCtqV6Fii17njq100paNU96oF5yktqQtNmPLUuoME6DwJUS3
         EFM0/iySxr2123T5ozlUvPkQddR2NtpX9tEqzF8UVSiHRamOMYw8OzOMrqzQ2jzNYzno
         rZIBvZKZL8HXMbcLHFhWUOwcmMXnhebVr3NBlkKz0I287VdSOIYW0lh/Op4UWD2SNhhq
         bLEz/y3Doe4U60AgkEfUMPQF6omBwiAs3N/+DCSvGh+rYwQtEHjjH/FSZAPpXfoC/6Y5
         Was0nuF92KkexZlsFpxlLThFxCGb5SlxFGqAk2C+HZ55xsWToO//5avnlCm9T30ZU2CP
         zDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998117; x=1709602917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xAMsdRq2CCVLSK0J5TCOOSXhHRp3Zy11izA1aiVcHbE=;
        b=L7fn/Ruk2rISqZZEPQoQFQyZojlNadF4cP8dAmzX51Cx8R6zH0KcpJrpZbewqAcPFZ
         Qf0HKlrEWPHzQ1LovzzujqE21jaA48Zrb+o1jUwa0pIgBLiI38PPC+PsOlow+Fm7F4ec
         gcbLfC0SsKFgOvH09Mm5vxSo8J5oJSZA//zoW3Q13FFyuYAw4aLoJRRqotuYcXzd+pfI
         suTBkZqWSqGRudu4wL+gC7F31WX/y5CnuQkN7euUhY6WDIkpyXOy7dbzwJ5s1JjAbdcH
         thiDvQUb8H9yAyoFwWtyhS/SIYKKBDFWhvb385To4w9bMcraHWCbzCmBsUJ4OeXv6pbb
         oW6A==
X-Gm-Message-State: AOJu0YwqdTR2AzJK8j0Y78uybr6iEAnY5qkmW+HEQb6Vj6w2rFZSnrnI
	wM4m284xswn3cBJVhcpnwiiwCnTFEn7pa0nAiVAtvofAv7b4gltbKNvuNG8RFPk=
X-Google-Smtp-Source: AGHT+IHFbVMMqnwbkFQLA8ydpfnz28ahzoQuv6rhEthZZQ4GpgMQ8DCXucIt5tPkDi+0pGg6LjIPjg==
X-Received: by 2002:a05:600c:4f86:b0:412:94b7:bc2 with SMTP id n6-20020a05600c4f8600b0041294b70bc2mr7789978wmq.2.1708998117431;
        Mon, 26 Feb 2024 17:41:57 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id w15-20020a05600c474f00b004129860d532sm9827918wmo.2.2024.02.26.17.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:41:57 -0800 (PST)
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
Subject: [net-next 1/6] ravb: Group descriptor types used in Rx ring
Date: Tue, 27 Feb 2024 02:40:09 +0100
Message-ID: <20240227014014.44855-2-niklas.soderlund+renesas@ragnatech.se>
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

The Rx ring can either be made up of normal or extended descriptors, not
a mix of the two at the same time. Make this explicitly by grouping the
two variables in a rx_ring union.

The extension of the storage for more than one queue of normal
descriptors from a single to NUM_RX_QUEUE queues have no practical
effect. But aids in making the code readable as the code that uses it
already piggyback on other members of struct ravb_private that are
arrays of max length NUM_RX_QUEUE, e.g. rx_desc_dma. This will also make
further refactoring easier.

While at it rename the normal descriptor Rx ring to make it clear it's
not strictly related to the GbEthernet E-MAC IP found in RZ/G2L, normal
descriptors could be used on R-Car SoCs too.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/net/ethernet/renesas/ravb.h      |  6 ++-
 drivers/net/ethernet/renesas/ravb_main.c | 57 ++++++++++++------------
 2 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 35e642fc4b2a..aecc98282c7e 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1092,8 +1092,10 @@ struct ravb_private {
 	struct ravb_desc *desc_bat;
 	dma_addr_t rx_desc_dma[NUM_RX_QUEUE];
 	dma_addr_t tx_desc_dma[NUM_TX_QUEUE];
-	struct ravb_rx_desc *gbeth_rx_ring;
-	struct ravb_ex_rx_desc *rx_ring[NUM_RX_QUEUE];
+	union {
+		struct ravb_rx_desc *desc;
+		struct ravb_ex_rx_desc *ex_desc;
+	} rx_ring[NUM_RX_QUEUE];
 	struct ravb_tx_desc *tx_ring[NUM_TX_QUEUE];
 	void *tx_align[NUM_TX_QUEUE];
 	struct sk_buff *rx_1st_skb;
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index f9fb772b05c7..c25a80f4d3b9 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -241,11 +241,11 @@ static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
 	unsigned int ring_size;
 	unsigned int i;
 
-	if (!priv->gbeth_rx_ring)
+	if (!priv->rx_ring[q].desc)
 		return;
 
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		struct ravb_rx_desc *desc = &priv->gbeth_rx_ring[i];
+		struct ravb_rx_desc *desc = &priv->rx_ring[q].desc[i];
 
 		if (!dma_mapping_error(ndev->dev.parent,
 				       le32_to_cpu(desc->dptr)))
@@ -255,9 +255,9 @@ static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
 					 DMA_FROM_DEVICE);
 	}
 	ring_size = sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1);
-	dma_free_coherent(ndev->dev.parent, ring_size, priv->gbeth_rx_ring,
+	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].desc,
 			  priv->rx_desc_dma[q]);
-	priv->gbeth_rx_ring = NULL;
+	priv->rx_ring[q].desc = NULL;
 }
 
 static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
@@ -266,11 +266,11 @@ static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
 	unsigned int ring_size;
 	unsigned int i;
 
-	if (!priv->rx_ring[q])
+	if (!priv->rx_ring[q].ex_desc)
 		return;
 
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
-		struct ravb_ex_rx_desc *desc = &priv->rx_ring[q][i];
+		struct ravb_ex_rx_desc *desc = &priv->rx_ring[q].ex_desc[i];
 
 		if (!dma_mapping_error(ndev->dev.parent,
 				       le32_to_cpu(desc->dptr)))
@@ -281,9 +281,9 @@ static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
 	}
 	ring_size = sizeof(struct ravb_ex_rx_desc) *
 		    (priv->num_rx_ring[q] + 1);
-	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q],
+	dma_free_coherent(ndev->dev.parent, ring_size, priv->rx_ring[q].ex_desc,
 			  priv->rx_desc_dma[q]);
-	priv->rx_ring[q] = NULL;
+	priv->rx_ring[q].ex_desc = NULL;
 }
 
 /* Free skb's and DMA buffers for Ethernet AVB */
@@ -335,11 +335,11 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 	unsigned int i;
 
 	rx_ring_size = sizeof(*rx_desc) * priv->num_rx_ring[q];
-	memset(priv->gbeth_rx_ring, 0, rx_ring_size);
+	memset(priv->rx_ring[q].desc, 0, rx_ring_size);
 	/* Build RX ring buffer */
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
-		rx_desc = &priv->gbeth_rx_ring[i];
+		rx_desc = &priv->rx_ring[q].desc[i];
 		rx_desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  GBETH_RX_BUFF_MAX,
@@ -352,7 +352,7 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 		rx_desc->dptr = cpu_to_le32(dma_addr);
 		rx_desc->die_dt = DT_FEMPTY;
 	}
-	rx_desc = &priv->gbeth_rx_ring[i];
+	rx_desc = &priv->rx_ring[q].desc[i];
 	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma[q]);
 	rx_desc->die_dt = DT_LINKFIX; /* type */
 }
@@ -365,11 +365,11 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 	dma_addr_t dma_addr;
 	unsigned int i;
 
-	memset(priv->rx_ring[q], 0, rx_ring_size);
+	memset(priv->rx_ring[q].ex_desc, 0, rx_ring_size);
 	/* Build RX ring buffer */
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
-		rx_desc = &priv->rx_ring[q][i];
+		rx_desc = &priv->rx_ring[q].ex_desc[i];
 		rx_desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  RX_BUF_SZ,
@@ -382,7 +382,7 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 		rx_desc->dptr = cpu_to_le32(dma_addr);
 		rx_desc->die_dt = DT_FEMPTY;
 	}
-	rx_desc = &priv->rx_ring[q][i];
+	rx_desc = &priv->rx_ring[q].ex_desc[i];
 	rx_desc->dptr = cpu_to_le32((u32)priv->rx_desc_dma[q]);
 	rx_desc->die_dt = DT_LINKFIX; /* type */
 }
@@ -437,10 +437,10 @@ static void *ravb_alloc_rx_desc_gbeth(struct net_device *ndev, int q)
 
 	ring_size = sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1);
 
-	priv->gbeth_rx_ring = dma_alloc_coherent(ndev->dev.parent, ring_size,
-						 &priv->rx_desc_dma[q],
-						 GFP_KERNEL);
-	return priv->gbeth_rx_ring;
+	priv->rx_ring[q].desc = dma_alloc_coherent(ndev->dev.parent, ring_size,
+						   &priv->rx_desc_dma[q],
+						   GFP_KERNEL);
+	return priv->rx_ring[q].desc;
 }
 
 static void *ravb_alloc_rx_desc_rcar(struct net_device *ndev, int q)
@@ -450,10 +450,11 @@ static void *ravb_alloc_rx_desc_rcar(struct net_device *ndev, int q)
 
 	ring_size = sizeof(struct ravb_ex_rx_desc) * (priv->num_rx_ring[q] + 1);
 
-	priv->rx_ring[q] = dma_alloc_coherent(ndev->dev.parent, ring_size,
-					      &priv->rx_desc_dma[q],
-					      GFP_KERNEL);
-	return priv->rx_ring[q];
+	priv->rx_ring[q].ex_desc = dma_alloc_coherent(ndev->dev.parent,
+						      ring_size,
+						      &priv->rx_desc_dma[q],
+						      GFP_KERNEL);
+	return priv->rx_ring[q].ex_desc;
 }
 
 /* Init skb and descriptor buffer for Ethernet AVB */
@@ -830,7 +831,7 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 	limit = priv->dirty_rx[q] + priv->num_rx_ring[q] - priv->cur_rx[q];
 	stats = &priv->stats[q];
 
-	desc = &priv->gbeth_rx_ring[entry];
+	desc = &priv->rx_ring[q].desc[entry];
 	for (i = 0; i < limit && rx_packets < *quota && desc->die_dt != DT_FEMPTY; i++) {
 		/* Descriptor type must be checked before all other reads */
 		dma_rmb();
@@ -901,13 +902,13 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 		}
 
 		entry = (++priv->cur_rx[q]) % priv->num_rx_ring[q];
-		desc = &priv->gbeth_rx_ring[entry];
+		desc = &priv->rx_ring[q].desc[entry];
 	}
 
 	/* Refill the RX ring buffers. */
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->gbeth_rx_ring[entry];
+		desc = &priv->rx_ring[q].desc[entry];
 		desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
 
 		if (!priv->rx_skb[q][entry]) {
@@ -957,7 +958,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 
 	boguscnt = min(boguscnt, *quota);
 	limit = boguscnt;
-	desc = &priv->rx_ring[q][entry];
+	desc = &priv->rx_ring[q].ex_desc[entry];
 	while (desc->die_dt != DT_FEMPTY) {
 		/* Descriptor type must be checked before all other reads */
 		dma_rmb();
@@ -1017,13 +1018,13 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 		}
 
 		entry = (++priv->cur_rx[q]) % priv->num_rx_ring[q];
-		desc = &priv->rx_ring[q][entry];
+		desc = &priv->rx_ring[q].ex_desc[entry];
 	}
 
 	/* Refill the RX ring buffers. */
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
-		desc = &priv->rx_ring[q][entry];
+		desc = &priv->rx_ring[q].ex_desc[entry];
 		desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
 
 		if (!priv->rx_skb[q][entry]) {
-- 
2.43.2


