Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44A0941F25B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 18:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355151AbhJAQpS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 12:45:18 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:53132 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355234AbhJAQpR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 12:45:17 -0400
X-IronPort-AV: E=Sophos;i="5.85,339,1624287600"; 
   d="scan'208";a="95827556"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Oct 2021 01:43:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.36])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 673524001DD6;
        Sat,  2 Oct 2021 01:43:29 +0900 (JST)
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
Subject: [PATCH 6/8] ravb: Add carrier_counters to struct ravb_hw_info
Date:   Fri,  1 Oct 2021 17:43:03 +0100
Message-Id: <20211001164305.8999-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211001164305.8999-1-biju.das.jz@bp.renesas.com>
References: <20211001164305.8999-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L E-MAC supports carrier counters.
Add a carrier_counter hw feature bit to struct ravb_hw_info
to add this feature only for RZ/G2L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
RFC->v1:
 * Added Sergey's Rb tag.
---
 drivers/net/ethernet/renesas/ravb.h      |  5 +++++
 drivers/net/ethernet/renesas/ravb_main.c | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/net/ethernet/renesas/ravb.h b/drivers/net/ethernet/renesas/ravb.h
index 1d50897a27f1..04aedde608e3 100644
--- a/drivers/net/ethernet/renesas/ravb.h
+++ b/drivers/net/ethernet/renesas/ravb.h
@@ -196,11 +196,15 @@ enum ravb_reg {
 	MAHR	= 0x05c0,
 	MALR	= 0x05c8,
 	TROCR	= 0x0700,	/* R-Car Gen3 and RZ/G2L only */
+	CXR41	= 0x0708,	/* RZ/G2L only */
+	CXR42	= 0x0710,	/* RZ/G2L only */
 	CEFCR	= 0x0740,
 	FRECR	= 0x0748,
 	TSFRCR	= 0x0750,
 	TLFRCR	= 0x0758,
 	RFCR	= 0x0760,
+	CXR55	= 0x0768,	/* RZ/G2L only */
+	CXR56	= 0x0770,	/* RZ/G2L only */
 	MAFCR	= 0x0778,
 };
 
@@ -1023,6 +1027,7 @@ struct ravb_hw_info {
 	unsigned nc_queue:1;		/* AVB-DMAC has NC queue */
 	unsigned magic_pkt:1;		/* E-MAC supports magic packet detection */
 	unsigned half_duplex:1;		/* E-MAC supports half duplex mode */
+	unsigned carrier_counters:1;	/* E-MAC has carrier counters */
 };
 
 struct ravb_private {
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index e1465b09cea2..bbb996e52f72 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -2069,6 +2069,18 @@ static struct net_device_stats *ravb_get_stats(struct net_device *ndev)
 		ravb_write(ndev, 0, TROCR);	/* (write clear) */
 	}
 
+	if (info->carrier_counters) {
+		nstats->collisions += ravb_read(ndev, CXR41);
+		ravb_write(ndev, 0, CXR41);	/* (write clear) */
+		nstats->tx_carrier_errors += ravb_read(ndev, CXR42);
+		ravb_write(ndev, 0, CXR42);	/* (write clear) */
+
+		nstats->tx_carrier_errors += ravb_read(ndev, CXR55);
+		ravb_write(ndev, 0, CXR55);	/* (write clear) */
+		nstats->tx_carrier_errors += ravb_read(ndev, CXR56);
+		ravb_write(ndev, 0, CXR56);	/* (write clear) */
+	}
+
 	nstats->rx_packets = stats0->rx_packets;
 	nstats->tx_packets = stats0->tx_packets;
 	nstats->rx_bytes = stats0->rx_bytes;
@@ -2449,6 +2461,7 @@ static const struct ravb_hw_info gbeth_hw_info = {
 	.aligned_tx = 1,
 	.tx_counters = 1,
 	.half_duplex = 1,
+	.carrier_counters = 1,
 };
 
 static const struct of_device_id ravb_match_table[] = {
-- 
2.17.1

