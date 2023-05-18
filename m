Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85ADF708567
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 17:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbjERP5J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 May 2023 11:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230476AbjERP5D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2023 11:57:03 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CEE4BEC
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2023 08:57:02 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,285,1677510000"; 
   d="scan'208";a="159865415"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2023 00:57:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.79])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 939F0400F7E0;
        Fri, 19 May 2023 00:56:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH RFC 3/3] phy: renesas: phy-rcar-gen3-usb2: Control VBUSEN selection
Date:   Thu, 18 May 2023 16:56:49 +0100
Message-Id: <20230518155649.516346-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
References: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/G2L HW(Rev.1.30 May2023) manual, VBUSEN can be controlled by
the Port Power bit of the EHCI/OHCI operational register or by the VBOUT
bit of the VBUS Control Register. Control VBUSEN selection such that bit
is set to 0 (Port Power bit of the EHCI/OHCI operational register) for
host operation and set the bit to 1 (VBOUT bit of the VBUS Control
Register) for device operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d4e2ee7e4efb..429b1d44eee7 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -21,6 +21,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/reset/rzg2l-usbphy-ctrl.h>
 #include <linux/string.h>
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
@@ -113,6 +115,7 @@ struct rcar_gen3_chan {
 	struct extcon_dev *extcon;
 	struct rcar_gen3_phy rphys[NUM_OF_PHYS];
 	struct regulator *vbus;
+	struct reset_control *rstc;
 	struct work_struct work;
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
@@ -190,6 +193,7 @@ static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
 	if (ch->soc_no_adp_ctrl) {
+		rzg2l_usbphy_ctrl_select_vbus_ctrl(ch->rstc, vbus ? 0 : 1);
 		vbus_ctrl_reg = USB2_VBCTRL;
 		vbus_ctrl_val = USB2_VBCTRL_VBOUT;
 	}
@@ -670,6 +674,11 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
+	channel->rstc = devm_reset_control_get_optional_shared(&pdev->dev,
+							       NULL);
+	if (IS_ERR(channel->rstc))
+		return PTR_ERR(channel->rstc);
+
 	channel->obint_enable_bits = USB2_OBINT_BITS;
 	/* get irq number here and request_irq for OTG in phy_init */
 	channel->irq = platform_get_irq_optional(pdev, 0);
-- 
2.25.1

