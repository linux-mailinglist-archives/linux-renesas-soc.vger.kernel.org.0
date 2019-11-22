Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 446F0106441
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2019 07:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727678AbfKVGQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Nov 2019 01:16:24 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:6348 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729496AbfKVGNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Nov 2019 01:13:52 -0500
X-IronPort-AV: E=Sophos;i="5.69,228,1571670000"; 
   d="scan'208";a="32366337"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2019 15:13:51 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A515D400D0F9;
        Fri, 22 Nov 2019 15:13:51 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH RFC 1/4] mmc: host: renesas_sdhi_sys_dmac: Use dma_buswidth instead of hardcoded value
Date:   Fri, 22 Nov 2019 15:13:48 +0900
Message-Id: <1574403231-18512-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1574403231-18512-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch uses dma_buswidth instread of hardcoded value of
TMIO_MMC_MIN_DMA_LEN (8) for increasing the buswidth in the future.
Note that, since the dma_buswidth is 4 and the align is 2,
when the sg_tmp->length is 6, it cannot transfer correcly.
So, this patch changes the conditions.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 13ff023..30f34a3 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -23,8 +23,6 @@
 #include "renesas_sdhi.h"
 #include "tmio_mmc.h"
 
-#define TMIO_MMC_MIN_DMA_LEN 8
-
 static const struct renesas_sdhi_of_data of_default_cfg = {
 	.tmio_flags = TMIO_MMC_HAS_IDLE_WAIT,
 };
@@ -159,11 +157,12 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
 	int ret, i;
 	bool aligned = true, multiple = true;
 	unsigned int align = (1 << host->pdata->alignment_shift) - 1;
+	unsigned int min_len = priv->dma_priv.dma_buswidth ? : align + 1;
 
 	for_each_sg(sg, sg_tmp, host->sg_len, i) {
 		if (sg_tmp->offset & align)
 			aligned = false;
-		if (sg_tmp->length & align) {
+		if (sg_tmp->length % min_len) {
 			multiple = false;
 			break;
 		}
@@ -175,7 +174,7 @@ static void renesas_sdhi_sys_dmac_start_dma_rx(struct tmio_mmc_host *host)
 		goto pio;
 	}
 
-	if (sg->length < TMIO_MMC_MIN_DMA_LEN)
+	if (sg->length < min_len)
 		return;
 
 	/* The only sg element can be unaligned, use our bounce buffer then */
@@ -231,11 +230,12 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
 	int ret, i;
 	bool aligned = true, multiple = true;
 	unsigned int align = (1 << host->pdata->alignment_shift) - 1;
+	unsigned int min_len = priv->dma_priv.dma_buswidth ? : align + 1;
 
 	for_each_sg(sg, sg_tmp, host->sg_len, i) {
 		if (sg_tmp->offset & align)
 			aligned = false;
-		if (sg_tmp->length & align) {
+		if (sg_tmp->length % min_len) {
 			multiple = false;
 			break;
 		}
@@ -247,7 +247,7 @@ static void renesas_sdhi_sys_dmac_start_dma_tx(struct tmio_mmc_host *host)
 		goto pio;
 	}
 
-	if (sg->length < TMIO_MMC_MIN_DMA_LEN)
+	if (sg->length < min_len)
 		return;
 
 	/* The only sg element can be unaligned, use our bounce buffer then */
-- 
2.7.4

