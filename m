Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF33E3A19A5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbhFIPew (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:34:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53196 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231691AbhFIPev (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:34:51 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83886951"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jun 2021 00:32:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4DD6040090FB;
        Thu, 10 Jun 2021 00:32:51 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 00/11] Add new Renesas RZ/G2L SoC and Renesas RZ/G2L SMARC EVK support
Date:   Wed,  9 Jun 2021 16:32:19 +0100
Message-Id: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Changes for v3:
* Updated tag from Rob for CPG binding doc
* Included RB tags from Geert
* Added description for clock-names property in CPG binding doc
* Dropped serial driver patch (already merged)
* Fixed CPG core issues for USB/ADC IP
* Added r9a07g044l2.dtsi

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
 .../bindings/clock/renesas,rzg2l-cpg.yaml     |  83 ++
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi    | 120 +++
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi  |  25 +
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |  21 +
 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi  |  13 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  |  27 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |  10 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r9a07g044-cpg.c           | 127 +++
 drivers/clk/renesas/renesas-rzg2l-cpg.c       | 750 ++++++++++++++++++
 drivers/clk/renesas/renesas-rzg2l-cpg.h       | 136 ++++
 drivers/soc/renesas/Kconfig                   |   5 +
 include/dt-bindings/clock/r9a07g044-cpg.h     |  89 +++
 16 files changed, 1429 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
 create mode 100644 drivers/clk/renesas/r9a07g044-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.c
 create mode 100644 drivers/clk/renesas/renesas-rzg2l-cpg.h
 create mode 100644 include/dt-bindings/clock/r9a07g044-cpg.h

-- 
2.17.1

