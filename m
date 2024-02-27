Return-Path: <linux-renesas-soc+bounces-3295-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1219886A292
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 23:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9015B1F2B324
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 22:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F415646B;
	Tue, 27 Feb 2024 22:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="to4SLyCf"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AC454746
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 22:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709073230; cv=none; b=ABlVu7ONE89S/KweiRCdtObuaWP/t3TFVhTLznhyIo1pahLyAbtDAgznze0pia/mLI7fiHpLvwwbrE3+NZlyzigfNAc9YB0eC66R7UP6UZjNbdShw1NNFNGqhchkfWzMN3JaKnXiShQJzeX69QuJs+PlNmUEMpxz8rzwA/ihKd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709073230; c=relaxed/simple;
	bh=PP+BcA8oc3XBVGSNrk6vnIfiYdsk2qa6AWUUUDldlyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTFjqivhnPpe/fJ989744y4/n89wXE2sduG/qU+lEWTJfJNH+uGjqh9sd3yJF3on8T8KdmPmhGCyR7qYba2Y+yY3o7+UixhRkmqfk+BklgT9rXX6mTSF2axaipu/UhjwGTxx2DYgb49Mk9NeapqWh1chG6zk5X8Q/d/XqcE602o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=to4SLyCf; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51316d6e026so766435e87.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 14:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709073226; x=1709678026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUjYtICPkfxsQECKKHlIIewKA5hTwhtP6GMvMFNyUnw=;
        b=to4SLyCfMap0uM0ONIq7ojnOnRJ/RMjcJBZ7nNN5DG1cCCKsRvwT/ZQ3iSpIAbNFDG
         q1lDa+d5Gwys823S927T5OVTV07p2UaKcxqEJDRmTZQI1P7EljapDqDgzkjq9+UwZps1
         XgHDrM9b95UExGHTHViOIVw1U8hsprQxj4sI0wjrK1gV8PoyS27y6taX9G2eEZI2vA8v
         pEKyyY6q5eP4idB6VYAPM6J9tQ4o3X2T+dVAQpjvJ5vhok8IgcI+RfGQH5hf0wFsKY+l
         RqzzwWx4GFYaDjAvl/64ROXHdWaGeMHkyeHIH+q+svhSKdYu0kEuetiVmQPKDvfsEJif
         WmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709073226; x=1709678026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUjYtICPkfxsQECKKHlIIewKA5hTwhtP6GMvMFNyUnw=;
        b=pYLEfxqZ9DzlvMLT+Cygrrt3iKZOKFOV/v6AnjLfBwYnP1eRcq8yb9hqIMiq79Cri3
         gV/MRcO22MDji1mhx0nEbvXehyGHTj9g/rkpApYK2+Zk1JkO5zGtXsqUj1PMMgECI2Wa
         Wj0n6AB7PXRuWGTJDaoZtEa7uBTBaSuD1zBJpWFOKpZbuo/5mfwcaz0hgzGNuAEscmC+
         ULkTiyuXUCLGE7NPaoZG+Ycdl79+4jdagIZOLlHsJCrya8U/gID5zdXFdz18doBVgsEw
         wF/jZmo5/cLZwZcigHqMWhOL1Gd9AkpOpE90XjLs3UvnqV/zSwBgXjjdKMJdObUbuS4r
         EY2g==
X-Gm-Message-State: AOJu0Yy/BoKuihMM6CzYC7fIxz20fKNCdb0ti7ggtSf/kI7Alfm4BaPf
	oPJrIJx1fcSU+IOzW63RRg9IZnZnmax9tJChsihr6OE+pXlrODVm3gOQ0+6/0i8=
X-Google-Smtp-Source: AGHT+IEiw9wdKMs/nvN74+0SQokyhw/8mfpb+kuJk/2QxdsUablbPzt4jAtj8SdgCAq1hRc5m/2dwg==
X-Received: by 2002:ac2:4c49:0:b0:512:ec53:5915 with SMTP id o9-20020ac24c49000000b00512ec535915mr8732527lfk.15.1709073226646;
        Tue, 27 Feb 2024 14:33:46 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id jp11-20020a170906f74b00b00a437b467c92sm1195860ejb.177.2024.02.27.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:33:46 -0800 (PST)
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
Subject: [net-next,v2 5/6] ravb: Move maximum Rx descriptor data usage to info struct
Date: Tue, 27 Feb 2024 23:33:04 +0100
Message-ID: <20240227223305.910452-6-niklas.soderlund+renesas@ragnatech.se>
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

To make it possible to merge the R-Car and RZ/G2L code paths move the
maximum usable size of a single Rx descriptor data slice in to the
hardware information instead of using two different defines in the two
different code paths.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- Use SZ_2K macro instead of 2048 directly to align the style of the
  rest of the members in struct ravb_hw_info.
---
 drivers/net/ethernet/renesas/ravb.h      |  5 +----
 drivers/net/ethernet/renesas/ravb_main.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 7fa60fccb6ea..b12b379baf5a 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -1015,10 +1015,6 @@ enum CSR2_BIT {
 #define NUM_RX_QUEUE	2
 #define NUM_TX_QUEUE	2
 
-#define RX_BUF_SZ	(2048 - ETH_FCS_LEN + sizeof(__sum16))
-
-#define GBETH_RX_DESC_DATA_SIZE 4080
-
 struct ravb_tstamp_skb {
 	struct list_head list;
 	struct sk_buff *skb;
@@ -1058,6 +1054,7 @@ struct ravb_hw_info {
 	int stats_len;
 	u32 tccr_mask;
 	u32 rx_max_frame_size;
+	u32 rx_max_desc_use;
 	unsigned aligned_tx: 1;
 
 	/* hardware features */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 45383635e8e2..4ef4be9e152e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -351,7 +351,7 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
 		rx_desc = &priv->rx_ring[q].desc[i];
-		rx_desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
+		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  priv->info->rx_max_frame_size,
 					  DMA_FROM_DEVICE);
@@ -381,7 +381,7 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
 		rx_desc = &priv->rx_ring[q].ex_desc[i];
-		rx_desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
+		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  priv->info->rx_max_frame_size,
 					  DMA_FROM_DEVICE);
@@ -921,7 +921,7 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].desc[entry];
-		desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
+		desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 
 		if (!priv->rx_skb[q][entry]) {
 			skb = ravb_alloc_skb(ndev, info, GFP_ATOMIC);
@@ -1036,7 +1036,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].ex_desc[entry];
-		desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
+		desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 
 		if (!priv->rx_skb[q][entry]) {
 			skb = ravb_alloc_skb(ndev, info, GFP_ATOMIC);
@@ -2694,6 +2694,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
+	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2719,6 +2720,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
+	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
 	.aligned_tx = 1,
 	.gptp = 1,
 	.nc_queues = 1,
@@ -2741,6 +2743,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
+	.rx_max_desc_use = SZ_2K - ETH_FCS_LEN + sizeof(__sum16),
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
 	.gptp = 1,
@@ -2765,6 +2768,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.tccr_mask = TCCR_TSRQ0,
 	.rx_max_frame_size = SZ_8K,
+	.rx_max_desc_use = 4080,
 	.aligned_tx = 1,
 	.tx_counters = 1,
 	.carrier_counters = 1,
-- 
2.43.2


