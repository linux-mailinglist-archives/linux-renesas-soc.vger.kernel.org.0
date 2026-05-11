Return-Path: <linux-renesas-soc+bounces-32352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPP5HXmfAWpKgwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:20:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 025CE50AC68
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:20:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 20B13307B047
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 08:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0B73BADB5;
	Mon, 11 May 2026 08:53:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333093C279D;
	Mon, 11 May 2026 08:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489593; cv=none; b=D+shgMfIUVdz1d1VWiyp6dj1fO1fbYXD0jN8Ul01F37rc8P0/+8CFIW1Zqe0bRyo2WTZH7wogDpgTXF9mfSm9SSLk7gr56oemmrI3Bqo5kExSC/3iKRDeDBqZkfXUjH9aP96bAWbtGOMTVQOWIVgcydZbSZ+uNsa1PafBiToNVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489593; c=relaxed/simple;
	bh=08tPQ2SlXpT/44pKgI7sMtclAsc/NvTJBw8wqh+v9xs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWEuVGrDJrleG5nUOJtyksXn0s/lmAv++q1VO1elm7GpZekp8HFrovDhtpKYqFz2ZYsouXNGsYsZk/2vghP/vlQEfFQBHyD4s7kvXUXL/8my/FxNSlpmjeV6MEO6nVRC8q9rxkyNsi8QjJRi92Sq3mPmiL8U33F5in6xcaYkrLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 4DwZo0Q/SYiVPE5W+1omwg==
X-CSE-MsgGUID: iwUK2FoqT8SRP/yqX9dKmg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 May 2026 17:53:11 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C644C4010DEB;
	Mon, 11 May 2026 17:53:07 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:15 +0200
Subject: [PATCH net-next v4 12/13] net: renesas: rswitch: add handler for
 FDB notification
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-12-a5a225f8faae@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=8906;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=08tPQ2SlXpT/44pKgI7sMtclAsc/NvTJBw8wqh+v9xs=;
 b=1OJi3o2s2+M7fwDfqUMdNjsteDzFg7qDx+wMZOETHCS4QZ2N0P27une68Pt2uFn7nVW/3z/fs
 yIqifQMCGl+AfBm4gce8FSItD0Jzdai59tm+rXTphg68hyAssNbY9F+
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: 025CE50AC68
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-32352-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Action: no action

The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC address
to the GWCA and adds a static rule to the MAC table.
The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h    |   9 ++
 drivers/net/ethernet/renesas/rswitch_l2.c | 196 ++++++++++++++++++++++++++----
 2 files changed, 182 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 949f0cb3c64e..3689463ddb1d 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1213,11 +1213,20 @@ struct rswitch_private {
 	bool etha_no_runtime_change;
 	bool gwca_halt;
 	struct net_device *offload_brdev;
+	netdevice_tracker dev_tracker;
 
 	enum hwtstamp_tx_types tstamp_tx_ctrl;
 	enum hwtstamp_rx_filters tstamp_rx_ctrl;
 };
 
+struct rswitch_switchdev_event_work {
+	struct work_struct work;
+	struct switchdev_notifier_fdb_info fdb_info;
+	struct net_device *ndev;
+	struct rswitch_private *priv;
+	unsigned long event;
+};
+
 bool is_rdev(const struct net_device *ndev);
 void rswitch_modify(void __iomem *addr, enum rswitch_reg reg, u32 clear, u32 set);
 int rswitch_reg_wait(void __iomem *addr, u32 offs, u32 mask, u32 expected);
diff --git a/drivers/net/ethernet/renesas/rswitch_l2.c b/drivers/net/ethernet/renesas/rswitch_l2.c
index 06c61c54db72..24d659576f62 100644
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
@@ -285,6 +269,172 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
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
+	if (is_rdev(ndev))
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
+	netdev_put(ndev, &switchdev_work->priv->dev_tracker);
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
+
+	priv = container_of(nb, struct rswitch_private, rswitch_switchdev_nb);
+
+	switch (event) {
+	case SWITCHDEV_FDB_ADD_TO_DEVICE:
+		fallthrough;
+	case SWITCHDEV_FDB_DEL_TO_DEVICE:
+		switchdev_work = kzalloc(sizeof(*switchdev_work), GFP_ATOMIC);
+
+		if (!switchdev_work)
+			return NOTIFY_BAD;
+
+		switchdev_work->ndev = info->dev;
+		switchdev_work->priv = priv;
+		switchdev_work->event = event;
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
+		ether_addr_copy((u8 *)switchdev_work->fdb_info.addr,
+				fdb_info->addr);
+		netdev_hold(ndev, &priv->dev_tracker, GFP_ATOMIC);
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

-- 
2.43.0


