Return-Path: <linux-renesas-soc+bounces-32970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOmhLolJEGpkVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32970-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:18:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7D55B3C11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1983A3036406
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F3237AA9E;
	Fri, 22 May 2026 12:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="MW/zQ/cu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE7537998A;
	Fri, 22 May 2026 12:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451983; cv=fail; b=Vq6gHM7xI1BEypdvN6ZiiddTCgcqhIeDLmwjM19R0hdzUXgp6DmtKWvjfpvX0Z52dw5qhSLAe6JoSsR2w7AkyKgoet6OUoj2R2mqanvegrHSB3TShRbOHq3alRl7xVqIoQLfGeo0K0uq5MaTDMfDuKd0+Aex8xfWQ6dALvIch2U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451983; c=relaxed/simple;
	bh=DdAHW5pFFp1rmLCOsdWwuX7F5XW8TbDbM8r2gJx/0iw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRETHlQXPlcS/NOgo+GOi8m44klZDqEoPraewSzZyNR12Sxa/50m/ix2p9o+AEN8E+bhs2qU4xDmERTk7iCNhXg8WiZtxROpVwwl4BgOBV6oD02A/84aDuApV+iW/JNH2IABRjTHt8Vkaxb30Lm76ckX7PU2uFAdDxzVCxBtvlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=MW/zQ/cu; arc=fail smtp.client-ip=52.101.229.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HDbJqcibUmaGJ1p4C5sEd+3lVyonf1lrgps25nDaElHakNNTHox2J0XVqQ/DWXE/bCzjMxou6mZb+34/ZOmR0D3PYcbVIm6LCcd9oA3r1g/SpvGnzF8veNKGh2QndAwaobU+eo+xfMZaj7ZbHI/QYK1wTl974SZzSKzgr/tB3f2T8QoQPfG19vnxx9IYMElTVqxqFwyWtFTqe47Uz9pbn4Ml1iv6Lo0+9qDMFAfTkGxXGsVNRmSJiGYR2Q0IX6RQNY0pWa+oRiNDNl2wu1IB9Cv2d639ne8WyTKTFRYPhIHslbrHIOBiFu/JzqgozD7mR1lT5tZV21DP9ySWovGzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjMlhTz+HHkSBlhW0rshtSHaQXq64oGKji5WI81unJU=;
 b=M6lb5Mo7adCOcu6zmLUaLnpuaB3OEHLaKiKWxpdGddCGcGO5i1dDzDNcKviyk3yu2QKax4cvRarTs5WfizbSuC2BQlpHfJhDH/7fJ3HtO02pZ6D3YPwBgXSGVsbBpHQd+mX+FTkntLBU5mDT/vWCJfeOBiix8d5Dmf32ZQBkAPW68j87DS/vaW2Qi3c2bU/MzBPt+/FID3IIwxhf+sI+DCdPpiJJSGVYxWn1CrjupEjPOaVbO76aRnqXUWMXE+/14YX1kij9XmvKiVcuYmFEfqsofjQQA2YZQE7yzFFQDBOsjoiKoEb4Y129Fcm2ZqGqjPAOZlZTh4LlZWiJfo3qpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjMlhTz+HHkSBlhW0rshtSHaQXq64oGKji5WI81unJU=;
 b=MW/zQ/cuMR7D5OhyCGNyOKVHW4cdum9gyDiIWwQk3DUWAsAJOd2C0lhqk74FGDh63IYd+ttau8L+gYHyH1vdm4ledr1bjSTB7xHy6WMGcbcoLAlHb2u4RRESf1cx5EWdv/5RG9WaPx71D5huLn918wA9TFxsojr2rYDG6gVB5yQ=
