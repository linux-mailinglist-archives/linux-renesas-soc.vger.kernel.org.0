Return-Path: <linux-renesas-soc+bounces-11245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF999EDF64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 07:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 58218188987B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 06:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2231DEFCC;
	Thu, 12 Dec 2024 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="aRMmI9/9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88844176AB7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Dec 2024 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733984781; cv=none; b=oBxdspK68caZAMXqii9z94oDKHsfbt0xGz7CgPSp2VfOsDSWd6iNERqb+keqPQE4tWqukkFN8i9h6s9B4yh2TkPdNkkEXemfEW8BdxeNtrXpRkeQ69KAh0A4W4I5HF0oidxqNfnbK8jOPbksjNsv4lBW6EROE1fqP7qWWo4dGfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733984781; c=relaxed/simple;
	bh=Lw+ze2Co0gj+5K3wkHR1YRQPmlFOF/oD7NcnYt1tECY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=k+rBL9ax6BHen6CPHb4N9St9K+pORO2CgsEDxP9XRSvf9c7mGcPsTpPnoPxVJyNT0cSWd0hCSI3qNex4o0sp1LkSFRiyexDv1P3+Ti24dXhrrZUzxPGc7fc4g/qj7/O3m8G8tAiu0avG6/ukQW1une/ITEwmxLGsrkzpcBo8WHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=aRMmI9/9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso2314571fa.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 22:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733984777; x=1734589577; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kuRjAdbDbTEkU+Ho9EYzXIrZiSQv0hABO5CTMWmsx+w=;
        b=aRMmI9/9iVJwzJMubQpRjVDyVvcEcRUtM80JiNDdtcJ/04ICHReprOLVWjAZ/lUvcd
         YCT1BR/pEiNAPifyDSiL6TAcGGZqhOaKiidslfxozIx0sAnOJMqN87VjPY3uBmkXM0Zi
         888J6Cs6dwUzpPXn5a+UyFDcvV7ZP8pvz4jZb5m/spR787JC1PNLnlqiuh8t+8lUnIuM
         WBkaSLa0oQM8vMb+Tbyo4mFy7Fqw7mhcIys4s96PXV4cztECieIOdyJseyyG0AiROLuS
         qQr6uxv9gwINf2PIGuyPAaPpJ9DE25SfkwaBW6oaJmXpUqbbTzNFGGd/FUqcyyQdkjd5
         ji8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733984777; x=1734589577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kuRjAdbDbTEkU+Ho9EYzXIrZiSQv0hABO5CTMWmsx+w=;
        b=oFa/0ZGSDG9MOIR95zeHtIB4aFMS/3dKN0MCJ8oIgWZ10dxHNVHiT6jh/PpUOFyl8f
         sE1/SyFmC0Rb8sljbBV951PLpTKiqb7pySrwGj6YtWyNQkYv2XQdTGH+eD1ThrCFUXhZ
         5IUmz/ndX/ZkhwPIJn+V25L4g9FX8y2t79bQ5FrVjc+Rxh4Xydda7AZnV1h99ehZklAz
         IqfVz9XC1Q5T6KzFIO5qnUSGEqDhu8SqEwg/Y5wLke3mKeVDjfAJCtR4UmuuKYJ3AYXH
         BvOS3BNzCrg1May15bcAnrAstBRni3aTPqaoAO3pCmMYbI9sCWMLfBTN1Q1GTppxMbeO
         gmQA==
X-Forwarded-Encrypted: i=1; AJvYcCVtztX2hnVMgywAKR7hpy7a82JoQPykmUVxntsaRiajK9pGxO9DzfyJ5rMjZXtS0mizNyLBirGOPcYP1jK2k+xIMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YycIEVD58zRYSPyAwY1NHeWdzzxXNuffcJvslMJFrHngNjK3DYD
	UppU4jDkbibmtFigc0Qtyx3dfg5zSlsDAPj4tnw00SGBnXuOMREHeqgN7ZREBBw=
X-Gm-Gg: ASbGnctaeix+iEumIKhjZRCe6pzP0g6ctCVufjdiXYxdFRP3TxpbPf6qwSGWg3T/FI0
	KR/A7Y+9L0vPJrtcP4Wlium49j1StkBxFqWShl9lQuOD/SYQS5aWELOXIHFzbu8hoUWVQazvDTV
	CJnW8FvEuKOZF4qbcUeq/J7qcLl73hsnge+j0zVn0Hm9/QTcvhxDL3Y4PLBTy87ykJduYNyI/K5
	OLUHt2NNsctA1WT16VPEDUPNAODEbOeTdxQPB+kHRCQ8cOT2KBHQz5HubpCuRmWm9wJ5VU=
