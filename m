Return-Path: <linux-renesas-soc+bounces-32981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GWqMpBKEGpvVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:22:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D25B3D52
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:22:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0BAF7306666E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 436E537F8DB;
	Fri, 22 May 2026 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lIPIGgBX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010025.outbound.protection.outlook.com [52.101.229.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F49437B01F;
	Fri, 22 May 2026 12:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452023; cv=fail; b=Eprav9earHGi9TgLw6q8mbAuKLxPi5/KXZBW/thsRg+VamkYFwHFTKnRBSd5M6Kcv/6HWyYRG8pN622dgIQ7LjD1Y4NBSfLuicUcAmoSYMwE/iOSqgsF7IKefldRGrtpau0Ybfq2fnu9IVP3nW/yLpZqsAQLepisVyKsbSq4/qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452023; c=relaxed/simple;
	bh=G1Hm9t+jdq3XHdrHsah7r40wTskO0HvE/olUpr9bBgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tST2SHPklxcC5jYgtVbHbUkEUVRtn3BbSKxDdK1T4S7hQ2a38SLh6FYDIpnFWXtoHmbvlDh1JELxSU8OVX2Hae0h4HjPLZAg1+lTN4oWkq/pqT/OIrDW1NxM3O/11V0CsL9K3n6eXDXI+LHAqO+1x2g/oZcUdaAPSXs/RPM1MYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lIPIGgBX; arc=fail smtp.client-ip=52.101.229.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9aE3M//7ehav/LvBOE15WvmAO1Ti5npzW8RKzzZG984UjesbnvNb7pXQ/Puzd5cSkQac2JpTXl3kXPE9IU0lslwXOFnPyOwQh/mE33v8fFc9+VjVUfV0ltKeXSRcpseYDfJ6EXjwCY+nxdmUcV7vlvQsezIakIuEhPLfLoJ0L3DUEslW7qjAvoeJeCV+V97Pkv38iXVVfX4U1g2qsJiyFam8np2BYbWtBehI5KeNiNOD20oE/aXMqYtGrsIrEB0NDQtYcjrQLJeHnnwFETZJT9vMnZbsJOgGmEQV6zluryhf4rt6fjq33OeIgfNpmNwu3EFCyDtSKRW9z8o52E6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUpLGnumPOlXImVumJ1PwX2As1VFa81VmcZngv7RaAc=;
 b=mOAdbEQNmPalI7Ba4cuT9OTNXbBuBojFAlTpIeNs9bQajPwHBFHHdKTYjZE+94UGffcmygdb/0n6GVY95Q3WGWopcB3VgKkMIQyfIKvL+jD4B8cxdHof16kqUvgBeIGuYs4llrS1KYrnAaaKDcHT9Bx8domi+wfkVMiuSB3LIWL9HSKKbpxFsxF5Sfkbe56QsOtBfeuIwt9t3aZ+JqNDE26g1nmjSSt5ecRYVFPh2ra2+TY/4Ei3bFxxLLe3LREKRRI/CXL0YAuTF2eZDqKVfM3NDHvudnYDbbYqDwPtK3Ba2VRmRCSFwsG8ZuIVWvYa2ERaDueqay4FCZ2FuTRneA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUpLGnumPOlXImVumJ1PwX2As1VFa81VmcZngv7RaAc=;
 b=lIPIGgBXkEsI2B1bF++8UJuVtI6Uh2wQOesFXU35cYXtbh0q4wa6TyzoBg+6M3ZBpeYeGg74UKBys3poOsfphpDtHf/82cjdOTzp0FWNV+6NzuU4212zXdKAHGp9XSvWaDyFNZlusKvF3181J8/s/u1HCMUYnGlqYX0j7CNwLz8=
Received: from TY1PR01CA0196.jpnprd01.prod.outlook.com (2603:1096:403::26) by
 TYYPR01MB7022.jpnprd01.prod.outlook.com (2603:1096:400:da::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Fri, 22 May 2026 12:13:37 +0000
Received: from TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:403:0:cafe::39) by TY1PR01CA0196.outlook.office365.com
 (2603:1096:403::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TYO1EPF00005025.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:35 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 70CBA300046A;
	Fri, 22 May 2026 21:13:32 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:42 +0200
Subject: [PATCH net-next v5 13/14] net: renesas: rswitch: add handler for
 FDB notification
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-13-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=9705;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=G1Hm9t+jdq3XHdrHsah7r40wTskO0HvE/olUpr9bBgU=;
 b=AU7fsgf4k+09Ivwdw8S8Gq4dzmXKQPX4OvBz6VV2TRINU+yfGEtX8YgHARi9A5yrXDP763Al0
 Y6K0zcA/yVFBZDv29WTA4blZVd4vAUXOprl5/Sq8u6P636lw28pJMql
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYO1EPF00005025:EE_|TYYPR01MB7022:EE_
X-MS-Office365-Filtering-Correlation-Id: a37c5eb9-9d77-4f6a-64b2-08deb7fb8cb2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700016|56012099003|18002099003|22082099003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	giS5uzilqQl6n80UHQwzZnovnUcOnzmLIcKddwUwWh65EbAuLjcVgS4BHBHmASrpgPY5eG1Df1uGviqQEhm94Yh2FiAdw1Pww+Wk4aWWN51qUI3CGFkdtesBHLGETT2YgSn2SbPEByOib/mrR7vToNiCgW6TMY739nv4ZBQZXb+zevhKdkx1w2t3EY9QMa7OVC2uPiF0g03qxNVv75Zz9eLYw7KT17EpNQuucno44VliE42CHF5iKpvAx25L6UoCfzVLbb4Z7PTFFy1KKQdd3aJNkyny/VcO+nXGkQjyuIipRZKf2G+lnS5dwc9ORugePsWyXSUl5aQwyhqSDv6dbfraJyVhOVrW/RjxdZaR4bvuafLks+KQvSIbQkYzKhSL5GZWxWKkTAzFm6VDRJ0pYHQqqF7Sjjax3fgmN+/SgV1nRIHcwj47qAZIzE/53ZeYrgnOjZ3GodQIQ7CHsHt+4kjScpdjxEzKy1pSChk1mi028GWdlmWd3bcEMxFfETU+S8OtITiwJI6dTfnf7/KL/EvxIrQeZ3XCikwEcd/VAMV6gBEgDOfkNLAq1Y3LeLtMWEiQsWbDUe1YeEULzwMuGLwvx8JZg/Wlo08StLTgOJK/VpvKVQeG+RIM/Tgru7tpRMuVoE5YMViw9j23LdYDc2ODH9SwfLud9WoV2MhMfErKE4/FgPPZFAyVHwg/HWcW9wvUrYqILWJbtdR0IpVAjwn3JbFS3kAx1EhoMmp5sVE=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fGqM7XcCuvRIrMb6tnQDx+6NRXujRhN3vHkepZvxfmwo2ipToqB73I2fm/2NsioCCXig0tTsrH3oo3pWd8ZOJQztLkoKa04XrfglVWlIS0KW+YepG4SDYJbwTTTfwGy8XlK0FE5WnGvXp0T6hodqi29+jDkSfskEwPOeOpfDxaxo9cZuaKA6DbY7Dsaz72p4MJkksrenHqVsCBp64ye64UfZWKkVzJnw6/lxPrn5t0nynLqDjD+smebi4GtyWaZR+hQgjXahNwYA1QuZuAE2FjQFEAuWlprfj3bVzhW0H6OQfeSSvBj14XUlil+httqaKlRuZPkGOy75DABqfsoFrY9b3qkyY5jC5Om5Z6yhhYZJXcWBcHtk/gpPvz9U20tEQx4KfU/v3aUxvAG52AlevQCw4ADLzjb9GlsYx4kmaMGve/K/zacqWg4FliRM18fl
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:35.7859
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a37c5eb9-9d77-4f6a-64b2-08deb7fb8cb2
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TYO1EPF00005025.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7022
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32981-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E9D25B3D52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC address
to the GWCA and adds a static rule to the MAC table.
The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  12 ++
 drivers/net/ethernet/renesas/rswitch_l2.c   | 200 ++++++++++++++++++++++++----
 drivers/net/ethernet/renesas/rswitch_main.c |   2 +
 3 files changed, 191 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 9777966ebe0e..202f877a9cc8 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1173,6 +1173,7 @@ struct rswitch_device {
 	struct phy *serdes;
 
 	struct net_device *brdev;	/* master bridge device */
+
 	unsigned int learning_requested : 1;
 	unsigned int learning_offloaded : 1;
 	unsigned int forwarding_requested : 1;
@@ -1219,6 +1220,17 @@ struct rswitch_private {
 
 	enum hwtstamp_tx_types tstamp_tx_ctrl;
 	enum hwtstamp_rx_filters tstamp_rx_ctrl;
+
+	struct rswitch_switchdev_event_work *switchdev_work;
+};
+
+struct rswitch_switchdev_event_work {
+	struct work_struct work;
+	netdevice_tracker dev_tracker;
+	struct switchdev_notifier_fdb_info fdb_info;
+	struct net_device *ndev;
+	struct rswitch_private *priv;
+	unsigned long event;
 };
 
 bool is_rdev(const struct net_device *ndev);
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index d2deb7cb7634..4d0646283f88 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -23,7 +23,8 @@ static bool rdev_for_l2_offload(struct rswitch_device *rdev)
 static void rswitch_change_l2_hw_offloading(struct rswitch_device *rdev,
 					    bool start, bool learning)
 {
-	u32 bits = learning ? FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA : FWPC0_MACDSA;
+	u32 bits = learning ? FWPC0_MACSSA | FWPC0_MACHLA | FWPC0_MACHMA | FWPC0_MACRUDA :
+			      FWPC0_MACDSA;
 	u32 clear = start ? 0 : bits;
 	u32 set = start ? bits : 0;
 
@@ -82,8 +83,9 @@ static void rswitch_update_l2_hw_forwarding(struct rswitch_private *priv)
 			 *
 			 * Do not allow L2 forwarding to self for hw port.
 			 */
-			iowrite32(FIELD_PREP(FWPC2_LTWFW, fwd_mask | BIT(rdev->port)),
-				  priv->addr + FWPC2(rdev->port));
+			rswitch_modify(priv->addr, FWPC2(rdev->port),
+				       FIELD_PREP(FWPC2_LTWFW, ~(fwd_mask | BIT(rdev->port))),
+				       0);
 		}
 
 		if (new_forwarding_offload && !rdev->forwarding_offloaded)
@@ -188,7 +190,8 @@ static int rswitch_port_update_stp_state(struct net_device *ndev, u8 stp_state)
 }
 
 static int rswitch_netdevice_event(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
+				   unsigned long event,
+				   void *ptr)
 {
 	struct net_device *ndev = netdev_notifier_info_to_dev(ptr);
 	struct netdev_notifier_changeupper_info *info;
@@ -241,25 +244,6 @@ static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
 	}
 }
 
-static int rswitch_switchdev_event(struct notifier_block *nb,
-				   unsigned long event, void *ptr)
-{
-	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
-	int ret;
-
-	if (event == SWITCHDEV_PORT_ATTR_SET) {
-		ret = switchdev_handle_port_attr_set(ndev, ptr,
-						     is_rdev,
-						     rswitch_port_attr_set);
-		return notifier_from_errno(ret);
-	}
-
-	if (!is_rdev(ndev))
-		return NOTIFY_DONE;
-
-	return notifier_from_errno(-EOPNOTSUPP);
-}
-
 static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
 					    unsigned long event, void *ptr)
 {
@@ -285,6 +269,176 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
 	return notifier_from_errno(ret);
 }
 
