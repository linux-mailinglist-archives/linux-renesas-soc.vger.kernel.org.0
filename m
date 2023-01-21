Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F05A6766DA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjAUO7D (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjAUO7D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:03 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC6C31F91A;
        Sat, 21 Jan 2023 06:59:01 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="150151029"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1543E42BC259;
        Sat, 21 Jan 2023 23:58:56 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 00/12] ADD USB3.1 HOST, Peri and DRD support
Date:   Sat, 21 Jan 2023 14:58:41 +0000
Message-Id: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add USB3.1 HOST, Peri and DRD support
on RZ/V2M EVK platform.

The reset for both host and peri are located in USB3DRD block. The
USB3DRD registers are mapped in the AXI address space of the Peripheral
module.

RZ/V2M XHCI is similar to R-Car XHCI but it doesn't require any
firmware.

Host/device needs to do reset release and set the host/device function
on DRD module, before accessing any registers.

v2->v3:
 * Fixed the X86 compilation for allmodconfig.
 * Added Rb and Acked-by tag from Rob for all the binding patches.
 * Changed USB_RZV2M_USB3DRD config option type from bool->tristate
 * Updated default values for the USB_RZV2M_USB3DRD config option
 * Updated USB_XHCI_PLATFORM to select USB_XHCI_RZV2M if ARCH_R9A09G011
   enabled.
v1->v2:
 * Added Rb tag from Rob for host binding patch
 * Renamed clock-name from "host_axi"->"axi"
 * Drop quotes around usb-xhci.yaml.
 * Moved DRD interrupts from device ctrlr to DRD bindings
 * Updated interrupts and dropped interrupt-names in device ctrlr bindings
 * Renamed aclk->axi in device ctrlr bindings
 * Added DRD interrupts and interrupt-names in DRD bindings
 * Dropped peripheral reset and reset-names from DRD bindings
 * Added reg property for usb3 device ctrlr nodes
 * Renamed peri_axi->axi and apb->reg
 * Updated pattern properties and example.
 * Moved header file from include/linux/soc/renesas->include/linux/usb
 * Passing DRD irq resource from parent to usb3_peri for handling it.
 * As drd reg is now separated from usb3 peri, updated DRD reg handling in
   usb3 peri driver.
 * Removed usb3 peri reset handling from DRD driver.
 * Added Rb tag from Geert for reset and clock updates for xhci-plat.

Biju Das (12):
  dt-bindings: usb: renesas,usb-xhci: Document RZ/V2M support
  dt-bindings: usb: renesas,usb3-peri: Update reset, clock-name and
    interrupts properties
  dt-bindings: usb: renesas,usb3-peri: Document RZ/V2MA bindings
  dt-bindings: usb: Add RZ/V2M USB3DRD binding
  usb: gadget: Add support for RZ/V2M USB3DRD driver
  usb: gadget: udc: renesas_usb3: Add role switch support for RZ/V2M
  usb: host: xhci-plat: Improve clock handling in probe()
  usb: host: xhci-plat: Add reset support
  xhci: host: Add Renesas RZ/V2M SoC support
  arm64: dts: renesas: r9a09g011: Add USB3 DRD, device and host nodes
  arm64: dts: renesas: rzv2mevk2: Enable USB3 DRD, Peripheral and Host
  arm64: dts: renesas: rzv2mevk2: Enable USB3 role switch

 .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 129 ++++++++++++++++
 .../bindings/usb/renesas,usb-xhci.yaml        |  41 +++++-
 .../bindings/usb/renesas,usb3-peri.yaml       |  40 +----
 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    |  76 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi    |  45 ++++++
 drivers/usb/gadget/udc/Kconfig                |  13 ++
 drivers/usb/gadget/udc/Makefile               |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c         | 136 +++++++++++------
 drivers/usb/gadget/udc/rzv2m_usb3drd.c        | 139 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |  10 ++
 drivers/usb/host/Makefile                     |   3 +
 drivers/usb/host/xhci-plat.c                  |  36 ++++-
 drivers/usb/host/xhci-rzv2m.c                 |  38 +++++
 drivers/usb/host/xhci-rzv2m.h                 |  16 ++
 include/linux/usb/rzv2m_usb3drd.h             |  20 +++
 15 files changed, 656 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
 create mode 100644 drivers/usb/gadget/udc/rzv2m_usb3drd.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.h
 create mode 100644 include/linux/usb/rzv2m_usb3drd.h

-- 
2.25.1

