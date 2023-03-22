Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D5656C4454
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Mar 2023 08:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbjCVHrg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Mar 2023 03:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbjCVHrc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2023 03:47:32 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B61BD5CC34;
        Wed, 22 Mar 2023 00:47:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,281,1673881200"; 
   d="scan'208";a="153375710"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Mar 2023 16:47:24 +0900
Received: from localhost.localdomain (unknown [10.226.93.24])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 441AE4005E20;
        Wed, 22 Mar 2023 16:47:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-serial@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] tty: serial: sh-sci: Remove setting {src,dst}_{addr,addr_width} based on DMA direction
Date:   Wed, 22 Mar 2023 07:47:17 +0000
Message-Id: <20230322074717.6057-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.5 required=5.0 tests=AC_FROM_MANY_DOTS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The direction field in the DMA config is deprecated. The sh-sci driver
sets {src,dst}_{addr,addr_width} based on the DMA direction and
it results in dmaengine_slave_config() failure as RZ DMAC driver
validates {src,dst}_addr_width values independent of DMA direction.

Fix this issue by passing both {src,dst}_{addr,addr_width}
values independent of DMA direction.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/tty/serial/sh-sci.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index da7eb7a3ca6f..4278aef59f6d 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -1553,15 +1553,12 @@ static struct dma_chan *sci_request_dma_chan(struct uart_port *port,
 
 	memset(&cfg, 0, sizeof(cfg));
 	cfg.direction = dir;
-	if (dir == DMA_MEM_TO_DEV) {
-		cfg.dst_addr = port->mapbase +
-			(sci_getreg(port, SCxTDR)->offset << port->regshift);
-		cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
-	} else {
-		cfg.src_addr = port->mapbase +
-			(sci_getreg(port, SCxRDR)->offset << port->regshift);
-		cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
-	}
+	cfg.dst_addr = port->mapbase +
+		(sci_getreg(port, SCxTDR)->offset << port->regshift);
+	cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
+	cfg.src_addr = port->mapbase +
+		(sci_getreg(port, SCxRDR)->offset << port->regshift);
+	cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_1_BYTE;
 
 	ret = dmaengine_slave_config(chan, &cfg);
 	if (ret) {
-- 
2.25.1

