Return-Path: <linux-renesas-soc+bounces-3227-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A9868628
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 02:42:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB34C28AE39
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 01:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7895C89;
	Tue, 27 Feb 2024 01:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Qcd76C1i"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F03E555
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Feb 2024 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708998124; cv=none; b=AIHHi0V/FFW1xneuTMDd/iSwDetf00HaW/Mhdcs5L5fsG8ZxZFRDIn6iHCQu68+z8hWLxsQILXhg5rH7KwJWBaGWdfS04W+tWeubeMrxPuTxfI2QXlUGI+Q4SdlllNE6anYgFYG/odj9CC5Jp2SuBNrrUMagvVS31gQr1vGlebY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708998124; c=relaxed/simple;
	bh=w/DjwGPj1HTTyzs29L1w+qCOuUvbUtis+M6MqzHRx2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FToaX0R0yK5IQkiVToajNwiIyDMSiv69AP2wBeDTHmEO8/lxrOf6IP8+RrbxKd6hixOSk/tyqxZWEV501QqdErxsUwnsMswkQlKFfBQF/a81DYbKH6IFFZjA+jaOmFWfMiiUp7uIkm86Y7ZIBnQOMAMvASGVvRzV95/xty8Nbg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Qcd76C1i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-412a3371133so12808395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2024 17:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708998121; x=1709602921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Y5hO8ZnJAyS1q0nvm3bYNQmcxxBjS8mjPxWDnNLxN4=;
        b=Qcd76C1iE1CO8EMJvIs5Y/hVi4pWk/lnYoSBr+Ueloc8zz9eQYxbU5ncbeNaDv0lB5
         QwYt7KZ1Vfcb8cwnWPOZkK44+a+MNUq9lMvQpUGJl1FO2oY9TW8d7o8W5orBIa/jXJ7l
         Pd3awmRLWI+IRBq/3YGinvZlud6BHhD8g09f0SGy+kWZ9n87oCrLDES3ah9uX2cyDkvY
         qKPi4tbWq6HuDtR+Iwk6Z5pNnb2FC7c04zwpHUSGi/3S1CYp0KboXQGxMTqc2PEFJyYF
         khpwQPt0CzvYZtw5C+JtfOuCWbQysdzYGAajgc7BzrIygd8BGFRtqpMZ2LxmPRrbdHpw
         03cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708998121; x=1709602921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Y5hO8ZnJAyS1q0nvm3bYNQmcxxBjS8mjPxWDnNLxN4=;
        b=ht6WwmeF58fUdv5R1Cm1C0XXOhIK0VF9TeH148ZB/9magpR5DZ993pYNUp0FlYOVeO
         db1/ztXPQI/JEW9l1VnSia53RNXPlQ/nDSUSGVBOfJLDBa3G1xcH9SAU4OkygwkJ699R
         dK0YSDKLbdZsFN3hyrlYfBQPtYQ2rkwnpmXP/OP7h9YgjnRLoXEOEmAaMgJup+ESZb/w
         AXNXCtG7yQMyHyveLaK4DCYmlqku6giD1iaxxrkJ49q8pqZ7gm1QBGIyIAZVF9Db08zt
         RcxxunZzp57D3YSgZYFWhglUDZsTuIw6JlQ2mdqqZMFVf63ZNty0Bpc44mIXcRJeXz9b
         nHJQ==
X-Gm-Message-State: AOJu0Yycq9NNIv2C+BpdpbNx5wziMVGP83actrApd66LOQWQ4zfuMXgb
	NkXJc2eKff0tGwCg4Ka8E+fPbWH6DChQLZ0kok9RAkF/54muG+G/qNmidaSoSWM=
