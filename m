Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E631FB0781
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Sep 2019 06:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbfILEOA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Sep 2019 00:14:00 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:42304 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726166AbfILEOA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Sep 2019 00:14:00 -0400
X-IronPort-AV: E=Sophos;i="5.64,495,1559487600"; 
   d="scan'208";a="26391057"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 12 Sep 2019 13:13:57 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 09C4C417A2F1;
        Thu, 12 Sep 2019 13:13:57 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     hch@lst.de, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     treding@nvidia.com, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] mmc: renesas_sdhi_internal_dmac: Add MMC_CAP2_MERGE_CAPABLE
Date:   Thu, 12 Sep 2019 13:13:56 +0900
Message-Id: <1568261636-25625-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1568261636-25625-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since this host controller can merge bigger segments if DMA API
layer cam merge the segments, this patch adds the flag.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 751fe91..a66f8d6 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -106,7 +106,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_CMD23,
-	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
+	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
 	.bus_shift	= 2,
 	.scc_offset	= 0x1000,
 	.taps		= rcar_gen3_scc_taps,
-- 
2.7.4

