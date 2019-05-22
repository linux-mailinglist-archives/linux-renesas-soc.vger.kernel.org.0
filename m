Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F06E261AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 May 2019 12:23:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbfEVKX0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 06:23:26 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:42569 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728929AbfEVKX0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 06:23:26 -0400
X-IronPort-AV: E=Sophos;i="5.60,498,1549897200"; 
   d="scan'208";a="16665270"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 May 2019 19:23:23 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3F0B540065CC;
        Wed, 22 May 2019 19:23:23 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/3] mmc: tmio: Add a definition for default max_segs
Date:   Wed, 22 May 2019 19:18:38 +0900
Message-Id: <1558520319-16452-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a definition for default max_segs to be used by other
driver (renesas_sdhi) in the future.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/tmio_mmc.h      | 1 +
 drivers/mmc/host/tmio_mmc_core.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index c5ba13f..9e387be 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -106,6 +106,7 @@
 #define TMIO_MASK_IRQ     (TMIO_MASK_READOP | TMIO_MASK_WRITEOP | TMIO_MASK_CMD)
 
 #define TMIO_MAX_BLK_SIZE 512
+#define TMIO_DEFAULT_MAX_SEGS 32
 
 struct tmio_mmc_data;
 struct tmio_mmc_host;
diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 7c76ab0..583cfc7 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1185,7 +1185,7 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 
 	mmc->caps |= MMC_CAP_4_BIT_DATA | pdata->capabilities;
 	mmc->caps2 |= pdata->capabilities2;
-	mmc->max_segs = pdata->max_segs ? : 32;
+	mmc->max_segs = pdata->max_segs ? : TMIO_DEFAULT_MAX_SEGS;
 	mmc->max_blk_size = TMIO_MAX_BLK_SIZE;
 	mmc->max_blk_count = pdata->max_blk_count ? :
 		(PAGE_SIZE / mmc->max_blk_size) * mmc->max_segs;
-- 
2.7.4

