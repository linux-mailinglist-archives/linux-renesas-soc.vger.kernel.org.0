Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5C707251D9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jun 2023 03:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233723AbjFGB44 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Jun 2023 21:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236368AbjFGB4z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Jun 2023 21:56:55 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC811196;
        Tue,  6 Jun 2023 18:56:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,222,1681138800"; 
   d="scan'208";a="162480707"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Jun 2023 10:56:51 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 530A5411C514;
        Wed,  7 Jun 2023 10:56:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com
Cc:     maciej.fijalkowski@intel.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH net-next v3 2/2] net: renesas: rswitch: Use hardware pause features
Date:   Wed,  7 Jun 2023 10:56:41 +0900
Message-Id: <20230607015641.1724057-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607015641.1724057-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230607015641.1724057-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since this driver used the "global rate limiter" feature of GWCA,
the TX perfromance of each port was reduced when multiple ports
transmitted frames simultaneously. To improve perfromance, remove
the use of the "global rate limiter" feature and use "hardware pause"
features of the following:
 - "per priority pause" of GWCA
 - "global pause" of COMA

Note that these features are not related to the ethernet PAUSE frame.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 36 ++++++++++----------------
 drivers/net/ethernet/renesas/rswitch.h |  7 +++++
 2 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 7bb0a6d594a0..84f62c77eb8f 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -90,6 +90,11 @@ static int rswitch_bpool_config(struct rswitch_private *priv)
 	return rswitch_reg_wait(priv->addr, CABPIRM, CABPIRM_BPR, CABPIRM_BPR);
 }
 
+static void rswitch_coma_init(struct rswitch_private *priv)
+{
+	iowrite32(CABPPFLC_INIT_VALUE, priv->addr + CABPPFLC0);
+}
+
 /* R-Switch-2 block (TOP) */
 static void rswitch_top_init(struct rswitch_private *priv)
 {
@@ -156,24 +161,6 @@ static int rswitch_gwca_axi_ram_reset(struct rswitch_private *priv)
 	return rswitch_reg_wait(priv->addr, GWARIRM, GWARIRM_ARR, GWARIRM_ARR);
 }
 
