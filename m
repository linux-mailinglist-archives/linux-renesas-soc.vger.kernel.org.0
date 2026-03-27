Return-Path: <linux-renesas-soc+bounces-30415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOSaHF1Axmm7HgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:31:25 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB8C341009
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60021305421C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50083D75AA;
	Fri, 27 Mar 2026 08:28:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D45583DA7E7;
	Fri, 27 Mar 2026 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600102; cv=none; b=PWph4WFaaN1ADz6Jp8flUSgfZP/TU7GxLi+lexHh/+5odgu7pFrICBTO2AXAGxjTIIAESTs8Zn9CHU85Z+gR1F73htHPjdSktKjsHKJiBWrZ5KjKGXN4X53WqSeJSWsBm9eEWpc1iQcnBIVbMy6Gz9EA5WPC4RbG9JCbnx9FuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600102; c=relaxed/simple;
	bh=F2vS5LObAuXULh9h9IlixD5s5bGmDr1DdYRsZlravzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i/PtgB+TV0IcoB+2g4/Rv5GqbmdlMCKXv/qw8ceL1CZ+ubLv0LRz0+5aIjf1w7ciQXGJmfJroZd6i8AFDtyQm/3h8sjeRZB7tQ1V2OvtepFrez79gtzitSMjKXOTZZrXM+xFJchhWljO92fmCzeL1Dp2wxIsAdDzhFa1FO5loJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 6dsPwbYbQLi0zc9/258O+g==
X-CSE-MsgGUID: FqXBI2v7S9SHZFqPdI5imQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Mar 2026 17:28:16 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F3EBA401225D;
	Fri, 27 Mar 2026 17:28:13 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:40 +0100
Subject: [PATCH net-next v2 10/13] net: renesas: rswitch: clean up is_rdev
 rswitch_device checking
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-10-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=2714;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=F2vS5LObAuXULh9h9IlixD5s5bGmDr1DdYRsZlravzg=;
 b=ARx6LPvE5SF6KR9RF6x/r9tDye78H7YdXr2BnfuqcnJqLcpLfybdSmEfXU8dkym4R/bvGpIZF
 l5VzStGAPYnBH4uEGUMjACkTv7BH9crAevUuiM6IjbGG0k/kk/YgUqm
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30415-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 6CB8C341009
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add null pointer checking for ndev and remove unnecessay
rswitch_port_check() wrapper function.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch_l2.c   | 15 +++++----------
 drivers/net/ethernet/renesas/rswitch_main.c |  2 +-
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index cabf1f92ad0c..ae3857ef9af6 100644
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
@@ -278,11 +273,11 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
 		return -EOPNOTSUPP;
 	case SWITCHDEV_PORT_ATTR_SET:
 		ret = switchdev_handle_port_attr_set(ndev, ptr,
-						     rswitch_port_check,
+						     is_rdev,
 						     rswitch_port_attr_set);
 		break;
 	default:
-		if (!rswitch_port_check(ndev))
+		if (!is_rdev(ndev))
 			return NOTIFY_DONE;
 		ret = -EOPNOTSUPP;
 	}
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index d1be588fb625..da984027239c 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -1962,7 +1962,7 @@ static const struct net_device_ops rswitch_netdev_ops = {
 
 bool is_rdev(const struct net_device *ndev)
 {
-	return (ndev->netdev_ops == &rswitch_netdev_ops);
+	return ndev && (ndev->netdev_ops == &rswitch_netdev_ops);
 }
 
 static int rswitch_get_ts_info(struct net_device *ndev, struct kernel_ethtool_ts_info *info)

-- 
2.43.0


