Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0992B785405
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Aug 2023 11:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235299AbjHWJ3x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Aug 2023 05:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235601AbjHWJYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Aug 2023 05:24:06 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D64135BAE;
        Wed, 23 Aug 2023 02:12:27 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="173694724"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2023 18:12:02 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C3FB2400856C;
        Wed, 23 Aug 2023 18:12:02 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     jingoohan1@gmail.com, gustavo.pimentel@synopsys.com,
        lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        manivannan.sadhasivam@linaro.org, bhelgaas@google.com,
        kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org
Cc:     marek.vasut+renesas@gmail.com, fancer.lancer@gmail.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v19 06/19] PCI: dwc: Add dw_pcie_link_set_max_link_width()
Date:   Wed, 23 Aug 2023 18:11:40 +0900
Message-Id: <20230823091153.2578417-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230823091153.2578417-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230823091153.2578417-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch is a preparation before adding the Max-Link-width capability
setup which would in its turn complete the max-link-width setup
procedure defined by Synopsys in the HW-manual. Seeing there is
a max-link-speed setup method defined in the DW PCIe core driver
it would be good to have a similar function for the link width setup.
That's why we need to define a dedicated function first from already
implemented but incomplete link-width setting up code.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/pci/controller/dwc/pcie-designware.c | 86 ++++++++++----------
 1 file changed, 41 insertions(+), 45 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index d1dfe6f2eb4c..976dcc511fdc 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -722,6 +722,46 @@ static void dw_pcie_link_set_max_speed(struct dw_pcie *pci, u32 link_gen)
 
 }
 
+static void dw_pcie_link_set_max_link_width(struct dw_pcie *pci, u32 num_lanes)
+{
+	u32 lwsc, plc;
+
+	if (!num_lanes)
+		return;
+
+	/* Set the number of lanes */
+	plc = dw_pcie_readl_dbi(pci, PCIE_PORT_LINK_CONTROL);
+	plc &= ~PORT_LINK_FAST_LINK_MODE;
+	plc &= ~PORT_LINK_MODE_MASK;
+
+	/* Set link width speed control register */
+	lwsc = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
+	lwsc &= ~PORT_LOGIC_LINK_WIDTH_MASK;
+	switch (num_lanes) {
+	case 1:
+		plc |= PORT_LINK_MODE_1_LANES;
+		lwsc |= PORT_LOGIC_LINK_WIDTH_1_LANES;
+		break;
+	case 2:
+		plc |= PORT_LINK_MODE_2_LANES;
+		lwsc |= PORT_LOGIC_LINK_WIDTH_2_LANES;
+		break;
+	case 4:
+		plc |= PORT_LINK_MODE_4_LANES;
+		lwsc |= PORT_LOGIC_LINK_WIDTH_4_LANES;
+		break;
+	case 8:
+		plc |= PORT_LINK_MODE_8_LANES;
+		lwsc |= PORT_LOGIC_LINK_WIDTH_8_LANES;
+		break;
+	default:
+		dev_err(pci->dev, "num-lanes %u: invalid value\n", num_lanes);
+		return;
+	}
+	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, plc);
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, lwsc);
+}
+
 void dw_pcie_iatu_detect(struct dw_pcie *pci)
 {
 	int max_region, ob, ib;
@@ -1003,49 +1043,5 @@ void dw_pcie_setup(struct dw_pcie *pci)
 	val |= PORT_LINK_DLL_LINK_EN;
 	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
 
-	if (!pci->num_lanes) {
-		dev_dbg(pci->dev, "Using h/w default number of lanes\n");
-		return;
-	}
-
-	/* Set the number of lanes */
-	val &= ~PORT_LINK_FAST_LINK_MODE;
-	val &= ~PORT_LINK_MODE_MASK;
-	switch (pci->num_lanes) {
-	case 1:
-		val |= PORT_LINK_MODE_1_LANES;
-		break;
-	case 2:
-		val |= PORT_LINK_MODE_2_LANES;
-		break;
-	case 4:
-		val |= PORT_LINK_MODE_4_LANES;
-		break;
-	case 8:
-		val |= PORT_LINK_MODE_8_LANES;
-		break;
-	default:
-		dev_err(pci->dev, "num-lanes %u: invalid value\n", pci->num_lanes);
-		return;
-	}
-	dw_pcie_writel_dbi(pci, PCIE_PORT_LINK_CONTROL, val);
-
-	/* Set link width speed control register */
-	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
-	val &= ~PORT_LOGIC_LINK_WIDTH_MASK;
-	switch (pci->num_lanes) {
-	case 1:
-		val |= PORT_LOGIC_LINK_WIDTH_1_LANES;
-		break;
-	case 2:
-		val |= PORT_LOGIC_LINK_WIDTH_2_LANES;
-		break;
-	case 4:
-		val |= PORT_LOGIC_LINK_WIDTH_4_LANES;
-		break;
-	case 8:
-		val |= PORT_LOGIC_LINK_WIDTH_8_LANES;
-		break;
-	}
-	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
+	dw_pcie_link_set_max_link_width(pci, pci->num_lanes);
 }
-- 
2.25.1

