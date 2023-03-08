Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D546B00FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Mar 2023 09:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229825AbjCHIZI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Mar 2023 03:25:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230208AbjCHIYr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 03:24:47 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 65399B0BAC;
        Wed,  8 Mar 2023 00:24:26 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.98,243,1673881200"; 
   d="scan'208";a="155237825"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Mar 2023 17:24:25 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DD43D4010E14;
        Wed,  8 Mar 2023 17:24:24 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com
Cc:     Sergey.Semin@baikalelectronics.ru, marek.vasut+renesas@gmail.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v10 02/12] PCI: endpoint: functions/pci-epf-test: Fix dma_chan direction
Date:   Wed,  8 Mar 2023 17:23:42 +0900
Message-Id: <20230308082352.491561-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308082352.491561-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230308082352.491561-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In the pci_epf_test_init_dma_chan(), epf_test->dma_chan_rx
is assigned from dma_request_channel() with DMA_DEV_TO_MEM as
filter.dma_mask. However, in the pci_epf_test_data_transfer(),
if the dir is DMA_DEV_TO_MEM, it should use epf->dma_chan_rx,
but it used epf_test->dma_chan_tx. So, fix it. Otherwise,
results of pcitest with enabled DMA will be "NOT OKAY" on eDMA
environment.

Fixes: 8353813c88ef ("PCI: endpoint: Enable DMA tests for endpoints with DMA capabilities")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/endpoint/functions/pci-epf-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 0f9d2ec822ac..172e5ac0bd96 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -112,7 +112,7 @@ static int pci_epf_test_data_transfer(struct pci_epf_test *epf_test,
 				      size_t len, dma_addr_t dma_remote,
 				      enum dma_transfer_direction dir)
 {
-	struct dma_chan *chan = (dir == DMA_DEV_TO_MEM) ?
+	struct dma_chan *chan = (dir == DMA_MEM_TO_DEV) ?
 				 epf_test->dma_chan_tx : epf_test->dma_chan_rx;
 	dma_addr_t dma_local = (dir == DMA_MEM_TO_DEV) ? dma_src : dma_dst;
 	enum dma_ctrl_flags flags = DMA_CTRL_ACK | DMA_PREP_INTERRUPT;
-- 
2.25.1

