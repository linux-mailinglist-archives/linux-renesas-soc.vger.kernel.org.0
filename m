Return-Path: <linux-renesas-soc+bounces-30644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK/DGkuey2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:13:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA800367AEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:13:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C8BF30770B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE2A3EF64F;
	Tue, 31 Mar 2026 10:04:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5255F3B6BEB;
	Tue, 31 Mar 2026 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951487; cv=none; b=f3vW10SdK/SLQkNfizMx+yMZzuqYbVMeGLmPFMC48nQ2WRa8LGHFOkKg0VzVTxbcaVqWisOMC0vbm0Dy/+y8rYAKt2E61Now2PfwStn2w2xyRMF/QjZ1rIFSBCeurAd2V/cfHvQVs/oe/9HBs1kDaxkqoWbZmjGC43QXcA5uar4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951487; c=relaxed/simple;
	bh=WAfBjqa3OGSnnHpoYPepB93JQeuYuGFIGvox+ouDe8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h/5Q8RBmDlVBgj6wvw7Rd+e5br7vO1ZyuqwG0KbJJQ3sySLtGRmuilLK6MY966fbrosVaBj8XB58tQN2ASPRK3mooUOtWv3UIipPq0+e06dRxohGmJ5vbZHI+CZEvPu2rODn5fF7FT5FVH+FU4WWlAje2WNJs7s9wayVV4Wvnis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: C3AB0Z6JQoGjIGppZ9sK5w==
X-CSE-MsgGUID: n7ZO3+ebRjaGX03x/Vn3ww==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:45 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7F56D416C825;
	Tue, 31 Mar 2026 19:04:42 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:05 +0200
Subject: [PATCH net-next v3 11/13] net: renesas: rswitch: add passing of
 rswitch_private into notifiers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-11-c37f41b1c556@renesas.com>
References: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
In-Reply-To: <20260331-rswitch_add_vlans-v3-0-c37f41b1c556@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=5516;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=WAfBjqa3OGSnnHpoYPepB93JQeuYuGFIGvox+ouDe8I=;
 b=qYRpGJb7ED1mSnLQIoMxQUQv26gLEZK3aCG/cZaftfbYvaXxbE72nUWdnpZKiQtyzLex5w5k2
 srSDq2Sro7XCabUYJA2Z5DuEfZX+vkiwvlqe/5CT7SsvTUz9hj0cdZJ
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-30644-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: DA800367AEF
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
index fc2c9892aea0..92dd372aaa20 100644
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


