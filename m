Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67D436829AE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Jan 2023 10:55:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232711AbjAaJz5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 Jan 2023 04:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjAaJzx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 Jan 2023 04:55:53 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 30C7E46724;
        Tue, 31 Jan 2023 01:55:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,259,1669042800"; 
   d="scan'208";a="151149539"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 31 Jan 2023 18:55:48 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 82E3C4001B72;
        Tue, 31 Jan 2023 18:55:48 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, jingoohan1@gmail.com,
        gustavo.pimentel@synopsys.com
Cc:     Sergey.Semin@baikalelectronics.ru, marek.vasut+renesas@gmail.com,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 3/6] PCI: dwc: Add support for triggering legacy IRQs
Date:   Tue, 31 Jan 2023 18:55:40 +0900
Message-Id: <20230131095543.1831875-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230131095543.1831875-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230131095543.1831875-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for triggering legacy IRQs by using outbound ATU.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../pci/controller/dwc/pcie-designware-ep.c   | 66 +++++++++++++++++--
 drivers/pci/controller/dwc/pcie-designware.c  | 25 ++++---
 drivers/pci/controller/dwc/pcie-designware.h  | 12 +++-
 3 files changed, 87 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 95efe14f1036..886483bf378b 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -6,6 +6,7 @@
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
+#include <linux/delay.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 
@@ -182,8 +183,8 @@ static int dw_pcie_ep_inbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
 	return 0;
 }
 
-static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
-				   phys_addr_t phys_addr,
+static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no, int type,
+				   u8 code, u8 routing, phys_addr_t phys_addr,
 				   u64 pci_addr, size_t size)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
@@ -196,8 +197,9 @@ static int dw_pcie_ep_outbound_atu(struct dw_pcie_ep *ep, u8 func_no,
 		return -EINVAL;
 	}
 
-	ret = dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, PCIE_ATU_TYPE_MEM,
-					   phys_addr, pci_addr, size);
+	ret = dw_pcie_prog_ep_outbound_atu(pci, func_no, free_win, type,
+					   code, routing, phys_addr, pci_addr,
+					   size);
 	if (ret)
 		return ret;
 
@@ -306,7 +308,8 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
 	struct dw_pcie_ep *ep = epc_get_drvdata(epc);
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 
-	ret = dw_pcie_ep_outbound_atu(ep, func_no, addr, pci_addr, size);
+	ret = dw_pcie_ep_outbound_atu(ep, func_no, PCIE_ATU_TYPE_MEM, 0, 0,
+				      addr, pci_addr, size);
 	if (ret) {
 		dev_err(pci->dev, "Failed to enable address\n");
 		return ret;
@@ -479,11 +482,43 @@ static const struct pci_epc_ops epc_ops = {
 	.get_features		= dw_pcie_ep_get_features,
 };
 
+static int dw_pcie_ep_send_msg(struct dw_pcie_ep *ep, u8 func_no, u8 code,
+			       u8 routing)
+{
+	struct pci_epc *epc = ep->epc;
+	int ret;
+
+	ret = dw_pcie_ep_outbound_atu(ep, func_no, PCIE_ATU_TYPE_MSG, code,
+				      routing, ep->intx_mem_phys, 0,
+				      epc->mem->window.page_size);
+	if (ret)
+		return ret;
+	writel(0, ep->intx_mem);
+	dw_pcie_ep_unmap_addr(epc, func_no, 0, ep->intx_mem_phys);
+
+	return 0;
+}
+
+static int __dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no,
+					 int intx)
+{
+	int ret;
+
+	ret = dw_pcie_ep_send_msg(ep, func_no, PCIE_MSG_ASSERT_INTA + intx, 0x04);
+	if (ret)
+		return ret;
+	usleep_range(1000, 2000);
+	return dw_pcie_ep_send_msg(ep, func_no, PCIE_MSG_DEASSERT_INTA + intx, 0x04);
+}
+
 int dw_pcie_ep_raise_legacy_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct device *dev = pci->dev;
 
+	if (ep->intx_by_atu)
+		return __dw_pcie_ep_raise_legacy_irq(ep, func_no, 0);
+
 	dev_err(dev, "EP cannot trigger legacy IRQs\n");
 
 	return -EINVAL;
@@ -617,6 +652,10 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	dw_pcie_edma_remove(pci);
 
+	if (ep->intx_by_atu)
+		pci_epc_mem_free_addr(epc, ep->intx_mem_phys, ep->intx_mem,
+				      epc->mem->window.page_size);
+
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);
 
@@ -789,9 +828,19 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 		goto err_exit_epc_mem;
 	}
 
+	if (ep->intx_by_atu) {
+		ep->intx_mem = pci_epc_mem_alloc_addr(epc, &ep->intx_mem_phys,
+						      epc->mem->window.page_size);
+		if (!ep->intx_mem) {
+			ret = -ENOMEM;
+			dev_err(dev, "Failed to reserve memory for INTx\n");
+			goto err_free_epc_mem;
+		}
+	}
+
 	ret = dw_pcie_edma_detect(pci);
 	if (ret)
-		goto err_free_epc_mem;
+		goto err_free_epc_mem_intx;
 
 	if (ep->ops->get_features) {
 		epc_features = ep->ops->get_features(ep);
@@ -808,6 +857,11 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
 err_remove_edma:
 	dw_pcie_edma_remove(pci);
 
+err_free_epc_mem_intx:
+	if (ep->intx_by_atu)
+		pci_epc_mem_free_addr(epc, ep->intx_mem_phys, ep->intx_mem,
+				      epc->mem->window.page_size);
+
 err_free_epc_mem:
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index 53a16b8b6ac2..b4315cf84340 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -465,8 +465,8 @@ static inline u32 dw_pcie_enable_ecrc(u32 val)
 }
 
 static int __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
