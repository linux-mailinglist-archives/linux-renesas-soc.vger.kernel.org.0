Return-Path: <linux-renesas-soc+bounces-32359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK2MGsSdAWoHggEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32359-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:13:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA950AAF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 11:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A5BF30205FF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 May 2026 09:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7603CF660;
	Mon, 11 May 2026 08:57:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232753CF674;
	Mon, 11 May 2026 08:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489870; cv=none; b=WOp6OcYJAbhm7gY5HvA7vuagsvu9eYdrZTE34h37hekwQjMGLFwac9jP8TvT7uNL3LWbEf0+PdwbvxTI1X1zRyp/PEof8etAGHfaDW3jc3HK4fu7+kMENwlCve/Ov0Xr9QCTnOPbM2KPLXAy45Pk2lzMdg935gLuryAEe0B+oeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489870; c=relaxed/simple;
	bh=BK4EhySTkA3ZOziO+g6xAlQYH+gxhg9yeiDTQtpN6IE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nBRMAzg9FIa0Bt76Tkiu+KIoeZXU4yhrx5FHpc8RtpsZaK8/+QFRuEC2xrFeghisEcOSm+NMrIwIEKcejQc47zUwr7RI8MCSydl+8orL2v+T74tobs/c2BksIw0fBWZUvpxuEJH7ngSI8P8Ch2Ucq+wuW04U6BW2hYuQ0GNvfig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: 6Ck5V8yqT8WvcbqrBUeWCA==
X-CSE-MsgGUID: l+UWU5y1R9GxX3gtFeLoxQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 May 2026 17:52:45 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id CFC114009A31;
	Mon, 11 May 2026 17:52:42 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Mon, 11 May 2026 10:52:08 +0200
Subject: [PATCH net-next v4 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-rswitch_add_vlans-v4-5-a5a225f8faae@renesas.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778489544; l=8735;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=BK4EhySTkA3ZOziO+g6xAlQYH+gxhg9yeiDTQtpN6IE=;
 b=NeQ1zwXSjSn7k/H8SqaRzia+VMx1B8sBbbH+KOPhXJ6P1lQwPsuIZE2J06A2ydzwU15nqiu3W
 1Kms3vabOX9CadlidIe2uGCEJo8EJTsLA5Wp7xrAqMZhWOd5Wzi47a2
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Rspamd-Queue-Id: DBAA950AAF6
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32359-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.987];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Packets with unknown MAC address cannot be handled by the HW forwarding.
These need to be forwarded, via an exception path, to the network driver.

Creates a queue for the exeption path. Packets received with unknown
src/dst address need to be passed to the CPU. The received packet does not
have the correct source port information, this is derived from the
descriptor and added to the new queue. The received packet is added to the
new queue and sent to the CPU for MAC learning. The CPU will broadcast the
received packet, to all ports. This is how the HW learns the new MAC
address.

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.h      |  2 +
 drivers/net/ethernet/renesas/rswitch_main.c | 94 ++++++++++++++++++++++++++---
 2 files changed, 89 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index e56c15dd4ecd..8415f52a239e 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -1148,6 +1148,7 @@ struct rswitch_gwca {
 	struct rswitch_gwca_queue *queues;
 	int num_queues;
 	struct rswitch_gwca_queue ts_queue;
+	struct rswitch_gwca_queue *l2_shared_rx_queue;
 	DECLARE_BITMAP(used, RSWITCH_MAX_NUM_QUEUES);
 	u32 tx_irq_bits[RSWITCH_NUM_IRQ_REGS];
 	u32 rx_irq_bits[RSWITCH_NUM_IRQ_REGS];
@@ -1162,6 +1163,7 @@ struct rswitch_device {
 	void __iomem *addr;
 	struct rswitch_gwca_queue *tx_queue;
 	struct rswitch_gwca_queue *rx_queue;
+	struct rswitch_gwca_queue *rx_old_queue;
 	struct sk_buff *ts_skb[TS_TAGS_PER_PORT];
 	DECLARE_BITMAP(ts_skb_used, TS_TAGS_PER_PORT);
 	bool disabled;
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index e05c42db5f4c..bf26c1a3384a 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -682,6 +682,34 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
 	return rswitch_gwca_queue_ext_ts_format(ndev->dev.parent, priv, rdev->rx_queue);
 }
 
+static int rswitch_shared_rx_queue_alloc(struct rswitch_private *priv)
+{
+	struct rswitch_gwca *gwca = &priv->gwca;
+	struct device *dev = &priv->pdev->dev;
+
+	int err;
+
+	gwca->l2_shared_rx_queue = rswitch_gwca_get(priv);
+	if (!gwca->l2_shared_rx_queue)
+		return -EBUSY;
+
+	err = rswitch_gwca_queue_alloc(NULL, priv, gwca->l2_shared_rx_queue, false, RX_RING_SIZE);
+	if (err < 0) {
+		rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
+		return err;
+	}
+
+	return rswitch_gwca_queue_ext_ts_format(dev, priv, gwca->l2_shared_rx_queue);
+}
+
+static void rswitch_shared_rx_queue_free(struct rswitch_private *priv)
+{
+	struct rswitch_gwca *gwca = &priv->gwca;
+
+	rswitch_gwca_queue_free(&priv->pdev->dev, gwca->l2_shared_rx_queue);
+	rswitch_gwca_put(priv, gwca->l2_shared_rx_queue);
+}
+
 static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 {
 	unsigned int i;
@@ -719,6 +747,10 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 			return err;
 	}
 
+	err = rswitch_shared_rx_queue_alloc(priv);
+	if (err < 0)
+		return err;
+
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
 }
 