+static int rswitch_gwca_write_mac_address(struct rswitch_private *priv, const u8 *mac)
+{
+	int err;
+
+	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
+	if (err < 0)
+		return err;
+
+	iowrite32((mac[0] << 8) | mac[1], priv->addr + GWMAC0);
+	iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
+		  priv->addr + GWMAC1);
+
+	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
+}
+
+static int rswitch_add_addr_to_mactable(struct rswitch_private *priv, const u8 *mac)
+{
+	u32 index = priv->gwca.l2_shared_rx_queue->index;
+	int err;
+
+	rswitch_modify(priv->addr, FWMACTL0, FWMACTL0_ED, 0);
+	iowrite32((mac[0] << 8) | mac[1], priv->addr + FWMACTL1);
+	iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
+		  priv->addr + FWMACTL2);
+	iowrite32(FWMACTL3_DSLV | FWMACTL3_SSLV,
+		  priv->addr + FWMACTL3);
+	iowrite32(FIELD_PREP(FWMACTL4_CSDL, index),
+		  priv->addr + FWMACTL4(GWCA_INDEX));
+	iowrite32(FIELD_PREP(FWMACTL5_DV, BIT(AGENT_INDEX_GWCA)),
+		  priv->addr + FWMACTL5);
+
+	err = rswitch_reg_wait(priv->addr, FWMACTLR, FWMACTLR_L, 0);
+	if (err < 0)
+		return err;
+
+	if (ioread32(priv->addr + FWMACTLR))
+		return NOTIFY_BAD;
+
+	return NOTIFY_DONE;
+}
+
+static int rswitch_del_addr_from_mactable(struct rswitch_private *priv, const u8 *mac)
+{
+	int err;
+
+	rswitch_modify(priv->addr, FWMACTL0, 0, FWMACTL0_ED);
+	iowrite32((mac[0] << 8) | mac[1], priv->addr + FWMACTL1);
+	iowrite32((mac[2] << 24) | (mac[3] << 16) | (mac[4] << 8) | mac[5],
+		  priv->addr + FWMACTL2);
+	iowrite32(FWMACTL3_DSLV | FWMACTL3_SSLV,
+		  priv->addr + FWMACTL3);
+	iowrite32(FIELD_PREP(FWMACTL4_CSDL, BIT(0)),
+		  priv->addr + FWMACTL4(GWCA_INDEX));
+	iowrite32(FIELD_PREP(FWMACTL5_DV, BIT(AGENT_INDEX_GWCA)),
+		  priv->addr + FWMACTL5);
+
+	err = rswitch_reg_wait(priv->addr, FWMACTLR, FWMACTLR_L, 0);
+	if (err < 0)
+		return err;
+
+	err = ioread32(priv->addr + FWMACTLR);
+	if (err)
+		return NOTIFY_BAD;
+
+	return NOTIFY_DONE;
+}
+
+static void rswitch_switchdev_bridge_fdb_event_work(struct work_struct *work)
+{
+	struct rswitch_switchdev_event_work *switchdev_work;
+	const unsigned char addr[] = {0, 0, 0, 0, 0, 0};
+	struct rswitch_device *rdev;
+	struct net_device *ndev;
+
+	switchdev_work = container_of(work, struct rswitch_switchdev_event_work, work);
+	ndev = switchdev_work->ndev;
+
+	rtnl_lock();
+
+	/* Unfortunately all net_device members point to br0, there is no simple way to check
+	 * if the event was triggered by a port device setting.
+	 */
+	rswitch_for_all_ports(switchdev_work->priv, rdev) {
+		if (ether_addr_equal(rdev->ndev->dev_addr, switchdev_work->fdb_info.addr))
+			goto out;
+	}
+
+	/* Handle only bridge device */
+	if (is_rdev(ndev) || !netif_is_bridge_master(ndev))
+		goto out;
+
+	switch (switchdev_work->event) {
+	case SWITCHDEV_FDB_ADD_TO_DEVICE:
+		rswitch_gwca_write_mac_address(switchdev_work->priv, switchdev_work->fdb_info.addr);
+		rswitch_add_addr_to_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
+		break;
+	case SWITCHDEV_FDB_DEL_TO_DEVICE:
+		rswitch_del_addr_from_mactable(switchdev_work->priv, switchdev_work->fdb_info.addr);
+		rswitch_gwca_write_mac_address(switchdev_work->priv, addr);
+		break;
+	default:
+		break;
+	}
+
+out:
+	rtnl_unlock();
+
+	kfree(switchdev_work->fdb_info.addr);
+	rdev = netdev_priv(ndev);
+	netdev_put(ndev, &switchdev_work->dev_tracker);
+	kfree(switchdev_work);
+}
+
+/* called under rcu_read_lock() */
+static int rswitch_switchdev_event(struct notifier_block *nb,
+				   unsigned long event,
+				   void *ptr)
+{
+	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
+	struct rswitch_switchdev_event_work *switchdev_work;
+	struct switchdev_notifier_fdb_info *fdb_info;
+	struct switchdev_notifier_info *info = ptr;
+	struct rswitch_private *priv;
+	struct rswitch_device *rdev;
+
+	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_nb);
+
+	switch (event) {
+	case SWITCHDEV_FDB_ADD_TO_DEVICE:
+		fallthrough;
+	case SWITCHDEV_FDB_DEL_TO_DEVICE:
+		switchdev_work = kzalloc(sizeof(*switchdev_work), GFP_ATOMIC);
+		if (!switchdev_work)
+			return NOTIFY_BAD;
+
+		switchdev_work->ndev = info->dev;
+		switchdev_work->priv = priv;
+		switchdev_work->event = event;
+		rdev = netdev_priv(switchdev_work->ndev);
+
+		fdb_info = container_of(info,
+					struct switchdev_notifier_fdb_info,
+					info);
+
+		INIT_WORK(&switchdev_work->work, rswitch_switchdev_bridge_fdb_event_work);
+
+		memcpy(&switchdev_work->fdb_info, ptr, sizeof(switchdev_work->fdb_info));
+
+		switchdev_work->fdb_info.addr = kzalloc(ETH_ALEN, GFP_ATOMIC);
+		if (!switchdev_work->fdb_info.addr)
+			goto err_addr_alloc;
+
+		priv->switchdev_work = switchdev_work;
+
+		ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
+				fdb_info->addr);
+		netdev_hold(ndev, &switchdev_work->dev_tracker, GFP_ATOMIC);
+		queue_work(system_long_wq, &switchdev_work->work);
+
+		break;
+	}
+
+	return NOTIFY_DONE;
+
+err_addr_alloc:
+	kfree(switchdev_work);
+
+	return NOTIFY_BAD;
+}
+
 int rswitch_register_notifiers(struct rswitch_private *priv)
 {
 	int err;
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index cfe7bfe6546b..6fa37533feff 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2262,6 +2262,8 @@ static void rswitch_deinit(struct rswitch_private *priv)
 	rswitch_gwca_ts_queue_free(priv);
 	rswitch_gwca_linkfix_free(priv);
 
+	cancel_work_sync(&priv->switchdev_work->work);
+
 	rswitch_clock_disable(priv);
 }
 

-- 
2.43.0


