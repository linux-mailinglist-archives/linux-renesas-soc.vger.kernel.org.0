Return-Path: <linux-renesas-soc+bounces-32983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOB6NNdKEGqmVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:23:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC535B3DB7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C953530688E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718663815CF;
	Fri, 22 May 2026 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SSnFS3ZN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010002.outbound.protection.outlook.com [52.101.229.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50331393DDC;
	Fri, 22 May 2026 12:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452029; cv=fail; b=tH8zqQ7wLGro7NUsf9WCI+Oq9b427rbiqijGnICWA4YyyKa3I1vmSrmr9a+pTwjOBDlQ4qPZHrDpOJ/dAx8I/15Ae8krlTCgEHaNwy38dlSVu1EY1vXIIp0uRwstmbApMdfxOyoD1CIhv9/FDDeFKDDP0s/7ZJ2E91aVvI1wf14=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452029; c=relaxed/simple;
	bh=i6HjGPzlP/nQ0Z6YFOlnj1YnHebJC2s2xjpnKWrc/1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYvT4pcOGrXQZN/9QbHXYHDrJBL7/389pBLxfmr6xjzndXgfXbSWua5HZlWbvOQRKDsodrMg8pCpdxUZlUE/d+9hPm34/2kjl/TMBp8zPmRTeXxjge77GJx9YYP0KCuCc34EWk5/bzeIpWZYUnnMDyTcRN4CW2tH1rH1nJ8DTWE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SSnFS3ZN; arc=fail smtp.client-ip=52.101.229.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITFL1DCWNbwPCZSdm4r9Fs32t6gvOPeTIj7TMcYTYgf/E5DURbqDmqBcIA2gF5QRTgzyZmqeWD3H+8oSbSJTtblcKx7+zc5NjHf/m2BJx+aoEA2Yz/QE5P9ifdxOhP+ow+Yi/Cf8MD4WlhAPIc+JnRP5RlGR4m99PHCmlLomWUvRqfMxyE1VqjrUDy0rVIZE+P7hmo0f+g+BWiLvHTwnEqK9ZIUSddiRT1Niz8bw0idJECGy6zbaaKGE6gaV9eiObz0iBrZMaF5ZFfZ+twNwgwaWUrP8wgGoSaUyO/bmt7Dn7i9JlK4hboJv6r/P2KM4jzWQ8UEDyR2irEI8BMtjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LK+h+/v5CiJWF+E9Jlgyqd3Sb+H0IeW+VkC/kfVCBnk=;
 b=Po1bDoCv79kCGp7y1EQ+UtBsHjBjJHQrFpPeg3/MRYVkjufcnsudPY356XIx1CbHRtsOOyTO1r3kAVwzglu4cx0riFiJDKe7std06OwJCTUFrWoMmkW1OGNXQXCk2UtasyHH4O6NOa+R/+09yGEfnYmZx/077oOd0TUEyGhVOdLtR4A9taMKJ/2Ua0GnCL86B/CQWLduY+GHMqEfCkmOEnC1CWyYNY3nqfaJmUhhIRfjTW1ko56uWzV0pYc5D7q9OiYOcs1+MXovTu8H1tv25ejqRpc6VTSSZGwEIVqO9ukl85lNvyZpS2mknnOZ43Yo9Xe1JsqrCdRH6+0bKeJbeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LK+h+/v5CiJWF+E9Jlgyqd3Sb+H0IeW+VkC/kfVCBnk=;
 b=SSnFS3ZN9KUnzWnnSsRag+/+QqrkFdobwFzqegqVqe8rhsGS1f+dPz2f4dO4yaDQ/hWZCg6zpuR8ydn09vRXzKa/hukmsjYukb8AswJiIekuSI+HV/N79nL07ls5uAdk7Wd5KIbOdM17AuZV8f+4pIMQU8DU8OkQYgNzKKyVB/U=
Received: from TY4PR01CA0104.jpnprd01.prod.outlook.com (2603:1096:405:378::9)
 by OS7PR01MB14701.jpnprd01.prod.outlook.com (2603:1096:604:39b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:40 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:378:cafe::7) by TY4PR01CA0104.outlook.office365.com
 (2603:1096:405:378::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:39 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 2FD603000458;
	Fri, 22 May 2026 21:13:35 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:43 +0200
Subject: [PATCH net-next v5 14/14] net: renesas: rswitch: add vlan aware
 switching
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-14-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=14831;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=i6HjGPzlP/nQ0Z6YFOlnj1YnHebJC2s2xjpnKWrc/1Y=;
 b=hJ+ay1A0mfm0EoxVOWB7Ib5Rf9v/GUNcNuueilKiIzz6wlhbyMwt9xsz+guZtppWTF2PihfEg
 ORPUQWlvxbVD3Draw8FME96dR6vGaaCveKlAjoflvbVQwm/RRKDFwNS
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|OS7PR01MB14701:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ab8bec-e56e-4c63-aaea-08deb7fb8ef1
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|18092099006|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uonr5y7kFsCpCofzjWhxBc8EvO7ZVSvbBbcWL8xg6gc9WUea9FRmOuX5HpYXwV1/2aBHhWbhi8OO8pbCvPhla7jrHSsg9Q5wbxe5yoRuNtufoV6wk6WNm5GUB1Jq7AUw/UVrJ/m4F9Hj18j3QsLXgxE0lVqNW6EFuTCnJ/oQSYSlFitBKVG6EdGQwqBkVJuKSJrpUGZXGFZ0dRhlMoSitTI34X+aED9Ub2RtFWc2JUzEBe3emS+RNQXGRQ1HpSn0WCtB4cRhhRzcMSQHgnCGQQZhl8XiSW9FwnV0AsT+JDL3TudCjW11CFpUzMLuDncht6vM9odBofFkuSE4CdDBCCqttLUD7KLXvc36Le9/uJg549ugCmfv7u9Xf7HPZjbdxxVc3pP4AaV360iLLa+PxPa433ZokhC97P5BlaOVFEt/X+y4TSL9a7tbInfYu43x7NPaUcDsv53fN2l9i8/vfbhcnqnObTikHswO7/hVANg8SDLSC1pc/7xn3xbBLzKOOcbMUrGb/sthw5SY8qOl8GleyPYKLG0FTIfkWXZWAJgDKUYTr2P9Avlel/EYl2p5JaHxvYWrvgCMBDM0y4IHJ+v6H+39bqPpb/AVEZdJvl1y6yuCqD0I/5YwTDhHIfXeC7C/vwGbYNIeSYguuGSsncdGS7yR/hzSosu4fadA8ryDHWk3CqCFon8QeS0bLEg+Y5HsX+AO8BDhQmSsMcPPBOCHSv1pkoca0wYpmf/U4mM=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(18092099006)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ARXjZQSgkSdCLeXmx2tMFXMgkrndWth5wJx4sLN3nZdA43IdX7D1HolyN4X3YdqWkfaCL2Slv8VpumJW7UndbxuJnQB5W5LgEdwFXXKnPQbqepPbPaCfgXSrvfcU/pRIve+mXKBqSfiAoNnXfht/PqG3YGtIWcHxqO0fF1M2rXp/UvV4gjez8AaiuDJPV5O4+qTaUDLSSCwE9SevezIdiKOtqyfJruaLWuoL+mMBd4QWmNrPv3ty2vpbrdcckhyrskFrbelnEZvmuL/LCpW/5/r5oNxOgR5cEhRa12/TsNZ6Bc7NTjs6O1HRPliL2lrgiGkBhnQJsx231SUgpwHOXpZ+bWgq+rIXEzqPaE1oxF9KniC+TrpK8aY+A8hFJmnSAaYXYvUvqinuBPtjAhs1AC65peCHAws+7P5Ipq9qHVHt8bGuIdAoT9WFqfMWy3Ku
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:39.5562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ab8bec-e56e-4c63-aaea-08deb7fb8ef1
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14701
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32983-lists,linux-renesas-soc=lfdr.de];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,ragnatech.se,pbarker.dev,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,renesas.com:mid,renesas.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[renesas.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[8.62.32.50:received,100.90.174.1:received,2603:1096:405:378::9:received,10.226.78.135:received];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FC535B3DB7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add vlan support to L2 HW bridge.

On R-Car S4 there is limited vlan support, which is not fully
802.1Q compliant. The aim of this driver addition is to get as
close as possible to the correct behavior. Limitations are:
- all ports should be in the same default vlan
- default vlans are not stripped on egress.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/Kconfig      |   1 +
 drivers/net/ethernet/renesas/rswitch_l2.c | 401 +++++++++++++++++++++++++++---
 2 files changed, 364 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/renesas/Kconfig b/drivers/net/ethernet/renesas/Kconfig
index 9b7559c88bee..2494ff60e8c2 100644
--- a/drivers/net/ethernet/renesas/Kconfig
+++ b/drivers/net/ethernet/renesas/Kconfig
@@ -43,6 +43,7 @@ config RENESAS_ETHER_SWITCH
 	tristate "Renesas Ethernet Switch support"
 	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on PTP_1588_CLOCK
+	depends on BRIDGE || BRIDGE=n
 	select CRC32
 	select MII
 	select PHYLINK
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 4d0646283f88..d2e22bee9c0d 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -7,6 +7,7 @@
 #include <linux/err.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
+#include <linux/if_vlan.h>
 #include <linux/kernel.h>
 #include <net/switchdev.h>
 
@@ -173,22 +174,6 @@ static void rswitch_port_update_brdev(struct net_device *ndev,
 	rswitch_update_offload_brdev(rdev->priv);
 }
 
-static int rswitch_port_update_stp_state(struct net_device *ndev, u8 stp_state)
-{
-	struct rswitch_device *rdev;
-
-	if (!is_rdev(ndev))
-		return -ENODEV;
-
-	rdev = netdev_priv(ndev);
-	rdev->learning_requested = (stp_state == BR_STATE_LEARNING ||
-				    stp_state == BR_STATE_FORWARDING);
-	rdev->forwarding_requested = (stp_state == BR_STATE_FORWARDING);
-	rswitch_update_l2_offload(rdev->priv);
-
-	return 0;
-}
-
 static int rswitch_netdevice_event(struct notifier_block *nb,
 				   unsigned long event,
 				   void *ptr)
@@ -212,61 +197,401 @@ static int rswitch_netdevice_event(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int rswitch_update_ageing_time(struct net_device *ndev, clock_t time)
+static int rswitch_port_update_stp_state(struct net_device *ndev, u8 stp_state)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
-	u32 reg_val;
+	struct rswitch_device *rdev;
 
 	if (!is_rdev(ndev))
 		return -ENODEV;
 
+	rdev = netdev_priv(ndev);
+	rdev->learning_requested = (stp_state == BR_STATE_LEARNING ||
+				    stp_state == BR_STATE_FORWARDING);
+	rdev->forwarding_requested = (stp_state == BR_STATE_FORWARDING);
+	rswitch_update_l2_offload(rdev->priv);
+
+	return 0;
+}
+
+static int rswitch_update_ageing_time(struct rswitch_private *priv, clock_t time)
+{
+	u32 reg_val;
+
 	if (!FIELD_FIT(FWMACAGC_MACAGT, time))
 		return -EINVAL;
 
 	reg_val = FIELD_PREP(FWMACAGC_MACAGT, time);
 	reg_val |= FWMACAGC_MACAGE | FWMACAGC_MACAGSL;
-	iowrite32(reg_val, rdev->priv->addr + FWMACAGC);
+	iowrite32(reg_val, priv->addr + FWMACAGC);
 
 	return 0;
 }
 
-static int rswitch_port_attr_set(struct net_device *ndev, const void *ctx,
-				 const struct switchdev_attr *attr,
-				 struct netlink_ext_ack *extack)
+static void rswitch_update_vlan_filtering(struct rswitch_private *priv,
+					  bool vlan_filtering)
 {
+	if (vlan_filtering)
+		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+			       0, FWPC0_VLANSA | FWPC0_VLANRU);
+	else
+		rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+			       FWPC0_VLANSA | FWPC0_VLANRU, 0);
+}
+
+static int rswitch_handle_port_attr_set(struct net_device *ndev,
+					struct notifier_block *nb,
+					struct switchdev_notifier_port_attr_info *info)
+{
+	const struct switchdev_attr *attr = info->attr;
+	struct rswitch_private *priv;
+	int err = 0;
+
+	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_blocking_nb);
+
 	switch (attr->id) {
 	case SWITCHDEV_ATTR_ID_PORT_STP_STATE:
-		return rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+		err = rswitch_port_update_stp_state(ndev, attr->u.stp_state);
+
+		break;
 	case SWITCHDEV_ATTR_ID_BRIDGE_AGEING_TIME:
-		return rswitch_update_ageing_time(ndev, attr->u.ageing_time);
+		err = rswitch_update_ageing_time(priv, attr->u.ageing_time);
+
+		break;
+	case SWITCHDEV_ATTR_ID_BRIDGE_VLAN_FILTERING:
+		rswitch_update_vlan_filtering(priv, attr->u.vlan_filtering);
+
+		break;
+	case SWITCHDEV_ATTR_ID_BRIDGE_MC_DISABLED:
+
+		break;
 	default:
 		return -EOPNOTSUPP;
 	}
