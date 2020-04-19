Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC39B1AFA85
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 19 Apr 2020 15:27:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbgDSN1R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 19 Apr 2020 09:27:17 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12666 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725793AbgDSN1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 19 Apr 2020 09:27:17 -0400
X-IronPort-AV: E=Sophos;i="5.72,403,1580742000"; 
   d="scan'208";a="44894763"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Apr 2020 22:27:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B93BD422C025;
        Sun, 19 Apr 2020 22:27:10 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Andrew Murray <amurray@thegoodpenguin.co.uk>,
        Tom Joseph <tjoseph@cadence.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Lad Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v8 0/8] Add support for PCIe controller to work in endpoint mode on R-Car/RZ/G2x SoCs
Date:   Sun, 19 Apr 2020 14:26:55 +0100
Message-Id: <1587302823-4435-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds support for PCIe controller on R-Car/RZ-G2x to work in
endpoint mode, this also extends the epf framework to handle base region
for mapping PCI address locally.

Note:
The cadence/rockchip/designware endpoint drivers are build tested only.

Changes for v8:
* Dropped adding R8A774C0 (0x002d) pci-id in pci_ids.h
* Fixed typo in commit message for patch 2/8
* Reworded commit message for patch 5/8 as suggested by Bjorn
* Split up patch to add pci_epc_mem_init() interface to add page_size argument
  as suggested by Bjorn.

Changes for v7:
* Fixed review comments pointed by Shimoda-san
  1] Made DT bindings dual licensed, added Shimoda-san as maintainer and fixed
     the example as its built with #{address,size}-cells = <1>. I have still
     restored the Ack from Rob and Shimoda-san with these changes.
  2] Split up the patches so that they can be picked up by respective subsystem
     patches 1/4-9/11 are now part of this series.
  3] Dropped altering a comment in pci-epc.h
  4] Used a local variable align_size in pci_epc_mem_alloc_addr() so that size
     variable doesn't get overwritten in the loop.
  5] Replaced i-=1 with i--
  6] Replaced rcar with R-Car in patch subject and description.
  7] Set MACCTLR in init() callback

Changes for v6:
1] Rebased patches on endpoint branch of https://git.kernel.org/pub/
   scm/linux/kernel/git/lpieralisi/pci.git/
2] Fixed review comments from Shimoda-san
   a] Made sure defconfig changes were in separate patch
   b] Created rcar_pcie_host/rcar_pcie_ep structures
   c] Added pci-id for R8A774C0
   d] Added entry in MAINTAINERS for dt-binding
   e] Dropped unnecessary braces
3] Added support for msi.

Changes for v5:
1] Rebased patches on next branch of https://git.kernel.org/pub/scm/
   linux/kernel/git/helgaas/pci.git
2] Fixed review comments reported by Kishon while fetching the matching
   window in function pci_epc_get_matching_window()
3] Fixed review comments reported by Bjorn
   a] Split patch up first patch so that its easier to review and incremental
   b] Fixed typos
4] Included Reviewed tag from Rob for the dt-binding patch
5] Fixed issue reported by Nathan for assigning variable to itself

Changes for v4:
1] Fixed dtb_check error reported by Rob
2] Fixed review comments reported by Kishon
   a] Dropped pci_epc_find_best_fit_window()
   b] Fixed initializing mem ptr in __pci_epc_mem_init()
   c] Dropped map_size from pci_epc_mem_window structure

Changes for v3:
1] Fixed review comments from Bjorn and Kishon.
3] Converted to DT schema

Changes for v2:
1] Fixed review comments from Biju for dt-bindings to include an example
   for a tested platform.
2] Fixed review comments from Kishon to extend the features of outbound
   regions in epf framework.
3] Added support to parse outbound-ranges in OF.

Lad Prabhakar (8):
  PCI: rcar: Rename pcie-rcar.c to pcie-rcar-host.c
  PCI: rcar: Move shareable code to a common file
  PCI: rcar: Fix calculating mask for PCIEPAMR register
  PCI: endpoint: Pass page size as argument to pci_epc_mem_init()
  PCI: endpoint: Add support to handle multiple base for mapping
    outbound memory
  dt-bindings: PCI: rcar: Add bindings for R-Car PCIe endpoint
    controller
  PCI: rcar: Add endpoint mode support
  MAINTAINERS: Add file patterns for rcar PCI device tree bindings

 .../devicetree/bindings/pci/rcar-pci-ep.yaml  |   77 ++
 MAINTAINERS                                   |    1 +
 drivers/pci/controller/Kconfig                |   18 +
 drivers/pci/controller/Makefile               |    3 +-
 .../pci/controller/cadence/pcie-cadence-ep.c  |    2 +-
 .../pci/controller/dwc/pcie-designware-ep.c   |   16 +-
 drivers/pci/controller/pcie-rcar-ep.c         |  555 ++++++++
 drivers/pci/controller/pcie-rcar-host.c       | 1065 +++++++++++++++
 drivers/pci/controller/pcie-rcar.c            | 1206 +----------------
 drivers/pci/controller/pcie-rcar.h            |  140 ++
 drivers/pci/controller/pcie-rockchip-ep.c     |    2 +-
 drivers/pci/endpoint/pci-epc-mem.c            |  201 ++-
 include/linux/pci-epc.h                       |   38 +-
 13 files changed, 2073 insertions(+), 1251 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/rcar-pci-ep.yaml
 create mode 100644 drivers/pci/controller/pcie-rcar-ep.c
 create mode 100644 drivers/pci/controller/pcie-rcar-host.c
 create mode 100644 drivers/pci/controller/pcie-rcar.h

-- 
2.17.1

