Return-Path: <linux-renesas-soc+bounces-32971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INoFHp9JEGpkVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32971-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:18:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A325B3C4E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:18:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB5AD3043A21
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE4337C91F;
	Fri, 22 May 2026 12:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="QUvCHaas"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011045.outbound.protection.outlook.com [52.101.125.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC31D37C102;
	Fri, 22 May 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451986; cv=fail; b=jsr1N6qMXdq41LVMTF/Cgx2OhHQqwy49aRnS+NOwV4exQ9N8ElpMWUtyeKU9B/jg73X25ZHODXqkg/6StT8HiBO/Jxoztq0haxYKEeVdbLanWxy28ybT/jv6wYm14rOdad1JeMTU5sjWGGbRTH8CBoLief0huQhVp2ZuENkvUC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451986; c=relaxed/simple;
	bh=3lkr+RE11y4eF24FLC88bvRLrDKItySrEf6pwuvS2n8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LgdhlmKzW2JlyF0mpb80yd2/5PHaE/WLtXHuO+Sn5wfRTeSAt0YeSnLS9uxj5craABEKviE2xrIhGWzatHXAQfRQWZ0ybdV9cbgUQ6RN2KT9joRSauuDh9qwYIlxJcbZT+5NDLHzh2kZCo6PZK1yyv3AGY6J9RV9xxgVJdRqpXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=QUvCHaas; arc=fail smtp.client-ip=52.101.125.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WUx1uxX0YcjV8yApguiG+xoGUyeUdSBTkExqZnu85dCxZp+zChSWkauQiEW411jzASKwCMgj1rrHrZA+WNi26mUHZYulZw4Vz4QVXJEZrVCzAdjdpckR6vgCbVHLJ+yEipNhUKgkqMRi8uh/swuB3Sue6kEwUtJ+MJNf74/DDF9n3GJaPZMDxzQU481a3K91ixMF+p6xxTmQUG3u2kmusTX3LXibtKb/Duv5hyYxqhkkZmAMjAY5X5u0FCkUps6I05jux7/FJD3mPrMzQyo4kAh0T2gtdZMi38bmod1JWQg7zL5blEVcxoddjhyYzHX4Mwjl6GfKFE3yFN+mCJ6x2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNAXQGbLGDV9VgYrH3X+u8IoseaTThTdiet2WcIj+S4=;
 b=kVRbFTBZIfTfR9R1jCNS0L63miR6qBWHSazXwQw4lJodXdQPTrCqlz8Gr0wkHsp6L94yq+I2Mw1NJDy9hezuq4yIXZ0XOWisrZLEzLle2cgnHVY6Q1hfjPHbhTAV4CLbjxvoLdWhJe2MSezGT4W4sLaW5JkHpjwm6HUwyu657taGoGyhJ4KE1ToXArWoSAypox3Qu+Y57XNJMSs2eUJtO8WSlj8iJ7LDEw41ccBmFPZfKHsv0fs3yARd9zLl+F+a8NjhBfX5qtYMrb/YqMWyR9F2gywi0JxqrOFkV/H0KbUdcvkyqE98LPmRCxinLWE/BWNwLsSwTvt9citiYUc/mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNAXQGbLGDV9VgYrH3X+u8IoseaTThTdiet2WcIj+S4=;
 b=QUvCHaasScH6gjrrE0uEUVS1+rad3s7C0ITwfB9EnoES0gNWVbY1+EjuACr6wpIJGkKnWGxsyApujgG9YKbVVhRH6EFxBmP2kAQEOvJwTg6zC4sBnQm0C2mtkZ8sr+KWXdbBYX+rwvz9jVQdjvHqdtpDyEu5tZNlRZuk3vcov14=
Received: from TY1PR01CA0183.jpnprd01.prod.outlook.com (2603:1096:403::13) by
 TYCPR01MB8706.jpnprd01.prod.outlook.com (2603:1096:400:188::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:12:52 +0000
Received: from TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:0:cafe::4d) by TY1PR01CA0183.outlook.office365.com
 (2603:1096:403::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005025.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:12:51 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id DAC1F300046A;
	Fri, 22 May 2026 21:12:47 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:30 +0200
Subject: [PATCH net-next v5 01/14] net: renesas: rswitch: improve port
 change mode functions
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-1-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=3593;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=3lkr+RE11y4eF24FLC88bvRLrDKItySrEf6pwuvS2n8=;
 b=+h4FIBJwxlkN4ZPZlcZC4q4lXNu/VxdV9FIr1kOhUcIO2LuD7Ky59XKpReVHX+0GbxVZpd2xP
 o19k/GxaHeLAfhAxqovSQXnYrmzf/LTPmcM4pd0hNlLnTvUGrgpvU4F
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005025:EE_|TYCPR01MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: a54f9bf8-cc1d-43e6-41bc-08deb7fb7221
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|6133799003|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ucXyTacBQuBMw2V1RKvlrEiadTLWWr9PBIXsj8k69yAR7CHYRAflNnM0SSrH9F7n5R5G6tkrRHuLW3axPZidnkPb/8Pvx5rsLxtNqBLid2rwUNDjL7Jza3BHf9taEWjywk5Z7r9KC3tng2I3axcTV8he5yTU99tqLcBL4+U483HangX0mDsUtcbYZhP8PegWIVPuoaNmwwFxSiD3qEH9QhOwnS+GUOB2VQoGTVv9Xs5QD34lhe5pIPGaBfs0abfcGFoDI2/qvEcrYwLCGrQuxZA54PcLPid+XED8BvpGrCiUkAGxdQJf+VT8qKJzUFdjc6tFEpmX3nwaI21+Z8Gvk9j+7m8MWxbeXIY7UtQk+npUYhXNFfHGybT877t4dhsUdnk5AcpTwMdGBf+P/YTmkbKT42KRCbA5n/hiPUoBKezj+6IKwOqhAaFtIirGZo58vkR6FsJjOAO3K3CAB0fFwLv3znvnqHvjQC4t1zMiJl0PFWufMuxNnD5c+h1dYrBQqbD7WiCv/6ZNPZVQrFK+A4GR9NuI6SKDHOYsGTz1QHgxHvAmwnMDqQpLd2ZkCJL+yIyCmyvVQyS11C+vdcGF9Gql6YvEdaBJ5mENg+qAtjw6ycM6LidavoPeMw9uvHlnjjRXpGIkhFNGpc6KKy9BKUcWfjNQClUvvO8CdHODXFdKSD1sCplRMKkj5+wTbaXol9+nL8G9PB1YanSbJsU/iUeXA+k7mQfw+a5qFIUdxRQ=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(6133799003)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	l8MprMwmYcpoOGCa3TM/PNgOfKUGMyqvDz+8eqCwK0m5d4Z03ty4IxCDDS7U0scg1C3OXK6gzgbxvXqDnVgT66JjJn2pik213XnZiQs3N5kGjRYBh+mCYs2iAvLSxozsWmWIe/pJlrmeSzxsDz32RrDkBRtO5SQoPh/IOTCcViZSqdxoOTxrx7p8SoaYIp0yEnASisFjhL023JUveWQ4eEJv3AWAjc1NYT3ImQHFUI4I/nkQeoUElW98ZoMneMNDJ/arbFSEtMLA8cpGcrFf1Un6/0d+nSJv3ReWSIigDgbXNd43XLo3PVJCCp2Sfxl73ocu4LPoaypfVI6xvjKUS8FQ+3Ru0OSiGLA80UnY6eW9PLxtCQwIi/oSOg089dXmnKwma+4Psxgni0PxPkJkOZU6OnFgwK1+Z5jEpIuL/7i2mYYIhy5XZ9yrjDhnXWLA
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:12:51.2139
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a54f9bf8-cc1d-43e6-41bc-08deb7fb7221
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8706
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32971-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 54A325B3C4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

For ETHA and GWCA ports every mode change from operational to
configuration and vice-versa requires to change the mode to
"disable" first. This was done by calling the function twice.
Let the change_mode functione take care of this requiered step
in a single call.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 43 +++++++++++++++--------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 6fe964816322..9b739594cc02 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -176,14 +176,21 @@ static int rswitch_gwca_change_mode(struct rswitch_private *priv,
 	if (!rswitch_agent_clock_is_enabled(priv->addr, priv->gwca.index))
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 1);
 
-	iowrite32(mode, priv->addr + GWMC);
+	iowrite32(GWMC_OPC_DISABLE, priv->addr + GWMC);
 
-	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
+	ret = rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, GWMC_OPC_DISABLE);
+	if (ret < 0)
+		return ret;
 
-	if (mode == GWMC_OPC_DISABLE)
+	if (mode == GWMC_OPC_DISABLE) {
 		rswitch_agent_clock_ctrl(priv->addr, priv->gwca.index, 0);
 
-	return ret;
+		return ret;
+	}
+
+	iowrite32(mode, priv->addr + GWMC);
+
+	return rswitch_reg_wait(priv->addr, GWMS, GWMS_OPS_MASK, mode);
 }
 
 static int rswitch_gwca_mcast_table_reset(struct rswitch_private *priv)