+
+	if (err < 0)
+		return err;
+
+	info->handled = true;
+
+	return NOTIFY_DONE;
+}
+
+static int rswitch_read_vlan_table(struct rswitch_private *priv, u16 vid,
+				   u32 *vlanslvs, u32 *vlandvs)
+{
+	int err;
+
+	iowrite32(FIELD_PREP(VLANVIDS, vid), priv->addr + FWVLANTS);
+	err = rswitch_reg_wait(priv->addr, FWVLANTSR0, VLANTS, 0);
+	if (err < 0)
+		return err;
+
+	/* check if vlans are present in table */
+	if (!(ioread32(priv->addr + FWVLANTSR0) & VLANSNF)) {
+		*vlanslvs = (ioread32(priv->addr + FWVLANTSR1) & VLANSLVS);
+		*vlandvs = (ioread32(priv->addr + FWVLANTSR3) & VLANDVS);
+	}
+
+	return 0;
+}
+
+static int rswitch_write_vlan_table(struct rswitch_private *priv, u16 vid, u32 index)
+{
+	u32 vlancsdl = priv->gwca.l2_shared_rx_queue->index;
+	u32 vlanslvs = 0, vlandvs = 0;
+	int err;
+
+	err = rswitch_read_vlan_table(priv, vid, &vlanslvs, &vlandvs);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, FWVLANTL0, VLANED, 0);
+	iowrite32(FIELD_PREP(VLANVIDL, vid), priv->addr + FWVLANTL1);
+
+	vlanslvs |= BIT(index);
+	vlandvs  |= BIT(index);
+	iowrite32(FIELD_PREP(VLANSLVL, vlanslvs), priv->addr + FWVLANTL2);
+	iowrite32(FIELD_PREP(VLANCSDL, vlancsdl), priv->addr + FWVLANTL3(GWCA_INDEX));
+	iowrite32(FIELD_PREP(VLANDVL, vlandvs), priv->addr + FWVLANTL4);
+
+	return rswitch_reg_wait(priv->addr, FWVLANTLR, VLANTL, 0);
+}
+
+static int rswitch_erase_vlan_table(struct rswitch_private *priv, u16 vid, u32 index)
+{
+	u32 vlanslvs = 0, vlandvs = 0;
+	int err;
+
+	err = rswitch_read_vlan_table(priv, vid, &vlanslvs, &vlandvs);
+	if (err < 0)
+		return err;
+
+	vlanslvs &= ~BIT(index);
+	vlandvs  &= ~BIT(index);
+
+	/* only erase empty vlan table entries */
+	if (vlanslvs == 0)
+		rswitch_modify(priv->addr, FWVLANTL0, 0, VLANED);
+
+	iowrite32(FIELD_PREP(VLANVIDL, vid), priv->addr + FWVLANTL1);
+	iowrite32(FIELD_PREP(VLANSLVL, vlanslvs), priv->addr + FWVLANTL2);
+	iowrite32(FIELD_PREP(VLANDVL, vlandvs), priv->addr + FWVLANTL4);
+
+	return rswitch_reg_wait(priv->addr, FWVLANTLR, VLANTL, 0);
+}
+
+static int rswitch_port_set_vlan_tag(struct rswitch_etha *etha,
+				     struct switchdev_obj_port_vlan *p_vlan,
+				     bool delete)
+{
+	u32 vem_val;
+	int err;
+
+	err = rswitch_etha_change_mode(etha, EAMC_OPC_CONFIG);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(etha->addr, EAVCC, VIM, 0);
+
+	if (((ioread32(etha->addr + EAVTC) & CTV) == p_vlan->vid) && delete) {
+		rswitch_modify(etha->addr, EAVTC, CTV, 0);
+		rswitch_modify(etha->addr, EAVCC, VEM, 0);
+	} else if (!delete) {
+		if ((p_vlan->flags & BRIDGE_VLAN_INFO_PVID) &&
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED))
+			vem_val = FIELD_PREP(VEM, C_TAG_VLAN);
+		else if (p_vlan->flags & BRIDGE_VLAN_INFO_PVID)
+			vem_val = FIELD_PREP(VEM, HW_C_TAG_VLAN);
+		else
+			vem_val = 0;
+		rswitch_modify(etha->addr, EAVCC, VEM, vem_val);
+		rswitch_modify(etha->addr, EAVTC, CTV, FIELD_PREP(CTV, p_vlan->vid));
+	}
+
+	return rswitch_etha_change_mode(etha, EAMC_OPC_OPERATION);
+}
+
+static int rswitch_gwca_set_vlan_tag(struct rswitch_private *priv,
+				     struct switchdev_obj_port_vlan *p_vlan,
+				     bool delete)
+{
+	u32 vem_val;
+	int err;
+
+	err = rswitch_gwca_change_mode(priv, GWMC_OPC_CONFIG);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, GWVCC, VIM, 0);
+
+	if (((ioread32(priv->addr + GWVTC) & CTV) == p_vlan->vid) && delete) {
+		rswitch_modify(priv->addr, GWVTC, CTV, 0);
+		rswitch_modify(priv->addr, GWVCC, VEM, 0);
+	} else  if (!delete) {
+		if ((p_vlan->flags & BRIDGE_VLAN_INFO_PVID) &&
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED))
+			vem_val = FIELD_PREP(VEM, C_TAG_VLAN);
+		else if (p_vlan->flags & BRIDGE_VLAN_INFO_PVID)
+			vem_val = FIELD_PREP(VEM, HW_C_TAG_VLAN);
+		else
+			vem_val = 0;
+		rswitch_modify(priv->addr, GWVCC, VEM, vem_val);
+		rswitch_modify(priv->addr, GWVTC, CTV, FIELD_PREP(CTV, p_vlan->vid));
+	}
+
+	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
+}
+
+static int rswitch_port_obj_do_add(struct net_device *ndev,
+				   struct switchdev_obj_port_vlan *p_vlan)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_private *priv = rdev->priv;
+	struct rswitch_etha *etha = rdev->etha;
+	int err;
+
+	/* Set Rswitch VLAN mode */
+	iowrite32(br_vlan_enabled(rdev->brdev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0,
+		  priv->addr + FWGC);
+
+	err = rswitch_write_vlan_table(priv, p_vlan->vid, etha->index);
+	if (err < 0)
+		return err;
+
+	/* If the default vlan for this port has been set, don't overwrite it. */
+	if (ioread32(etha->addr + EAVCC))
+		return NOTIFY_DONE;
+
+	if (br_vlan_enabled(rdev->brdev))
+		rswitch_modify(priv->addr, FWPC0(etha->index), 0, FWPC0_VLANSA | FWPC0_VLANRU);
+
+	rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA),
+		       FIELD_PREP(FWPC2_LTWFW, BIT(etha->index)),
+		       0);
+
+	return rswitch_port_set_vlan_tag(etha, p_vlan, false);
+}
+
+static int rswitch_port_obj_do_add_gwca(struct net_device *ndev,
+					struct rswitch_private *priv,
+					struct switchdev_obj_port_vlan *p_vlan)
+{
+	int err;
+
+	if (!(p_vlan->flags & BRIDGE_VLAN_INFO_BRENTRY))
+		return NOTIFY_DONE;
+
+	/* Set Rswitch VLAN mode */
+	iowrite32(br_vlan_enabled(ndev) ? FIELD_PREP(FWGC_SVM, C_TAG) : 0, priv->addr + FWGC);
+
+	err = rswitch_write_vlan_table(priv, p_vlan->vid, AGENT_INDEX_GWCA);
+	if (err < 0)
+		return err;
+
+	/* If the default vlan for this port has been set, don't overwrite it. */
+	if (ioread32(priv->addr + GWVCC))
+		return NOTIFY_DONE;
+
+	return rswitch_gwca_set_vlan_tag(priv, p_vlan, false);
+}
+
+static int rswitch_port_obj_do_del(struct net_device *ndev,
+				   struct switchdev_obj_port_vlan *p_vlan)
+{
+	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_private *priv = rdev->priv;
+	struct rswitch_etha *etha = rdev->etha;
+	int err;
+
+	err = rswitch_port_set_vlan_tag(etha, p_vlan, true);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, FWPC0(etha->index), FWPC0_VLANSA | FWPC0_VLANRU, 0);
+	rswitch_modify(priv->addr, FWPC2(AGENT_INDEX_GWCA), 0,
+		       FIELD_PREP(FWPC2_LTWFW, BIT(etha->index)));
+	rswitch_modify(priv->addr, FWPC2(rdev->port),
+		       0, FIELD_PREP(FWPC2_LTWFW, GENMASK(RSWITCH_NUM_AGENTS - 1, 0)));
+
+	return rswitch_erase_vlan_table(priv, p_vlan->vid, etha->index);
+}
+
+static int rswitch_port_obj_do_del_gwca(struct net_device *ndev,
+					struct rswitch_private *priv,
+					struct switchdev_obj_port_vlan *p_vlan)
+{
+	int err;
+
+	err = rswitch_gwca_set_vlan_tag(priv, p_vlan, true);
+	if (err < 0)
+		return err;
+
+	rswitch_modify(priv->addr, FWPC0(AGENT_INDEX_GWCA),
+		       FWPC0_VLANSA | FWPC0_VLANRU,
+		       0);
+
+	return rswitch_erase_vlan_table(priv, p_vlan->vid, AGENT_INDEX_GWCA);
+}
+
+static int rswitch_handle_port_obj_add(struct net_device *ndev,
+				       struct notifier_block *nb,
+				       struct switchdev_notifier_port_obj_info *info)
+{
+	struct switchdev_obj_port_vlan *p_vlan;
+	struct rswitch_private *priv;
+	int err;
+
+	switch (info->obj->id) {
+	case SWITCHDEV_OBJ_ID_PORT_VLAN:
+		p_vlan = SWITCHDEV_OBJ_PORT_VLAN(info->obj);
+		if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
+			return NOTIFY_DONE;
+
+		priv = container_of(nb, struct rswitch_private,
+				    rswitch_switchdev_blocking_nb);
+
+		if (!is_rdev(ndev))
+			err = rswitch_port_obj_do_add_gwca(ndev, priv, p_vlan);
+		else
+			err = rswitch_port_obj_do_add(ndev, p_vlan);
+
+		if (err < 0)
+			return err;
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	info->handled = true;
+
+	return NOTIFY_DONE;
+}
+
+static int rswitch_handle_port_obj_del(struct net_device *ndev,
+				       struct notifier_block *nb,
+				       struct switchdev_notifier_port_obj_info *info)
+{
+	struct switchdev_obj_port_vlan *p_vlan;
+	struct rswitch_private *priv;
+	int err;
+
+	switch (info->obj->id) {
+	case SWITCHDEV_OBJ_ID_PORT_VLAN:
+		p_vlan = SWITCHDEV_OBJ_PORT_VLAN(info->obj);
+		if ((p_vlan->flags & BRIDGE_VLAN_INFO_MASTER) ||
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_BEGIN) ||
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_RANGE_END) ||
+		    (p_vlan->flags & BRIDGE_VLAN_INFO_ONLY_OPTS))
+			return NOTIFY_DONE;
+
+		priv = container_of(nb, struct rswitch_private,
+				    rswitch_switchdev_blocking_nb);
+
+		if (!is_rdev(ndev))
+			err = rswitch_port_obj_do_del_gwca(ndev, priv, p_vlan);
+		else
+			err = rswitch_port_obj_do_del(ndev, p_vlan);
+
+		if (err < 0)
+			return err;
+
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	info->handled = true;
+
+	return NOTIFY_DONE;
 }
 
 static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
