Return-Path: <linux-renesas-soc+bounces-3439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE41D86FFE9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 12:10:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45A3DB2437C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Mar 2024 11:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24F043B2B6;
	Mon,  4 Mar 2024 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WXsjFnih"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286B238392
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Mar 2024 11:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709550579; cv=none; b=vB7ziknm32mimnVLvCYHHx7XkxNYGvF5RS3N7FVCk//QODc0wzvEXm4bhnepbg7aAJ9fU1DleOanPrPDUYIhUAK+RQs6CmRBcZ02Iyw685Bah0kHq5OwSe3GX0ntF2gNX604vld1QR7ei6Ic6uj6K0q7xhO+5H40ODwpBT2Gqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709550579; c=relaxed/simple;
	bh=JiLkntrYTJZND4z0nPVMFds07fodZwj6xg4Wk5sfC1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3ougYtv4CRZjSNnQuaVinLjF5D2AZWAtY9ODxeUMTcYdLQ/OZO7PE5NRIdSYKt23AXKBWOsYxlNYOMm1IKoLhNnMjpArQoKX7N6XVLej3gmbCpjfEn/iZUnQHGd+YJ0XSHHHeNFViBfXMyAHVG9U8a7G1EB0nygDTN12woAoaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WXsjFnih; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-563d32ee33aso5375201a12.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Mar 2024 03:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709550575; x=1710155375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAilWgH3pj3MNHGJeCYvt8EDXQsjjEtUHJ8xZZCJZLc=;
        b=WXsjFnihlzYQTiDSvGYANT8IpVqM62fcylhtClNdbM+4VtqWVlALLtFtIaoKeehRwi
         PTkgbAnakHsO4gbj9I7KH9hgFl6s/Vm/r/SuxcZ3O9hz6A3/AWNAE21E2X0AQfpdCPRz
         tSolD6P9DlvtEM5HVBRPS7a8ZydD/LR61WGyNMwf0wv7jaRKqy8Q+N5LXkdsiFbgz4d7
         X5FfMJt00zW9JLtoj+W9l16MfmaoD4CvQFRp66xP4rzBH2ZKCsZh1WK6K9NWte4gQF9n
         inwI2qzju7QqjL90HN4SfDHnqpl05sGUTIpRZtBWE6GT2AoSaVCxWiSxmqRNKIYXInzz
         P1Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709550575; x=1710155375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAilWgH3pj3MNHGJeCYvt8EDXQsjjEtUHJ8xZZCJZLc=;
        b=AmzEG2dDtfpU/CEMIJVSfUyTrWr428AnVeDgT8/g6jCAxD7ZgEj7gEKr/zzVS5oqbM
         9Zq520r+ett4Qr6KIzzQyGnaWJKAO+vQS1tdLd5JUqb4aVq67BLFVAR9DBVzWky6tsJ1
         QOZ+Y9dBzqGWBmxnuDs2lrCkbvm5B42mlDMIcCF8/fTShquzkglFZThXQbekAGWUblru
         UgEYXpIJjy1R4VPwRtcktjt1clVBuUWWGTGMq5d+nIC2YrTB70K2x9JQ9PLiyP2wtEYF
         nGIB07AEd/Q/2nf6PKyaiGKQ1KcIKTrjfH5VNia6XcbXLw8yFuiMYnNKB+m3t+Jvn1Xc
         nJiA==
X-Gm-Message-State: AOJu0YxdLydASUd3VEZOM+H0ME4+oiNJ3yNBwJokslx2No3z/NTu/Avm
	fjYgipPtqoaEFIO+RP1YWXmlw9CuxnFc51ZA3C1k+r9JXC+nsfOwE3+BUnDtHlgbq0PKSy2J9Rs
	G
X-Google-Smtp-Source: AGHT+IGWd1Fage/iBgODq4437hWs5ONtoY3pWZ5KKT34E0JjEgOen2Ie+UUn3K5IH5rO57us1lOCFA==
X-Received: by 2002:a17:906:e211:b0:a3e:3a1d:f4b5 with SMTP id gf17-20020a170906e21100b00a3e3a1df4b5mr6057014ejb.65.1709550575594;
        Mon, 04 Mar 2024 03:09:35 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id v23-20020a170906565700b00a455ff77e7bsm688420ejr.88.2024.03.04.03.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 03:09:35 -0800 (PST)
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
Subject: [net-next,v3 5/6] ravb: Move maximum Rx descriptor data usage to info struct
Date: Mon,  4 Mar 2024 12:08:57 +0100
Message-ID: <20240304110858.117100-6-niklas.soderlund+renesas@ragnatech.se>
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

To make it possible to merge the R-Car and RZ/G2L code paths move the
maximum usable size of a single Rx descriptor data slice into the
hardware information instead of using two different defines in the two
different code paths.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
* Changes since v1
- Use SZ_2K macro instead of 2048 directly to align the style of the
  rest of the members in struct ravb_hw_info.

* Changes since v2
- Fix spelling in commit message.
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
2.44.0


