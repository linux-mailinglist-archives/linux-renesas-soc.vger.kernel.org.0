Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77709452BE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 08:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbhKPHpm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 02:45:42 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:48885 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231274AbhKPHpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 02:45:38 -0500
X-IronPort-AV: E=Sophos;i="5.87,238,1631545200"; 
   d="scan'208";a="100433326"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 16 Nov 2021 16:42:37 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 337AB40083D3;
        Tue, 16 Nov 2021 16:42:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/16] treewide: Initial support for R-Car S4-8
Date:   Tue, 16 Nov 2021 16:41:14 +0900
Message-Id: <20211116074130.107554-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds initial support for the Renesas R-Car S4-8
(r8a779f0) SoC.

Yoshihiro Shimoda (16):
  dt-bindings: arm: renesas: Document R-Car S4-8 SoC DT bindings
  dt-bindings: arm: renesas: Document Renesas Spider boards
  dt-bindings: reset: renesas,rst: Document r8a779f0 reset module
  dt-bindings: power: renesas,rcar-sysc: Document r8a779f0 SYSC bindings
  dt-bindings: power: Add r8a779f0 SYSC power domain definitions
  dt-bindings: clock: renesas,cpg-mssr: Document r8a779f0
  dt-bindings: clock: Add r8a779f0 CPG Core Clock Definitions
  dt-bindings: serial: renesas,scif: Document r8a779f0 bindings
  soc: renesas: Identify R-Car S4-8
  soc: renesas: r8a779f0-sysc: Add r8a779f0 support
  soc: renesas: rcar-rst: Add support for R-Car S4-8
  clk: renesas: cpg-mssr: Add support for R-Car S4-8
  tty: serial: sh-sci: Add support for R-Car Gen4
  arm64: dts: renesas: Add Renesas R8A779F0 SoC support
  arm64: dts: renesas: Add Renesas Spider boards support
  arm64: defconfig: Enable R-Car S4-8

 .../devicetree/bindings/arm/renesas.yaml      |  12 +
 .../bindings/clock/renesas,cpg-mssr.yaml      |   1 +
 .../bindings/power/renesas,rcar-sysc.yaml     |   1 +
 .../bindings/reset/renesas,rst.yaml           |   1 +
 .../bindings/serial/renesas,scif.yaml         |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi |  36 ++
 .../boot/dts/renesas/r8a779f0-spider.dts      |  22 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi     | 121 ++++++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |  10 +
 drivers/clk/renesas/Makefile                  |   2 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c       |   2 +-
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       | 188 +++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c           | 141 +++++++
 drivers/clk/renesas/rcar-gen4-cpg.h           |  76 ++++
 drivers/clk/renesas/renesas-cpg-mssr.c        |  42 +-
 drivers/clk/renesas/renesas-cpg-mssr.h        |   3 +-
 drivers/soc/renesas/Kconfig                   |  10 +
 drivers/soc/renesas/Makefile                  |   3 +-
 drivers/soc/renesas/r8a779a0-sysc.c           | 380 +-----------------
 drivers/soc/renesas/r8a779f0-sysc.c           |  47 +++
 drivers/soc/renesas/rcar-gen4-sysc.c          | 376 +++++++++++++++++
 drivers/soc/renesas/rcar-gen4-sysc.h          |  43 ++
 drivers/soc/renesas/rcar-rst.c                |  14 +-
 drivers/soc/renesas/renesas-soc.c             |  13 +
 drivers/tty/serial/sh-sci.c                   |   3 +
 include/dt-bindings/clock/r8a779f0-cpg-mssr.h |  65 +++
 include/dt-bindings/power/r8a779f0-sysc.h     |  30 ++
 29 files changed, 1251 insertions(+), 400 deletions(-)
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