Received: from TYCPR01CA0066.jpnprd01.prod.outlook.com (2603:1096:405:2::30)
 by TYWPR01MB10660.jpnprd01.prod.outlook.com (2603:1096:400:2a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:12:56 +0000
Received: from TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2:cafe::9) by TYCPR01CA0066.outlook.office365.com
 (2603:1096:405:2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005026.mail.protection.outlook.com (10.167.240.23) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:12:54 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 9426F3000466;
	Fri, 22 May 2026 21:12:51 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:31 +0200
Subject: [PATCH net-next v5 02/14] net: renesas: rswitch: use device
 instead of net_device
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-2-53589d944a9f@renesas.com>
References: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
In-Reply-To: <20260522-rswitch_add_vlans-v5-0-53589d944a9f@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=6734;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=DdAHW5pFFp1rmLCOsdWwuX7F5XW8TbDbM8r2gJx/0iw=;
 b=wPhUoF2sxqoIuzVSyz/3GbeuZeCgh+H6sUBc5cFhi396h5+rc+jjbP2PW2aiR1zOO3MQLY36l
 IOf2wCbeUjvCaN8vd19o5DUVH0/Jc8OzN/ws8qdFq/XFbgqyv+hPLFw
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005026:EE_|TYWPR01MB10660:EE_
X-MS-Office365-Filtering-Correlation-Id: 817719ef-7a78-458d-6fdc-08deb7fb745b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|7416014|18002099003|56012099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	9GxRoL9xXOb21IvbaGbLssNk+Wi5ZLNPTnaGLRGZNPQ7UNZvH0qycVar11oOcBEnZLN8D9T/3MORb+7ca4Bgkke+paSxtPAAcnWa1af8obXiYWQAXERiIefRiMjH/GxIfsGUUxtBNNlUBMLrMfbjM9JwJlZCi2T3gDQfuMSlhwWoM5iCYVxDcBdyYZtLCIab1yuF4TmJGDQonwWCvvoD3+qO0Mva8LS1saoCI23gC0tQlCYJi68k6qR13C+OBUyxOVUqmYaBWH4JZDbstonjZXhadi/ZTnb9qlwuvqIWhiMj33+nPof6vtJmx1jWfZ0y7GebMvDwROtLTBt1b2XEuPthqI4oQXkB8Mxjq/AWrHruZ1Wz/dOKqxrxm4P+JrR2aTnD1aBEVpjQKc8C44N+H4oLv3kLRy363diC4gkYMt1WCBvzHjqCd665WkxVdYs0NvZsbhDTp2hqfbRRKOU+HZi1BPRYFzonngy0fbfX261vwnl/I+qZxqc3hh1L7pqDT8ZaAsLW09NRdyCd/C/Xh4pHcgIg363Phiz51GyjCP4Y5gaRpmrnUwsmmFT+9+sMikCSymyfWAnlwRbwav/n91Iv28mIHIosfJNrHUT7qUaitqIbd80AsLBaSt8Uh5uRB+agrJYvftSdLgOPdXWjmHLMCTB/PfEF9inHSCTX2V1rh7C+aTXFA9auDG0m2DN0hhYtM6jAj4sOVYF8eOXNWPln9DVH2B/+pN4ZUrU3QpE=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(7416014)(18002099003)(56012099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MMzIiyOI5nlg96cBibIu9x79GWt7i67/IH7usElv3zVlLaIYsVP100dIQWrFCB9dvomZQv9GBiOg/VU18/1Wot0XpVqPz8metONF30Y9X7isQjX9pwABR1+NTQ0zSNo4eOoe11QjptEqGhRoIZKfEDESs5Vl9Zr2uw+EbFRabnHadQsT6nNP1CIx1HY4bpFYgxHdBB9ebhCXORXy6RVEaZpP1PcKlkTk8ckDm3jZWj4/J7SLVMtyL0bFbc7F/q5LVxqEznS3PlsDxl54hbuS2SgpOsZO7hKSjk3iYywGZuZND086fngC0uIocMEfH6gDSuEP9Ivxe7+ypvv2GvXW2M4aSYFgHcotOoQYZjUcaR9CMJHXt3GbLvdn5WXpklpeQig3b3VhjQvY9lBDvN2ctzUzyzQ6ON+1FCZ9FGEkF5GfkXeAjV7hs27S1jMsdp/F
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:12:54.9501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817719ef-7a78-458d-6fdc-08deb7fb745b
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005026.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10660
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32970-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5E7D55B3C11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In upcomming changes for adding vlan support struct net_device
will not be available in all cases, therefore use struct device
instead.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 56 +++++++++++++++--------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 9b739594cc02..74d441ae1976 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -304,26 +304,30 @@ static int rswitch_gwca_queue_alloc_rx_buf(struct rswitch_gwca_queue *gq,
 	return -ENOMEM;
 }
 
-static void rswitch_gwca_queue_free(struct net_device *ndev,
+static void rswitch_gwca_queue_free(struct device *dev,
 				    struct rswitch_gwca_queue *gq)
 {
 	unsigned int i;
 
 	if (!gq->dir_tx) {
-		dma_free_coherent(ndev->dev.parent,
-				  sizeof(struct rswitch_ext_ts_desc) *
-				  (gq->ring_size + 1), gq->rx_ring, gq->ring_dma);
-		gq->rx_ring = NULL;
-
+		if (gq->rx_ring) {
+			dma_free_coherent(dev,
+					  sizeof(struct rswitch_ext_ts_desc) *
+					  (gq->ring_size + 1), gq->rx_ring, gq->ring_dma);
+			gq->rx_ring = NULL;
+		}
 		for (i = 0; i < gq->ring_size; i++)
-			skb_free_frag(gq->rx_bufs[i]);
+			if (gq->rx_bufs[i])
+				skb_free_frag(gq->rx_bufs[i]);
 		kfree(gq->rx_bufs);
 		gq->rx_bufs = NULL;
 	} else {
-		dma_free_coherent(ndev->dev.parent,
-				  sizeof(struct rswitch_ext_desc) *
-				  (gq->ring_size + 1), gq->tx_ring, gq->ring_dma);
-		gq->tx_ring = NULL;
+		if (gq->tx_ring) {
+			dma_free_coherent(dev,
+					  sizeof(struct rswitch_ext_desc) *
+					  (gq->ring_size + 1), gq->tx_ring, gq->ring_dma);
+			gq->tx_ring = NULL;
+		}
 		kfree(gq->skbs);
 		gq->skbs = NULL;
 		kfree(gq->unmap_addrs);
@@ -359,7 +363,7 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 		if (rswitch_gwca_queue_alloc_rx_buf(gq, 0, gq->ring_size) < 0)
 			goto out;
 
-		gq->rx_ring = dma_alloc_coherent(ndev->dev.parent,
+		gq->rx_ring = dma_alloc_coherent(&priv->pdev->dev,
 						 sizeof(struct rswitch_ext_ts_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
 	} else {
@@ -369,7 +373,7 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 		gq->unmap_addrs = kzalloc_objs(*gq->unmap_addrs, gq->ring_size);
 		if (!gq->unmap_addrs)
 			goto out;
-		gq->tx_ring = dma_alloc_coherent(ndev->dev.parent,
+		gq->tx_ring = dma_alloc_coherent(&priv->pdev->dev,
 						 sizeof(struct rswitch_ext_desc) *
 						 (gq->ring_size + 1), &gq->ring_dma, GFP_KERNEL);
 	}
@@ -387,7 +391,7 @@ static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 	return 0;
 
 out:
-	rswitch_gwca_queue_free(ndev, gq);
+	rswitch_gwca_queue_free(&priv->pdev->dev, gq);
 
 	return -ENOMEM;
 }
@@ -469,12 +473,11 @@ static void rswitch_gwca_ts_queue_fill(struct rswitch_private *priv,
 	}
 }
 
-static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
+static int rswitch_gwca_queue_ext_ts_fill(struct device *dev,
 					  struct rswitch_gwca_queue *gq,
 					  unsigned int start_index,
 					  unsigned int num)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_ext_ts_desc *desc;
 	unsigned int i, index;
 	dma_addr_t dma_addr;
@@ -483,18 +486,17 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 		index = (i + start_index) % gq->ring_size;
 		desc = &gq->rx_ring[index];
 		if (!gq->dir_tx) {
-			dma_addr = dma_map_single(ndev->dev.parent,
+			dma_addr = dma_map_single(dev,
 						  gq->rx_bufs[index] + RSWITCH_HEADROOM,
 						  RSWITCH_MAP_BUF_SIZE,
 						  DMA_FROM_DEVICE);
-			if (dma_mapping_error(ndev->dev.parent, dma_addr))
+			if (dma_mapping_error(dev, dma_addr))
 				goto err;
 
 			desc->desc.info_ds = cpu_to_le16(RSWITCH_DESC_BUF_SIZE);
 			rswitch_desc_set_dptr(&desc->desc, dma_addr);
 			dma_wmb();
 			desc->desc.die_dt = DT_FEMPTY | DIE;
-			desc->info1 = cpu_to_le64(INFO1_SPN(rdev->etha->index));
 		} else {
 			desc->desc.die_dt = DT_EEMPTY | DIE;
 		}
@@ -507,8 +509,10 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 		for (; i-- > 0; ) {
 			index = (i + start_index) % gq->ring_size;
 			desc = &gq->rx_ring[index];
+			desc->desc.die_dt = 0x00;
+			dma_wmb();
 			dma_addr = rswitch_desc_get_dptr(&desc->desc);
-			dma_unmap_single(ndev->dev.parent, dma_addr,
+			dma_unmap_single(dev, dma_addr,
 					 RSWITCH_MAP_BUF_SIZE, DMA_FROM_DEVICE);
 		}
 	}
@@ -516,7 +520,7 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 	return -ENOMEM;
 }
 
-static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
+static int rswitch_gwca_queue_ext_ts_format(struct device *dev,
 					    struct rswitch_private *priv,
 					    struct rswitch_gwca_queue *gq)
 {
@@ -526,7 +530,7 @@ static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
 	int err;
 
 	memset(gq->rx_ring, 0, ring_size);
-	err = rswitch_gwca_queue_ext_ts_fill(ndev, gq, 0, gq->ring_size);
+	err = rswitch_gwca_queue_ext_ts_fill(dev, gq, 0, gq->ring_size);
 	if (err < 0)
 		return err;
 
@@ -638,7 +642,7 @@ static void rswitch_txdmac_free(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 
-	rswitch_gwca_queue_free(ndev, rdev->tx_queue);
+	rswitch_gwca_queue_free(ndev->dev.parent, rdev->tx_queue);
 	rswitch_gwca_put(rdev->priv, rdev->tx_queue);
 }
 
@@ -672,7 +676,7 @@ static void rswitch_rxdmac_free(struct net_device *ndev)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 
-	rswitch_gwca_queue_free(ndev, rdev->rx_queue);
+	rswitch_gwca_queue_free(ndev->dev.parent, rdev->rx_queue);
 	rswitch_gwca_put(rdev->priv, rdev->rx_queue);
 }
 
@@ -681,7 +685,7 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
 
-	return rswitch_gwca_queue_ext_ts_format(ndev, priv, rdev->rx_queue);
+	return rswitch_gwca_queue_ext_ts_format(ndev->dev.parent, priv, rdev->rx_queue);
 }
 
 static int rswitch_gwca_hw_init(struct rswitch_private *priv)
@@ -872,7 +876,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	ret = rswitch_gwca_queue_alloc_rx_buf(gq, gq->dirty, num);
 	if (ret < 0)
 		goto err;
-	ret = rswitch_gwca_queue_ext_ts_fill(ndev, gq, gq->dirty, num);
+	ret = rswitch_gwca_queue_ext_ts_fill(ndev->dev.parent, gq, gq->dirty, num);
 	if (ret < 0)
 		goto err;
 	gq->dirty = rswitch_next_queue_index(gq, false, num);

-- 
2.43.0


