Return-Path: <linux-renesas-soc+bounces-32972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aE1kMdhIEGrzVgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32972-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:15:20 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBD85B3B30
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F0F743068099
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFE837E2F5;
	Fri, 22 May 2026 12:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PRA8asZW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466F137998A;
	Fri, 22 May 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451989; cv=fail; b=nfM+Gp4pvzJb8qcWQzMjJQI1e8ySPvB1VuU3aC4O6V3NhLIRU6AHxlKvdOf3iIUA7yl8wSUKJN81ixNFiz9udm45rahhIQSm0dbq6BG721inZfWUxpM0WLF9iAlI8E4AD3yTAa8wS6sv48vtVzyESY7cLudZlO1PJnKiw4P6aO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451989; c=relaxed/simple;
	bh=KzokIuVf1JuasylWpTqglayVYk5u79t+hlc7Z4jEbGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nMgPC7ihp8AOZ34MaAnNRnVamTjto9jDKxztw31hhFaGXC6ZZp5ETk/2lt57NsdLSntVa0xRlwx97LHyT2cdhMKMeUXQcTzcbpfYATIJcBIqYn5JULhHZJMB7qH2TGzk8tPVdiGqzOHktG4wz6Y3dso+iCfuNGLtlxFUQT4cAUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PRA8asZW; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSl3p99ZraPWNrEWG4mo1bsOqinDiDoUDPf0eHUGrokzPE48ntsHnjxBtdL5tUeImda9MBS7AEPFJ49qYM5Y2BYmQfsJJvt872DSxd6+j2aq8ZBLKykDJjsHdvARs+HF536Ua/K3nPhDWW+YBmZu+1nyiV3dSXxM2YeJIKXFF56e6NcdoBzSstBIJB43vB2hkgGPr2K1kChDO97FQFIBXsUKMsFuI5q14p3EvNKxa6Sau1+xeePt477E6/joaW5KDQzY1sIhMym7DhoJAe1ezwM5yGwERBc3busPjH9S8APaWytQ3a2IGmpeCwtrhH4fITre0zF/OqF+V9KLnthmMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ap7scxMTOjzPFSt4AZQx1FHKtid9MxnoQaxp0m+isPc=;
 b=oM4TUAM2usDj1wTSnCcgSm34GZVn4fLWNCjXbXB02SIfO/sg0Vc/L4QkMSen/SdXuRN7dqAtZFGJr1zvbDgHfWFpOCu6prkguWZFul6QFpNFWNz3JS5jyLVuYGuQgZFvw/LZXxidVlH7HplkjdsOupEZm5JU7D8w4Qb6tNFggLVNPbWgq/5yuI1rUCfeoAkAE3knHpOsTEKDDrHQt5D4Bsj7WKvnfvp3C4s+fbtB+2uJQG2aU0xbZwVup2ABxs+lGVQWkR1eOrlcRnhK6I1LfyQrV8UtP6m9VxuPzHUb21BoWjlZm2zFkzhaEVGtAjnHA9lEP4QGvzU3IlmEEIn1qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ap7scxMTOjzPFSt4AZQx1FHKtid9MxnoQaxp0m+isPc=;
 b=PRA8asZWkBBE1veCGtMYhpM802/oqpOvVq4JE6NUuLbpd0eE80Qq5pqLxNR+RO3S4a/oGU/KpUkEaK9mamKHFyGSZQV9l3nPFe/nqHcA9ROSP/Wn6T40VXEYzC48ztCPbEtGc39wgqjeNhz00n91h5PQP+Ajs1sBSssT8nh17Wg=
