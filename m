Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 515203AE62D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230268AbhFUJmF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:05 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:47950 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229576AbhFUJmE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:04 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="85045854"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jun 2021 18:39:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AAC77400C4C3;
        Mon, 21 Jun 2021 18:39:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 00/11] Add USB2.0 support.
Date:   Mon, 21 Jun 2021 10:39:32 +0100
Message-Id: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add USB PHY Control, USB2.0 Host and USB2.0 device
support for RZ/G2L SoC.

v1->v2
 * Updated usb phy control bindings with clock definitions
 * Updated generic ohci/ehci bindings to support RZ/G2L SoC
 * Incorporated vind's review comment on us phy control driver
 * Add support for USB2.0 device and OTG support.

v1:
 - https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=498915

Biju Das (11):
  dt-bindings: phy: renesas: Document RZ/G2L USB PHY Control bindings
  drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
  phy: renesas: Add RZ/G2L usb phy control driver
  arm64: configs: defconfig: Enable RZ/G2L USB PHY control driver
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
  dt-bindings: usb: generic-ohci: Document RZ/G2L SoC bindings
  dt-bindings: usb: generic-ehci: Document RZ/G2L SoC bindings
  arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L bindings
  phy: renesas: phy-rcar-gen3-usb2: Add OTG support for RZ/G2L
  arm64: dts: renesas: r9a07g044: Add USB2.0 device support

 .../phy/renesas,rzg2l-usbphyctrl.yaml         |  65 ++++++++
 .../bindings/phy/renesas,usb2-phy.yaml        |  23 +--
 .../devicetree/bindings/usb/generic-ehci.yaml |  33 +++-
 .../devicetree/bindings/usb/generic-ohci.yaml |  32 +++-
 .../bindings/usb/renesas,usbhs.yaml           |  44 ++++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 119 +++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c           |  12 ++
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  63 +++++--
 drivers/phy/renesas/phy-rzg2l-usbphyctrl.c    | 157 ++++++++++++++++++
 12 files changed, 522 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
 create mode 100644 drivers/phy/renesas/phy-rzg2l-usbphyctrl.c

-- 
2.17.1

