Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680003D7E14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 20:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhG0Sze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 14:55:34 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:24741 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229763AbhG0Sze (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 14:55:34 -0400
X-IronPort-AV: E=Sophos;i="5.84,274,1620658800"; 
   d="scan'208";a="88899487"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 28 Jul 2021 03:55:32 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DF5A24005161;
        Wed, 28 Jul 2021 03:55:29 +0900 (JST)
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
Subject: [PATCH v5 0/6] Add USB2.0 support
Date:   Tue, 27 Jul 2021 19:55:21 +0100
Message-Id: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series aims to add USB2.0 Host and device support for RZ/G2L SoC.

v4->v5:
 * Removed USBPHY control and binding patches as it is accepted for reset/next
 * Removed USB ehci/ohci binding patches as it is accepted for usb/next.
 * Updated Renesas USB2.0 PHY bindings to just use 'resets' as required.
 * Added interrupts maxitems=1 for SoC other than RZ/G2L for Renesas USBHS bindings
 * Updated the commit description for USB2.0 PHY driver patch.

v3->v4:
 * Added Rob's Acked-by tag for generic-{ohci,ehci} binding patch
 * Added Rob's Rb tag for RZ/G2L USBPHY control binding patch
 * Incorporated Philipp's review comments for USBPHY control driver.
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

Biju Das (6):
  arm64: configs: defconfig: Enable RZ/G2L USBPHY control driver
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
  phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/G2L
  arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
  dt-bindings: usb: renesas,usbhs: Document RZ/G2L bindings
  arm64: dts: renesas: r9a07g044: Add USB2.0 device support

 .../bindings/phy/renesas,usb2-phy.yaml        |  15 +++
 .../bindings/usb/renesas,usbhs.yaml           |  26 +++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 113 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/phy/renesas/phy-rcar-gen3-usb2.c      |  97 +++++++++++----
 5 files changed, 226 insertions(+), 26 deletions(-)

-- 
2.17.1

