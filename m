Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD9B863228A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Nov 2022 13:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbiKUMoM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Nov 2022 07:44:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbiKUMoL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2022 07:44:11 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D7156BF825;
        Mon, 21 Nov 2022 04:44:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,181,1665414000"; 
   d="scan'208";a="143416637"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Nov 2022 21:44:09 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0800249236FB;
        Mon, 21 Nov 2022 21:44:09 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, krzk+dt@kernel.org
Cc:     marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v7 0/9] PCI: rcar-gen4: Add R-Car Gen4 PCIe support
Date:   Mon, 21 Nov 2022 21:43:51 +0900
Message-Id: <20221121124400.1282768-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add R-Car S4-8 (R-Car Gen4) PCIe Host and Endpoint support.
To support them, modify PCIe DesignWare common codes.

Changes from v6:
 https://lore.kernel.org/all/20220922080647.3489791-1-yoshihiro.shimoda.uh@renesas.com/
 - Based on next-20221116.
 -- And based on the following patches:
    [PATCH v7 00/20] PCI: dwc: Add generic resources and Baikal-T1 support
    https://lore.kernel.org/linux-pci/20221113191301.5526-1-Sergey.Semin@baikalelectronics.ru/
    [PATCH v6 00/24] dmaengine: dw-edma: Add RP/EP local DMA controllers support
    https://lore.kernel.org/linux-pci/20221107210438.1515-1-Sergey.Semin@baikalelectronics.ru/
 - Update dt-bindings docs for the latest based code.
 - Add support for triggering legacy IRQs in the patch [06/10] (new).
 - Add .no_msix flag into the patch [07/10].
 - Merge .ep_pre_init() support into the patch [08/10].
 - Add .reserved_bar for BAR5 instead in the patch [08/10].
 - Change SPDX-License-Identifier from "GPL-2.0" to "GPL-2.0-only".

Changes from v5:
 https://lore.kernel.org/all/20220905071257.1059436-1-yoshihiro.shimoda.uh@renesas.com/
 - No treewide patches.
 - Drop PCI_EXP_LNKCAP_MLW_X32 in patch [03/10].
 - Add Acked-by in patch [03/10].
 - Fix subject prefix in patch [04/10], [05/10], [08/10] and [09/10].
 - Fix typo in patch [05/10] and [07/10].

Yoshihiro Shimoda (9):
  dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Host
  dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Endpoint
  PCI: Add PCI_EXP_LNKCAP_MLW macros
  PCI: designware-ep: Expose dw_pcie_ep_exit() to module
  PCI: dwc: Avoid reading a register to detect whether eDMA exists
  PCI: dwc: Add support for triggering legacy IRQs
  PCI: rcar-gen4: Add R-Car Gen4 PCIe Host support
  PCI: rcar-gen4-ep: Add R-Car Gen4 PCIe Endpoint support
  MAINTAINERS: Update PCI DRIVER FOR RENESAS R-CAR for R-Car Gen4

 .../bindings/pci/rcar-gen4-pci-ep.yaml        |  90 +++++++++
 .../bindings/pci/rcar-gen4-pci-host.yaml      |  90 +++++++++
 MAINTAINERS                                   |   1 +
 drivers/pci/controller/dwc/Kconfig            |  18 ++
 drivers/pci/controller/dwc/Makefile           |   4 +
 .../pci/controller/dwc/pcie-designware-ep.c   |  70 ++++++-
 .../pci/controller/dwc/pcie-designware-host.c |   3 +
 drivers/pci/controller/dwc/pcie-designware.c  |  29 ++-
 drivers/pci/controller/dwc/pcie-designware.h  |  14 +-
 .../pci/controller/dwc/pcie-rcar-gen4-ep.c    | 182 +++++++++++++++++
 .../pci/controller/dwc/pcie-rcar-gen4-host.c  | 190 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 181 +++++++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.h   |  63 ++++++
 include/uapi/linux/pci_regs.h                 |   6 +
 14 files changed, 923 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-ep.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.h

-- 
2.25.1

