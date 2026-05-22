Return-Path: <linux-renesas-soc+bounces-32979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNMOIktKEGpvVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32979-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:21:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BBC5B3D07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF7643059E76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F2937F01C;
	Fri, 22 May 2026 12:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="YiqzH4fT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0437B01A;
	Fri, 22 May 2026 12:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452016; cv=fail; b=ABnHUqTfMGVH7Dc5gL+l9x/VQMe4jLtq4auv+CL4+dr6Q/GPohMSWlLA85Mq1PJi6aaBXq0n21dHzNoY+NgGfv5FFe4L+5ZD/efDJ4vXcXtM4cY12o42JZCrvhjhhquBnObnqmRL1wuoe1daeI8g1EU/ilY840NgArb5tUqp+NQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452016; c=relaxed/simple;
	bh=tMmQJm0vtdZRJgpvsM1oW0YiuTdWB/Gfc14iGHnzoFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fQ1qznUbSxDrEQ1Ti6LZrpk5U1usaOviXt/1agIdBhRm0vePONkLqAZuLc+bKGkGgqFL9NvGAujarM8wy0rwbWkRCqkRmam12xlPKiXsUKT3znwdNYB6oSYPF9kKWxWibf56rIW0H4bR1CFIKJpzdJaavcwo3FeEkIoDn/BVDYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=YiqzH4fT; arc=fail smtp.client-ip=52.101.229.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEUsXjLXkAoUrjdCz9D9Sn4suk9IeeAXX36BZZQ7QGMNH7tO+qXtDPkHyZGkQ5NsnrKWGH6ph3Cpd0qev7veLnEz64sN4/MHe6v8XK3mnsvcaexgvJqClpjRJzBtrK2QcTuCyg76C9guUTQlf1R5hIWQWLmGUOdaEcu4hwcRQcDw7plfNnqUeMC8vRtodTgI212JRuT42yy2oLIXr/LNY3644ckt4VwZYcqj2ewtPzw//w5fK21r2dfwUfG37hrkR4oLry3JdSsXH0FVL/tqHMGgcXZvRbcSdAG/tstdajiD3uf9l2ZGLb5tJOdHM6hsIbxhbRIxZ1tWkTrWuBIbMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpNUD6eKPLGagvN0agwhcTnekrXcd0mJ50gVI38B5vE=;
 b=EjNySOSYYbsGOLBMcDEOCJoDM497c3ilGVyhc9zJRw6udkQ/67Jk15RWHceJCJ+OvxWBh6eVsXkiGUdJuKLAzOgrP/5mmsI1F3mpSVCYswKcerOYnQlAIfLI60L8jk0jOPZYPMa+RUsl8a0i0nuP4dTa1/+LZkk6ztIMjiTLXCSEhPjfq3ggOwoa9IAWuu7Oc3Bh+C8kSYfCsJjcjh/QVufiYvzep60fMidus7KI9mf5AJkCKY020CQQFLQ8S7iDNV8tRQrkI1ANaoIVtWAM9XPPaZwtdA/vuIwaHmZ+snOuTGKI2US/orwhmIUedTPAFSbCmZl/QbKw/EcUYXTtXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpNUD6eKPLGagvN0agwhcTnekrXcd0mJ50gVI38B5vE=;
 b=YiqzH4fTEKee36nX2Fp537qY5sbn5QzIQG/UVsSjSlf8/zcxAYeTvI0WL8uNiM8K2ja1THMTwAWUBbCgxHlP8LN3/o3MrLOYESWM3kxBvM21g49XI3CMDOKHTEarqF1Xb3ZKblwUNksz2gIAc+9mZD90jahvFCCj96zyaa7DFdY=