-				       int index, int type, u64 cpu_addr,
-				       u64 pci_addr, u64 size)
+				       int index, int type, u8 code, u8 routing,
+				       u64 cpu_addr, u64 pci_addr, u64 size)
 {
 	u32 retries, val;
 	u64 limit_addr;
@@ -498,7 +498,7 @@ static int __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
 	dw_pcie_writel_atu_ob(pci, index, PCIE_ATU_UPPER_TARGET,
 			      upper_32_bits(pci_addr));
 
-	val = type | PCIE_ATU_FUNC_NUM(func_no);
+	val = type | routing | PCIE_ATU_FUNC_NUM(func_no);
 	if (upper_32_bits(limit_addr) > upper_32_bits(cpu_addr) &&
 	    dw_pcie_ver_is_ge(pci, 460A))
 		val |= PCIE_ATU_INCREASE_REGION_SIZE;
@@ -506,7 +506,14 @@ static int __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
 		val = dw_pcie_enable_ecrc(val);
 	dw_pcie_writel_atu_ob(pci, index, PCIE_ATU_REGION_CTRL1, val);
 
-	dw_pcie_writel_atu_ob(pci, index, PCIE_ATU_REGION_CTRL2, PCIE_ATU_ENABLE);
+	if (code)
+		dw_pcie_writel_atu_ob(pci, index, PCIE_ATU_REGION_CTRL2,
+				      PCIE_ATU_ENABLE |
+				      PCIE_ATU_INHIBIT_PAYLOAD |
+				      PCIE_ATU_HEADER_SUB_ENABLE | code);
+	else
+		dw_pcie_writel_atu_ob(pci, index, PCIE_ATU_REGION_CTRL2,
+				      PCIE_ATU_ENABLE);
 
 	/*
 	 * Make sure ATU enable takes effect before any subsequent config
@@ -528,16 +535,16 @@ static int __dw_pcie_prog_outbound_atu(struct dw_pcie *pci, u8 func_no,
 int dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
 			      u64 cpu_addr, u64 pci_addr, u64 size)
 {
-	return __dw_pcie_prog_outbound_atu(pci, 0, index, type,
+	return __dw_pcie_prog_outbound_atu(pci, 0, index, type, 0, 0,
 					   cpu_addr, pci_addr, size);
 }
 
 int dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
-				 int type, u64 cpu_addr, u64 pci_addr,
-				 u64 size)
+				 int type, u8 code, u8 routing, u64 cpu_addr,
+				 u64 pci_addr, u64 size)
 {
-	return __dw_pcie_prog_outbound_atu(pci, func_no, index, type,
-					   cpu_addr, pci_addr, size);
+	return __dw_pcie_prog_outbound_atu(pci, func_no, index, type, code,
+					   routing, cpu_addr, pci_addr, size);
 }
 
 static inline u32 dw_pcie_readl_atu_ib(struct dw_pcie *pci, u32 index, u32 reg)
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 79713ce075cc..1a6e7e9489ee 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -147,11 +147,14 @@
 #define PCIE_ATU_TYPE_IO		0x2
 #define PCIE_ATU_TYPE_CFG0		0x4
 #define PCIE_ATU_TYPE_CFG1		0x5
+#define PCIE_ATU_TYPE_MSG		0x10
 #define PCIE_ATU_TD			BIT(8)
 #define PCIE_ATU_FUNC_NUM(pf)           ((pf) << 20)
 #define PCIE_ATU_REGION_CTRL2		0x004
 #define PCIE_ATU_ENABLE			BIT(31)
 #define PCIE_ATU_BAR_MODE_ENABLE	BIT(30)
+#define PCIE_ATU_INHIBIT_PAYLOAD	BIT(22)
+#define PCIE_ATU_HEADER_SUB_ENABLE	BIT(21)
 #define PCIE_ATU_FUNC_NUM_MATCH_EN      BIT(19)
 #define PCIE_ATU_LOWER_BASE		0x008
 #define PCIE_ATU_UPPER_BASE		0x00C
@@ -244,6 +247,9 @@
 /* Default eDMA LLP memory size */
 #define DMA_LLP_MEM_SIZE		PAGE_SIZE
 
+#define PCIE_MSG_ASSERT_INTA		0x20
+#define PCIE_MSG_DEASSERT_INTA		0x24
+
 struct dw_pcie;
 struct dw_pcie_rp;
 struct dw_pcie_ep;
@@ -352,7 +358,10 @@ struct dw_pcie_ep {
 	unsigned long		*ob_window_map;
 	void __iomem		*msi_mem;
 	phys_addr_t		msi_mem_phys;
+	void __iomem		*intx_mem;
+	phys_addr_t		intx_mem_phys;
 	struct pci_epf_bar	*epf_bar[PCI_STD_NUM_BARS];
+	bool			intx_by_atu;
 };
 
 struct dw_pcie_ops {
@@ -419,7 +428,8 @@ int dw_pcie_wait_for_link(struct dw_pcie *pci);
 int dw_pcie_prog_outbound_atu(struct dw_pcie *pci, int index, int type,
 			      u64 cpu_addr, u64 pci_addr, u64 size);
 int dw_pcie_prog_ep_outbound_atu(struct dw_pcie *pci, u8 func_no, int index,
-				 int type, u64 cpu_addr, u64 pci_addr, u64 size);
+				 int type, u8 code, u8 routing, u64 cpu_addr,
+				 u64 pci_addr, u64 size);
 int dw_pcie_prog_inbound_atu(struct dw_pcie *pci, int index, int type,
 			     u64 cpu_addr, u64 pci_addr, u64 size);
 int dw_pcie_prog_ep_inbound_atu(struct dw_pcie *pci, u8 func_no, int index,
-- 
2.25.1

