Return-Path: <linux-renesas-soc+bounces-30410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLzVFUZAxmm7HgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:31:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C0340FFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 09:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 17E29303AF1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 08:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4163D88F5;
	Fri, 27 Mar 2026 08:28:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C101C3D6CAC;
	Fri, 27 Mar 2026 08:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600087; cv=none; b=ikMChwwKXrXmoMFenE3NQRjTtZJy+flhRJ6pyRAedRNGalceyBCyBJrsGW7LfJfMYqNQGEWPbObpEk2R8+5PPJuuFmlBey/jzhOl/mc5nXLtp2J2FPJYP3MewJ3SzgdoXBW44X9uffljTOIUtOD6IkC6WruN7NgwjA9DxcWQFCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600087; c=relaxed/simple;
	bh=pqPX66nqzY6BalxpifRIhDeL3aUrNVLAlaxPrOMewJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfOpApMXnoVc0DP0tbKVTT8o7odjQvm8KGag9yMVZ4R6xVw2AQcZdMa7MtCaWcwkJU6kWhb0n4zdlcVE7X5iHs739XcoROR0wD8UwerIkVhtDzqpKvqmR4KnSCbI/lueBijZSmnEfc+frGko1UIGttZDTn8YAB97OiJOuD7FLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: cA5nRibiTg2cDDYm7ENZJQ==
X-CSE-MsgGUID: fkyIQWNHQs2DwHnyZU2+gg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 27 Mar 2026 17:28:01 +0900
Received: from [127.0.1.1] (unknown [10.226.78.135])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 976194012274;
	Fri, 27 Mar 2026 17:27:58 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Fri, 27 Mar 2026 09:27:35 +0100
Subject: [PATCH net-next v2 05/13] net: renesas: rswitch: add exception
 path for packets with unknown dst MAC
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-rswitch_add_vlans-v2-5-d7f4358ca57a@renesas.com>
References: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
In-Reply-To: <20260327-rswitch_add_vlans-v2-0-d7f4358ca57a@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774600062; l=7240;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=pqPX66nqzY6BalxpifRIhDeL3aUrNVLAlaxPrOMewJM=;
 b=fCThGlAAIqnX7UO6/3EHguo2Ju1ulnmvynh4xzUg82KQQEhOnq1Y0WlO1bg66JtUAJDAsWeNR
 Fn7tYAKpYcOD6bt6Vr6oPEXYDIWIwSSAE1tfuqDTCFLiV2F+3t4XI+a
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-30410-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D20C0340FFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 drivers/net/ethernet/renesas/rswitch.h      |  1 +
 drivers/net/ethernet/renesas/rswitch_main.c | 80 ++++++++++++++++++++++++++---
 2 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 15d3fa48b0e3..bf123b564ed1 100644
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
diff --git a/drivers/net/ethernet/renesas/rswitch_main.c b/drivers/net/ethernet/renesas/rswitch_main.c
index d404bc41bd1e..f8ceb7f66903 100644
--- a/drivers/net/ethernet/renesas/rswitch_main.c
+++ b/drivers/net/ethernet/renesas/rswitch_main.c
@@ -680,6 +680,34 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
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
@@ -717,6 +745,12 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 			return err;
 	}
 
+	err = rswitch_shared_rx_queue_alloc(priv);
+	if (err < 0) {
+		rswitch_shared_rx_queue_free(priv);
+		return err;
+	}
+
 	return rswitch_gwca_change_mode(priv, GWMC_OPC_OPERATION);
 }
 
@@ -940,6 +974,7 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 			rswitch_enadis_data_irq(priv, rdev->tx_queue->index, true);
 			rswitch_enadis_data_irq(priv, rdev->rx_queue->index, true);
 		}
+		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, true);
 		spin_unlock_irqrestore(&priv->lock, flags);
 	}
 
@@ -952,15 +987,31 @@ static int rswitch_poll(struct napi_struct *napi, int budget)
 	return 0;
 }
 
