Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE8F7511780
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Apr 2022 14:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234421AbiD0Mka (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 27 Apr 2022 08:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbiD0Mk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Apr 2022 08:40:28 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0C18B546B8;
        Wed, 27 Apr 2022 05:37:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,292,1643641200"; 
   d="scan'208";a="118193613"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Apr 2022 21:37:14 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B4610435BBF9;
        Wed, 27 Apr 2022 21:37:14 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Date:   Wed, 27 Apr 2022 21:37:01 +0900
Message-Id: <20220427123706.555166-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427123706.555166-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220427123706.555166-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS for a broken host controller
of the 64-bit addressing supported capability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/scsi/ufs/ufshcd.c | 3 ++-
 drivers/scsi/ufs/ufshcd.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 3f9caafa91bf..a7bb3945c7c6 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -9513,7 +9513,8 @@ EXPORT_SYMBOL_GPL(ufshcd_dealloc_host);
  */
 static int ufshcd_set_dma_mask(struct ufs_hba *hba)
 {
-	if (hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
+	if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS) &&
+	    hba->capabilities & MASK_64_ADDRESSING_SUPPORT) {
 		if (!dma_set_mask_and_coherent(hba->dev, DMA_BIT_MASK(64)))
 			return 0;
 	}
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 94f545be183a..1745144eb904 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -602,6 +602,12 @@ enum ufshcd_quirks {
 	 * support physical host configuration.
 	 */
 	UFSHCD_QUIRK_SKIP_PH_CONFIGURATION		= 1 << 16,
+
+	/*
+	 * This quirk needs to be enabled if the host controller has
+	 * 64-bit addressing supported capability but it doesn't work.
+	 */
+	UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS		= 1 << 17,
 };
 
 enum ufshcd_caps {
-- 
2.25.1

