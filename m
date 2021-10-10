Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEFE427FC4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 10 Oct 2021 09:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbhJJHbw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 10 Oct 2021 03:31:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:23021 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231192AbhJJHbt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 03:31:49 -0400
X-IronPort-AV: E=Sophos;i="5.85,362,1624287600"; 
   d="scan'208";a="96694930"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Oct 2021 16:29:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 60D3D4001958;
        Sun, 10 Oct 2021 16:29:47 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Sergey Shtylyov <s.shtylyov@omp.ru>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>,
        Adam Ford <aford173@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Yuusuke Ashizuka <ashiduka@fujitsu.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v2 07/14] ravb: Add carrier_counters to struct ravb_hw_info
Date:   Sun, 10 Oct 2021 08:29:13 +0100
Message-Id: <20211010072920.20706-8-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211010072920.20706-1-biju.das.jz@bp.renesas.com>
References: <20211010072920.20706-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L E-MAC supports carrier counters.
Add a carrier_counter hw feature bit to struct ravb_hw_info
to add this feature only for RZ/G2L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
V1->V2:
 * No change
RFC->V1:
 * Moved carrier_counters near to tx_counters.
 * removed CXR55 and CXR56 registers as it is rx related registers.
 * Retained Sergey's Rb tag as it is trivial change.
RFC changes:
 * Added Sergey's Rb tag.
---
 drivers/net/ethernet/renesas/ravb.h      | 3 +++
 drivers/net/ethernet/renesas/ravb_main.c | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 99164318db26..527e865dee81 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -196,6 +196,8 @@ enum ravb_reg {
 	MAHR	= 0x05c0,
 	MALR	= 0x05c8,
 	TROCR	= 0x0700,	/* R-Car Gen3 and RZ/G2L only */
+	CXR41	= 0x0708,	/* RZ/G2L only */
+	CXR42	= 0x0710,	/* RZ/G2L only */
 	CEFCR	= 0x0740,
 	FRECR	= 0x0748,
 	TSFRCR	= 0x0750,
@@ -1017,6 +1019,7 @@ struct ravb_hw_info {
 	/* hardware features */
 	unsigned internal_delay:1;	/* AVB-DMAC has internal delays */
 	unsigned tx_counters:1;		/* E-MAC has TX counters */
+	unsigned carrier_counters:1;	/* E-MAC has carrier counters */
 	unsigned multi_irqs:1;		/* AVB-DMAC and E-MAC has multiple irqs */
 	unsigned gptp:1;		/* AVB-DMAC has gPTP support */
 	unsigned ccc_gac:1;		/* AVB-DMAC has gPTP support active in config mode */
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e93c676d8f57..eefff19d1739 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2053,6 +2053,13 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
 		ravb_write(ndev, 0, TROCR);	/* (write clear) */
 	}
 
+	if (info->carrier_counters) {
+		nstats->collisions += ravb_read(ndev, CXR41);
+		ravb_write(ndev, 0, CXR41);	/* (write clear) */
+		nstats->tx_carrier_errors += ravb_read(ndev, CXR42);
+		ravb_write(ndev, 0, CXR42);	/* (write clear) */
+	}
+
 	nstats->rx_packets = stats0->rx_packets;
 	nstats->tx_packets = stats0->tx_packets;
 	nstats->rx_bytes = stats0->rx_bytes;
@@ -2432,6 +2439,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.rx_max_buf_size = SZ_8K,
 	.aligned_tx = 1,
 	.tx_counters = 1,
+	.carrier_counters = 1,
 	.half_duplex = 1,
 };
 
-- 
2.17.1

