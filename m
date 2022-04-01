Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 522D64EEEE1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 16:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346694AbiDAOL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 10:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346679AbiDAOL2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 10:11:28 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69AA1D4197
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Apr 2022 07:09:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bd2c:e90f:bea1:b124])
        by xavier.telenet-ops.be with bizsmtp
        id DS9b270034qGt8d01S9bYk; Fri, 01 Apr 2022 16:09:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1naHy2-007nLn-Mf; Fri, 01 Apr 2022 16:09:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1naHy2-002X9t-8d; Fri, 01 Apr 2022 16:09:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mmc: renesas_sdhi: Add missing checks for the presence of quirks
Date:   Fri,  1 Apr 2022 16:09:28 +0200
Message-Id: <cc3178c2ff60f640f4d5a071d51f6b0b1db37656.1648822020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When running on an system without any quirks (e.g. R-Car V3U), the
kernel crashes with a NULL pointer dereference:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000002
    ...
    Hardware name: Renesas Falcon CPU and Breakout boards based on r8a779a0 (DT)
    Workqueue: events_freezable mmc_rescan
    ...
    Call trace:
     renesas_sdhi_internal_dmac_start_dma+0x54/0x12c
     tmio_process_mrq+0x124/0x274

Fix this by adding the missing checks for the validatity of the
priv->quirks pointer.

Fixes: dce2ba8b2ee8cef6 ("mmc: renesas_sdhi: make 'dmac_only_one_rx' a quirk")
Fixes: d4bfa17a655c6de2 ("mmc: renesas_sdhi: make 'fixed_addr_mode' a quirk")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 6dd5ade3851b2ba8..90048f74e6221add 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -374,7 +374,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 	struct scatterlist *sg = host->sg_ptr;
 	u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
 
-	if (!priv->quirks->fixed_addr_mode)
+	if (!(priv->quirks && priv->quirks->fixed_addr_mode))
 		dtran_mode |= DTRAN_MODE_ADDR_MODE;
 
 	if (!renesas_sdhi_internal_dmac_map(host, data, COOKIE_MAPPED))
@@ -382,7 +382,7 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
 
 	if (data->flags & MMC_DATA_READ) {
 		dtran_mode |= DTRAN_MODE_CH_NUM_CH1;
-		if (priv->quirks->dma_one_rx_only &&
+		if (priv->quirks && priv->quirks->dma_one_rx_only &&
 		    test_and_set_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags))
 			goto force_pio_with_unmap;
 	} else {
-- 
2.25.1

