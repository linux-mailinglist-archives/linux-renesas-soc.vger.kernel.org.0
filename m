Return-Path: <linux-renesas-soc+bounces-30416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KE/8NptAxmlRIAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:32:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EB431341063
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1B96930627A4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46523DCDB9;
	Fri, 27 Mar 2026 08:28:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3A53DA7F0;
	Fri, 27 Mar 2026 08:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600107; cv=none; b=Eqt8Engd55XF2YQ7ZcN9vBq2ONQVWgCEwvby62J1KhOshDNSoHcPn70sFyInNPOAz/ZsM4zLxSOyKjbHmlHd9iHvvGSCmJTrf0kjpZJGBRIiXIXb86RhYACJYAfKkiPGaEDa48j4dWTtMaNwvA+QqEL5iqR27nBQT9762+1DdMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600107; c=relaxed/simple;
	bh=Rw4DVW36RRvrroYvWOsbjsU4bvJfVh6bb1p03Vh1ueY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L6uTKFrVFxwjbQKIPKEnATDp9o+LEsJhbOULrIShkLHnV9VzYoVOwV4NR/Sw+Nmq+8GluEETK0/2rdQHNbn4xd3bDO3gCx3h+97wIZGLcDHQ0H3UE8/Huo7/F6AK2wFqHbD/5Smc4pwmfzB6aT25tSLyxjjrRd9MdnugmPfQ0i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: hm3xYS6sReK2FxMNGdwL0g==
X-CSE-MsgGUID: bSLHYaqTSYGQFcdT98IjbA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Mar 2026 17:28:19 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 118AF4012274;
	Fri, 27 Mar 2026 17:28:16 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:41 +0100
Subject: [PATCH net-next v2 11/13] net: renesas: rswitch: add passing of
 rswitch_private into notifiers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-11-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=5516;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=Rw4DVW36RRvrroYvWOsbjsU4bvJfVh6bb1p03Vh1ueY=;
 b=hdzF7o8i4G09nfB29532KPRri/vhPg8hTmnAZzUnQeFko3m9LbVMWmG0UGSbQsYlyPdeKIZrR
 A9nH1IVO4d2D6wwJ8URpJyv77YAa0KY9OGB79sH6DapfjfnaNtd1jnb
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30416-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EB431341063
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 42c8bbafa27d..6dfc53c6b985 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1199,6 +1199,11 @@ struct rswitch_private {
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
index ae3857ef9af6..f1c5c96027ba 100644
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
index da984027239c..4e0a481ef403 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -2272,7 +2272,7 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	if (list_empty(&priv->port_list))
 		dev_warn(&pdev->dev, "could not initialize any ports\n");
 
-	ret = rswitch_register_notifiers();
+	ret = rswitch_register_notifiers(priv);
 	if (ret) {
 		dev_err(&pdev->dev, "could not register notifiers\n");
 		return ret;
@@ -2311,7 +2311,7 @@ static void renesas_eth_sw_remove(struct platform_device *pdev)
 {
 	struct rswitch_private *priv = platform_get_drvdata(pdev);
 
-	rswitch_unregister_notifiers();
+	rswitch_unregister_notifiers(priv);
 	rswitch_deinit(priv);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.43.0