-					    unsigned long event, void *ptr)
+					    unsigned long event,
+					    void *ptr)
 {
 	struct net_device *ndev = switchdev_notifier_info_to_dev(ptr);
-	int ret;
+	int err;
 
 	switch (event) {
 	case SWITCHDEV_PORT_OBJ_ADD:
-		return -EOPNOTSUPP;
+		err = rswitch_handle_port_obj_add(ndev, nb, ptr);
+
+		return notifier_from_errno(err);
 	case SWITCHDEV_PORT_OBJ_DEL:
-		return -EOPNOTSUPP;
+		err = rswitch_handle_port_obj_del(ndev, nb, ptr);
+
+		return notifier_from_errno(err);
 	case SWITCHDEV_PORT_ATTR_SET:
-		ret = switchdev_handle_port_attr_set(ndev, ptr,
-						     is_rdev,
-						     rswitch_port_attr_set);
-		break;
-	default:
-		if (is_rdev(ndev))
-			return -EOPNOTSUPP;
-		return NOTIFY_DONE;
+		err = rswitch_handle_port_attr_set(ndev, nb, ptr);
+
+		return notifier_from_errno(err);
 	}
 
-	return notifier_from_errno(ret);
+	return NOTIFY_DONE;
 }
 
 static int rswitch_gwca_write_mac_address(struct rswitch_private *priv, const u8 *mac)

-- 
2.43.0