@@ -730,6 +762,8 @@ static int rswitch_gwca_hw_deinit(struct rswitch_private *priv)
 	if (err < 0)
 		return err;
 
+	rswitch_shared_rx_queue_free(priv);
+
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
 }
 
@@ -938,10 +972,15 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 
 	if (napi_complete_done(napi, budget - quota)) {
 		spin_lock_irqsave(&priv->lock, flags);
+		if (rdev->rx_old_queue) {
+			rdev->rx_queue = rdev->rx_old_queue;
+			rdev->rx_old_queue = NULL;
+		}
 		if (test_bit(rdev->port, priv->opened_ports)) {
 			rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
 			rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
 		}
+		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, true);
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
@@ -954,15 +993,40 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	return 0;
 }
 
-static void rswitch_queue_interrupt(struct net_device *ndev)
+static void rswitch_queue_interrupt(struct rswitch_private *priv, struct rswitch_gwca_queue *gq)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_ext_ts_desc *desc;
+	struct rswitch_device *rdev;
+	struct net_device *ndev;
+	unsigned int rx_q_index;
+	u32 spn;
+
+	rdev = netdev_priv(gq->ndev);
+	rx_q_index = rdev->rx_queue->index;
+
+/* If we receive a shared queue through the exception path, it will be missing the ndev
+ * pointer. This needs to be added to be able to determine from which port the packet was
+ * received. Then we temporarily exchange the rx_queue pointer in rdev. This will be
+ * restored after the packet has been processed.
+ */
+
+	if (gq->index == priv->gwca.l2_shared_rx_queue->index) {
+		desc = &gq->rx_ring[gq->cur];
+		spn = FIELD_GET(SPN, desc->info1);
+		ndev = priv->rdev[spn]->ndev;
+		rdev = netdev_priv(ndev);
+		gq->ndev = ndev;
+		/* store original rx_queue */
+		rdev->rx_old_queue = rdev->rx_queue;
+		rdev->rx_queue = gq;
+	}
 
 	if (napi_schedule_prep(&rdev->napi)) {
-		spin_lock(&rdev->priv->lock);
-		rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
-		rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
-		spin_unlock(&rdev->priv->lock);
+		spin_lock(&priv->lock);
+		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false);
+		rswitch_enadis_data_irq(priv, rx_q_index, false);
+		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, false);
+		spin_unlock(&priv->lock);
 		__napi_schedule(&rdev->napi);
 	}
 }
@@ -980,7 +1044,7 @@ static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
 			continue;
 
 		rswitch_ack_data_irq(priv, gq->index);
-		rswitch_queue_interrupt(gq->ndev);
+		rswitch_queue_interrupt(priv, gq);
 	}
 
 	return IRQ_HANDLED;
@@ -1517,6 +1581,14 @@ static int rswitch_serdes_set_params(struct rswitch_device *rdev)
 	return phy_set_speed(rdev->serdes, rdev->etha->speed);
 }
 
+static void rswitch_etha_set_exception_path(struct rswitch_private *priv)
+{
+	iowrite32(FDMACUFEF, priv->addr + FWCEPRC2);
+	iowrite32(FIELD_PREP(EPCS, GWCA_INDEX) |
+		  FIELD_PREP(EPCSD, priv->gwca.l2_shared_rx_queue->index),
+		  priv->addr + FWCEPTC);
+}
+
 static int rswitch_ether_port_init_one(struct rswitch_device *rdev)
 {
 	int err;
@@ -1570,6 +1642,8 @@ static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 	unsigned int i;
 	int err;
 
+	rswitch_etha_set_exception_path(priv);
+
 	rswitch_for_each_enabled_port(priv, i) {
 		err = rswitch_ether_port_init_one(priv->rdev[i]);
 		if (err)
@@ -1620,6 +1694,7 @@ static int rswitch_open(struct net_device *ndev)
 	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, true);
+	rswitch_enadis_data_irq(rdev->priv, rdev->priv->gwca.l2_shared_rx_queue->index, true);
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
 	phy_start(ndev->phydev);
@@ -1646,6 +1721,7 @@ static int rswitch_stop(struct net_device *ndev)
 	spin_lock_irqsave(&rdev->priv->lock, flags);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
+	rswitch_enadis_data_irq(rdev->priv, rdev->priv->gwca.l2_shared_rx_queue->index, false);
 	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
@@ -1953,6 +2029,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index
 	rdev->port = index;
 	rdev->etha = &priv->etha[index];
 	rdev->addr = priv->addr;
+	rdev->rx_old_queue = NULL;
 
 	ndev->base_addr = (unsigned long)rdev->addr;
 	snprintf(ndev->name, IFNAMSIZ, "tsn%d", index);
@@ -2170,6 +2247,9 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
 	priv->gwca.index = AGENT_INDEX_GWCA;
 	priv->gwca.num_queues = min(RSWITCH_NUM_PORTS * NUM_QUEUES_PER_NDEV,
 				    RSWITCH_MAX_NUM_QUEUES);
+	/* One extra queue for L2 switch reception */
+	priv->gwca.num_queues = min(priv->gwca.num_queues + 1,
+				    RSWITCH_MAX_NUM_QUEUES);
 	priv->gwca.queues = devm_kcalloc(&pdev->dev, priv->gwca.num_queues,
 					 sizeof(*priv->gwca.queues), GFP_KERNEL);
 	if (!priv->gwca.queues)

-- 
2.43.0