@@ -682,9 +689,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	unsigned int i;
 	int err;
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
 	if (err < 0)
 		return err;
@@ -717,9 +721,6 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 			return err;
 	}
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
 }
 
@@ -727,9 +728,6 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
 {
 	int err;
 
-	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_RESET);
 	if (err < 0)
 		return err;
@@ -1116,14 +1114,20 @@ static int rswitch_etha_change_mode(struct rswitch_etha *etha,
 	if (!rswitch_agent_clock_is_enabled(etha->coma_addr, etha->index))
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 1);
 
-	iowrite32(mode, etha->addr + EAMC);
-
-	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
+	iowrite32(EAMC_OPC_DISABLE, etha->addr + EAMC);
+	ret = rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, EAMC_OPC_DISABLE);
+	if (ret < 0)
+		return ret;
 
-	if (mode == EAMC_OPC_DISABLE)
+	if (mode == EAMC_OPC_DISABLE) {
 		rswitch_agent_clock_ctrl(etha->coma_addr, etha->index, 0);
 
-	return ret;
+		return ret;
+	}
+
+	iowrite32(mode, etha->addr + EAMC);
+
+	return rswitch_reg_wait(etha->addr, EAMS, EAMS_OPS_MASK, mode);
 }
 
 static void rswitch_etha_read_mac_address(struct rswitch_etha *etha)
@@ -1203,9 +1207,6 @@ static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
 {
 	int err;
 
-	err = rswitch_etha_change_mode(etha, EAMC_OPC_DISABLE);
-	if (err < 0)
-		return err;
 	err = rswitch_etha_change_mode(etha, EAMC_OPC_CONFIG);
 	if (err < 0)
 		return err;

-- 
2.43.0