Received: from OS0P286CA0158.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:16a::13)
 by OSCPR01MB16045.jpnprd01.prod.outlook.com (2603:1096:604:3e6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Fri, 22 May
 2026 12:13:00 +0000
Received: from OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a:cafe::8c) by OS0P286CA0158.outlook.office365.com
 (2603:1096:604:16a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 OS3PEPF0000003E.mail.protection.outlook.com (10.167.240.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:12:58 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 4DCC6300046B;
	Fri, 22 May 2026 21:12:55 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:32 +0200
Subject: [PATCH net-next v5 03/14] net: renesas: rswitch: fix FWPC2
 register access macros
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-3-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=2272;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=KzokIuVf1JuasylWpTqglayVYk5u79t+hlc7Z4jEbGI=;
 b=74fyfnFW6c9FbPjq1ndnv1o/ToeSRiHboiSu25FUbJELeDuImlTNNpi94YIe200pH1qLilaMA
 neVeXRibWyMBe1zCGISkxFR1FkemqyPsUnf18aTNnW6N22hBLpyKhCP
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PEPF0000003E:EE_|OSCPR01MB16045:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f36447a-6d87-46fe-e861-08deb7fb7698
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|82310400026|36860700016|376014|11063799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	sIrrPuwQoJIB0vVV/CM7LqlSia+09FyQjP6arY/wPALN0zFSxhsFFU9hSeVp+fFPOaIIdwAvs3+DlZQmoybmqQJnZgYEFKi43JzL+NiZT+5oTrchjwIGDcKmDSkaSTbtJA3vvyQxgZv4lGqwN7c2I8HZrWhxpeDpS+Q0ob5xiBO3rktJQefjVyUFnMbCyP3eJYJs/m4tAUBnFBSsvTQRBZbDURYlIHZ67l7G0P+xJlor3z/9jTjJ5zdiUTdaAn3gPUEwD5ZJR9q3Q9TUcMrjnYvJAMRhfUHd0kx41i+xxlmE3O01rRBBYU2u+t1kroXtvwPev1pfJhn653VxJPcCZ2DDWOSuH4r2j4tMgFozV3nw0ZUBqw24OLgknmnLlKsd3C8Xo/pdfIH++nR/2xMQNxEn5XYGblihtqmh/5enVVNu2zKW4Yd0NlDL0vFdxlk6cN0+x97OlSGw3m5/D0jrPL9m9UhFDGpguL1hrc2SBnje5FMTQNPi54VAdmMRPhNHem/vcnnoXT/sEwutk5YPi8shSjhS5QPP/BTDSMSve9y62ZX68iFJLCNvLd5JjB/bGP/ttQ2ghTDpTm3asGFdkhJPweNYc15KCnXioK5nS8w8oaTBuWHolHV7NrmzdDL7aN0LtjltmREffEu1yrAiUgpEPnkOqkWxlEO51Isrqrh0ml3zDMrteL3yltjN/kKCQPaG6/aB3SkZPFOv/rBLg6xpv5sqDq/4Deayq1neuGw=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(82310400026)(36860700016)(376014)(11063799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RIy1u0Z0kz/J/FSyrucK5Y9bTs5mmOTrCApU6H5e+SZ0YzcI2yQoyyChnZMJak/YxBmQj+SppxWLTBAdrRkdFDOJ74WMj7tOVhUC5LlBYQJOiO7cunsGgu13amPDJ7j90+/m3UQlkj/iYQ2iP+0UndIAcuP3zp2WLOvYV9bUCvOv2YP8/OF16h5N844q26PjjDSDBmc0nLpnnW3NCk+dQVZha42aYORjYDjNiVcoQC/wnfJZeEhAMjkuooNC6L/1TP1dpKh7jbcb0RB5WLrMhO9WSHj/lKFBvbDTejrsAfsovplIsbZ078epr/UJP84MC2PuKvqpsesTyGLK+UBNWF7XEpzdxJeZp9x9OBzZ4aPfJiY04WaHu3grYpATErLnbx1oDEIJstm2BWU9KRc0ML+LsvOZkLRD6l++DVS8ZZzRYzbrCyuFdIe1dTw1qm3u
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:12:58.6953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f36447a-6d87-46fe-e861-08deb7fb7698
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: OS3PEPF0000003E.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16045
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32972-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,renesas.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FBD85B3B30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Fix typo in macro name and remove duplicate macro definition.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      | 3 +--
 drivers/net/ethernet/renesas/rswitch_l2.c   | 2 +-
 drivers/net/ethernet/renesas/rswitch_main.c | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index aa605304fed0..340524d995ac 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -826,8 +826,7 @@ enum rswitch_gwca_mode {
 #define FWPC1_DDE		BIT(0)
 
 #define FWPC2(i)		(FWPC20 + (i) * 0x10)
-#define FWCP2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
-#define FWCP2_LTWFW_MASK	GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
+#define FWPC2_LTWFW		GENMASK(16 + (RSWITCH_NUM_AGENTS - 1), 16)
 
 #define FWPBFC(i)		(FWPBFC0 + (i) * 0x10)
 #define FWPBFC_PBDV		GENMASK(RSWITCH_NUM_AGENTS - 1, 0)
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 9433cd8adced..709524c8a5c4 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -82,7 +82,7 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 			 *
 			 * Do not allow L2 forwarding to self for hw port.
 			 */
-			iowrite32(FIELD_PREP(FWCP2_LTWFW_MASK, fwd_mask | BIT(rdev->port)),
+			iowrite32(FIELD_PREP(FWPC2_LTWFW, fwd_mask | BIT(rdev->port)),
 				  priv->addr + FWPC2(rdev->port));
 		}
 
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 74d441ae1976..9510bcdf9e83 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -129,7 +129,7 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 		iowrite32(FIELD_PREP(FWCP1_LTHFW, all_ports_mask),
 			  priv->addr + FWPC1(i));
 		/* Disallow L2 forwarding */
-		iowrite32(FIELD_PREP(FWCP2_LTWFW, all_ports_mask),
+		iowrite32(FIELD_PREP(FWPC2_LTWFW, all_ports_mask),
 			  priv->addr + FWPC2(i));
 		/* Disallow port based forwarding */
 		iowrite32(0, priv->addr + FWPBFC(i));

-- 
2.43.0


