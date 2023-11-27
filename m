Return-Path: <linux-renesas-soc+bounces-278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 424647F9F0C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 12:54:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E5CD62815E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Nov 2023 11:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F24B21E501;
	Mon, 27 Nov 2023 11:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8547A101;
	Mon, 27 Nov 2023 03:53:41 -0800 (PST)
X-IronPort-AV: E=Sophos;i="6.04,230,1695654000"; 
   d="scan'208";a="184395874"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Nov 2023 20:53:40 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E5811400C4CD;
	Mon, 27 Nov 2023 20:53:39 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: s.shtylyov@omp.ru,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next 2/9] net: rswitch: Use unsigned int for desc related array index
Date: Mon, 27 Nov 2023 20:53:27 +0900
Message-Id: <20231127115334.3670790-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
References: <20231127115334.3670790-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Array index should not be negative, so use unsigned int for
descriptors related array index.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/Makefile  |  1 -
 drivers/net/ethernet/renesas/rswitch.c | 88 ++++++++++++++------------
 drivers/net/ethernet/renesas/rswitch.h | 14 ++--
 3 files changed, 56 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/renesas/Makefile b/drivers/net/ethernet/renesas/Makefile
index 9070acfd6aaf..f9cfd9750c1c 100644
--- a/drivers/net/ethernet/renesas/Makefile
+++ b/drivers/net/ethernet/renesas/Makefile
@@ -2,7 +2,6 @@
 #
 # Makefile for the Renesas network device drivers
 #
-
 obj-$(CONFIG_SH_ETH) += sh_eth.o
 
 ravb-objs := ravb_main.o ravb_ptp.o
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 8c03c0e18003..0928003ad245 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -56,7 +56,8 @@ static void rswitch_clock_disable(struct rswitch_private *priv)
 	iowrite32(RCDC_RCD, priv->addr + RCDC);
 }
 
-static bool rswitch_agent_clock_is_enabled(void __iomem *coma_addr, int port)
+static bool rswitch_agent_clock_is_enabled(void __iomem *coma_addr,
+					   unsigned int port)
 {
 	u32 val = ioread32(coma_addr + RCEC);
 
@@ -66,7 +67,8 @@ static bool rswitch_agent_clock_is_enabled(void __iomem *coma_addr, int port)
 		return false;
 }
 
-static void rswitch_agent_clock_ctrl(void __iomem *coma_addr, int port, int enable)
+static void rswitch_agent_clock_ctrl(void __iomem *coma_addr, unsigned int port,
+				     int enable)
 {
 	u32 val;
 
@@ -100,7 +102,7 @@ static void rswitch_coma_init(struct rswitch_private *priv)
 /* R-Switch-2 block (TOP) */
 static void rswitch_top_init(struct rswitch_private *priv)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < RSWITCH_MAX_NUM_QUEUES; i++)
 		iowrite32((i / 16) << (GWCA_INDEX * 8), priv->addr + TPEMIMC7(i));
@@ -109,7 +111,7 @@ static void rswitch_top_init(struct rswitch_private *priv)
 /* Forwarding engine block (MFWD) */
 static void rswitch_fwd_init(struct rswitch_private *priv)
 {
-	int i;
+	unsigned int i;
 
 	/* For ETHA */
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
@@ -166,7 +168,7 @@ static int rswitch_gwca_axi_ram_reset(struct rswitch_private *priv)
 static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool tx)
 {
 	u32 *mask = tx ? priv->gwca.tx_irq_bits : priv->gwca.rx_irq_bits;
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
 		if (dis[i] & mask[i])
@@ -178,7 +180,7 @@ static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool
 
 static void rswitch_get_data_irq_status(struct rswitch_private *priv, u32 *dis)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < RSWITCH_NUM_IRQ_REGS; i++) {
 		dis[i] = ioread32(priv->addr + GWDIS(i));
@@ -186,23 +188,26 @@ static void rswitch_get_data_irq_status(struct rswitch_private *priv, u32 *dis)
 	}
 }
 
-static void rswitch_enadis_data_irq(struct rswitch_private *priv, int index, bool enable)
+static void rswitch_enadis_data_irq(struct rswitch_private *priv,
+				    unsigned int index, bool enable)
 {
 	u32 offs = enable ? GWDIE(index / 32) : GWDID(index / 32);
 
 	iowrite32(BIT(index % 32), priv->addr + offs);
 }
 
