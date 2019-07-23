Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A44C71128
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 07:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfGWF16 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 01:27:58 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6931 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727467AbfGWF15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 01:27:57 -0400
X-IronPort-AV: E=Sophos;i="5.64,297,1559487600"; 
   d="scan'208";a="22145540"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2019 14:27:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6316641E4097;
        Tue, 23 Jul 2019 14:27:52 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 3/5] block: sort headers on blk-setting.c
Date:   Tue, 23 Jul 2019 14:26:46 +0900
Message-Id: <1563859608-19456-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch sorts the headers in alphabetic order to ease
the maintenance for this part.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 block/blk-settings.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/blk-settings.c b/block/blk-settings.c
index 2ae348c..45f2c52 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -2,16 +2,16 @@
 /*
  * Functions related to setting various queue properties from drivers
  */
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
-#include <linux/memblock.h>	/* for max_pfn/max_low_pfn */
 #include <linux/gcd.h>
-#include <linux/lcm.h>
-#include <linux/jiffies.h>
 #include <linux/gfp.h>
+#include <linux/init.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/lcm.h>
+#include <linux/memblock.h>     /* for max_pfn/max_low_pfn */
+#include <linux/module.h>
 
 #include "blk.h"
 #include "blk-wbt.h"
-- 
2.7.4

