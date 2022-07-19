Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B92C357A28D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 17:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbiGSPAg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237833AbiGSPAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 11:00:09 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E2A2C60E9;
        Tue, 19 Jul 2022 08:00:06 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,284,1650898800"; 
   d="scan'208";a="128390052"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Jul 2022 00:00:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.160])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D75A6400C737;
        Wed, 20 Jul 2022 00:00:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Colin Ian King <colin.king@intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        dmaengine@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dmaengine: sh: rz-dmac: Add device_synchronize callback
Date:   Tue, 19 Jul 2022 15:59:59 +0100
Message-Id: <20220719150000.383722-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Some on-chip peripheral modules(for eg:- rspi) on RZ/G2L SoC
use the same signal for both interrupt and DMA transfer requests.
The signal works as a DMA transfer request signal by setting
DMARS, and subsequent interrupt requests to the interrupt controller
are masked.

We can enable the interrupt by clearing the DMARS.

This patch adds device_synchronize callback for clearing
DMARS and thereby allowing DMA consumers to switch to
DMA mode.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 drivers/dma/sh/rz-dmac.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/dma/sh/rz-dmac.c b/drivers/dma/sh/rz-dmac.c
index ee2872e7d64c..675e6d5319d7 100644
--- a/drivers/dma/sh/rz-dmac.c
+++ b/drivers/dma/sh/rz-dmac.c
@@ -630,6 +630,14 @@ static void rz_dmac_virt_desc_free(struct virt_dma_desc *vd)
 	 */
 }
 
+static void rz_dmac_device_synchronize(struct dma_chan *chan)
+{
+	struct rz_dmac_chan *channel = to_rz_dmac_chan(chan);
+	struct rz_dmac *dmac = to_rz_dmac(chan->device);
+
+	rz_dmac_set_dmars_register(dmac, channel->index, 0);
+}
+
 /*
  * -----------------------------------------------------------------------------
  * IRQ handling
@@ -909,6 +917,7 @@ static int rz_dmac_probe(struct platform_device *pdev)
 	engine->device_config = rz_dmac_config;
 	engine->device_terminate_all = rz_dmac_terminate_all;
 	engine->device_issue_pending = rz_dmac_issue_pending;
+	engine->device_synchronize = rz_dmac_device_synchronize;
 
 	engine->copy_align = DMAENGINE_ALIGN_1_BYTE;
 	dma_set_max_seg_size(engine->dev, U32_MAX);
-- 
2.25.1

