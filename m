Return-Path: <linux-renesas-soc+bounces-32980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AForIE9KEGpvVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:21:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE065B3D16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 07C8D3060096
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510CD37F733;
	Fri, 22 May 2026 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Go+OM60Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010044.outbound.protection.outlook.com [52.101.229.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460437F017;
	Fri, 22 May 2026 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452016; cv=fail; b=Qfqd4ANoblnP7GCz4AisYI2sqlcWUhHN1LcHHjFNk8tLKqIEDQQO2RYSvWkBEgrJUocxb7DdCM8lKFD83BJVZFWuchvsaKKOPHcQDEVeAweulzH7TtSTdgh6Ng74dhxyFNoqPPypxX8vlpmxHp2+OlRmBmpDcRcIOQKa08mtFPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452016; c=relaxed/simple;
	bh=68bTAHsrtn5+3OAMsPqfRjblCPIZOM0XUr496LrrfdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkGShaNH3gwcfthFQdthvuHmlI2ZSWsi+yFXyUrGz50CRafoYl/OwXACr2+1AEHUBk2iLVrmWJSFEf5mRBewSlMJMcTtY7GU33N7QrODKpgllAqREKJENr94Iyo2nu/nbCwei4s0zZR8PAX9zFLkBoEL+07LyQpK4JNnBUaLUYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Go+OM60Y; arc=fail smtp.client-ip=52.101.229.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TfHZPjnYARKviNpAnDb9px4Tg/VInXJIQngZL4Ep9f1pojYZ6Qjt+MRNtr9QMxtKRN/K2GN0YthzwfbygWJoLb3YrhG4Jl8cANvWPwWA+YZsKs5y/vN9IHk6iACvNnov5agmOsbj+StZtgfmocrlTokLhn9q7S8hPmoubgcwi/2k//5EgMcNQG0wT4+rP4X/3syPk8wUeBne1JQ1ByLml30HxvnrOJ7ltpI14+UNBq6YMHdcAfXnH4De8SLLLV1CVAmlfeAexmueh39bcVmbD/W+9lyWSxakijd/PEMY9faIg4t2J/fq5lpisZHdh0qF2hfS7Fmbs2QIeUxH/WXDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A+nl79xvbe3KMm2ckL77kD+YsIW27RLtDrUzY1MpQ+M=;
 b=FCWUhL0t3uQwg5l9S81OqHPGcBwzhNoQNh0MvMG0UQvsCGj5g0cye2jsG9doF+ryDrc+PS4thgiVF9/i/KBnTg+DM0/OlYg6Vo6D/H5vnHS3pMM2DftLO8+73CmVtbeaN/EKWDRSsiIERaRVIDo9UbDGAAAp52E9toTxxl9lSvl6LpoKciAAbwth3pCFg0T9CZdtEi9wTr54ABAayXEdxwAQmduAx9RyKJ2589963XbQTEygtpbZ1qNZ92QHnUOFn8Nu2BpYN3mYZ7m6JHOkYo0WmqZBXEhsoDd5ILEMK6CbVVmFLms26E4Ybug+YQL9GPhmZs/1gDJ7JXL1vCKxeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+nl79xvbe3KMm2ckL77kD+YsIW27RLtDrUzY1MpQ+M=;
 b=Go+OM60YLkCGoyJ59XaPU9KkHd1UulvjegS4ImCtEML1c3kKo0HBVWp9IDFPV2YL8qynwMLpr+mgJR8iPlkPGjsiHiipzCh6S/gjYB9XCv6L5Poxlg4q/eDwSJbmRKSficNcmVQa1CYckFUblMuq4RV3HX5EHzlnTUceMKExkvc=
Received: from OS3P301CA0052.JPNP301.PROD.OUTLOOK.COM (2603:1096:604:21c::17)
 by TY4PR01MB13430.jpnprd01.prod.outlook.com (2603:1096:405:1d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:31 +0000
Received: from OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:21c:cafe::62) by OS3P301CA0052.outlook.office365.com
 (2603:1096:604:21c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS1PEPF0000D20F.mail.protection.outlook.com (10.167.240.38) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:24 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 4D82A3000469;
	Fri, 22 May 2026 21:13:21 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:39 +0200
Subject: [PATCH net-next v5 10/14] net: renesas: rswitch: update port HW
 init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-10-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=2613;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=68bTAHsrtn5+3OAMsPqfRjblCPIZOM0XUr496LrrfdM=;
 b=+vEzTd6d2Q//FN/buK4ZFnZ/cBaaYhnpo6N+mA433qGTWfy/FZHjdTr9dEUxo/UXt9k5fXYC+
 RZkq8W+CaS/BjfPbCwLO52flr1+4NokeMlbukEZmAKJpMGFZRxtgb96
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS1PEPF0000D20F:EE_|TY4PR01MB13430:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cb281d8-6f2a-47d1-b239-08deb7fb8616
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|36860700016|82310400026|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	yjklH+FdSjafQi9pDT6oMkQEEAVhQ/twEnZau+uyCJoYIIg7XXPvIRgoYaErxBg6yPnhnSY4GCMazyaiw9Iyytn5VDnXYvY9eWi6OVZ7+AT+8A84KqkMKPOw8/2oDodyt08WxQEBC7ZUe+LS0XCfAaLGeN17QHFhJf1bCHDqBfvXXbbF0gygR8s6Vszo1gX8K+fpebAApKl1w2TPHNx72S/rKAaY1PdmczljWLyhgpAmg9AnoWyJDd+9KXht4dttMcRuj9LbNjrZ0De6KlsWtfpBBW8VSzpjMD/Gzi41KLfHZRCeHNwFzJ+yidQGFVfU7AofEZSlrvxLvHjmX6RSi6bzUydhKIpzOfDF/ZJwlxkXgbiUe99/zFeaDX64ZSyrhmxrQ4I6Whx58xGbI98XMJxiOOHVpo90WTPxntSRMQK29d8M+67JYNq0eIF/b6gWUqIn5yT90/jyPSx5JweWduvzKMd7Vyu1gNPTih5xNeF4A0KPTcrzqc+9fIWKBn44MFAXht1PR4752Vvelvj8gLmenXvmiB/Z47PtNFvzLbscLw8/IvBy20cxHoBdOb7Un9blpxNeB/7Mp6+LifyPiHGAviNFkfLkQel4RFf7rLfeZXdsqy3FfKGlC1mw4ZOoMJ/WsVJh3eDZ7on0y6S5IcY7oluGILFTrDPhU+d6TuZeOf7GB5Ir9UmMqeoK58LSCZjTRYq5+QhVY3XD/xfcvMCk13AGTDXRnJIU6ukFhKQ=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WWslC2UVLjQ7uIv6pi9JaWbiRPe0cPBcRbyY+N5ErJU2Zb90XKRCAK8l5stog290bEMhuTEZ9GwcoiAd+ykskEblpuCIQZ+5fjMUVCJsn0I8sPYh4JnNHbAEc/3Fmd+QLo1Jg+WCIKHz+MdjL9gc94pqGWTbZwK2610ISduTHzqeyydmSg3g66NPKo572IFo1X/5ir27W49KzdG2ETB47Anj9WmzqpKxLVI7yF9fC3+3HKsR7VgaPFuW/2ibF8rGjz3In0Phbon4VTB62JSbIQ+8WNPfDBhXya8XcSOGZFaCwB3uXi6xBHCtvX8syLkMw9J27k5VJe1WiGqcMTu/ehDM+x+eXqjwIpDCA9Fb79kOoAk+d/14JEweV5WVgVmIVGP6+FpdReokrdunV5rYIyzdLrKxbC1NsrP2yEM810XsTB+MJk1kZIsxcdqxkt7L
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:24.6862
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cb281d8-6f2a-47d1-b239-08deb7fb8616
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS1PEPF0000D20F.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13430
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32980-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 6BE065B3D16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Certain Ethernet and cpu port settings need to be updated for vlan
support.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  4 ----
 drivers/net/ethernet/renesas/rswitch_main.c | 16 +++++++++++++---
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index f85dd96a9bfb..736762912acf 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -766,8 +766,6 @@ enum vlan_egress_mode {
 	HW_SC_TAG_VLAN,
 };
 
-#define EAVCC_VEM_SC_TAG	(0x3 << 16)
-
 #define MPIC_PIS		GENMASK(2, 0)
 #define MPIC_PIS_GMII		2
 #define MPIC_PIS_XGMII		4
@@ -806,8 +804,6 @@ enum rswitch_gwca_mode {
 #define GWMTIRM_MTIOG		BIT(0)
 #define GWMTIRM_MTR		BIT(1)
 
-#define GWVCC_VEM_SC_TAG	(0x3 << 16)
-
 #define GWARIRM_ARIOG		BIT(0)
 #define GWARIRM_ARR		BIT(1)
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index a445d9a8505d..13e59d2d0828 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -752,8 +752,12 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	if (err < 0)
 		return err;
 
-	iowrite32(GWVCC_VEM_SC_TAG, priv->addr + GWVCC);
-	iowrite32(0, priv->addr + GWTTFC);
+	iowrite32(0, priv->addr + GWVCC);
+	iowrite32(0, priv->addr + GWIRC);
+	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), priv->addr + GWRDQDC0);
+	/* Drop frames with unknown tags */
+	iowrite32(UT, priv->addr + GWTTFC);
+
 	iowrite32(lower_32_bits(priv->gwca.linkfix_table_dma), priv->addr + GWDCBAC1);
 	iowrite32(upper_32_bits(priv->gwca.linkfix_table_dma), priv->addr + GWDCBAC0);
 	iowrite32(lower_32_bits(priv->gwca.ts_queue.ring_dma), priv->addr + GWTDCAC10);
@@ -895,6 +899,7 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	limit = boguscnt;
 
 	desc = &gq->rx_ring[gq->cur];
+
 	while ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY) {
 		dma_rmb();
 		skb = rswitch_rx_handle_desc(ndev, gq, desc);
@@ -1305,7 +1310,12 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 	if (err < 0)
 		return err;
 
-	iowrite32(EAVCC_VEM_SC_TAG, etha->addr + EAVCC);
+	iowrite32(0, etha->addr + EAIRC);
+	iowrite32(FIELD_PREP(DQD, DES_RAM_DP), etha->addr + EATDQDC0);
+
+	/* Drop frames with unknown tags */
+	iowrite32(UT, etha->addr + EARTFC);
+
 	rswitch_rmac_setting(etha, mac);
 	rswitch_etha_enable_mii(etha);
 

-- 
2.43.0


