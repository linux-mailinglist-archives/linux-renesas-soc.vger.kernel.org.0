Return-Path: <linux-renesas-soc+bounces-32351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLFJNauZAWqqfwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:56:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7161050A6D2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 10:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 93EE43023E1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2773BB9F8;
	Mon, 11 May 2026 08:53:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F73E3BAD92;
	Mon, 11 May 2026 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489589; cv=none; b=cuftcDeU9jBTZN9N9Vdhtf0G1AtA1A0rdWShkBlUjeMy9nJV+SJ1YtN76E/E63vniLu1YWmvaW8/YNgRwTGwriYkGjCYT8x8SxOS1jj3whNm5W3cvSWSitCuUSx6a5VQvjTaZWfOTXZf9BP11YhXu+OnqcpqHxOOgf1r+IFOfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489589; c=relaxed/simple;
	bh=8qZcwzyFkTWzWUYTrSt2/n8qMoLPtqhgJVcFV06qqhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QdbobSD2IBMCBZnxfZMMg6MedyGbO5/tpGvaJQTRmM23nm5ePwQ+NWBR8btbnCt1ykPQy8juhWfUKf2jxiS1gpSQExCHjjFAZRuetkbqKPqTGDJFICcMDmiqPUkpCMD2dAVeg0vKDjneCyQUQr39CofUKA5Kuc5c+XMMT578od8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: /IXS3/wlS0GpgZ4HpYGF8Q==
X-CSE-MsgGUID: cDLc0rYaTsGCcOwIbCbJNA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 May 2026 17:53:07 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 38E444009A31;
	Mon, 11 May 2026 17:53:03 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:14 +0200
Subject: [PATCH net-next v4 11/13] net: renesas: rswitch: add passing of
 rswitch_private into notifiers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-11-a5a225f8faae@renesas.com>
References: <20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com>
In-Reply-To: <20260511-rswitch_add_vlans-v4-0-a5a225f8faae@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=5516;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=8qZcwzyFkTWzWUYTrSt2/n8qMoLPtqhgJVcFV06qqhY=;
 b=Pk/1tUX3aLMuYPlE3iJ93wXD3bhDmXknVypc4oeTT8QmJKuJd00z10r4YFZkS11z0DKC3SIHi
 d/ZfN9Yqob7CM0UVFZ/faj2L2vUPtmUDT76R1Z7C9CDvg4gSgj8Jgjk
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: 7161050A6D2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32351-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Action: no action

Provide struct rswitch_private to notifiers. This will be needed
to access the HW in the notification handlers.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  5 ++++
 drivers/net/ethernet/renesas/rswitch_l2.c   | 45 ++++++++++++-----------------
 drivers/net/ethernet/renesas/rswitch_l2.h   |  6 ++--
 drivers/net/ethernet/renesas/rswitch_main.c |  4 +--
 4 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 89315b6cde0f..949f0cb3c64e 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1200,6 +1200,11 @@ struct rswitch_private {
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
index dd8aecbcb2a8..06c61c54db72 100644
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
index bb9ead193cd6..7ea3f4cc8f17 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2290,7 +2290,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (list_empty(&priv->port_list))
 		dev_warn(&pdev->dev, "could not initialize any ports\n");
 
-	ret = rswitch_register_notifiers();
+	ret = rswitch_register_notifiers(priv);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register notifiers\n");
 		return ret;
@@ -2329,7 +2329,7 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
 {
 	struct rswitch_private *priv = platform_get_drvdata(pdev);
 
-	rswitch_unregister_notifiers();
+	rswitch_unregister_notifiers(priv);
 	rswitch_deinit(priv);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.43.0