Received: from TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c5::6)
 by TYWPR01MB9855.jpnprd01.prod.outlook.com (2603:1096:400:236::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:29 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5:cafe::44) by TYCP286CA0215.outlook.office365.com
 (2603:1096:400:3c5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:28 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 085F6300046A;
	Fri, 22 May 2026 21:13:24 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:40 +0200
Subject: [PATCH net-next v5 11/14] net: renesas: rswitch: clean up is_rdev
 rswitch_device checking
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-11-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=2806;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=tMmQJm0vtdZRJgpvsM1oW0YiuTdWB/Gfc14iGHnzoFE=;
 b=8I/JlFso7y+4vPRz6dJDPemebqhDLhwLr30kF0M4GX8vlUpjFs2qwknG77HABbl/B44wJ/WZ1
 yec2GX79rQjDGTsLGsC9/qcZd3SXduB+UWXRnreLjSMxoeSuZ3eX4d4
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|TYWPR01MB9855:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d1e598-38de-456a-c40a-08deb7fb8849
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|7416014|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lztQZKIb+LupDKfJLaHRWXV6iJyumFcD3Jq00pNThMQyRRrncV77Qvd0uWoGQdZfK7ty2oU/jorEZrkV+K+62SHCCi06zYXZWLCCVlQVxS8To3zvp21kJkKlc4qLJC3iMbddsK24Xh9B5zx+515bsjUGQphHxs6qAdd5WLfmGcF+t5aNaeZSJgyyjSq1YY7z12b0sS7C+BHS0er7OPdlchhMrLjAJGE7/yuGkR+f3LM1J1vv1JJ92kUKNM8kG1sn8NH5tdyskHDU/CF98cgn4CkM3OfYGMOCNQsQzKpIamVrrte06CL5k4yw5V0ehBMxPosEJ+c9RwwDna3GGKdXHJYab1DJrx4sVKsefoMxszrGWrry6FpG1t/i0xaBYAnx5HpW6+DrqmCM5rrbTbkF8hiJun5eHDoZHpRX5kSfHUh2Zb1ikOABpTDVpWPUwi0NbDKsCb1wcwOvBsutWliu9wlxYtir9FANKsbE9G3ixvQXh30eIp+DaKTQo79B6N/fhui/EeUuavoVgn34VCA9VHz/EZY5+zZ+r4cT8yC3ZRIDmd/PPP8AjK9GZnrWXwdqBwajzQZH9npUUxiRPyppRn1mS3audBYSRdEPeMhw2TeKhKABIdcczCoQzaP0A1XcQuN+FrieKfMbnHYRObbBETmV3k/iB5ZTIo4GD8AspPmF9iSVMd50cs1sn/P7nIJEVj9bWbE47rOfIBCCZUvBxlIBccn2aFW7GnDg3VHcQpA=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(7416014)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+AZ4y1+lUsdYgK04PAz+eRB/itbL6DMCHEcz55h3Vs+qRtFy1DX4pou7lPcampBlkQTlfDOgo94KqfJekLoDpYQqDFr5nFaeKDpTWxMiZnWQWR4sOdVGSEXtX5lQmumvkE+IqbgDQjCmPxRmrijMQXlAf4fXuwf4vRXE7xb65NLfYsE+KKgLDwOAjuAeBbbKB2QMJ7wOL0byyR2xO1zHSE0xFuMSxC3iH2yB+qxUgJd4K1uPzAAa1ZagerJ4KmW0k0J/tqoJffh4XC1/1EPtnhB285yDeFcTex4w8loZHb8rP847RlZcQuN5OP3xtOuXSYP5UylK5ZifZqxFUNsSu+oyrttMpboV0TrwZD9q3Q2ZBXlIhd63a8z4vkLSzGgVbyIU6KpvDNqVOyNaEOHlrmpAeqK0PuDQMPttbvySseYIktksu03TPcT2rwXG/8p4
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:28.3882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d1e598-38de-456a-c40a-08deb7fb8849
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9855
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32979-lists,linux-renesas-soc=lfdr.de];
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
X-Rspamd-Queue-Id: 66BBC5B3D07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add null pointer checking for ndev and remove unnecessary
rswitch_port_check() wrapper function.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c   | 19 +++++++------------
 drivers/net/ethernet/renesas/rswitch_main.c |  2 +-
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 3cc0ce8762f3..c76fc8121ef0 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -158,11 +158,6 @@ static void rswitch_update_offload_brdev(struct rswitch_private *priv)
 	rswitch_update_l2_offload(priv);
 }
 
-static bool rswitch_port_check(const struct net_device *ndev)
-{
-	return is_rdev(ndev);
-}
-
 static void rswitch_port_update_brdev(struct net_device *ndev,
 				      struct net_device *brdev)
 {
@@ -199,7 +194,7 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
 	struct netdev_notifier_changeupper_info *info;
 	struct net_device *brdev;
 
-	if (!rswitch_port_check(ndev))
+	if (!is_rdev(ndev))
 		return NOTIFY_DONE;
 	if (event != NETDEV_CHANGEUPPER)
 		return NOTIFY_DONE;
@@ -254,12 +249,12 @@ static int rswitch_switchdev_event(struct notifier_block *nb,
 
 	if (event == SWITCHDEV_PORT_ATTR_SET) {
 		ret = switchdev_handle_port_attr_set(ndev, ptr,
-						     rswitch_port_check,
+						     is_rdev,
 						     rswitch_port_attr_set);
 		return notifier_from_errno(ret);
 	}
 
-	if (!rswitch_port_check(ndev))
+	if (!is_rdev(ndev))
 		return NOTIFY_DONE;
 
 	return notifier_from_errno(-EOPNOTSUPP);
@@ -278,13 +273,13 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
 		return -EOPNOTSUPP;
 	case SWITCHDEV_PORT_ATTR_SET:
 		ret = switchdev_handle_port_attr_set(ndev, ptr,
-						     rswitch_port_check,
+						     is_rdev,
 						     rswitch_port_attr_set);
 		break;
 	default:
-		if (!rswitch_port_check(ndev))
-			return NOTIFY_DONE;
-		ret = -EOPNOTSUPP;
+		if (is_rdev(ndev))
+			return -EOPNOTSUPP;
+		return NOTIFY_DONE;
 	}
 
 	return notifier_from_errno(ret);
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index 13e59d2d0828..da400020a8f1 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2005,7 +2005,7 @@ static const struct net_device_ops rswitch_netdev_ops = {
 
 bool is_rdev(const struct net_device *ndev)
 {
-	return (ndev->netdev_ops == &rswitch_netdev_ops);
+	return ndev && (ndev->netdev_ops == &rswitch_netdev_ops);
 }
 
 static int rswitch_get_ts_info(struct net_device *ndev, struct kernel_ethtool_ts_info *info)

-- 
2.43.0


