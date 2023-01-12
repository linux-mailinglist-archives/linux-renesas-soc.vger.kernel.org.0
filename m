Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD77366868A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240210AbjALWJE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:09:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240344AbjALWIe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:08:34 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 513E8279;
        Thu, 12 Jan 2023 13:59:13 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="146137066"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:12 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AA753400A8BB;
        Fri, 13 Jan 2023 06:59:08 +0900 (JST)
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
Subject: [PATCH v2 00/12] ADD USB3.1 HOST, Peri and DRD support
Date:   Thu, 12 Jan 2023 21:58:54 +0000
Message-Id: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
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

This patch series aims to add USB3.1 HOST, Peri and DRD support
on RZ/V2M EVK platform.

The reset for both host and peri are located in USB3DRD block. The
USB3DRD registers are mapped in the AXI address space of the Peripheral
module.

RZ/V2M XHCI is similar to R-Car XHCI but it doesn't require any
firmware.

Host/device needs to do reset release and set the host/device function
on DRD module, before accessing any registers.

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

Note:
 * Patch12 dependup on [1]
  [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221209171836.71610-3-biju.das.jz@bp.renesas.com/

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
 drivers/usb/gadget/udc/Kconfig                |   7 +
 drivers/usb/gadget/udc/Makefile               |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c         | 136 +++++++++++------
 drivers/usb/gadget/udc/rzv2m_usb3drd.c        | 139 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   9 ++
 drivers/usb/host/Makefile                     |   3 +
 drivers/usb/host/xhci-plat.c                  |  36 ++++-
 drivers/usb/host/xhci-rzv2m.c                 |  38 +++++
 drivers/usb/host/xhci-rzv2m.h                 |  16 ++
 include/linux/usb/rzv2m_usb3drd.h             |  20 +++
 15 files changed, 649 insertions(+), 87 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
 create mode 100644 drivers/usb/gadget/udc/rzv2m_usb3drd.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.h
 create mode 100644 include/linux/usb/rzv2m_usb3drd.h

-- 
2.25.1

