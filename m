Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C710D39AD8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 00:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhFCWT5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 18:19:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:11651 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230265AbhFCWT4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 18:19:56 -0400
X-IronPort-AV: E=Sophos;i="5.83,246,1616425200"; 
   d="scan'208";a="83343527"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2021 07:18:09 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D3E93410B534;
        Fri,  4 Jun 2021 07:18:05 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 00/12] Add new Renesas RZ/G2L SoC and Renesas RZ/G2L SMARC EVK support
Date:   Thu,  3 Jun 2021 23:17:46 +0100
Message-Id: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi All,

This patch series adds initial support for Renesas RZ/G2L SoC and
Renesas RZ/G2L SMARC EVK.

Initial patches enables minimal peripherals on Renesas RZ/G2L
SMARC EVK and booted via initramfs.
* Documentation for RZ/G2{L,LC,UL} SoC variants
* SoC identification support
* CPG core support
* Minimal SoC DTSi
* Minimal DTS for SMARC EVK

Changes for v2:
* Included type-2 RZ/G2Ul SoC in binding doc
* Added single entry for SMARC EVK "renesas,smarc-evk"
* Renamed ARCH_R9A07G044L to ARCH_R9A07G044 and
  dropped ARCH_R9A07G044LC config
* Dropped SoC identification changes will post them as
  separate patch.
* Updated comment in sh-sci.c
* Binding documentation patch for serial driver has been
  accepted so dropped the patch from this series
* Incorporated changes requested by Geert for CPG core
* Fixed dtbs_check errors
* Dropped 'clock-names'/'clocks'/'power-domains'/'resets'
  properties from GIC node and will include them in a separate
  patch along with arm,gic-v3.yaml binding updates
* Included ACK's from Rob

Patches are based on top of [1] master branch.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/

Cheers,
Prabhakar

Biju Das (1):
  serial: sh-sci: Add support for RZ/G2L SoC

Lad Prabhakar (11):
  dt-bindings: arm: renesas: Document Renesas RZ/G2UL SoC
  dt-bindings: arm: renesas: Document Renesas RZ/G2{L,LC} SoC variants
  dt-bindings: arm: renesas: Document SMARC EVK
  soc: renesas: Add ARCH_R9A07G044 for the new RZ/G2L SoC's
  arm64: defconfig: Enable ARCH_R9A07G044
  clk: renesas: Define RZ/G2L CPG Clock Definitions
  dt-bindings: clock: renesas: Document RZ/G2L SoC CPG driver
  clk: renesas: Add CPG core wrapper for RZ/G2L SoC
  clk: renesas: Add support for R9A07G044 SoC
  arm64: dts: renesas: Add initial DTSI for RZ/G2{L,LC} SoC's
  arm64: dts: renesas: Add initial device tree for RZ/G2L SMARC EVK

 .../devicetree/bindings/arm/renesas.yaml      |  18 +
 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  80 ++
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 119 +++
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  25 +
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |  21 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  27 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   9 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a07g044-cpg.c           | 372 +++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.c       | 979 ++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.h       | 217 ++++
 drivers/soc/renesas/Kconfig                   |   5 +
 drivers/tty/serial/sh-sci.c                   |  12 +-
 drivers/tty/serial/sh-sci.h                   |   1 +
 include/dt-bindings/clock/r9a07g044-cpg.h     |  89 ++
 17 files changed, 1978 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
 create mode 100644 drivers/clk/renesas/r9a07g044-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.h
 create mode 100644 include/dt-bindings/clock/r9a07g044-cpg.h

-- 
2.17.1

