Return-Path: <linux-renesas-soc+bounces-30643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB4KCcmey2nVJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30643-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:15:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93578367B9F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A35F306C854
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF023E8C78;
	Tue, 31 Mar 2026 10:04:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC993EF0DC;
	Tue, 31 Mar 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951484; cv=none; b=uUzv53zChvHXn6a5pCY+GV1k/E6W/ORmsYtF13Wq10lOvwjniApoIQo2GieKTX0GWKHpULwkxnRP60PimDgDRRVEqAsmM2RLwKwr2cmHPON0RBAmcdv2sbSJAAFvXgQPKhs0nOpglEE7sOPUVQ76V5lUk7A/yFwRlMf1jABDLEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951484; c=relaxed/simple;
	bh=sQSaxlM7a5nZ2wZ0RK4jADV0oM5+2mN19pMlCn7V02g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pwmMQpmXsTWRVkyeCOqyoDX73sr86dZVxFUkUKiFoYOACCq7pItut7OnCeRkh+9Nmqqau4/6fj0TZCwZbAWcJR+2OzEn6zgvaSaWLIoUQHkh83EI8nhTlYs3Bf1c1j+lL7BgQ1JS0YtgcTojqZh9dBZWz1/WpXKNDNdjI34Nlhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 1tg9J7aPQ3i3TGskGu2++w==
X-CSE-MsgGUID: DzDCbSuYSpGqZVNtnqjv1w==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:42 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id E89DA416C823;
	Tue, 31 Mar 2026 19:04:38 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:04 +0200
Subject: [PATCH net-next v3 10/13] net: renesas: rswitch: clean up is_rdev
 rswitch_device checking
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-10-c37f41b1c556@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=2714;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=sQSaxlM7a5nZ2wZ0RK4jADV0oM5+2mN19pMlCn7V02g=;
 b=+ydQjzN8MJSEL4ZYiybVg8H5An+TYbfSxHKTpPkLS2OxjXmhSiLU/FpIxK0XiaFxW2cnefCH4
 As/nZlTjxruCvTcvleiNaOkgk4zDfuKlW2HKvP6add5eJXIEcTpoevp
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
	TAGGED_FROM(0.00)[bounces-30643-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 93578367B9F
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
index 60bfa22cc412..fc2c9892aea0 100644
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


