Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FABE64A5BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Dec 2022 18:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232645AbiLLR2O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Dec 2022 12:28:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229536AbiLLR2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 12:28:13 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 426B7FCDE;
        Mon, 12 Dec 2022 09:28:12 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,239,1665414000"; 
   d="scan'208";a="143082617"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Dec 2022 02:28:11 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 87C6C406F1D3;
        Tue, 13 Dec 2022 02:28:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Artur Bujdoso <artur.bujdoso@gmail.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 00/16] ADD USB3.1 HOST, Peri and DRD support
Date:   Mon, 12 Dec 2022 17:27:48 +0000
Message-Id: <20221212172804.1277751-1-biju.das.jz@bp.renesas.com>
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

RZ/V2M is similar to R-Car XHCI but it doesn't require any
firmware.

Patch#16 depend upon [1]
[1] https://lore.kernel.org/linux-renesas-soc/20221209171836.71610-1-biju.das.jz@bp.renesas.com/T/#t


Biju Das (16):
  clk: renesas: r9a09g011: Add USB clock and reset entries
  dt-bindings: usb: Add RZ/V2M USB3DRD binding
  usb: gadget: Add support for RZ/V2M USB3DRD driver
  dt-bindings: usb: renesas,usb-xhci: Document RZ/V2M support
  usb: host: xhci-plat: Improve clock handling in probe()
  usb: host: xhci-plat: Add reset support
  xhci: host: Add Renesas RZ/V2M SoC support
  dt-bindings: usb: renesas,usb3-peri: Update reset property
  dt-bindings: usb: renesas,usb3-peri: Document RZ/V2MA bindings
  usb: gadget: udc: renesas_usb3: Remove drd_reset handling
  usb: gadget: udc: renesas_usb3: Add role switch support for RZ/V2M
  arm64: dts: renesas: r9a09g011: Add USB3 DRD and host nodes
  arm64: dts: renesas: r9a09g011: Add USB3 peripheral node
  arm64: dts: renesas: rzv2mevk2: Enable USB3 DRD and Host
  arm64: dts: renesas: rzv2mevk2: Enable USB3 Peripheral
  arm64: dts: renesas: rzv2mevk2: Enable USB3 role switch

 .../bindings/usb/renesas,rzv2m-usb3drd.yaml   | 123 ++++++++++++++
 .../bindings/usb/renesas,usb-xhci.yaml        |  41 ++++-
 .../bindings/usb/renesas,usb3-peri.yaml       |  16 +-
 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    |  76 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi    |  46 ++++++
 drivers/clk/renesas/r9a09g011-cpg.c           |  21 +++
 drivers/usb/gadget/udc/Kconfig                |   7 +
 drivers/usb/gadget/udc/Makefile               |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c         |  63 ++++----
 drivers/usb/gadget/udc/rzv2m_usb3drd.c        | 151 ++++++++++++++++++
 drivers/usb/host/Kconfig                      |   9 ++
 drivers/usb/host/Makefile                     |   3 +
 drivers/usb/host/xhci-plat.c                  |  36 ++++-
 drivers/usb/host/xhci-rzv2m.c                 |  38 +++++
 drivers/usb/host/xhci-rzv2m.h                 |  16 ++
 include/linux/soc/renesas/rzv2m_usb3drd.h     |  19 +++
 16 files changed, 615 insertions(+), 51 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,rzv2m-usb3drd.yaml
 create mode 100644 drivers/usb/gadget/udc/rzv2m_usb3drd.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.c
 create mode 100644 drivers/usb/host/xhci-rzv2m.h
 create mode 100644 include/linux/soc/renesas/rzv2m_usb3drd.h

-- 
2.25.1

