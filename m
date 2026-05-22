Return-Path: <linux-renesas-soc+bounces-32975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A5IDHJJEGpkVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:17:54 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF4B5B3BE4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:17:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B41A8309018A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003703815FA;
	Fri, 22 May 2026 12:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="HMRP8O4x"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010064.outbound.protection.outlook.com [52.101.228.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E72B37B402;
	Fri, 22 May 2026 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779451995; cv=fail; b=C77gC6gi/14bsxAaYFovEKpTPfwdinnaGPz3lyK55sTA53gdm4YjNuoSXGtHZXy7nrUxXCJUQ7XP1Djo0VPHbjKEXrWVdoJ664owymnffUnODXSktBf8ByrZ8fYrYg/ij4x8cocjqw+C+gLiyfKMsm36wY1vmVxSZ5hkIhAYV/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779451995; c=relaxed/simple;
	bh=JGGhbyQumfo3wcFix6PAjLF371iAqBT/aYF9KzKp2j0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DuWiIfuyKqT+ku0upQdaIrl/ejgUJjMDdS472CoQDNACLp9PtHsgFuacCtUwLBpnS/O5PZDK6Q3G3RXFkDPscaUSn6LV3pR4pulAUKpiGzlgUjj/5esNhevfZ17RLP7OEMqQ5GVRi5Kr6qHR+PWBXiIfNxWhRz1LenvE3JzCdTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=HMRP8O4x; arc=fail smtp.client-ip=52.101.228.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5bATu8ZSjkmufDZK5gZzZKYrkpft5LPV9ScuXOKXYbJWm8IDKdFWqdGBpHsz4+UxigxviXk7LOENza28Br1LWsdyM/k+CqF8+2UqQfkqQi1u9HGBgYUXqXB897qtvewi36HAG+hT7OrwEGHCg3zcEPcnM6D+ffil96V0WX+7MND5xvR5ouSiwoSGxl2jGIhFJqzURMzMmKjVyhn/Tgpl5tGtpx4HRX2xUXtgj0zuXzGe0e8RDtzRuTpvCR4yefMaMxADx/t4eQXbtQOOAu/D+F4P+CDcV9UPw0pUbMQ/BY6EKaRiqDkmNJdrYYFf8dl24iWggODB6Ee38bnmSmh/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxro00NmhE/dO79vz9YLIdM7vKkEUKSeJCD5b3lKSWA=;
 b=mUcS+yroWecBzC9k553eQKMTVqTAz+68xiay+9gFwDtJfS6jcL/CckM+4Ddl25ggDLCMTGG0ecmEJv9seyJjHjYmz5HUyH1UwqvilUjVQ0WRXTJ+CilnXqFbep0e9WWaTTnSOBbRJWYkCzDX+TAjjy07ENtOJgoEZ9D5qKbFEecYEz+tLK8sZKhWGpMscXQhKdJTK5cqe033x/3KhVJ60+I/b3wTGvaLw1v2Qi8XPnX0PgY4CWR5B2M6GwEhrrfA3rPZyCw3jeRiGmDMA/QLXWqDDxqD4wqaknkAvKx6sCWmCfo8Hp/IvntdDogbLpi3eIvVGz7+bMeuN6GTqkcYfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxro00NmhE/dO79vz9YLIdM7vKkEUKSeJCD5b3lKSWA=;
 b=HMRP8O4xrgCH7OmYFbYyN4MPoeC4y2+um7e4WosY6xngNJ8GahbLzRDiJBR0RmTbGEyzrAy4JGKew8zXACM+yrDy8W0hp9nzfjbDbRSC/m3DTdkYk6cjveB5HpktnzbE034cURyn4Vq8WkMpqvnBlt7j275VSgXiNnpSjKjLtj4=
Received: from TYCP301CA0079.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:7b::15)
 by OS3PR01MB8352.jpnprd01.prod.outlook.com (2603:1096:604:193::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:11 +0000
Received: from TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7b:cafe::9c) by TYCP301CA0079.outlook.office365.com
 (2603:1096:405:7b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005624.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:09 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 6FA853000466;
	Fri, 22 May 2026 21:13:06 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:35 +0200
Subject: [PATCH net-next v5 06/14] net: renesas: rswitch: add forwarding
 rules for gwca
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-6-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=1614;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=JGGhbyQumfo3wcFix6PAjLF371iAqBT/aYF9KzKp2j0=;
 b=XXTnDb+NWlXl0IbgKlu1W0fONRY1ju2L9NLCAKgbmpSnSJ2J1SJUQ3uHV+zGJz2kMgz9O3eWn
 A5NxAYD/MX0DTe9i7m4pQL0yxNyIhUNrfeJZl75wztjR/6m9Snpwv8W
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005624:EE_|OS3PR01MB8352:EE_
X-MS-Office365-Filtering-Correlation-Id: 106d7fcb-1475-4871-933c-08deb7fb7d35
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|11063799006|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ifDV1Ll5YoREkK4JB53zBpcVFj2UK9i93aJXYCYKNECdLjv/GggiWlt9KwPhCyPtEUIkV7woAFnCSuG9yqaZ9Ups1mzshzBuCvNnFeRluu7D1ultVdmOMgF/tC34r4aWdN0iXZSkeoUOU1WMuj4kU11jNr3Z+VNK0xFt94YeFpoPiRI+9n5K1lwBUcm3ztIG3V0x248CxhipDWGHPLfAzTV0P3CdUAZtYYxvkMJaXCry7kbycXsYjsFnJnnjTk4U63QgxrCNVFIblRKN58616Jkg7WhZyEbo1aVPTQx8SXfCQoAiPY0ZnT8D2W7ASixvgMzrZsQaAO8ihm9GLZS6vArDqpjkeYTgPCpJ97prTKA3aI7fztxTzemhz1u9bX2KegTRI+nGv+ZOiWbGNJvTxjVfIc1tXXUYl7P7jyHwAZ5cPveoctfUUK3Xln7JSErx/xJLO6Cp/BWKdHPq+0kXGaXYNNDCkBJpJ4GOWL2yTfnjxieCsMYnk6LFoCdOURlkVaSiCu5R6RgeTLFRC31yGhOraxBOoZxwaURmCVStp648Odpl2q6BJgbRer+5NHi0VMmqKWMMyb1LaAeEckIOlWq7vIIGn0d9J42L5oe/CFyLmCGDuC54Nx4Rj4mXutL26pm0jfMTrooyiZhRG7ImqXhLfDtCrlNCoL0wJjm78Dj7NNEpGiiPBMLrPBDyxWChv3kF8OKrVdH3XsZBSl4LeiOiPLRqdFbKHZFE9mvVP1Y=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(11063799006)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XZteY3I/BoU8NO93HHxXetBAKXjK7KAQrH3qwpUva6Vi4d6f8yLy58+anktqk5YZjvxgW4Ij8YCz3UPWNEJNBef/eRSj/IbWa7GeaoYb37EM+d3cLAkmLgzmw9L2FdLQJPQL8U5JS+E/U5SPpeG6JKljfCykmlHZr+WhdZ+kLHlEUOEUWK5FT3kWIn7KXnwxndj7kspdWIEH6ZnJydoYOVxRntSGRXZp0jgwyZ07cs36nrxRt+TO4CA8+Yrp0SlMZfkoGqUZEkDJOIpKiMcKZDwin6Ebx86f6T6ZI/obde7kNEETkNl1JAV+mEPDTUNx6vrylQJx8vTlWGyuM2DeGDXjKQG+geWb0lyG05sKWFbzLV3y+FTiXtDIAJ8KwCY/Bfkx+m6u67VmdZdnmbRLvb8jTvqeeN6ONRAvf0/RH/sESNNsxsXflA/YrX5pt7eX
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:09.8019
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 106d7fcb-1475-4871-933c-08deb7fb7d35
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005624.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8352
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32975-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCF4B5B3BE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add rules to forward packets from the Ethernet ports to the CPU port (GWCA)
using L2 forwarding instead of port forwarding.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 709524c8a5c4..3cc0ce8762f3 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -93,10 +93,32 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 	}
 }
 