-static void rswitch_gwca_set_rate_limit(struct rswitch_private *priv, int rate)
-{
-	u32 gwgrlulc, gwgrlc;
-
-	switch (rate) {
-	case 1000:
-		gwgrlulc = 0x0000005f;
-		gwgrlc = 0x00010260;
-		break;
-	default:
-		dev_err(&priv->pdev->dev, "%s: This rate is not supported (%d)\n", __func__, rate);
-		return;
-	}
-
-	iowrite32(gwgrlulc, priv->addr + GWGRLULC);
-	iowrite32(gwgrlc, priv->addr + GWGRLC);
-}
-
 static bool rswitch_is_any_data_irq(struct rswitch_private *priv, u32 *dis, bool tx)
 {
 	u32 *mask = tx ? priv->gwca.tx_irq_bits : priv->gwca.rx_irq_bits;
@@ -402,7 +389,7 @@ static int rswitch_gwca_queue_format(struct net_device *ndev,
 	linkfix->die_dt = DT_LINKFIX;
 	rswitch_desc_set_dptr(linkfix, gq->ring_dma);
 
-	iowrite32(GWDCC_BALR | (gq->dir_tx ? GWDCC_DQT : 0) | GWDCC_EDE,
+	iowrite32(GWDCC_BALR | (gq->dir_tx ? GWDCC_DCP(GWCA_IPV_NUM) | GWDCC_DQT : 0) | GWDCC_EDE,
 		  priv->addr + GWDCC_OFFS(gq->index));
 
 	return 0;
@@ -500,7 +487,8 @@ static int rswitch_gwca_queue_ext_ts_format(struct net_device *ndev,
 	linkfix->die_dt = DT_LINKFIX;
 	rswitch_desc_set_dptr(linkfix, gq->ring_dma);
 
-	iowrite32(GWDCC_BALR | (gq->dir_tx ? GWDCC_DQT : 0) | GWDCC_ETS | GWDCC_EDE,
+	iowrite32(GWDCC_BALR | (gq->dir_tx ? GWDCC_DCP(GWCA_IPV_NUM) | GWDCC_DQT : 0) |
+		  GWDCC_ETS | GWDCC_EDE,
 		  priv->addr + GWDCC_OFFS(gq->index));
 
 	return 0;
@@ -649,7 +637,8 @@ static int rswitch_gwca_hw_init(struct rswitch_private *priv)
 	iowrite32(lower_32_bits(priv->gwca.ts_queue.ring_dma), priv->addr + GWTDCAC10);
 	iowrite32(upper_32_bits(priv->gwca.ts_queue.ring_dma), priv->addr + GWTDCAC00);
 	iowrite32(GWCA_TS_IRQ_BIT, priv->addr + GWTSDCC0);
-	rswitch_gwca_set_rate_limit(priv, priv->gwca.speed);
+
+	iowrite32(GWTPC_PPPL(GWCA_IPV_NUM), priv->addr + GWTPC0);
 
 	for (i = 0; i < RSWITCH_NUM_PORTS; i++) {
 		err = rswitch_rxdmac_init(priv, i);
@@ -1502,7 +1491,8 @@ static netdev_tx_t rswitch_start_xmit(struct sk_buff *skb, struct net_device *nd
 	rswitch_desc_set_dptr(&desc->desc, dma_addr);
 	desc->desc.info_ds = cpu_to_le16(skb->len);
 
-	desc->info1 = cpu_to_le64(INFO1_DV(BIT(rdev->etha->index)) | INFO1_FMT);
+	desc->info1 = cpu_to_le64(INFO1_DV(BIT(rdev->etha->index)) |
+				  INFO1_IPV(GWCA_IPV_NUM) | INFO1_FMT);
 	if (skb_shinfo(skb)->tx_flags & SKBTX_HW_TSTAMP) {
 		struct rswitch_gwca_ts_info *ts_info;
 
@@ -1772,6 +1762,8 @@ static int rswitch_init(struct rswitch_private *priv)
 	if (err < 0)
 		return err;
 
+	rswitch_coma_init(priv);
+
 	err = rswitch_gwca_linkfix_alloc(priv);
 	if (err < 0)
 		return -ENOMEM;
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index b3e0411b408e..bb9ed971a97c 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -48,6 +48,7 @@
 #define GWCA_NUM_IRQS		8
 #define GWCA_INDEX		0
 #define AGENT_INDEX_GWCA	3
+#define GWCA_IPV_NUM		0
 #define GWRO			RSWITCH_GWCA0_OFFSET
 
 #define GWCA_TS_IRQ_RESOURCE_NAME	"gwca0_rxts0"
@@ -768,11 +769,14 @@ enum rswitch_gwca_mode {
 #define GWARIRM_ARR		BIT(1)
 
 #define GWDCC_BALR		BIT(24)
+#define GWDCC_DCP_MASK		GENMASK(18, 16)
+#define GWDCC_DCP(prio)		FIELD_PREP(GWDCC_DCP_MASK, (prio))
 #define GWDCC_DQT		BIT(11)
 #define GWDCC_ETS		BIT(9)
 #define GWDCC_EDE		BIT(8)
 
 #define GWTRC(queue)		(GWTRC0 + (queue) / 32 * 4)
+#define GWTPC_PPPL(ipv)		BIT(ipv)
 #define GWDCC_OFFS(queue)	(GWDCC0 + (queue) * 4)
 
 #define GWDIS(i)		(GWDIS0 + (i) * 0x10)
@@ -789,6 +793,8 @@ enum rswitch_gwca_mode {
 #define CABPIRM_BPIOG		BIT(0)
 #define CABPIRM_BPR		BIT(1)
 
+#define CABPPFLC_INIT_VALUE	0x00800080
+
 /* MFWD */
 #define FWPC0_LTHTA		BIT(0)
 #define FWPC0_IP4UE		BIT(3)
@@ -863,6 +869,7 @@ enum DIE_DT {
 
 /* For transmission */
 #define INFO1_TSUN(val)		((u64)(val) << 8ULL)
+#define INFO1_IPV(prio)		((u64)(prio) << 28ULL)
 #define INFO1_CSD0(index)	((u64)(index) << 32ULL)
 #define INFO1_CSD1(index)	((u64)(index) << 40ULL)
 #define INFO1_DV(port_vector)	((u64)(port_vector) << 48ULL)
-- 
2.25.1

