Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B790653C90C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jun 2022 13:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243963AbiFCLFx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jun 2022 07:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243939AbiFCLFm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 07:05:42 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A77AF3BFBB;
        Fri,  3 Jun 2022 04:05:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,274,1647270000"; 
   d="scan'208";a="123226934"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Jun 2022 20:05:38 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 132CF42849B7;
        Fri,  3 Jun 2022 20:05:38 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 3/7] ufs: add UFSHCD_QUIRK_HIBERN_FASTAUTO
Date:   Fri,  3 Jun 2022 20:05:20 +0900
Message-Id: <20220603110524.1997825-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220603110524.1997825-1-yoshihiro.shimoda.uh@renesas.com>
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
 drivers/ufs/core/ufshcd.c | 9 +++++++--
 include/ufs/ufshcd.h      | 6 ++++++
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 88e567c3ba0b..bb6cbd514a69 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -4260,8 +4260,13 @@ static int ufshcd_get_max_pwr_mode(struct ufs_hba *hba)
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
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 795c8951341d..991aea081ec7 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -583,6 +583,12 @@ enum ufshcd_quirks {
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