-static void rswitch_ack_data_irq(struct rswitch_private *priv, int index)
+static void rswitch_ack_data_irq(struct rswitch_private *priv,
+				 unsigned int index)
 {
 	u32 offs = GWDIS(index / 32);
 
 	iowrite32(BIT(index % 32), priv->addr + offs);
 }
 
-static int rswitch_next_queue_index(struct rswitch_gwca_queue *gq, bool cur, int num)
+static unsigned int rswitch_next_queue_index(struct rswitch_gwca_queue *gq,
+					     bool cur, unsigned int num)
 {
-	int index = cur ? gq->cur : gq->dirty;
+	unsigned int index = cur ? gq->cur : gq->dirty;
 
 	if (index + num >= gq->ring_size)
 		index = (index + num) % gq->ring_size;
@@ -212,7 +217,7 @@ static int rswitch_next_queue_index(struct rswitch_gwca_queue *gq, bool cur, int
 	return index;
 }
 
-static int rswitch_get_num_cur_queues(struct rswitch_gwca_queue *gq)
+static unsigned int rswitch_get_num_cur_queues(struct rswitch_gwca_queue *gq)
 {
 	if (gq->cur >= gq->dirty)
 		return gq->cur - gq->dirty;
@@ -231,9 +236,10 @@ static bool rswitch_is_queue_rxed(struct rswitch_gwca_queue *gq)
 }
 
 static int rswitch_gwca_queue_alloc_skb(struct rswitch_gwca_queue *gq,
-					int start_index, int num)
+					unsigned int start_index,
+					unsigned int num)
 {
-	int i, index;
+	unsigned int i, index;
 
 	for (i = 0; i < num; i++) {
 		index = (i + start_index) % gq->ring_size;
@@ -248,7 +254,7 @@ static int rswitch_gwca_queue_alloc_skb(struct rswitch_gwca_queue *gq,
 	return 0;
 
 err:
-	for (i--; i >= 0; i--) {
+	for (; i-- > 0; ) {
 		index = (i + start_index) % gq->ring_size;
 		dev_kfree_skb(gq->skbs[index]);
 		gq->skbs[index] = NULL;
@@ -260,7 +266,7 @@ static int rswitch_gwca_queue_alloc_skb(struct rswitch_gwca_queue *gq,
 static void rswitch_gwca_queue_free(struct net_device *ndev,
 				    struct rswitch_gwca_queue *gq)
 {
-	int i;
+	unsigned int i;
 
 	if (!gq->dir_tx) {
 		dma_free_coherent(ndev->dev.parent,
@@ -294,9 +300,9 @@ static void rswitch_gwca_ts_queue_free(struct rswitch_private *priv)
 static int rswitch_gwca_queue_alloc(struct net_device *ndev,
 				    struct rswitch_private *priv,
 				    struct rswitch_gwca_queue *gq,
-				    bool dir_tx, int ring_size)
+				    bool dir_tx, unsigned int ring_size)
 {
-	int i, bit;
+	unsigned int i, bit;
 
 	gq->dir_tx = dir_tx;
 	gq->ring_size = ring_size;
@@ -351,11 +357,11 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 				     struct rswitch_private *priv,
 				     struct rswitch_gwca_queue *gq)
 {
-	int ring_size = sizeof(struct rswitch_ext_desc) * gq->ring_size;
+	unsigned int ring_size = sizeof(struct rswitch_ext_desc) * gq->ring_size;
 	struct rswitch_ext_desc *desc;
 	struct rswitch_desc *linkfix;
 	dma_addr_t dma_addr;
-	int i;
+	unsigned int i;
 
 	memset(gq->tx_ring, 0, ring_size);
 	for (i = 0, desc = gq->tx_ring; i < gq->ring_size; i++, desc++) {
@@ -387,7 +393,7 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 
 err:
 	if (!gq->dir_tx) {
-		for (i--, desc = gq->tx_ring; i >= 0; i--, desc++) {
+		for (desc = gq->tx_ring; i-- > 0; desc++) {
 			dma_addr = rswitch_desc_get_dptr(&desc->desc);
 			dma_unmap_single(ndev->dev.parent, dma_addr, PKT_BUF_SZ,
 					 DMA_FROM_DEVICE);
@@ -398,11 +404,12 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 }
 
 static void rswitch_gwca_ts_queue_fill(struct rswitch_private *priv,
-				       int start_index, int num)
+				       unsigned int start_index,
+				       unsigned int num)
 {
 	struct rswitch_gwca_queue *gq = &priv->gwca.ts_queue;
 	struct rswitch_ts_desc *desc;
-	int i, index;
+	unsigned int i, index;
 
 	for (i = 0; i < num; i++) {
 		index = (i + start_index) % gq->ring_size;
@@ -413,12 +420,13 @@ static void rswitch_gwca_ts_queue_fill(struct rswitch_private *priv,
 
 static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 					  struct rswitch_gwca_queue *gq,
-					  int start_index, int num)
+					  unsigned int start_index,
+					  unsigned int num)
 {
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_ext_ts_desc *desc;
+	unsigned int i, index;
 	dma_addr_t dma_addr;
-	int i, index;
 
 	for (i = 0; i < num; i++) {
 		index = (i + start_index) % gq->ring_size;
@@ -444,7 +452,7 @@ static int rswitch_gwca_queue_ext_ts_fill(struct net_device *ndev,
 
 err:
 	if (!gq->dir_tx) {
-		for (i--; i >= 0; i--) {
+		for (; i-- > 0; ) {
 			index = (i + start_index) % gq->ring_size;
 			desc = &gq->rx_ring[index];
 			dma_addr = rswitch_desc_get_dptr(&desc->desc);
@@ -460,7 +468,7 @@ static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
 					    struct rswitch_private *priv,
 					    struct rswitch_gwca_queue *gq)
 {
-	int ring_size = sizeof(struct rswitch_ext_ts_desc) * gq->ring_size;
+	unsigned int ring_size = sizeof(struct rswitch_ext_ts_desc) * gq->ring_size;
 	struct rswitch_ext_ts_desc *desc;
 	struct rswitch_desc *linkfix;
 	int err;
@@ -487,7 +495,7 @@ static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
 
 static int rswitch_gwca_linkfix_alloc(struct rswitch_private *priv)
 {
-	int i, num_queues = priv->gwca.num_queues;
+	unsigned int i, num_queues = priv->gwca.num_queues;
 	struct rswitch_gwca *gwca = &priv->gwca;
 	struct device *dev = &priv->pdev->dev;
 
@@ -537,7 +545,7 @@ static int rswitch_gwca_ts_queue_alloc(struct rswitch_private *priv)
 static struct rswitch_gwca_queue *rswitch_gwca_get(struct rswitch_private *priv)
 {
 	struct rswitch_gwca_queue *gq;
-	int index;
+	unsigned int index;
 
 	index = find_first_zero_bit(priv->gwca.used, priv->gwca.num_queues);
 	if (index >= priv->gwca.num_queues)
@@ -583,7 +591,7 @@ static void rswitch_txdmac_free(struct net_device *ndev)
 	rswitch_gwca_put(rdev->priv, rdev->tx_queue);
 }
 
-static int rswitch_txdmac_init(struct rswitch_private *priv, int index)
+static int rswitch_txdmac_init(struct rswitch_private *priv, unsigned int index)
 {
 	struct rswitch_device *rdev = priv->rdev[index];
 
@@ -617,7 +625,7 @@ static void rswitch_rxdmac_free(struct net_device *ndev)
 	rswitch_gwca_put(rdev->priv, rdev->rx_queue);
 }
 
-static int rswitch_rxdmac_init(struct rswitch_private *priv, int index)
+static int rswitch_rxdmac_init(struct rswitch_private *priv, unsigned int index)
 {
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
@@ -627,7 +635,8 @@ static int rswitch_rxdmac_init(struct rswitch_private *priv, int index)
 
 static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 {
-	int i, err;
+	unsigned int i;
+	int err;
 
 	err = rswitch_gwca_change_mode(priv, GWMC_OPC_DISABLE);
 	if (err < 0)
@@ -698,9 +707,10 @@ static bool rswitch_rx(struct net_device *ndev, int *quota)
 	struct rswitch_device *rdev = netdev_priv(ndev);
 	struct rswitch_gwca_queue *gq = rdev->rx_queue;
 	struct rswitch_ext_ts_desc *desc;
-	int limit, boguscnt, num, ret;
+	int limit, boguscnt, ret;
 	struct sk_buff *skb;
 	dma_addr_t dma_addr;
+	unsigned int num;
 	u16 pkt_len;
 	u32 get_ts;
 
@@ -768,7 +778,7 @@ static void rswitch_tx_free(struct net_device *ndev)
 	struct rswitch_ext_desc *desc;
 	dma_addr_t dma_addr;
 	struct sk_buff *skb;
-	int size;
+	unsigned int size;
 
 	for (; rswitch_get_num_cur_queues(gq) > 0;
 	     gq->dirty = rswitch_next_queue_index(gq, false, 1)) {
@@ -847,7 +857,7 @@ static void rswitch_queue_interrupt(struct net_device *ndev)
 static irqreturn_t rswitch_data_irq(struct rswitch_private *priv, u32 *dis)
 {
 	struct rswitch_gwca_queue *gq;
-	int i, index, bit;
+	unsigned int i, index, bit;
 
 	for (i = 0; i < priv->gwca.num_queues; i++) {
 		gq = &priv->gwca.queues[i];
@@ -914,8 +924,8 @@ static void rswitch_ts(struct rswitch_private *priv)
 	struct skb_shared_hwtstamps shhwtstamps;
 	struct rswitch_ts_desc *desc;
 	struct timespec64 ts;
+	unsigned int num;
 	u32 tag, port;
-	int num;
 
 	desc = &gq->ts_ring[gq->cur];
 	while ((desc->desc.die_dt & DT_MASK) != DT_FEMPTY_ND) {
@@ -1434,7 +1444,7 @@ static int rswitch_ether_port_init_all(struct rswitch_private *priv)
 
 static void rswitch_ether_port_deinit_all(struct rswitch_private *priv)
 {
-	int i;
+	unsigned int i;
 
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
 		phy_exit(priv->rdev[i]->serdes);
@@ -1689,7 +1699,7 @@ static const struct of_device_id renesas_eth_sw_of_table[] = {
 };
 MODULE_DEVICE_TABLE(of, renesas_eth_sw_of_table);
 
-static void rswitch_etha_init(struct rswitch_private *priv, int index)
+static void rswitch_etha_init(struct rswitch_private *priv, unsigned int index)
 {
 	struct rswitch_etha *etha = &priv->etha[index];
 
@@ -1705,7 +1715,7 @@ static void rswitch_etha_init(struct rswitch_private *priv, int index)
 	etha->psmcs = clk_get_rate(priv->clk) / 100000 / (25 * 2) - 1;
 }
 
-static int rswitch_device_alloc(struct rswitch_private *priv, int index)
+static int rswitch_device_alloc(struct rswitch_private *priv, unsigned int index)
 {
 	struct platform_device *pdev = priv->pdev;
 	struct rswitch_device *rdev;
@@ -1776,7 +1786,7 @@ static int rswitch_device_alloc(struct rswitch_private *priv, int index)
 	return err;
 }
 
-static void rswitch_device_free(struct rswitch_private *priv, int index)
+static void rswitch_device_free(struct rswitch_private *priv, unsigned int index)
 {
 	struct rswitch_device *rdev = priv->rdev[index];
 	struct net_device *ndev = rdev->ndev;
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 27c9d3872c0e..f1c7f7cdefc2 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -909,7 +909,7 @@ struct rswitch_ext_ts_desc {
 } __packed;
 
 struct rswitch_etha {
-	int index;
+	unsigned int index;
 	void __iomem *addr;
 	void __iomem *coma_addr;
 	bool external_phy;
@@ -938,12 +938,12 @@ struct rswitch_gwca_queue {
 
 	/* Common */
 	dma_addr_t ring_dma;
-	int ring_size;
-	int cur;
-	int dirty;
+	unsigned int ring_size;
+	unsigned int cur;
+	unsigned int dirty;
 
-	/* For [rt]_ring */
-	int index;
+	/* For [rt]x_ring */
+	unsigned int index;
 	bool dir_tx;
 	struct sk_buff **skbs;
 	struct net_device *ndev;	/* queue to ndev for irq */
@@ -959,7 +959,7 @@ struct rswitch_gwca_ts_info {
 
 #define RSWITCH_NUM_IRQ_REGS	(RSWITCH_MAX_NUM_QUEUES / BITS_PER_TYPE(u32))
 struct rswitch_gwca {
-	int index;
+	unsigned int index;
 	struct rswitch_desc *linkfix_table;
 	dma_addr_t linkfix_table_dma;
 	u32 linkfix_table_size;
-- 
2.34.1


