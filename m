Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49036748337
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jul 2023 13:46:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231751AbjGELqk (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jul 2023 07:46:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbjGELqi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jul 2023 07:46:38 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 63AAB1BC6;
        Wed,  5 Jul 2023 04:46:14 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,182,1684767600"; 
   d="scan'208";a="166982751"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jul 2023 20:46:12 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E9801400C458;
        Wed,  5 Jul 2023 20:46:11 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     jingoohan1@gmail.com, gustavo.pimentel@synopsys.com,
        lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, kishon@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     marek.vasut+renesas@gmail.com, fancer.lancer@gmail.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Bjorn Helgaas <helgaas@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v17 03/20] PCI: dwc: Rename "legacy_irq" to "INTx_irq"
Date:   Wed,  5 Jul 2023 20:41:49 +0900
Message-Id: <20230705114206.3585188-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230705114206.3585188-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230705114206.3585188-1-yoshihiro.shimoda.uh@renesas.com>
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

Using "INTx" instead of "legacy" is more specific. So, rename
dw_pcie_ep_raise_legacy_irq() to dw_pcie_ep_raise_intx_irq().

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
 drivers/pci/controller/dwc/pci-layerscape-ep.c    | 2 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 6 +++---
 drivers/pci/controller/dwc/pcie-designware-plat.c | 2 +-
 drivers/pci/controller/dwc/pcie-designware.h      | 4 ++--
 drivers/pci/controller/dwc/pcie-qcom-ep.c         | 2 +-
 6 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index a32f1867e0bb..2a13688059a4 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1064,7 +1064,7 @@ static int imx6_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	switch (type) {
 	case PCI_EPC_IRQ_INTX:
-		return dw_pcie_ep_raise_legacy_irq(ep, func_no);
+		return dw_pcie_ep_raise_intx_irq(ep, func_no);
 	case PCI_EPC_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
 	case PCI_EPC_IRQ_MSIX:
diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index b2e14d64dba2..5e00f0be4f95 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -156,7 +156,7 @@ static int ls_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	switch (type) {
 	case PCI_EPC_IRQ_INTX:
-		return dw_pcie_ep_raise_legacy_irq(ep, func_no);
+		return dw_pcie_ep_raise_intx_irq(ep, func_no);
 	case PCI_EPC_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
 	case PCI_EPC_IRQ_MSIX:
diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index f9182f8d552f..27278010ecec 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -479,16 +479,16 @@ static const struct pci_epc_ops epc_ops = {
 	.get_features		= dw_pcie_ep_get_features,
 };
 
-int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no)
+int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct device *dev = pci->dev;
 
-	dev_err(dev, "EP cannot trigger legacy IRQs\n");
+	dev_err(dev, "EP cannot trigger INTx IRQs\n");
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_legacy_irq);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_intx_irq);
 
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num)
diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
index fc3b02949218..2689ff7939e4 100644
--- a/drivers/pci/controller/dwc/pcie-designware-plat.c
+++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
@@ -49,7 +49,7 @@ static int dw_plat_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	switch (type) {
 	case PCI_EPC_IRQ_INTX:
-		return dw_pcie_ep_raise_legacy_irq(ep, func_no);
+		return dw_pcie_ep_raise_intx_irq(ep, func_no);
 	case PCI_EPC_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
 	case PCI_EPC_IRQ_MSIX:
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 615660640801..3c06e025c905 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -548,7 +548,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
-int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no);
+int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
 int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
@@ -581,7 +581,7 @@ static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 {
 }
 
-static inline int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no)
+static inline int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 93624728c772..93f2fdfbb5a3 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -661,7 +661,7 @@ static int qcom_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
 
 	switch (type) {
 	case PCI_EPC_IRQ_INTX:
-		return dw_pcie_ep_raise_legacy_irq(ep, func_no);
+		return dw_pcie_ep_raise_intx_irq(ep, func_no);
 	case PCI_EPC_IRQ_MSI:
 		return dw_pcie_ep_raise_msi_irq(ep, func_no, interrupt_num);
 	default:
-- 
2.25.1

