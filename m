Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 939873A4332
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 15:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230376AbhFKNsq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 09:48:46 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:2891 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230373AbhFKNsq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:48:46 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="84106292"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2021 22:46:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D8B204274BD0;
        Fri, 11 Jun 2021 22:46:44 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/6] Add RZ/G2L USB2.0 phy and host support
Date:   Fri, 11 Jun 2021 14:46:36 +0100
Message-Id: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds USB2.0 phy and Host support for RZ/G2L SoC.

A new driver introduced for RZ/G2L USB phy control block,
which mainly controls reset and power down of the USB2.0/PHY.

This patchset is based on master branch [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/

Biju Das (6):
  dt-bindings: phy: renesas: Document RZ/G2L USB PHY Control bindings
  drivers: clk: renesas: r9a07g044-cpg: Add USB clocks
  phy: renesas: Add RZ/G2L usb phy control driver
  arm64: configs: defconfig: Enable RZ/G2L USB PHY control driver
  dt-bindings: phy: renesas,usb2-phy: Document RZ/G2L phy bindings
  arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support

 .../phy/renesas,rzg2l-usbphyctrl.yaml         |  50 ++++++
 .../bindings/phy/renesas,usb2-phy.yaml        |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  81 +++++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/r9a07g044-cpg.c           |   6 +
 drivers/phy/renesas/Kconfig                   |   7 +
 drivers/phy/renesas/Makefile                  |   1 +
 drivers/phy/renesas/phy-rzg2l-usbphyctrl.c    | 163 ++++++++++++++++++
 8 files changed, 310 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/renesas,rzg2l-usbphyctrl.yaml
 create mode 100644 drivers/phy/renesas/phy-rzg2l-usbphyctrl.c

-- 
2.17.1