-static void rswitch_queue_interrupt(struct net_device *ndev)
+static void rswitch_queue_interrupt(struct rswitch_private *priv, struct rswitch_gwca_queue *gq)
 {
-	struct rswitch_device *rdev = netdev_priv(ndev);
+	struct rswitch_ext_ts_desc *desc;
+	struct rswitch_device *rdev;
+	struct net_device *ndev;
+	u32 spn;
+
+	if (gq->index == priv->gwca.l2_shared_rx_queue->index) {
+		desc = &gq->rx_ring[gq->cur];
+		spn = FIELD_GET(SPN, desc->info1);
+		ndev = priv->rdev[spn]->ndev;
+		rdev = netdev_priv(ndev);
+		gq->ndev = ndev;
+		rdev->rx_queue = gq;
+	} else {
+		rdev = netdev_priv(gq->ndev);
+	}
+
 
 	if (napi_schedule_prep(&rdev->napi)) {
-		spin_lock(&rdev->priv->lock);
-		rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
-		rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
-		spin_unlock(&rdev->priv->lock);
+		spin_lock(&priv->lock);
+		rswitch_enadis_data_irq(priv, rdev->tx_queue->index, false);
+		rswitch_enadis_data_irq(priv, rdev->rx_queue->index, false);
+		rswitch_enadis_data_irq(priv, priv->gwca.l2_shared_rx_queue->index, false);
+		spin_unlock(&priv->lock);
 		__napi_schedule(&rdev->napi);
 	}
 }
@@ -978,7 +1029,7 @@ static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
 			continue;
 
 		rswitch_ack_data_irq(priv, gq->index);
-		rswitch_queue_interrupt(gq->ndev);
+		rswitch_queue_interrupt(priv, gq);
 	}
 
 	return IRQ_HANDLED;
@@ -1513,6 +1564,14 @@ static int rswitch_serdes_set_params(struct rswitch_device *rdev)
 	return phy_set_speed(rdev->serdes, rdev->etha->speed);
 }
 
+static void rswitch_etha_set_exception_path(struct rswitch_private *priv)
+{
+	iowrite32(FDMACUFEF, priv->addr + FWCEPRC2);
+	iowrite32(FIELD_PREP(EPCSD, priv->gwca.l2_shared_rx_queue->index) |
+			FIELD_PREP(EPCSD, priv->gwca.l2_shared_rx_queue->index),
+			priv->addr + FWCEPTC);
+}
+
 static int rswitch_ether_port_init_one(struct rswitch_device *rdev)
 {
 	int err;
@@ -1566,6 +1625,8 @@ static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 	unsigned int i;
 	int err;
 
+	rswitch_etha_set_exception_path(priv);
+
 	rswitch_for_each_enabled_port(priv, i) {
 		err = rswitch_ether_port_init_one(priv->rdev[i]);
 		if (err)
@@ -1616,6 +1677,7 @@ static int rswitch_open(struct net_device *ndev)
 	bitmap_set(rdev->priv->opened_ports, rdev->port, 1);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, true);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, true);
+	rswitch_enadis_data_irq(rdev->priv, rdev->priv->gwca.l2_shared_rx_queue->index, true);
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
 	phy_start(ndev->phydev);
@@ -1642,6 +1704,7 @@ static int rswitch_stop(struct net_device *ndev)
 	spin_lock_irqsave(&rdev->priv->lock, flags);
 	rswitch_enadis_data_irq(rdev->priv, rdev->tx_queue->index, false);
 	rswitch_enadis_data_irq(rdev->priv, rdev->rx_queue->index, false);
+	rswitch_enadis_data_irq(rdev->priv, rdev->priv->gwca.l2_shared_rx_queue->index, false);
 	bitmap_clear(rdev->priv->opened_ports, rdev->port, 1);
 	spin_unlock_irqrestore(&rdev->priv->lock, flags);
 
@@ -2166,6 +2229,9 @@ static int renesas_eth_sw_probe(struct platform_device *pdev)
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


