Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C63E53C91F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jun 2022 13:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243924AbiFCLFk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jun 2022 07:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243922AbiFCLFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jun 2022 07:05:40 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D57C13BFBB;
        Fri,  3 Jun 2022 04:05:38 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,274,1647270000"; 
   d="scan'208";a="121822511"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Jun 2022 20:05:37 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E489342849B3;
        Fri,  3 Jun 2022 20:05:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     alim.akhtar@samsung.com, avri.altman@wdc.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     jejb@linux.ibm.com, martin.petersen@oracle.com,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 2/7] ufs: add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS
Date:   Fri,  3 Jun 2022 20:05:19 +0900
Message-Id: <20220603110524.1997825-3-yoshihiro.shimoda.uh@renesas.com>
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

Add UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS for a broken host controller
of the 64-bit addressing supported capability.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/ufs/core/ufshcd.c | 2 ++
 include/ufs/ufshcd.h      | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 01fb4bad86be..88e567c3ba0b 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -2216,6 +2216,8 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	int err;
 
 	hba->capabilities = ufshcd_readl(hba, REG_CONTROLLER_CAPABILITIES);
+	if (hba->quirks & UFSHCD_QUIRK_BROKEN_64BIT_ADDRESS)
+		hba->capabilities &= ~MASK_64_ADDRESSING_SUPPORT;
 
 	/* nutrs and nutmrs are 0 based values */
 	hba->nutrs = (hba->capabilities & MASK_TRANSFER_REQUESTS_SLOTS) + 1;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index a92271421718..795c8951341d 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -577,6 +577,12 @@ enum ufshcd_quirks {
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

