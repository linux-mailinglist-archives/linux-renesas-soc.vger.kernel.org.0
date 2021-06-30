Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B59B93B7E3F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233043AbhF3Hkp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:40:45 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:37182 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233010AbhF3Hkn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:40:43 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85976892"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jun 2021 16:38:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.74])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 457CC4012252;
        Wed, 30 Jun 2021 16:38:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 00/11] Add USB2.0 support
Date:   Wed, 30 Jun 2021 08:37:47 +0100
Message-Id: <20210630073747.22677-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add USB PHY Control, USB2.0 Host and USB2.0 device support for RZ/G2L SoC.

https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/rzg2l-update-clock-defs-v4

v2->v3
 * USBPHY Control IP modelled as reset bindings as per Rob's suggestion
 * Updated the binding patches
 * Incorporated Geert's and Shimoda-San's review comment for phy driver patch.

v1->v2
 * Updated usb phy control bindings with clock definitions
 * Updated generic ohci/ehci bindings to support RZ/G2L SoC
 * Incorporated vind's review comment on us phy control driver
 * Add support for USB2.0 device and OTG support.

Biju Das (11):
  dt-bindings: usb: generic-ohci: Document dr_mode property
  dt-bindings: usb: generic-ehci: Document dr_mode property
  dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
  drivers: clk: renesas: r9a07g044-cpg: Add USB clocks/resets
  reset: renesas: Add RZ/G2L usbphy control driver
  arm64: configs: defconfig: Enable RZ/G2L USBPHY control driver
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
  arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L bindings
  phy: renesas: phy-rcar-gen3-usb2: Add OTG support for RZ/G2L
  arm64: dts: renesas: r9a07g044: Add USB2.0 device support

 .../bindings/phy/renesas,usb2-phy.yaml        |  18 ++
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  66 ++++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   5 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   5 +
 .../bindings/usb/renesas,usbhs.yaml           |  21 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 113 ++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c           |  12 ++
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  97 ++++++---
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 195 ++++++++++++++++++
 12 files changed, 515 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c


base-commit: 06c1e6911a7a76b446e4b00fc8bad5d8465932f8
-- 
2.17.1

