Return-Path: <linux-renesas-soc+bounces-32976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH9WHRNKEGpvVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:20:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C99F5B3CCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:20:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0A060305716B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69FFD37C91E;
	Fri, 22 May 2026 12:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W7P3wIdo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010058.outbound.protection.outlook.com [52.101.228.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED24383300;
	Fri, 22 May 2026 12:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452000; cv=fail; b=isdpbtaamKKDzMDpo/RqZiaCp3FU3020eOX0suu7dBxhZIXeaDNKSiFcychvcjYRpD0Ohj+oNfPVERbitsuwb0OrRXG7lJd562soqAQnWTz5dTFm8X3t4yqUnXuJ6dLCVpWqjA58d341dwoDCvSxtEStD+0l/rmGUH9TL1OagC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452000; c=relaxed/simple;
	bh=LGWh+xNQi7OdMlwH19o1E/svIT2N5TNNEAL8wdOrX34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmXP2uPKvLCcOVmZXWxpoPQOiq18BES6gVGQihb3hdKzZ4PL3LFv7e3XckMkRMnEOX30Md5qh3snc7gvDhFPP5fd9t4awbzwjlqkSsAS0Ql04wW7QveIHWnz7ARRPoX6lGgDgAQqxmPqpN+eNA0UK9aGnl8TB7L/aGYn+0lJkZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W7P3wIdo; arc=fail smtp.client-ip=52.101.228.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AXGDfxWNMQkWKT8y92hNIc7v1Ht+xycozzyNcjboUNvaeshET+RLJ0qd/VXi3ldfUqciBWVqIbTlJ98l2mSO7WVGPe0gEbju7Fsht/t5qdZWIy9dy6tQ8uo4S7Pifwoi/4PrTKtojehY0ycVVaoD9Yy3+b1uSaehFBqHXKUCoDmevSEPc+0aKODE1LleHPbmxls8sTOaRFQ8+1NFPvi3aGDJX13zPU2VcPCfYWG0HMf17Epl19pqJIxX1K+NS3d/Ya9gnT7ydw+OXZOdDX6/+/ey0d31Nsi9Y7CpavdGRm4G9uwzu8tnCE6tgOizL4z96etIX3rzBKMvjbTLpO4lng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=35zZ4kJ0LQvFIaOvChJuRpFOYy4gCwzo4eIY9oSDkqk=;
 b=bKTPlgnOSUN+HrFSQ1pp0lUWL2bLdY3ZsrQumt0kWwEa/qzVQaSvBWGgeaIv5pknOaQOsdMJC3OE2d9fM0pAxRiqv77RByhKfJAnsTJdQ7EQqgWuUseBRnS9Iag8P5tJYgc06sMtL4faxJeIkxW20S52CZrxK1XAO4i6nIRdKFjNrIQJKt5/dxB554Ljz3MLaphuDwvVAraoSaytSj0fTJ6W929gVk1bR0e9VLWIwXsoWQ0VGeKrua5IkqxJIJzJuIM4/h7DzXmy+hB+C1mz6scz0H7WqCnZS/6bik9/eTwfa0W47GWHLhcUlOITRFb1rKt6EeCHtgm64lrXuaw5XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=35zZ4kJ0LQvFIaOvChJuRpFOYy4gCwzo4eIY9oSDkqk=;
 b=W7P3wIdo9gsL2mjPTfYGWYAclQAZxJUAFDW+zx6pjnQ2EJpqSobZ8+u69tN8YIPJFHe3UupoZPM6rcQ/ssaEDAyvH26sJGEyIyx58EnI8Vw/F1I37IjTEwtFF4JSfbnHJq8TwPM+dJ9oJS5IknhBy9O+qXUahQh9RmoefMgsZbY=
Received: from TYCP301CA0078.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7b::14)
 by TYCPR01MB9797.jpnprd01.prod.outlook.com (2603:1096:400:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:15 +0000
Received: from TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7b:cafe::77) by TYCP301CA0078.outlook.office365.com
 (2603:1096:405:7b::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005624.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:13 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 289243000469;
	Fri, 22 May 2026 21:13:09 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:36 +0200
Subject: [PATCH net-next v5 07/14] net: renesas: rswitch: make helper
 functions available to whole driver
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-7-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=3137;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=LGWh+xNQi7OdMlwH19o1E/svIT2N5TNNEAL8wdOrX34=;
 b=qACOsTQShl6y2ZBZx1vhAE71rI0ZPu11bGUc+xRJbX38iIp79d8dpVoTCaiyGH1P6TXwBcurK
 UiUPgm276pFAxjiHOn0Vcc7Gn2T/nJjzuvtc3LeLLD+Y3/F1i3+5/JZ
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005624:EE_|TYCPR01MB9797:EE_
X-MS-Office365-Filtering-Correlation-Id: 857f165d-bd83-4c08-15bf-08deb7fb7f79
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|6133799003|11063799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LC+YtMfAykRPeCb/sMpgTS3j4QFjgY4/Tsm8D2bXWTuDIwOczzTaTGVjW0q9G7kQn/iO8cI76sls0aECr08zmkZDo7SdYhkJLETcsqUvqp8YbRhOV0e+67JY7Hnd6QpOQVM/u2vNWpLsm6R6LH+5GujIGUFke7SDpRHSeFMzBBAHtUc55cojpvrOTmsIblLMqp/QRy/YM58fo0tBRZU0o19gaSIT4Ts1BUAfQ1e9smot9laBZIH+lMQO3BQAUumUBC060AFu0Ed92tvbJzItbdSST9jQeCv/c/QUVd4vET4ulZI60Oh1j/kSpQRDDk0qW5OvA0a2r1Hm4wKa47x9cLaanpu4La4W4WMYSYbixDmUAfTy6XR/FpIX+XkggMMtYxJ4Z7Bz2FfzrQXXCm8OyQKgKlIGKHdpKzVWa964DZK0XeLzxpCDCy6BSGt0YFRff5ocwOlXBKb7w3/NAySYSB9hWS4KxtibWBvNNAINWqndXTL+mboX7n0kqpxjlQ7VYDFrLxaTq508AfOeIXYPtKkAveAcPCBOaQYpAnwCVvOMjee+OzVNjySRhbU1vi9xKqyJ12keQMZ6Hy3XfZDH/hl8ptAImsMsJTtPQK//j2D3RojplgAI60EsdIsY5mdfVwMANHKGxNkQcGth/fH4OSwhBIyQegYPJgq8jMs8qzLETZOZ4Jp0Tl6YiiH4ItQBrxmLdA7jGTLeKj2hqPTvJcBWEq2Q77tGfslklBp0ZE8=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(6133799003)(11063799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rgBL0OUuHQSR47nm2vHDpQqjSKKN1SpTjrIl1Qluk5HY1I/k+bFskDqWszob4sFl7pE/CtlFEpDDnTe0wrjbXl+N1lc1vGNeWTVdMOf5gRL74FGrZV97qlL+11DBqQs7FcgQsIVu4KBA2AF2EntNMiOBtPgH7W3tjkc8/koBTgz8kRQFJ4BQU88wuSaKqi5RhVcaUexVVZQ7mcqMmbJ9/BTeixJsTM/fZI5TTMIv/ek6CIACNbwq+PgKc2e6oL1YNKadI0IgDTpCAjTGRY2oaU9IpAgdkdPElus5UBzVNL+CkcDlxSVtWNLWVFpZ6uzVymKTLDCNlt7MR/ij5tQA0mRmdobCNKQbpFW8cdI+k9wAYm1q+3H+H3t/CpCP1uUKUCXPOsJ0WYkXWCmibVmEkTQrjpAQclbDhskyiU+OPGftH+jl0T9WxgBIa41TZJtV
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:13.5746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 857f165d-bd83-4c08-15bf-08deb7fb7f79
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9797
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32976-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
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
X-Rspamd-Queue-Id: 1C99F5B3CCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These functions will be needed in L2 and vlan handling. Remove static
declaration and add function prototype to rswitch.h.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  4 +++-
 drivers/net/ethernet/renesas/rswitch_main.c | 14 ++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 8415f52a239e..5feeb555e9a8 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1219,5 +1219,7 @@ struct rswitch_private {
 
 bool is_rdev(const struct net_device *ndev);
 void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
-
+int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected);
+int rswitch_gwca_change_mode(struct rswitch_private *priv, enum rswitch_gwca_mode mode);
+int rswitch_etha_change_mode(struct rswitch_etha *etha, enum rswitch_etha_mode mode);
 #endif	/* #ifndef __RSWITCH_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 1f4ec65f6f9b..20ac8f3b9357 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2022-2025 Renesas Electronics Corporation
+ * Copyright (C) 2022-2026 Renesas Electronics Corporation
  */
 
 #include <linux/clk.h>
@@ -32,7 +32,7 @@
 
 #define RSWITCH_GPTP_OFFSET_S4 0x00018000
 
-static int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
+int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected)
 {
 	u32 val;
 
@@ -168,14 +168,13 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 }
 
 /* Gateway CPU agent block (GWCA) */
-static int rswitch_gwca_change_mode(struct rswitch_private *priv,
-				    enum rswitch_gwca_mode mode)
+int rswitch_gwca_change_mode(struct rswitch_private *priv,
+			     enum rswitch_gwca_mode mode)
 {
 	int ret;
 
 	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
-
 	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
 
 	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
@@ -1179,14 +1178,13 @@ static int rswitch_gwca_ts_request_irqs(struct rswitch_private *priv)
 }
 
 /* Ethernet TSN Agent block (ETHA) and Ethernet MAC IP block (RMAC) */
-static int rswitch_etha_change_mode(struct rswitch_etha *etha,
-				    enum rswitch_etha_mode mode)
+int rswitch_etha_change_mode(struct rswitch_etha *etha,
+			     enum rswitch_etha_mode mode)
 {
 	int ret;
 
 	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
-
 	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
 	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
 	if (ret < 0)

-- 
2.43.0


