Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3761F427CF6
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Oct 2021 21:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbhJITKU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Oct 2021 15:10:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58435 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229558AbhJITKT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Oct 2021 15:10:19 -0400
X-IronPort-AV: E=Sophos;i="5.85,361,1624287600"; 
   d="scan'208";a="96658991"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Oct 2021 04:08:22 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E0EA34001B64;
        Sun, 10 Oct 2021 04:08:18 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 04/14] ravb: Fillup ravb_rx_ring_free_gbeth() stub
Date:   Sat,  9 Oct 2021 20:07:52 +0100
Message-Id: <20211009190802.18585-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211009190802.18585-1-biju.das.jz@bp.renesas.com>
References: <20211009190802.18585-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fillup ravb_rx_ring_free_gbeth() function to support RZ/G2L.

This patch also renames ravb_rx_ring_free to ravb_rx_ring_free_rcar
to be consistent with the naming convention used in sh_eth driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
RFC->V1:
 * No change. Added Sergey's Rb tag.
RFC Changes:
 * moved "gbeth_rx_ring" to previous patch
 * started using "gbeth_rx_ring" instead of gbeth_rx_ring[q].
 * renamed ravb_rx_ring_free to ravb_rx_ring_free_rcar
---
 drivers/net/ethernet/renesas/ravb_main.c | 28 ++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 1a84713446c7..1fc2abd3dc0e 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -236,10 +236,30 @@ static int ravb_tx_free(struct net_device *ndev, int q, bool free_txed_only)
 
 static void ravb_rx_ring_free_gbeth(struct net_device *ndev, int q)
 {
-	/* Place holder */
+	struct ravb_private *priv = netdev_priv(ndev);
+	unsigned int ring_size;
+	unsigned int i;
+
+	if (!priv->gbeth_rx_ring)
+		return;
+
+	for (i = 0; i < priv->num_rx_ring[q]; i++) {
+		struct ravb_rx_desc *desc = &priv->gbeth_rx_ring[i];
+
+		if (!dma_mapping_error(ndev->dev.parent,
+				       le32_to_cpu(desc->dptr)))
+			dma_unmap_single(ndev->dev.parent,
+					 le32_to_cpu(desc->dptr),
+					 GBETH_RX_BUFF_MAX,
+					 DMA_FROM_DEVICE);
+	}
+	ring_size = sizeof(struct ravb_rx_desc) * (priv->num_rx_ring[q] + 1);
+	dma_free_coherent(ndev->dev.parent, ring_size, priv->gbeth_rx_ring,
+			  priv->rx_desc_dma[q]);
+	priv->gbeth_rx_ring = NULL;
 }
 
-static void ravb_rx_ring_free(struct net_device *ndev, int q)
+static void ravb_rx_ring_free_rcar(struct net_device *ndev, int q)
 {
 	struct ravb_private *priv = netdev_priv(ndev);
 	unsigned int ring_size;
@@ -2189,7 +2209,7 @@ static int ravb_mdio_release(struct ravb_private *priv)
 }
 
 static const struct ravb_hw_info ravb_gen3_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free,
+	.rx_ring_free = ravb_rx_ring_free_rcar,
 	.rx_ring_format = ravb_rx_ring_format,
 	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rcar_rx,
@@ -2214,7 +2234,7 @@ static const struct ravb_hw_info ravb_gen3_hw_info = {
 };
 
 static const struct ravb_hw_info ravb_gen2_hw_info = {
-	.rx_ring_free = ravb_rx_ring_free,
+	.rx_ring_free = ravb_rx_ring_free_rcar,
 	.rx_ring_format = ravb_rx_ring_format,
 	.alloc_rx_desc = ravb_alloc_rx_desc_rcar,
 	.receive = ravb_rcar_rx,
-- 
2.17.1

