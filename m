Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E5E74648A9
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Dec 2021 08:33:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347564AbhLAHgj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 1 Dec 2021 02:36:39 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:27177 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233520AbhLAHgi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Dec 2021 02:36:38 -0500
X-IronPort-AV: E=Sophos;i="5.87,278,1631545200"; 
   d="scan'208";a="102002981"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Dec 2021 16:33:16 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D865441FE2AC;
        Wed,  1 Dec 2021 16:33:16 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 00/14] treewide: Initial support for R-Car S4-8
Date:   Wed,  1 Dec 2021 16:32:54 +0900
Message-Id: <20211201073308.1003945-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds initial support for the Renesas R-Car S4-8
(r8a779f0) SoC.

Changes from v1:
 - Remove some merged patches by Geert-san. (Thanks!)
 - Fix dt-binding doc of Spider boards
 - Fix r8a779f0 SYSC / Clock definitions
 - Fix dt-binding doc of scif for R-Car Gen4
 - Fix ordering in Kconfig of drivers/soc/renesas/Kconfig
 - Remove .reg in renesas-soc.c for rcar_gen4.
 - Remove moditication of V3U_WDTRSTCR.
 - Split R-Car Gen4 support at first for SYSC and CPG driver.
 - Fix some minor issues in r8a779f0-cpg-mssr.c.
 - Use DEF_BASE for .sdsrc.
 - Rebase the latest renesas-clk for cpg_sd_clk_register().

Yoshihiro Shimoda (14):
  dt-bindings: arm: renesas: Document Renesas Spider boards
  dt-bindings: power: Add r8a779f0 SYSC power domain definitions
  dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
  dt-bindings: serial: renesas,scif: Document r8a779f0 bindings
  soc: renesas: rcar-gen4-sysc: Introduce R-Car Gen4 SYSC driver
  soc: renesas: r8a779f0-sysc: Add r8a779f0 support
  soc: renesas: Identify R-Car S4-8
  clk: renesas: rcar-gen4-cpg: Introduce R-Car Gen4 CPG driver
  clk: renesas: cpg-mssr: Add support for R-Car S4-8
  soc: renesas: rcar-rst: Add support for R-Car S4-8
  tty: serial: sh-sci: Add support for R-Car Gen4
  arm64: dts: renesas: Add Renesas R8A779F0 SoC support
  arm64: dts: renesas: Add Renesas Spider boards support
  arm64: defconfig: Enable R-Car S4-8

 .../devicetree/bindings/arm/renesas.yaml      |   8 +
 .../bindings/serial/renesas,scif.yaml         |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  36 ++
 .../boot/dts/renesas/r8a779f0-spider.dts      |  22 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 121 ++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |  10 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       | 350 ++--------------
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       | 183 +++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c           | 307 ++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h           |  76 ++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |  42 +-
 drivers/clk/renesas/renesas-cpg-mssr.h        |   3 +-
 drivers/soc/renesas/Kconfig                   |  15 +
 drivers/soc/renesas/Makefile                  |   2 +
 drivers/soc/renesas/r8a779a0-sysc.c           | 380 +-----------------
 drivers/soc/renesas/r8a779f0-sysc.c           |  47 +++
 drivers/soc/renesas/rcar-gen4-sysc.c          | 376 +++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.h          |  43 ++
 drivers/soc/renesas/rcar-rst.c                |   6 +-
 drivers/soc/renesas/renesas-soc.c             |  12 +
 drivers/tty/serial/sh-sci.c                   |   3 +
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h |  64 +++
 include/dt-bindings/power/r8a779f0-sysc.h     |  30 ++
 26 files changed, 1430 insertions(+), 718 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f0.dtsi
 create mode 100644 drivers/clk/renesas/r8a779f0-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen4-cpg.h
 create mode 100644 drivers/soc/renesas/r8a779f0-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-gen4-sysc.c
 create mode 100644 drivers/soc/renesas/rcar-gen4-sysc.h
 create mode 100644 include/dt-bindings/clock/r8a779f0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779f0-sysc.h

-- 
2.25.1

