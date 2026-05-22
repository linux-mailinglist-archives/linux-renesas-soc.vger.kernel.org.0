Return-Path: <linux-renesas-soc+bounces-32978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNefA0tOEGq5VwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:38:35 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D505B43D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AED2C30B32B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BECC383C74;
	Fri, 22 May 2026 12:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BPoLg4dm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011063.outbound.protection.outlook.com [52.101.125.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0D37DE8B;
	Fri, 22 May 2026 12:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452008; cv=fail; b=Hivgk2oGySH38D/EwtQ+MdwRqwi6/ouQLW8Q4Dicbq/f88M8DLGSCgLVGDyoRr5iEO+8le15nD/PO9KVXaYGgMjjdPZE49srd4+kiZBeR1HWj4fLrk/3ClVT+t2SWur2BrZ+oTVaCvtmhsIcbr3iaDCqh57H5flq7PeI2nJxe0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452008; c=relaxed/simple;
	bh=hLnTKpOgthWQzvXF+Q+ys3eDp3ALKqhCOmR4k0TQ/qg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mer81iyn6OwjZsv70CQV8eE3+aQLVq0G5VhIc6p7s5HZgfCZ7cKu+slgFIi/Is2s++E9U0bq0iL/FM6ijbsd+cjRxnwbQBGWsQihiAjq4OAf5UqBanRlkuTDFZqScuHxgfU8fQIxNMLAkNNJiaOhu5QB3Lg2rO2BE0xeCkorkXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BPoLg4dm; arc=fail smtp.client-ip=52.101.125.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LXSAHi9EOAgYqfABi5GiTq1q7rrAKTjHJHYdx9qYLOLJSF+pFD7Ur4uxoizrNzKjDLAFCWeFApkdn5tPHsr8xFLe1bW55P+tqDYWCr6mcdX8HlqbdVmau9lVNraGiAOc4OHPcUJCLnZ3D/FsPv+kraoQZgrnZQpaN6kmr3HDEjnw2ipvC/YxeKlQYlEm8uBCPTDuO0JjuYQhwH8S+NaYkXWwsDez7qFUN0DIxqwhRVpEg8YIkr5ktdcgop9HJ7X1CiXy9dHKJRvpGP/fWtmXtky7Ke9nL1pn4XYRctk73+owQ0J1ag2tuZVLMBWl0yqMXZc4udhUcolnbDGKsowFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ddRc+CipmaN7G6yuATUOz2mVH+Zg5zoCZ/ShBc+4WI=;
 b=TAM+4QCVVX7tBgGzA03Snasu9FYGTZvmDwJjAjMbghrw9GFBw41ZLS42C80IWsHY3a4WSVmmBiou/5A/Ssc34QyIfUW92umRjioPwzki/PaRHPWZoXxB48LgE37T+6sOLfQNZBpOw7xKXfpe28JXDfNSJgSwHzn5EQqEUyqZ3WNLe6hSnx6KNNQ3uL4Fr1bTwJfOQEmHKRZSzYPvIoV47d6CMwq+1iEJ8vwelJpHFyOxPHB1356dOy2f3Faqwws8gLbw/WK7+yGjVNHP6cN3byPRf6NoKO5PvcjppRnmdy++EpwcYE6Splkhi200qrKqTyAz8T+iP1xvMOHv4wYEWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ddRc+CipmaN7G6yuATUOz2mVH+Zg5zoCZ/ShBc+4WI=;
 b=BPoLg4dm7/FTtI1t+qXjyCIurma3GbNYAumUNdvRFjSnNC7YV3O+knkRK/iw7iDxYjGL3PfaoMV7KGAFANDTMBcLmEhCVO/a94xK3euP/MJXSBD2GQXEz9zZWLwl5jOG9JhKNHAOOI1JonHeseWOoodZI1AkF6ZbDthZ8Qex//A=
Received: from TYCP286CA0333.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:38e::19)
 by TY7PR01MB13889.jpnprd01.prod.outlook.com (2603:1096:405:1fd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:22 +0000
Received: from TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e:cafe::6f) by TYCP286CA0333.outlook.office365.com
 (2603:1096:400:38e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005020.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:20 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 919673000459;
	Fri, 22 May 2026 21:13:17 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:38 +0200
Subject: [PATCH net-next v5 09/14] net: renesas: rswitch: add basic vlan
 init to rswitch_fwd_init
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-9-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=1893;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=hLnTKpOgthWQzvXF+Q+ys3eDp3ALKqhCOmR4k0TQ/qg=;
 b=WWqvK9aWOH3BYFl3zZwdqijBuqxA+QBMLddYxmCKCZFUc6FKzYfuxfTgk7L1ZZtpsGdmn1oX8
 2/3liImaVmCCVj4kz8y6jQsHfD2//ySI6gVLIVV0por7ifsPICyFGdz
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005020:EE_|TY7PR01MB13889:EE_
X-MS-Office365-Filtering-Correlation-Id: 5456dadd-3aae-4adf-d378-08deb7fb83d6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|1800799024|6133799003|11063799006|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0IrxeXkG+OFXnvRbPiM7xgLNKisXbU/zqzAxWYM0ZTA3FL2c3e3hDvQWTz87hmzZ5Nc0Q+Qptih0w7ZBLGrDFq6J0ZDCo/gTtT711RSCw6BNjYt7MPJdUbxSoppVZNFSCs9uUuAPbliVyPkN0xgJuibMZ5illZdvOnbI/Iza3aNPDaJ7UotE4TNXxIp6UTBsiueZHxgNMmsJZAKhj6OPDFZJxImcxtpqjx6D+dpUt9mT5PRKATeyZs7RiVUPwxdsVZ4UliZBSC5c7C1pTIn3IjY3lL0OZgzOjaJwVNHIiliIWRM2OTsH9kr2W/y8oXuPX64WfU3PiLqu6qx0rruezE0CLp3FdEtN53+v0ddsDsqClYz9gKmq7SvotE9Me0IslIJKjvDcQ5p9kmJKcjVBz2WDEq7N9ERBd2e61uSgHkg3ndfZ/RayqI+RJmUY4CSHbsZOiBHwhMsC33nG/LkR4tjwqbrLUfyF6DLgEWee+Mctn6ZXmZYgWb8ySKKxx+eRRS4v9AHSuHb7f6/Bmi9YuWZst8VazKj7mEygfD9dBz2gCaZ8AwKUzaXt3cuS/xicqoW+6dZ1/jk8ngQAaKLDfU0MvWwCy3q76N39aBjhb0sw8+25LWuzXKMo6xx5wJO4GMi2FwUEIGlMi7srf30QG6jAvzZRP3tw3GoD7cB1a46KdIRRejAaYXwen3CG1XeS3T56hf5Tx4U/w0e2z8OPWuIQKRvHVchM+A26Kgky6wE=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(1800799024)(6133799003)(11063799006)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2CPbqqobQY/LUQKf0c9R+zhiUwoCCW/3FPGYEnA1BBx8rmO1MdJfI43MrTLDov2avxN/oLe7o3Eg6sOrksRbROpimJdTnQT2wjwU7AkyzViezkJhXQnC/O0OcNR4c667BcGVWwZNECwn0+yRWjnt0ggGh6eyQMBVJbbmMBLXaKFLpdasygzz44XwdDFBxI5eoRElUGxJA8RYyDMZo8oDU67mMCgvlCeappYEbwlrNVT9hsJwXuRgBCaW12Ky6ExMIoCUr4Q3JfmrRVL1Y6Ezw+OJ5pQkdO8CZ4b2xrNbadhcNqPZ1kkUCJgAjZgEhLFdI3Js/zvHH+GGVfDzr3K63dufYTD48h2VBeDDOG44+3pp9faLxCI1MgbN2xOSPH9rGLS6d33cH9CYk8QHzFAd9gXfUrlH+74dmp8GtSm6VfDWfpeb4Xso6K7ykIwWO/+d
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:20.9250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5456dadd-3aae-4adf-d378-08deb7fb83d6
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005020.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13889
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32978-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11D505B43D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add basic vlan related register initialization.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_main.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index fc80c65c2131..a445d9a8505d 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -120,6 +120,7 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 	u32 all_ports_mask = GENMASK(RSWITCH_NUM_AGENTS - 1, 0);
 	unsigned int i;
 	u32 reg_val;
+	int ret;
 
 	/* Start with empty configuration */
 	for (i = 0; i < RSWITCH_NUM_AGENTS; i++) {
@@ -154,17 +155,27 @@ static int rswitch_fwd_init(struct rswitch_private *priv)
 	}
 
 	/* For GWCA port, allow direct descriptor forwarding */
-	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), FWPC1_DDE, FWPC1_DDE);
+	rswitch_modify(priv->addr, FWPC1(priv->gwca.index), 0, FWPC1_DDE);
 
 	/* Initialize hardware L2 forwarding table */
 
-	/* Allow entire table to be used for "unsecure" entries */
+	/* Allow entire table to be used for "un-secure" entries */
 	rswitch_modify(priv->addr, FWMACHEC, 0, FWMACHEC_MACHMUE_MASK);
 
 	/* Initialize MAC hash table */
 	iowrite32(FWMACTIM_MACTIOG, priv->addr + FWMACTIM);
 
-	return rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+	ret = rswitch_reg_wait(priv->addr, FWMACTIM, FWMACTIM_MACTIOG, 0);
+	if (ret)
+		return ret;
+
+	/* Allow entire VLAN table to be used for "un-secure" entries */
+	iowrite32(VLANTMUE, priv->addr + FWVLANTEC);
+
+	/* Initialize VLAN table */
+	iowrite32(VLANTIOG, priv->addr + FWVLANTIM);
+
+	return rswitch_reg_wait(priv->addr, FWVLANTIM, VLANTIOG, 0);
 }
 
 /* Gateway CPU agent block (GWCA) */

-- 
2.43.0


