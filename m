Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E28F51063E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2019 07:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729517AbfKVGNy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Nov 2019 01:13:54 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:37970 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729511AbfKVGNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 01:13:53 -0500
X-IronPort-AV: E=Sophos;i="5.69,228,1571670000"; 
   d="scan'208";a="32153145"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2019 15:13:51 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE30E400D0F4;
        Fri, 22 Nov 2019 15:13:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 2/4] mmc: host: renesas_sdhi_sys_dmac: Do not fall back to PIO
Date:   Fri, 22 Nov 2019 15:13:49 +0900
Message-Id: <1574403231-18512-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Falling back to PIO forever is not convenience if a buffer condition
is not match with the hardware once. So, this patch removes it.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 35 +++++++-------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 30f34a3..09137cc 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -175,7 +175,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
 	}
 
 	if (sg->length < min_len)
-		return;
+		goto pio;
 
 	/* The only sg element can be unaligned, use our bounce buffer then */
 	if (!aligned) {
@@ -200,23 +200,13 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
 			ret = cookie;
 		}
 		host->dma_on = true;
+		renesas_sdhi_sys_dmac_enable_dma(host, true);
 	}
 pio:
 	if (!desc) {
-		/* DMA failed, fall back to PIO */
 		renesas_sdhi_sys_dmac_enable_dma(host, false);
-		if (ret >= 0)
-			ret = -EIO;
-		host->chan_rx = NULL;
-		dma_release_channel(chan);
-		/* Free the Tx channel too */
-		chan = host->chan_tx;
-		if (chan) {
-			host->chan_tx = NULL;
-			dma_release_channel(chan);
-		}
-		dev_warn(&host->pdev->dev,
-			 "DMA failed: %d, falling back to PIO\n", ret);
+		host->dma_on = false;
+		dev_dbg(&host->pdev->dev, "DMA failed: %d\n", ret);
 	}
 }
 
@@ -248,7 +238,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
 	}
 
 	if (sg->length < min_len)
-		return;
+		goto pio;
 
 	/* The only sg element can be unaligned, use our bounce buffer then */
 	if (!aligned) {
@@ -281,20 +271,9 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
 	}
 pio:
 	if (!desc) {
-		/* DMA failed, fall back to PIO */
 		renesas_sdhi_sys_dmac_enable_dma(host, false);
-		if (ret >= 0)
-			ret = -EIO;
-		host->chan_tx = NULL;
-		dma_release_channel(chan);
-		/* Free the Rx channel too */
-		chan = host->chan_rx;
-		if (chan) {
-			host->chan_rx = NULL;
-			dma_release_channel(chan);
-		}
-		dev_warn(&host->pdev->dev,
-			 "DMA failed: %d, falling back to PIO\n", ret);
+		host->dma_on = false;
+		dev_dbg(&host->pdev->dev, "DMA failed: %d\n", ret);
 	}
 }
 
-- 
2.7.4

