Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A56F562F11
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 10:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235460AbiGAIzF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 04:55:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234901AbiGAIzB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 04:55:01 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5D841929A;
        Fri,  1 Jul 2022 01:54:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,236,1650898800"; 
   d="scan'208";a="124761343"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Jul 2022 17:54:58 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B4CD543E0092;
        Fri,  1 Jul 2022 17:54:58 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, krzk+dt@kernel.org, geert+renesas@glider.be,
        magnus.damm@gmail.com
Cc:     marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 00/13] treewide: PCI: renesas: Add R-Car Gen4 PCIe support
Date:   Fri,  1 Jul 2022 17:54:07 +0900
Message-Id: <20220701085420.870306-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add R-Car S4-8 (R-Car Gen4) PCIe Host and Endpoint support.
To support them, modify PCIe DesignWare common codes.

Changes from v2:
 - Remove some unneeded functions in patch [09/13].
 - Fix error messages in patch [09/13].
 - Rebase implementation of patch [10/13] on patch [09/13].
 https://lore.kernel.org/all/20220627122417.809615-1-yoshihiro.shimoda.uh@renesas.com/

Changes from v1:
 - Fix a lot of warning/errors by 'make DT_CHECKER_FLAGS=-m dt_binding_check'.
 - Add PCI_EXP_LNKCAP_MLW macros into pci_regs.h
 - Remove "extern" in pcie-rcar-gen4.h.
 - Add ep_pre_init() into dw_pcie_ep_ops for this controller.
 - Add a new flag "reset_all_bars" into dw_pcie_ep. If this way is acceptable,
   I'll make patches for other endpoint controllers to simplify.
 - Move timing of getting num-lanes property for {ep_pre,host}_init().
 - Remove some platform_get_resource().
 - Remove "struct rcar_gen4_pcie_ep".
 - Allow a kernel module for both host and ep of this controller.
 - Minor fixes for checkpatch.pl.
 https://lore.kernel.org/all/20220613115712.2831386-1-yoshihiro.shimoda.uh@renesas.com/

Yoshihiro Shimoda (13):
  PCI: Add PCI_EXP_LNKCAP_MLW macros
  PCI: controller: dwc: Expose dw_pcie_ep_exit() to module
  PCI: dwc: Add ep_pre_init() callback to dw_pcie_ep_ops
  PCI: dwc: Add reset_all_bars flag
  PCI: dwc: endpoint: Read num-lanes property before ep_pre_init()
  PCI: dwc: host: Read num-lanes property before host_init()
  dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Host
  dt-bindings: PCI: renesas: Add R-Car Gen4 PCIe Endpoint
  PCI: renesas: Add R-Car Gen4 PCIe Host support
  PCI: renesas: Add R-Car Gen4 PCIe Endpoint support
  MAINTAINERS: Update PCI DRIVER FOR RENESAS R-CAR for R-Car Gen4
  arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
  arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0

 .../bindings/pci/rcar-gen4-pci-ep.yaml        |  99 +++++++++
 .../bindings/pci/rcar-gen4-pci-host.yaml      |  97 +++++++++
 MAINTAINERS                                   |   1 +
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  39 ++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 118 +++++++++++
 drivers/pci/controller/dwc/Kconfig            |  18 ++
 drivers/pci/controller/dwc/Makefile           |   4 +
 .../pci/controller/dwc/pcie-designware-ep.c   |  16 ++
 .../pci/controller/dwc/pcie-designware-host.c |   2 +
 drivers/pci/controller/dwc/pcie-designware.c  |   1 -
 drivers/pci/controller/dwc/pcie-designware.h  |   2 +
 .../pci/controller/dwc/pcie-rcar-gen4-ep.c    | 182 ++++++++++++++++
 .../pci/controller/dwc/pcie-rcar-gen4-host.c  | 195 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 178 ++++++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.h   |  61 ++++++
 include/uapi/linux/pci_regs.h                 |   7 +
 16 files changed, 1019 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-ep.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.h

-- 
2.25.1