+static void rswitch_update_l2_hw_forwarding_gwca(struct rswitch_private *priv)
+{
+	struct rswitch_device *rdev;
+	u32 fwpc0_set, fwpc0_clr, fwpc2_set, fwpc2_clr;
+
+	fwpc0_clr = FWPC0_MACSSA | FWPC0_MACDSA | FWPC0_MACRUDA;
+	fwpc0_set = fwpc0_clr;
+	fwpc2_clr = FIELD_PREP(FWPC2_LTWFW, BIT(AGENT_INDEX_GWCA));
+	fwpc2_set = fwpc2_clr;
+
+	(priv->offload_brdev) ? (fwpc0_clr = 0, fwpc2_set = 0)
+			      : (fwpc0_set = 0, fwpc2_clr = 0);
+
+	rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA), fwpc0_clr, fwpc0_set);
+
+	rswitch_for_all_ports(priv, rdev) {
+		rswitch_modify(priv->addr, FWPC2(rdev->etha->index),
+			       fwpc2_clr, fwpc2_set);
+	}
+}
+
 void rswitch_update_l2_offload(struct rswitch_private *priv)
 {
 	rswitch_update_l2_hw_learning(priv);
 	rswitch_update_l2_hw_forwarding(priv);
+	rswitch_update_l2_hw_forwarding_gwca(priv);
 }
 
 static void rswitch_update_offload_brdev(struct rswitch_private *priv)

-- 
2.43.0


