Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83E383810BC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:28:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhENT3Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:29:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:15521 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229524AbhENT3Z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:29:25 -0400
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Fri, 14 May 2021 15:29:24 EDT
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81147945"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2021 04:23:07 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D8EC34010906;
        Sat, 15 May 2021 04:23:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 00/16] Add new Renesas RZ/G2L SoC and Renesas RZ/G2L SMARC EVK support
Date:   Fri, 14 May 2021 20:22:02 +0100
Message-Id: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds initial support for Renesas RZ/G2L SoC and
Renesas RZ/G2L SMARC EVK.

The RZ/G2L SoC includes a single/dual Cortex-A55 CPU including
below list of IP's:
* Cortex-M33
* 3D Graphics engine (Arm Mali-G31)
* Video Codec (H.264)
* Camera interface (MIPI-CSI or Parallel-IF)
* Display interface (MIPI-DSI or Parallel-IF)
* USB2.0 interface 2ch, SD interface 2ch
* CAN interface (CAN-FD)
* Giga bit Ethernet 2ch

Initial patches enables minimal peripherals on Renesas RZ/G2L
SMARC EVK and booted via initramfs.
* Documentation for RZ/G2{L,LC,UL} SoC variants
* SoC identification support
* CPG core support
* Minimal SoC DTSi
* Minimal DTS for SMARC EVK

Patches are based on top of [1] master branch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/

Links for SoC and EVK:
[*] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/
rz-arm-based-high-end-32-64-bit-mpus/rzg2l-general-purpose-microprocessors-
dual-core-arm-cortex-a55-12-ghz-cpus-3d-graphics-and-video-codec
[*] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/
rz-arm-based-high-end-32-64-bit-mpus/rzg2lc-general-purpose-microprocessors-
dual-core-arm-cortex-a55-12-ghz-cpus-3d-graphics
[*] https://renesas.info/wiki/RZ-G/RZ-G2L_SMARC

Cheers,
Prabhakar

Biju Das (1):
  serial: sh-sci: Add support for RZ/G2L SoC

Lad Prabhakar (15):
  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
  dt-bindings: arm: renesas: Document Renesas RZ/G2{L,LC} SoC variants
  dt-bindings: arm: renesas: Document SMARC EVK
  soc: renesas: Add ARCH_R9A07G044{L,LC} for the new RZ/G2{L,LC} SoC's
  arm64: defconfig: Enable ARCH_R9A07G044{L,LC}
  dt-bindings: arm: renesas,prr: Add new compatible string for
    RZ/G{L,LC,UL}
  soc: renesas: Add support to read LSI DEVID register
  soc: renesas: Add support to identify RZ/G2{L,LC} SoC's
  dt-bindings: serial: renesas,scif: Document r9a07g044 bindings
  dt-bindings: clock: renesas: Document RZ/G2L SoC CPG driver
  clk: renesas: Define RZ/G2L CPG Clock Definitions
  clk: renesas: Add CPG core wrapper for RZ/G2L SoC
  clk: renesas: Add support for R9A07G044L SoC
  arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's
  arm64: dts: renesas: Add initial device tree for RZ/G2L SMARC EVK

 .../devicetree/bindings/arm/renesas,prr.yaml  |   6 +-
 .../devicetree/bindings/arm/renesas.yaml      |  18 +
 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  80 ++
 .../bindings/serial/renesas,scif.yaml         |   4 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/g2l-smarc.dtsi    |  27 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    |  70 ++
 arch/arm64/boot/dts/renesas/r9a07g044l.dtsi   |  21 +
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  43 +
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |  21 +
 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi  |  62 ++
 arch/arm64/configs/defconfig                  |   2 +
 drivers/clk/renesas/Kconfig                   |  12 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a07g044l-cpg.c          | 372 +++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.c       | 964 ++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.h       | 223 ++++
 drivers/soc/renesas/Kconfig                   |  10 +
 drivers/soc/renesas/renesas-soc.c             |  33 +-
 drivers/tty/serial/sh-sci.c                   |  11 +
 drivers/tty/serial/sh-sci.h                   |   1 +
 include/dt-bindings/clock/r9a07g044l-cpg.h    |  89 ++
 22 files changed, 2070 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/g2l-smarc.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
 create mode 100644 drivers/clk/renesas/r9a07g044l-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.h
 create mode 100644 include/dt-bindings/clock/r9a07g044l-cpg.h

-- 
2.17.1

