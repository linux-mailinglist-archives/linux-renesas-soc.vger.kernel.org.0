Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0576A6FD6ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 May 2023 08:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbjEJGW6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 May 2023 02:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236072AbjEJGWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 May 2023 02:22:51 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D22D92D56;
        Tue,  9 May 2023 23:22:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,263,1677510000"; 
   d="scan'208";a="158801611"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 May 2023 15:22:39 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 259694010E3C;
        Wed, 10 May 2023 15:22:39 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     jingoohan1@gmail.com, mani@kernel.org,
        gustavo.pimentel@synopsys.com, fancer.lancer@gmail.com,
        lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, kishon@kernel.org
Cc:     marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v16 22/22] misc: pci_endpoint_test: Add Device ID for R-Car S4-8 PCIe controller
Date:   Wed, 10 May 2023 15:22:34 +0900
Message-Id: <20230510062234.201499-23-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510062234.201499-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230510062234.201499-1-yoshihiro.shimoda.uh@renesas.com>
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

Add Renesas R8A779F0 in pci_device_id table so that pci-epf-test
can be used for testing PCIe EP on R-Car S4-8.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/misc/pci_endpoint_test.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/pci_endpoint_test.c b/drivers/misc/pci_endpoint_test.c
index ed4d0ef5e5c3..150083dab71a 100644
--- a/drivers/misc/pci_endpoint_test.c
+++ b/drivers/misc/pci_endpoint_test.c
@@ -81,6 +81,7 @@
 #define PCI_DEVICE_ID_RENESAS_R8A774B1		0x002b
 #define PCI_DEVICE_ID_RENESAS_R8A774C0		0x002d
 #define PCI_DEVICE_ID_RENESAS_R8A774E1		0x0025
+#define PCI_DEVICE_ID_RENESAS_R8A779F0		0x0031
 
 static DEFINE_IDA(pci_endpoint_test_ida);
 
@@ -990,6 +991,9 @@ static const struct pci_device_id pci_endpoint_test_tbl[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, PCI_DEVICE_ID_RENESAS_R8A774B1),},
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, PCI_DEVICE_ID_RENESAS_R8A774C0),},
 	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, PCI_DEVICE_ID_RENESAS_R8A774E1),},
+	{ PCI_DEVICE(PCI_VENDOR_ID_RENESAS, PCI_DEVICE_ID_RENESAS_R8A779F0),
+	  .driver_data = (kernel_ulong_t)&default_data,
+	},
 	{ PCI_DEVICE(PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_J721E),
 	  .driver_data = (kernel_ulong_t)&j721e_data,
 	},
-- 
2.25.1

