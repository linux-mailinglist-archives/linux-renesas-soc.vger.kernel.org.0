Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A505083BB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Apr 2022 10:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376860AbiDTIpq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Apr 2022 04:45:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376845AbiDTIpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 04:45:44 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 810E43B2A7;
        Wed, 20 Apr 2022 01:42:58 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,275,1643641200"; 
   d="scan'208";a="118557982"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Apr 2022 17:42:57 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B120840062B6;
        Wed, 20 Apr 2022 17:42:57 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 00/15] treewide: Initial support for R-Car V4H
Date:   Wed, 20 Apr 2022 17:42:40 +0900
Message-Id: <20220420084255.375700-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        KHOP_HELO_FCRDNS,SPF_HELO_NONE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series adds initial support for the Renesas R-Car V4H
(r8a779g0) SoC.

Yoshihiro Shimoda (15):
  dt-bindings: arm: renesas: Document R-Car V4H SoC DT bindings
  dt-bindings: arm: renesas: Document Renesas White Hawk boards
  dt-bindings: reset: renesas,rst: Document r8a779g0 reset module
  dt-bindings: power: renesas,rcar-sysc: Document r8a779g0 SYSC bindings
  dt-bindings: power: Add r8a779g0 SYSC power domain definitions
  dt-bindings: clock: renesas,cpg-mssr: Document r8a779g0
  dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
  dt-bindings: serial: renesas,hscif: Document r8a779g0 bindings
  soc: renesas: r8a779g0-sysc: Add r8a779g0 support
  soc: renesas: Identify R-Car V4H
  soc: renesas: rcar-rst: Add support for R-Car V4H
  clk: renesas: rcar-gen4: Add CLK_TYPE_GEN4_PLL4
  clk: renesas: cpg-mssr: Add support for R-Car V4H
  arm64: dts: renesas: Add Renesas R8A779G0 SoC support
  arm64: dts: renesas: Add Renesas White Hawk boards support

 .../devicetree/bindings/arm/renesas.yaml      |  12 +
 .../bindings/clock/renesas,cpg-mssr.yaml      |   1 +
 .../bindings/power/renesas,rcar-sysc.yaml     |   1 +
 .../bindings/reset/renesas,rst.yaml           |   1 +
 .../bindings/serial/renesas,hscif.yaml        |   6 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  45 ++++
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  |  22 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi     | 122 ++++++++++
 drivers/clk/renesas/Kconfig                   |   5 +
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r8a779f0-cpg-mssr.c       |  18 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c       | 215 ++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.c           |   5 +
 drivers/clk/renesas/rcar-gen4-cpg.h           |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.c        |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h        |   1 +
 drivers/soc/renesas/Kconfig                   |  11 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/r8a779g0-sysc.c           |  62 +++++
 drivers/soc/renesas/rcar-gen4-sysc.c          |   3 +
 drivers/soc/renesas/rcar-gen4-sysc.h          |   1 +
 drivers/soc/renesas/rcar-rst.c                |   1 +
 drivers/soc/renesas/renesas-soc.c             |   8 +
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h |  87 +++++++
 include/dt-bindings/power/r8a779g0-sysc.h     |  45 ++++
 26 files changed, 676 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0.dtsi
 create mode 100644 drivers/clk/renesas/r8a779g0-cpg-mssr.c
 create mode 100644 drivers/soc/renesas/r8a779g0-sysc.c
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h

-- 
2.25.1

