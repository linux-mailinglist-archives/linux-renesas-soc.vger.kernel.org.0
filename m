Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39B2D4D61F8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Mar 2022 14:02:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348724AbiCKNDR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Mar 2022 08:03:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348730AbiCKNDO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Mar 2022 08:03:14 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 124DE1C027C;
        Fri, 11 Mar 2022 05:02:10 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,173,1643641200"; 
   d="scan'208";a="114106604"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Mar 2022 22:02:09 +0900
Received: from localhost.localdomain (unknown [10.226.93.53])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4CDF94007F22;
        Fri, 11 Mar 2022 22:02:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 2/3] media: vsp1: Add support to deassert/assert reset line
Date:   Fri, 11 Mar 2022 13:01:57 +0000
Message-Id: <20220311130158.27158-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311130158.27158-1-biju.das.jz@bp.renesas.com>
References: <20220311130158.27158-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As the resets DT property is mandatory, and is present in all .dtsi
in mainline, add support to perform deassert/assert using reference
counted reset handle.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v3->v4:
 * Restored error check for pm_runtime_resume_and_get and calls
   assert() in case of failure.
v2->v3:
 * Added Rb tag from Philipp
 * If reset_control_deassert() failed, return ret directly. 
v1->v2:
 * Used reference counted reset handle to perform deassert/assert
RFC->v1:
 * Added reset support as separate patch
 * Moved rstc just after the bus_master field in struct vsp1_device
RFC:
 * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-21-biju.das.jz@bp.renesas.com/
---
 drivers/media/platform/vsp1/vsp1.h     |  1 +
 drivers/media/platform/vsp1/vsp1_drv.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/vsp1/vsp1.h b/drivers/media/platform/vsp1/vsp1.h
index 37cf33c7e6ca..c5da829c79b5 100644
--- a/drivers/media/platform/vsp1/vsp1.h
+++ b/drivers/media/platform/vsp1/vsp1.h
@@ -79,6 +79,7 @@ struct vsp1_device {
 	void __iomem *mmio;
 	struct rcar_fcp_device *fcp;
 	struct device *bus_master;
+	struct reset_control *rstc;
 
 	struct vsp1_brx *brs;
 	struct vsp1_brx *bru;
diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index 502c7d9d6890..699d7d985df4 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -16,6 +16,7 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/videodev2.h>
 
 #include <media/rcar-fcp.h>
@@ -569,7 +570,16 @@ static void vsp1_mask_all_interrupts(struct vsp1_device *vsp1)
  */
 int vsp1_device_get(struct vsp1_device *vsp1)
 {
-	return pm_runtime_resume_and_get(vsp1->dev);
+	int ret = reset_control_deassert(vsp1->rstc);
+
+	if (ret < 0)
+		return ret;
+
+	ret = pm_runtime_resume_and_get(vsp1->dev);
+	if (ret < 0)
+		reset_control_assert(vsp1->rstc);
+
+	return ret;
 }
 
 /*
@@ -581,6 +591,7 @@ int vsp1_device_get(struct vsp1_device *vsp1)
 void vsp1_device_put(struct vsp1_device *vsp1)
 {
 	pm_runtime_put_sync(vsp1->dev);
+	reset_control_assert(vsp1->rstc);
 }
 
 /* -----------------------------------------------------------------------------
@@ -827,6 +838,11 @@ static int vsp1_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
+	vsp1->rstc = devm_reset_control_get_shared(&pdev->dev, NULL);
+	if (IS_ERR(vsp1->rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(vsp1->rstc),
+				     "failed to get reset ctrl\n");
+
 	/* FCP (optional). */
 	fcp_node = of_parse_phandle(pdev->dev.of_node, "renesas,fcp", 0);
 	if (fcp_node) {
-- 
2.17.1

