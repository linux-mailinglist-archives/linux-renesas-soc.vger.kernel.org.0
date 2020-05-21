Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3B81DC743
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 May 2020 09:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728000AbgEUHBW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 May 2020 03:01:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:15628 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728245AbgEUHBW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 May 2020 03:01:22 -0400
X-IronPort-AV: E=Sophos;i="5.73,416,1583161200"; 
   d="scan'208";a="47651286"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 May 2020 16:01:19 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 92978400C45F;
        Thu, 21 May 2020 16:01:19 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] mmc: renesas_sdhi_internal_dmac: Fix dma unmapping in error cases
Date:   Thu, 21 May 2020 16:01:06 +0900
Message-Id: <1590044466-28372-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1590044466-28372-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If this controller doesn't issue interrupt for response of command,
this driver lacks to call dma_unmap_sg(). So, fix the issue by
using end() of struct tmio_mmc_dma_ops.

Reported-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Fixes: 2a68ea7896e3 ("mmc: renesas-sdhi: add support for R-Car Gen3 SDHI DMAC")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 201b8ed..32ab991 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -233,6 +233,9 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
 {
 	enum dma_data_direction dir;
 
+	if (!host->dma_on)
+		return false;
+
 	if (!host->data)
 		return false;
 
@@ -247,6 +250,8 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
 	if (dir == DMA_FROM_DEVICE)
 		clear_bit(SDHI_INTERNAL_DMAC_RX_IN_USE, &global_flags);
 
+	host->dma_on = false;
+
 	return true;
 }
 
@@ -263,6 +268,12 @@ static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
 	spin_unlock_irq(&host->lock);
 }
 
+static void renesas_sdhi_internal_dmac_end_dma(struct tmio_mmc_host *host)
+{
+	if (host->data)
+		renesas_sdhi_internal_dmac_complete(host);
+}
+
 static void
 renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
 				       struct tmio_mmc_data *pdata)
@@ -300,6 +311,7 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
 	.release = renesas_sdhi_internal_dmac_release_dma,
 	.abort = renesas_sdhi_internal_dmac_abort_dma,
 	.dataend = renesas_sdhi_internal_dmac_dataend_dma,
+	.end = renesas_sdhi_internal_dmac_end_dma,
 };
 
 /*
-- 
2.7.4

