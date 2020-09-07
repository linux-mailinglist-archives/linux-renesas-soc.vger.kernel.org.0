Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC9025F635
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Sep 2020 11:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgIGJUJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 05:20:09 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49605 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727122AbgIGJUI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 05:20:08 -0400
X-IronPort-AV: E=Sophos;i="5.76,401,1592838000"; 
   d="scan'208";a="56565779"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Sep 2020 18:20:07 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7A1B740065CD;
        Mon,  7 Sep 2020 18:20:06 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/14] treewide: add initial support for R-Car V3U
Date:   Mon,  7 Sep 2020 18:19:36 +0900
Message-Id: <1599470390-29719-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds initial support for R-Car V3U (r8a779a0).

Yoshihiro Shimoda (14):
  dt-bindings: arm: renesas: Document R-Car V3U SoC DT bindings
  dt-bindings: arm: renesas: Document Renesas Falcon boards
  dt-bindings: power: renesas,rcar-sysc: Document r8a779a0 SYSC binding
  dt-bindings: power: Add r8a779a0 SYSC power domain definitions
  dt-bindings: reset: renesas,rst: Document r8a779a0 reset module
  dt-bindings: clock: renesas,cpg-mssr: Document r8a779a0
  dt-bindings: clock: Add r8a77961 CPG Core Clock Definitions
  dt-bindings: serial: renesas,scif: Document r8a779a0 bindings
  soc: renesas: identify R-Car V3U
  soc: renesas: r8a779a0-sysc: Add r8a779a0 support
  soc: renesas: rcar-rst: Add support for R-Car V3U
  clk: renesas: cpg-mssr: Add support for R-Car V3U
  arm64: dts: renesas: Add Renesas R8A779A0 SoC support
  arm64: dts: renesas: Add Renesas Falcon boards support

 Documentation/devicetree/bindings/arm/renesas.yaml |   7 +
 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/power/renesas,rcar-sysc.yaml          |   1 +
 .../devicetree/bindings/reset/renesas,rst.yaml     |   1 +
 .../devicetree/bindings/serial/renesas,scif.yaml   |   1 +
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/falcon-cpu.dtsi        |  44 ++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  23 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 132 ++++++
 drivers/clk/renesas/Kconfig                        |   4 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a779a0-cpg-mssr.c            | 479 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  20 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |   2 +
 drivers/soc/renesas/Kconfig                        |  10 +
 drivers/soc/renesas/Makefile                       |   1 +
 drivers/soc/renesas/r8a779a0-sysc.c                | 460 ++++++++++++++++++++
 drivers/soc/renesas/rcar-rst.c                     |   6 +
 drivers/soc/renesas/renesas-soc.c                  |   8 +
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |  63 +++
 include/dt-bindings/power/r8a779a0-sysc.h          |  61 +++
 21 files changed, 1324 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/falcon-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0.dtsi
 create mode 100644 drivers/clk/renesas/r8a779a0-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a779a0-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779a0-sysc.h

-- 
2.7.4