X-Google-Smtp-Source: AGHT+IEDTXGBo2HWzXx2i6Hv1sGpcVA3TggdLOBM18vE43jz6irncBSC3Gba5PIz1VR7slTQ7L8ovQ==
X-Received: by 2002:a05:651c:2220:b0:302:3de5:b039 with SMTP id 38308e7fff4ca-3024a1d4bd1mr6264891fa.8.1733984776497;
        Wed, 11 Dec 2024 22:26:16 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30223be9b15sm11209191fa.106.2024.12.11.22.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 22:26:16 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net] net: renesas: rswitch: rework ts tags management
Date: Thu, 12 Dec 2024 11:25:58 +0500
Message-Id: <20241212062558.436455-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing linked list based implementation of how ts tags are
assigned and managed is unsafe against concurrency and corner cases:
- element addition in tx processing can race against element removal
  in ts queue completion,
- element removal in ts queue completion can race against element
  removal in device close,
- if a large number of frames gets added to tx queue without ts queue
  completions in between, elements with duplicate tag values can get
  added.

Use a different implementation, based on per-port used tags bitmaps and
saved skb arrays.

Safety for addition in tx processing vs removal in ts completion is
provided by:

    tag = find_first_zero_bit(...);
    smp_mb();
    <write rdev->ts_skb[tag]>
    set_bit(...);

  vs

    <read rdev->ts_skb[tag]>
    smp_mb();
    clear_bit(...);

Safety for removal in ts completion vs removal in device close is
provided by using atomic read-and-clear for rdev->ts_skb[tag]:

    ts_skb = xchg(&rdev->ts_skb[tag], NULL);
    if (ts_skb)
        <handle it>

Fixes: 33f5d733b589 ("net: renesas: rswitch: Improve TX timestamp accuracy")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 74 ++++++++++++++------------
 drivers/net/ethernet/renesas/rswitch.h | 13 ++---
 2 files changed, 42 insertions(+), 45 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index dbbbf024e7ab..9ac6e2aad18f 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -547,7 +547,6 @@ static int rswitch_gwca_ts_queue_alloc(struct rswitch_private *priv)
 	desc = &gq->ts_ring[gq->ring_size];
 	desc->desc.die_dt = DT_LINKFIX;
 	rswitch_desc_set_dptr(&desc->desc, gq->ring_dma);
-	INIT_LIST_HEAD(&priv->gwca.ts_info_list);
 
 	return 0;
 }
@@ -1003,9 +1002,10 @@ static int rswitch_gwca_request_irqs(struct rswitch_private *priv)
 static void rswitch_ts(struct rswitch_private *priv)
 {
 	struct rswitch_gwca_queue *gq = &priv->gwca.ts_queue;
-	struct rswitch_gwca_ts_info *ts_info, *ts_info2;
 	struct skb_shared_hwtstamps shhwtstamps;
 	struct rswitch_ts_desc *desc;
+	struct rswitch_device *rdev;
+	struct sk_buff *ts_skb;
 	struct timespec64 ts;
 	unsigned int num;
 	u32 tag, port;
@@ -1015,23 +1015,28 @@ static void rswitch_ts(struct rswitch_private *priv)
 		dma_rmb();
 
 		port = TS_DESC_DPN(__le32_to_cpu(desc->desc.dptrl));
-		tag = TS_DESC_TSUN(__le32_to_cpu(desc->desc.dptrl));
-
-		list_for_each_entry_safe(ts_info, ts_info2, &priv->gwca.ts_info_list, list) {
-			if (!(ts_info->port == port && ts_info->tag == tag))
-				continue;
-
-			memset(&shhwtstamps, 0, sizeof(shhwtstamps));
-			ts.tv_sec = __le32_to_cpu(desc->ts_sec);
-			ts.tv_nsec = __le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
-			shhwtstamps.hwtstamp = timespec64_to_ktime(ts);
-			skb_tstamp_tx(ts_info->skb, &shhwtstamps);
-			dev_consume_skb_irq(ts_info->skb);
-			list_del(&ts_info->list);
-			kfree(ts_info);
-			break;
-		}
+		if (unlikely(port >= RSWITCH_NUM_PORTS))
+			goto next;
+		rdev = priv->rdev[port];
 
+		tag = TS_DESC_TSUN(__le32_to_cpu(desc->desc.dptrl));
+		if (unlikely(tag >= TS_TAGS_PER_PORT))
+			goto next;
+		ts_skb = xchg(&rdev->ts_skb[tag], NULL);
+		smp_mb(); /* order rdev->ts_skb[] read before bitmap update */
+		clear_bit(tag, rdev->ts_skb_used);
+
+		if (unlikely(!ts_skb))
+			goto next;
+
+		memset(&shhwtstamps, 0, sizeof(shhwtstamps));
+		ts.tv_sec = __le32_to_cpu(desc->ts_sec);
+		ts.tv_nsec = __le32_to_cpu(desc->ts_nsec & cpu_to_le32(0x3fffffff));
+		shhwtstamps.hwtstamp = timespec64_to_ktime(ts);
+		skb_tstamp_tx(ts_skb, &shhwtstamps);
+		dev_consume_skb_irq(ts_skb);
+
+next:
 		gq->cur = rswitch_next_queue_index(gq, true, 1);
 		desc = &gq->ts_ring[gq->cur];
 	}
