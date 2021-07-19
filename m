Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DAD3CD4B5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jul 2021 14:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236968AbhGSLot (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 19 Jul 2021 07:44:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:16001 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236667AbhGSLor (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jul 2021 07:44:47 -0400
X-IronPort-AV: E=Sophos;i="5.84,252,1620658800"; 
   d="scan'208";a="88078285"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jul 2021 21:25:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CDE024221AFD;
        Mon, 19 Jul 2021 21:25:23 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 00/10] Add USB2.0 support
Date:   Mon, 19 Jul 2021 13:25:21 +0100
Message-Id: <20210719122521.6855-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add USB PHY Control, USB2.0 Host and USB2.0 device support for RZ/G2L SoC.

v3->v4:
 * Added Rob's Acked-by tag for generic-{ohci,ehci} binding patch
 * Added Rob's Rb tag for RZ/G2L USBPHY control binding patch
 * Incorporated Phillip's review comments for USBPHY control driver.
 * Dropped second reset from usb2-phy binding patch
 * Added maxitems as per Rob's review comment.

v2->v3
 * USBPHY Control IP modelled as reset bindings as per Rob's suggestion
 * Updated the binding patches
 * Incorporated Geert's and Shimoda-San's review comment for phy driver patch.

v1->v2
 * Updated usb phy control bindings with clock definitions
 * Updated generic ohci/ehci bindings to support RZ/G2L SoC
 * Incorporated vinod's review comment on usb phy control driver
 * Add support for USB2.0 device and OTG support.

Biju Das (10):
  dt-bindings: usb: generic-ohci: Document dr_mode property
  dt-bindings: usb: generic-ehci: Document dr_mode property
  dt-bindings: reset: Document RZ/G2L USBPHY Control bindings
  reset: renesas: Add RZ/G2L usbphy control driver
  arm64: configs: defconfig: Enable RZ/G2L USBPHY control driver
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
  phy: renesas: phy-rcar-gen3-usb2: Add OTG support for RZ/G2L
  arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L bindings
  arm64: dts: renesas: r9a07g044: Add USB2.0 device support

 .../bindings/phy/renesas,usb2-phy.yaml        |  19 ++
 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      |  65 +++++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   5 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   5 +
 .../bindings/usb/renesas,usbhs.yaml           |  22 ++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 113 +++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  97 +++++++---
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       | 175 ++++++++++++++++++
 11 files changed, 484 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
 create mode 100644 drivers/reset/reset-rzg2l-usbphy-ctrl.c

-- 
2.17.1

