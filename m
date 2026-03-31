Return-Path: <linux-renesas-soc+bounces-30645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLd4H5Kdy2loJgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:10:26 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AEB367A18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:10:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B7813040B8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7A23EF0B0;
	Tue, 31 Mar 2026 10:04:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5923BED16;
	Tue, 31 Mar 2026 10:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774951491; cv=none; b=HpvFmJJnmbDsJWwPjwkmIU9ubzoqHRS5zEpagOsmw5w7Goe5PR0dB2bqw8S0ut7eMfvtlKEvveBldMrkeUTagqhkueH6ZuBkpQ4dtQShx2PEkYLyVQHcBLD4zhKHMuR0XFRBcVu3JDansIcEKWAFY9f9wrZ/A55/zLNYxkJo4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774951491; c=relaxed/simple;
	bh=3Lv1xwr4+L63Jy7K7ory2uKzTRGIdthOPGp5pOxxqZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmmagZvcQyb5kjYrWn0dSI/0VfIDhJwOndrN86CzSP/DTkWLCz8UDqr0G62ge2dLJC+2aU7GX1WaLtzX9XQhpfFQHORvjcsSW0eYQ+2sjarur0SV9bgD7Lof3Ce4UtwQdzAl/qtjHnQaSM0QngyGkEyo7HM8HrawVkQdCEIT+P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: hQ3ZbRB6S5u+CTRikRtlpA==
X-CSE-MsgGUID: polP+duBRLikVxq9ZoLEpw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Mar 2026 19:04:49 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 102E4416C827;
	Tue, 31 Mar 2026 19:04:45 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Tue, 31 Mar 2026 12:04:06 +0200
Subject: [PATCH net-next v3 12/13] net: renesas: rswitch: add handler for
 FDB notification
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-rswitch_add_vlans-v3-12-c37f41b1c556@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774951442; l=8841;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=3Lv1xwr4+L63Jy7K7ory2uKzTRGIdthOPGp5pOxxqZU=;
 b=L87QcBzIJbegNtxA/aWCh9BqTO73w9d5wdHQH6S52xUEAcWUy+huEeCXQ1AJuzDn0WXFY0na4
 8egi1LyOmRNAfGNba3/jA2nKERaiz+Z38KojKfMitm7l6nZZwlaaITS
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-30645-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michael.dege@renesas.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.955];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email,renesas.com:mid]
X-Rspamd-Queue-Id: 28AEB367A18
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The SWITCHDEV_FDB_ADD_TO_DEVICE notification writes the bridge MAC address
to the GWCA and adds a static rule to the MAC table.
The SWITCHDEV_FDB_DEL_TO_DEVICE removes the static rule from the MAC table.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h    |   8 ++
 drivers/net/ethernet/renesas/rswitch_l2.c | 205 ++++++++++++++++++++++++++----
 2 files changed, 190 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 6dfc53c6b985..443fc4e49602 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1217,6 +1217,14 @@ struct rswitch_private {
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
index f1c5c96027ba..ea95a87ed234 100644
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
@@ -285,6 +269,181 @@ static int rswitch_switchdev_blocking_event(struct notifier_block *nb,
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
+		break;
+	default:
+		break;
+	}
+
+out:
+	rtnl_unlock();
+
+	kfree(switchdev_work->fdb_info.addr);
+	kfree(switchdev_work);
+	dev_put(ndev);
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
+	int err;
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
+		dev_hold(ndev);
+		queue_work(system_long_wq, &switchdev_work->work);
+
+		break;
+	case SWITCHDEV_PORT_ATTR_SET:
+		err = switchdev_handle_port_attr_set(ndev, ptr,
+						     is_rdev,
+						     rswitch_port_attr_set);
+		return notifier_from_errno(err);
+
+		if (!is_rdev(ndev))
+			return NOTIFY_DONE;
+
+		return notifier_from_errno(-EOPNOTSUPP);
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


