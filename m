Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE28500440
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Apr 2022 04:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239365AbiDNCeU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Apr 2022 22:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231398AbiDNCeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Apr 2022 22:34:17 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B01171CFD7;
        Wed, 13 Apr 2022 19:31:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,258,1643641200"; 
   d="scan'208";a="116825507"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Apr 2022 11:31:52 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6ECFC4175290;
        Thu, 14 Apr 2022 11:31:52 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/7] ufs: add UFSHCD_QUIRK_HIBERN_FASTAUTO
Date:   Thu, 14 Apr 2022 11:31:11 +0900
Message-Id: <20220414023115.4190736-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220414023115.4190736-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add UFSHCD_QUIRK_HIBERN_FASTAUTO for a broken host controller of
the auto-hibernate capability but it's FASTAUTO only.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/scsi/ufs/ufshcd.c | 9 +++++++--
 drivers/scsi/ufs/ufshcd.h | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index a7bb3945c7c6..adc059a86e1e 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -4247,8 +4247,13 @@ static int ufshcd_get_max_pwr_mode(struct ufs_hba *hba)
 	if (hba->max_pwr_info.is_valid)
 		return 0;
 
-	pwr_info->pwr_tx = FAST_MODE;
-	pwr_info->pwr_rx = FAST_MODE;
+	if (hba->quirks & UFSHCD_QUIRK_HIBERN_FASTAUTO) {
+		pwr_info->pwr_tx = FASTAUTO_MODE;
+		pwr_info->pwr_rx = FASTAUTO_MODE;
+	} else {
+		pwr_info->pwr_tx = FAST_MODE;
+		pwr_info->pwr_rx = FAST_MODE;
+	}
 	pwr_info->hs_rate = PA_HS_MODE_B;
 
 	/* Get the connected lane count */
diff --git a/drivers/scsi/ufs/ufshcd.h b/drivers/scsi/ufs/ufshcd.h
index 1745144eb904..d14cc48226ce 100644
--- a/drivers/scsi/ufs/ufshcd.h
+++ b/drivers/scsi/ufs/ufshcd.h
@@ -608,6 +608,12 @@ enum ufshcd_quirks {
 	 * 64-bit addressing supported capability but it doesn't work.
 	 */
 	UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS		= 1 << 17,
+
+	/*
+	 * This quirk needs to be enabled if the host controller has
+	 * auto-hibernate capability but it's FASTAUTO only.
+	 */
+	UFSHCD_QUIRK_HIBERN_FASTAUTO			= 1 << 18,
 };
 
 enum ufshcd_caps {
-- 
2.25.1

