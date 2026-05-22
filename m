Return-Path: <linux-renesas-soc+bounces-32982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DzcHrJKEGpvVwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:23:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280D5B3D77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 14:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D33A83061DFE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2026 12:14:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C657E3803DE;
	Fri, 22 May 2026 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="aBxGuzFW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011032.outbound.protection.outlook.com [52.101.125.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239038A716;
	Fri, 22 May 2026 12:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779452023; cv=fail; b=kSxCwPySqzbEoNzvt3Ln+2+f8qso0Q/nLnTGRHAFo3QuZwrvCnPbIa6fcV+o3T5wehV5vn9IyauIppELfHzJHFLhZgqfZk0Slt9mthJWBV8ryioLFNI/tGzXEdeFik1ACfJHlii5M/OWcLt+IbuxyRtlqABnlpogBDOpayungOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779452023; c=relaxed/simple;
	bh=R4csxHU6oBOnZhlRDwmQEnq6OFv6MP7uyGGYZTm77n0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVnOGlTuPNB3KjyTLaXSOkK3FOHkYgdZ/dMcMl/0R9C2qqXSdYVkysaJ3UH35pRS7w0LQGIab/MkyBdl1GP0izJWPV9SZw1NT4BEuZBwHAOLy++07HPgakdH+XJnL3+JAV3onqSm7VXB7xbsuNb1AN2EjsCKQDuX/iBKE9jDKi0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=aBxGuzFW; arc=fail smtp.client-ip=52.101.125.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JJcTK0jCCL+Q7gETyhmj7B36nGluYZoG1z7aj8mSdkqBwT0Q0G9ASHYdbytkkFq3CfYPk9WWr7QgYDLWU7QQ/41C9yr2I82Ip50d6UgbggOulf+CvL7W5Bzu/9myL6RBo4PPj1b0UGT3Pd1IBwxNyLyhEWnT19cuBIYPBjXPUxemo10fyBM1wxnMnSrqIVx6RYxQ/aDd+6td+Cgd8rp3L6F8Q3vzY/NPJ7eZVmH8yCKCw3REqn5sJ9LdRduCGh/nlpDyF4UEBwO9KAmyCYMViRG7uH1t+NkorB1X8iV68zz+UEYcSwrkxvM3q15ebcCvm+1NCZ2WfobtPahnx/uKUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkXSMfV9q9doB21DFgs8A+hO3TdoEUG2s+U79T1GX8k=;
 b=TqJ4ESrY5x11b38zzgjTOQcSdiyB+OtUXbLR32/YjbocASVzf3bCYvE5sTz5kk/Aa0VsQJJ8bq9cEPi9qLOigdXLgFOso/DMBlpC3Jh/R8tpU3nGjAxxPfY7EPhzxe08WzW2kAhN6HG02aC7mI1EK7l6M4DkVTqRzsI8aO/n+rxivO6AJgIgJ7di3EO84ZOkPHloLWZIq+sQuVnet3AEoLeo7OpPLf3yZNPSFMlAZPd9iUzJ5M+iANo0OOPUOwMR6nqaT/XzeVVv8S59pmiJu3EhGs2O8/wUisTaE2pYz5xTpE/0cQEYCmWDUkt2G+LecyhST/Kz01xGk413zfZS4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=davemloft.net smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kkXSMfV9q9doB21DFgs8A+hO3TdoEUG2s+U79T1GX8k=;
 b=aBxGuzFWeeIn2xienQsxMMuRhER52vr3dEKt54LnrNXMEpAm1kBVkRSoC4ktNamLap/tcambChvo6NJhJXFYHUnHkJ3+64SHncWiQJPaaKRi6C/d5SKpvZ3ZGcbIYqxK/MR1SAQ9vKRsBaHdkQP4bq3hOZPvgi0lnNsFeMSa0Kw=