X-Google-Smtp-Source: AGHT+IGuewTaru7AsQJQnTej5ayys1+mdPZq/0Uu13JVPRpMAUytFeMlrDpZ95UO07lEOsJTHXQF+Q==
X-Received: by 2002:a05:600c:a002:b0:412:a498:ad36 with SMTP id jg2-20020a05600ca00200b00412a498ad36mr3456799wmb.20.1708998121029;
        Mon, 26 Feb 2024 17:42:01 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id w15-20020a05600c474f00b004129860d532sm9827918wmo.2.2024.02.26.17.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 17:42:00 -0800 (PST)
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
Subject: [net-next 5/6] ravb: Move maximum Rx descriptor data usage to info struct
Date: Tue, 27 Feb 2024 02:40:13 +0100
Message-ID: <20240227014014.44855-6-niklas.soderlund+renesas@ragnatech.se>
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

To make it possible to merge the R-Car and RZ/G2L code paths move the
maximum usable size of a single Rx descriptor data slice in to the
hardware information instead of using two different defines in the two
different code paths.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
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
index b309ca23f5b6..dee51a78cf36 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -349,7 +349,7 @@ static void ravb_rx_ring_format_gbeth(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
 		rx_desc = &priv->rx_ring[q].desc[i];
-		rx_desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
+		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  priv->info->rx_max_frame_size,
 					  DMA_FROM_DEVICE);
@@ -379,7 +379,7 @@ static void ravb_rx_ring_format_rcar(struct net_device *ndev, int q)
 	for (i = 0; i < priv->num_rx_ring[q]; i++) {
 		/* RX descriptor */
 		rx_desc = &priv->rx_ring[q].ex_desc[i];
-		rx_desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
+		rx_desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 		dma_addr = dma_map_single(ndev->dev.parent, priv->rx_skb[q][i]->data,
 					  priv->info->rx_max_frame_size,
 					  DMA_FROM_DEVICE);
@@ -919,7 +919,7 @@ static bool ravb_rx_gbeth(struct net_device *ndev, int *quota, int q)
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].desc[entry];
-		desc->ds_cc = cpu_to_le16(GBETH_RX_DESC_DATA_SIZE);
+		desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 
 		if (!priv->rx_skb[q][entry]) {
 			skb = ravb_alloc_skb(ndev, info);
@@ -1034,7 +1034,7 @@ static bool ravb_rx_rcar(struct net_device *ndev, int *quota, int q)
 	for (; priv->cur_rx[q] - priv->dirty_rx[q] > 0; priv->dirty_rx[q]++) {
 		entry = priv->dirty_rx[q] % priv->num_rx_ring[q];
 		desc = &priv->rx_ring[q].ex_desc[entry];
-		desc->ds_cc = cpu_to_le16(RX_BUF_SZ);
+		desc->ds_cc = cpu_to_le16(priv->info->rx_max_desc_use);
 
 		if (!priv->rx_skb[q][entry]) {
 			skb = ravb_alloc_skb(ndev, info);
@@ -2692,6 +2692,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
+	.rx_max_desc_use = 2048 - ETH_FCS_LEN + sizeof(__sum16),
 	.internal_delay = 1,
 	.tx_counters = 1,
 	.multi_irqs = 1,
@@ -2717,6 +2718,7 @@ static const struct ravb_hw_info ravb_gen2_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
+	.rx_max_desc_use = 2048 - ETH_FCS_LEN + sizeof(__sum16),
 	.aligned_tx = 1,
 	.gptp = 1,
 	.nc_queues = 1,
@@ -2739,6 +2741,7 @@ static const struct ravb_hw_info ravb_rzv2m_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats),
 	.tccr_mask = TCCR_TSRQ0 | TCCR_TSRQ1 | TCCR_TSRQ2 | TCCR_TSRQ3,
 	.rx_max_frame_size = SZ_2K,
+	.rx_max_desc_use = 2048 - ETH_FCS_LEN + sizeof(__sum16),
 	.multi_irqs = 1,
 	.err_mgmt_irqs = 1,
 	.gptp = 1,
@@ -2763,6 +2766,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.stats_len = ARRAY_SIZE(ravb_gstrings_stats_gbeth),
 	.tccr_mask = TCCR_TSRQ0,
 	.rx_max_frame_size = SZ_8K,
+	.rx_max_desc_use = 4080,
 	.aligned_tx = 1,
 	.tx_counters = 1,
 	.carrier_counters = 1,
-- 
2.43.2