@@ -1576,8 +1581,9 @@ static int rswitch_open(struct net_device *ndev)
 static int rswitch_stop(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
-	struct rswitch_gwca_ts_info *ts_info, *ts_info2;
+	struct sk_buff *ts_skb;
 	unsigned long flags;
+	unsigned int tag;
 
 	netif_tx_stop_all_queues(ndev);
 
@@ -1594,12 +1600,13 @@ static int rswitch_stop(struct net_device *ndev)
 	if (bitmap_empty(rdev->priv->opened_ports, RSWITCH_NUM_PORTS))
 		iowrite32(GWCA_TS_IRQ_BIT, rdev->priv->addr + GWTSDID);
 
-	list_for_each_entry_safe(ts_info, ts_info2, &rdev->priv->gwca.ts_info_list, list) {
-		if (ts_info->port != rdev->port)
-			continue;
-		dev_kfree_skb_irq(ts_info->skb);
-		list_del(&ts_info->list);
-		kfree(ts_info);
+	for (tag = find_first_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
+	     tag < TS_TAGS_PER_PORT;
+	     tag = find_next_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT, tag + 1)) {
+		ts_skb = xchg(&rdev->ts_skb[tag], NULL);
+		clear_bit(tag, rdev->ts_skb_used);
+		if (ts_skb)
+			dev_kfree_skb(ts_skb);
 	}
 
 	return 0;
@@ -1612,20 +1619,17 @@ static bool rswitch_ext_desc_set_info1(struct rswitch_device *rdev,
 	desc->info1 = cpu_to_le64(INFO1_DV(BIT(rdev->etha->index)) |
 				  INFO1_IPV(GWCA_IPV_NUM) | INFO1_FMT);
 	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
-		struct rswitch_gwca_ts_info *ts_info;
+		unsigned int tag;
 
-		ts_info = kzalloc(sizeof(*ts_info), GFP_ATOMIC);
-		if (!ts_info)
+		tag = find_first_zero_bit(rdev->ts_skb_used, TS_TAGS_PER_PORT);
+		if (tag == TS_TAGS_PER_PORT)
 			return false;
+		smp_mb(); /* order bitmap read before rdev->ts_skb[] write */
+		rdev->ts_skb[tag] = skb_get(skb);
+		set_bit(tag, rdev->ts_skb_used);
 
 		skb_shinfo(skb)->tx_flags |= SKBTX_IN_PROGRESS;
-		rdev->ts_tag++;
-		desc->info1 |= cpu_to_le64(INFO1_TSUN(rdev->ts_tag) | INFO1_TXC);
-
-		ts_info->skb = skb_get(skb);
-		ts_info->port = rdev->port;
-		ts_info->tag = rdev->ts_tag;
-		list_add_tail(&ts_info->list, &rdev->priv->gwca.ts_info_list);
+		desc->info1 |= cpu_to_le64(INFO1_TSUN(tag) | INFO1_TXC);
 
 		skb_tx_timestamp(skb);
 	}
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index e020800dcc57..d8d4ed7d7f8b 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -972,14 +972,6 @@ struct rswitch_gwca_queue {
 	};
 };
 
-struct rswitch_gwca_ts_info {
-	struct sk_buff *skb;
-	struct list_head list;
-
-	int port;
-	u8 tag;
-};
-
 #define RSWITCH_NUM_IRQ_REGS	(RSWITCH_MAX_NUM_QUEUES / BITS_PER_TYPE(u32))
 struct rswitch_gwca {
 	unsigned int index;
@@ -989,7 +981,6 @@ struct rswitch_gwca {
 	struct rswitch_gwca_queue *queues;
 	int num_queues;
 	struct rswitch_gwca_queue ts_queue;
-	struct list_head ts_info_list;
 	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
 	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
 	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
@@ -997,6 +988,7 @@ struct rswitch_gwca {
 };
 
 #define NUM_QUEUES_PER_NDEV	2
+#define TS_TAGS_PER_PORT	256
 struct rswitch_device {
 	struct rswitch_private *priv;
 	struct net_device *ndev;
@@ -1004,7 +996,8 @@ struct rswitch_device {
 	void __iomem *addr;
 	struct rswitch_gwca_queue *tx_queue;
 	struct rswitch_gwca_queue *rx_queue;
-	u8 ts_tag;
+	struct sk_buff *ts_skb[TS_TAGS_PER_PORT];
+	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
 	bool disabled;
 
 	int port;
-- 
2.39.5