Received: from TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c5::10)
 by TY7PR01MB15747.jpnprd01.prod.outlook.com (2603:1096:405:290::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 12:13:33 +0000
Received: from TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5:cafe::51) by TYCP286CA0214.outlook.office365.com
 (2603:1096:400:3c5::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Fri, 22
 May 2026 12:13:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD8.mail.protection.outlook.com (10.167.240.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.7 via
 Frontend Transport; Fri, 22 May 2026 12:13:32 +0000
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id B6BFC3000466;
	Fri, 22 May 2026 21:13:28 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 22 May 2026 14:12:41 +0200
Subject: [PATCH net-next v5 12/14] net: renesas: rswitch: add passing of
 rswitch_private into notifiers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rswitch_add_vlans-v5-12-53589d944a9f@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779451963; l=7135;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=R4csxHU6oBOnZhlRDwmQEnq6OFv6MP7uyGGYZTm77n0=;
 b=ueph6X6ceihiE6gZtUA4cehBYv/xaJmAA5o1LQA9AZdrSjUIPzNIjpc5jOGpR+DgH7trgnqgS
 39DpNvUr1U4BPGfbpU4U6t+S7EqNO9DidDpvEa/0kC6i0WaqrQuPe2V
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD8:EE_|TY7PR01MB15747:EE_
X-MS-Office365-Filtering-Correlation-Id: 72a18247-2f2e-4fc4-693c-08deb7fb8a80
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|7416014|56012099003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	z+6EBih4kxruZK0C1mPfGAXGPSMgrZ9JsBAeaPQn1rHw4MQkT+pwbepglwSJVMiPLRL24tb4TC92zQwrwVufsi8YivECs1LQbrpPTgdj53nAnZPDONBzkfHK5NjLGA4uqRuzmqa/H2+SYtLC3OW7fS9bCkrC8vxFMT8cLrG2M8pvd/NtmQnyrKX3Kx7detHQgoHuFxKE6pSxh9aB3IHL9A2wqic9UUg+E8bQphB+lnAebJOl1mM94yB2oNEaEu/BovgPlXwuq88DyYeD3rmscdSivhUlDa89DBoVmklI4NdSNtNEMlaRSWOHpyk7V3KN1Uf+azew5En02e5rHgweDrFkN3Rxx7T88p2kpp54d5U3prKkkXd5ZwC3p9hcUrkLL2EfxR8ipW9gOnNo+d/P5ndge9693bXmH/fyOOoI+KpaR0ahRWMClQhTsUplPnX9dNsVzH5i1b8nkbTQYX0dfzoX31oJbIwZtSOsMDcEi5izqzuvdSoS+VCR7jfbhZgJosctO+6yiMxgL98VYV3cgu97EpEnrxigrin2lXwjYAGushxdr6lTfnWkRTM57/qtSQHiVVD4a9B0fNtrPF8KBNUy9Q8+lr4zO/M8tTYL2TWsbelPrmGZ+Vf2v8dCUp1GSRvYJookQhW78FKVWez6Ycd6RVm8Lv3qtqSa2Y64TH/jMOaelf/ebTE+fYU+Fl6qUIpy4QPmicj+rhAfci94LMcUWgAR0TLGAW+0Hy/20Vo=
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(7416014)(56012099003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S7IH+4WfLDB1YjJiUE/8L7FTuJy9DKHPA950+UseJmAAvvLNqZj2JRx74frwHoZ70NoySF+nmBnFTq4va35N0lf2aIOxhJ5U6XaZzc3p4HpvK5aGkyPyX7Vf9oLKVBla+Vy91kpvfo5VvaJq1w4Xs5SpJEMaKLmDgFvLnq7zNBLc5e5CAaaP0d+mNpNN+PnEL/04EWfXyUK9IrDjyKbpd34J7S9HpjN3kj5lDXregCn48qAjyPl8GsRiYttheyw3HkobuxtBa+K2wnTrZ01ISu8X2SZFZzL5tpPGqftYxfDBJVZHYeNhfH7xQc6W4ipyJP7zg7jKdMuuJ0No0XvE+fTCQgrX22y0ULuyF2MkzUbYljeD3TgHASYN1Jbu83CGYA1FWixOiUuLPJFdPQO/0xiqg5c2AKhPN5l5xgFhWc/J+Ao1XfiBOjWTaHRhl/OH
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 12:13:32.1026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72a18247-2f2e-4fc4-693c-08deb7fb8a80
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD8.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB15747
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32982-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3280D5B3D77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Provide struct rswitch_private to notifiers. This will be needed
to access the HW in the notification handlers.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  5 +++
 drivers/net/ethernet/renesas/rswitch_l2.c   | 45 ++++++++++-------------
 drivers/net/ethernet/renesas/rswitch_l2.h   |  6 ++--
 drivers/net/ethernet/renesas/rswitch_main.c | 56 +++++++++++++++--------------
 4 files changed, 56 insertions(+), 56 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 736762912acf..9777966ebe0e 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1201,6 +1201,11 @@ struct rswitch_private {
 	struct rswitch_etha etha[RSWITCH_NUM_PORTS];
 	struct rswitch_mfwd mfwd;
 
+	/* Notifiers */
+	struct notifier_block rswitch_netdevice_nb;
+	struct notifier_block rswitch_switchdev_nb;
+	struct notifier_block rswitch_switchdev_blocking_nb;
+
 	struct list_head port_list;
 
 	spinlock_t lock;	/* lock interrupt registers' control */
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index c76fc8121ef0..d2deb7cb7634 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.c
+++ b/drivers/net/ethernet/renesas/rswitch_l2.c
@@ -285,48 +285,39 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
 	return notifier_from_errno(ret);
 }
 
-static struct notifier_block rswitch_netdevice_nb = {
-	.notifier_call = rswitch_netdevice_event,
-};
-
-static struct notifier_block rswitch_switchdev_nb = {
-	.notifier_call = rswitch_switchdev_event,
-};
-
-static struct notifier_block rswitch_switchdev_blocking_nb = {
-	.notifier_call = rswitch_switchdev_blocking_event,
-};
-
-int rswitch_register_notifiers(void)
+int rswitch_register_notifiers(struct rswitch_private *priv)
 {
-	int ret;
+	int err;
 
-	ret = register_netdevice_notifier(&rswitch_netdevice_nb);
-	if (ret)
+	priv->rswitch_netdevice_nb.notifier_call = rswitch_netdevice_event;
+	err = register_netdevice_notifier(&priv->rswitch_netdevice_nb);
+	if (err)
 		goto register_netdevice_notifier_failed;
 
-	ret = register_switchdev_notifier(&rswitch_switchdev_nb);
-	if (ret)
+	priv->rswitch_switchdev_nb.notifier_call = rswitch_switchdev_event;
+	err = register_switchdev_notifier(&priv->rswitch_switchdev_nb);
+	if (err)
 		goto register_switchdev_notifier_failed;
 
-	ret = register_switchdev_blocking_notifier(&rswitch_switchdev_blocking_nb);
-	if (ret)
+	priv->rswitch_switchdev_blocking_nb.notifier_call = rswitch_switchdev_blocking_event;
+	err = register_switchdev_blocking_notifier(&priv->rswitch_switchdev_blocking_nb);
+	if (err)
 		goto register_switchdev_blocking_notifier_failed;
 
 	return 0;
 
 register_switchdev_blocking_notifier_failed:
-	unregister_switchdev_notifier(&rswitch_switchdev_nb);
+	unregister_switchdev_notifier(&priv->rswitch_switchdev_nb);
 register_switchdev_notifier_failed:
-	unregister_netdevice_notifier(&rswitch_netdevice_nb);
+	unregister_netdevice_notifier(&priv->rswitch_netdevice_nb);
 register_netdevice_notifier_failed:
 
-	return ret;
+	return err;
 }
 
-void rswitch_unregister_notifiers(void)
+void rswitch_unregister_notifiers(struct rswitch_private *priv)
 {
-	unregister_switchdev_blocking_notifier(&rswitch_switchdev_blocking_nb);
-	unregister_switchdev_notifier(&rswitch_switchdev_nb);
-	unregister_netdevice_notifier(&rswitch_netdevice_nb);
+	unregister_switchdev_blocking_notifier(&priv->rswitch_switchdev_blocking_nb);
+	unregister_switchdev_notifier(&priv->rswitch_switchdev_nb);
+	unregister_netdevice_notifier(&priv->rswitch_netdevice_nb);
 }
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.h b/drivers/net/ethernet/renesas/rswitch_l2.h
index 57050ede8f31..af9780c63c9a 100644
--- a/drivers/net/ethernet/renesas/rswitch_l2.h
+++ b/drivers/net/ethernet/renesas/rswitch_l2.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Renesas Ethernet Switch device driver
  *
- * Copyright (C) 2025 Renesas Electronics Corporation
+ * Copyright (C) 2025 - 2026 Renesas Electronics Corporation
  */
 
 #ifndef __RSWITCH_L2_H__
@@ -9,7 +9,7 @@
 
 void rswitch_update_l2_offload(struct rswitch_private *priv);
 
-int rswitch_register_notifiers(void);
-void rswitch_unregister_notifiers(void);
+int rswitch_register_notifiers(struct rswitch_private *priv);
+void rswitch_unregister_notifiers(struct rswitch_private *priv);
 
 #endif	/* #ifndef __RSWITCH_L2_H__ */
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index da400020a8f1..cfe7bfe6546b 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2241,6 +2241,30 @@ static int rswitch_init(struct rswitch_private *priv)
 	return err;
 }
 
+static void rswitch_deinit(struct rswitch_private *priv)
+{
+	unsigned int i;
+
+	rswitch_gwca_hw_deinit(priv);
+	rcar_gen4_ptp_unregister(priv->ptp_priv);
+
+	rswitch_for_each_enabled_port(priv, i) {
+		struct rswitch_device *rdev = priv->rdev[i];
+
+		unregister_netdev(rdev->ndev);
+		rswitch_ether_port_deinit_one(rdev);
+		phy_exit(priv->rdev[i]->serdes);
+	}
+
+	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
+		rswitch_device_free(priv, i);
+
+	rswitch_gwca_ts_queue_free(priv);
+	rswitch_gwca_linkfix_free(priv);
+
+	rswitch_clock_disable(priv);
+}
+
 static const struct soc_device_attribute rswitch_soc_no_speed_change[]  = {
 	{ .soc_id = "r8a779f0", .revision = "ES1.0" },
 	{ /* Sentinel */ }
@@ -2317,9 +2341,13 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (list_empty(&priv->port_list))
 		dev_warn(&pdev->dev, "could not initialize any ports\n");
 
-	ret = rswitch_register_notifiers();
+	ret = rswitch_register_notifiers(priv);
 	if (ret) {
+		rswitch_deinit(priv);
+		pm_runtime_put(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
 		dev_err(&pdev->dev, "could not register notifiers\n");
+
 		return ret;
 	}
 
@@ -2328,35 +2356,11 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void rswitch_deinit(struct rswitch_private *priv)
-{
-	unsigned int i;
-
-	rswitch_gwca_hw_deinit(priv);
-	rcar_gen4_ptp_unregister(priv->ptp_priv);
-
-	rswitch_for_each_enabled_port(priv, i) {
-		struct rswitch_device *rdev = priv->rdev[i];
-
-		unregister_netdev(rdev->ndev);
-		rswitch_ether_port_deinit_one(rdev);
-		phy_exit(priv->rdev[i]->serdes);
-	}
-
-	for (i = 0; i < RSWITCH_NUM_PORTS; i++)
-		rswitch_device_free(priv, i);
-
-	rswitch_gwca_ts_queue_free(priv);
-	rswitch_gwca_linkfix_free(priv);
-
-	rswitch_clock_disable(priv);
-}
-
 static void renesas_eth_sw_remove(struct platform_device *pdev)
 {
 	struct rswitch_private *priv = platform_get_drvdata(pdev);
 
-	rswitch_unregister_notifiers();
+	rswitch_unregister_notifiers(priv);
 	rswitch_deinit(priv);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.43.0


