Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B114C26FD74
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Sep 2020 14:48:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgIRMsT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Sep 2020 08:48:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbgIRMsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Sep 2020 08:48:17 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36A2C06178C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Sep 2020 05:48:04 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id VQo22300Y4C55Sk06Qo2hU; Fri, 18 Sep 2020 14:48:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-000256-Ds; Fri, 18 Sep 2020 14:48:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kJFo2-00043q-CV; Fri, 18 Sep 2020 14:48:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM DT updates for v5.10 (take two)
Date:   Fri, 18 Sep 2020 14:47:57 +0200
Message-Id: <20200918124800.15555-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200918124800.15555-1-geert+renesas@glider.be>
References: <20200918124800.15555-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e9f0fb53ac88c1ccf3728b47c687838b6054f481:

  arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display (2020-09-04 09:54:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.10-tag2

for you to fetch changes up to c91dfc9818df5f43c10c727f1cecaebdb5e2fa92:

  arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels (2020-09-18 09:10:58 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.10 (take two)

  - PCIe endpoint support for the RZ/G2H SoC,
  - SATA support for the HopeRun HiHope RZ/G2H board,
  - Increase support (CAN, LED, SPI NOR, VIN, VSP) for the RZ/G1H SoC on
    the iWave Qseven board (G21D), and its camera add-on board,
  - Initial support for the R-Car V3U SoC on the Falcon CPU and BreakOut
    boards,
  - HDMI display and sound support for the R-Car M3-W+ SoC on the
    Salvator-XS board,
  - Digital Radio Interface (DRIF) support for the R-Car E3 SoC,
  - Minor fixes and cleanups.

----------------------------------------------------------------
Fabrizio Castro (1):
      arm64: dts: renesas: r8a77990: Add DRIF support

Geert Uytterhoeven (6):
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag' into renesas-arm-dt-for-v5.10
      ARM: dts: renesas: Fix pin controller node names
      arm64: dts: renesas: Fix pin controller node names
      arm64: dts: renesas: Drop superfluous pin configuration containers
      arm64: dts: renesas: r8a77990: Fix MSIOF1 DMA channels
      arm64: dts: renesas: r8a774c0: Fix MSIOF1 DMA channels

Kuninori Morimoto (6):
      arm64: dts: renesas: r8a77961: Add FCP device nodes
      arm64: dts: renesas: r8a77961: Add VSP device nodes
      arm64: dts: renesas: r8a77961: Add DU device nodes
      arm64: dts: renesas: r8a77961: Add HDMI device nodes
      arm64: dts: renesas: r8a77961: salvator-xs: Add HDMI Display support
      arm64: dts: renesas: r8a77961: salvator-xs: Add HDMI Sound support

Lad Prabhakar (8):
      arm64: dts: renesas: r8a774e1: Add PCIe EP nodes
      arm64: dts: renesas: r8a774e1-hihope-rzg2h-ex: Enable sata
      ARM: dts: r8a7742: Add VIN DT nodes
      ARM: dts: r8a7742-iwg21d-q7: Add SPI NOR support
      ARM: dts: r8a7742-iwg21d-q7: Add can1 support to carrier board
      ARM: dts: r8a7742-iwg21d-q7: Enable SD2 LED indication
      ARM: dts: r8a7742: Add VSP support
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add can0 support to camera DB

Yoshihiro Shimoda (4):
      dt-bindings: power: Add r8a779a0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779a0 CPG Core Clock Definitions
      arm64: dts: renesas: Add Renesas R8A779A0 SoC support
      arm64: dts: renesas: Add Renesas Falcon boards support

 arch/arm/boot/dts/emev2.dtsi                       |   2 +-
 arch/arm/boot/dts/r7s72100.dtsi                    |   2 +-
 arch/arm/boot/dts/r7s9210.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a73a4.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7740.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  11 ++
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |  62 ++++++++++
 arch/arm/boot/dts/r8a7742.dtsi                     |  82 ++++++++++++-
 arch/arm/boot/dts/r8a7743.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a77470.dtsi                    |   2 +-
 arch/arm/boot/dts/r8a7778.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7779.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   2 +-
 arch/arm/boot/dts/r9a06g032.dtsi                   |   2 +-
 arch/arm/boot/dts/sh73a0.dtsi                      |   2 +-
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   7 +-
 .../boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dts  |   5 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  40 +++++-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +-
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |  57 +++++++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          | 134 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          | 127 ++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   2 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |  46 +++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  22 ++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 133 ++++++++++++++++++++
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |  55 +++++++++
 include/dt-bindings/power/r8a779a0-sysc.h          |  59 +++++++++
 43 files changed, 859 insertions(+), 47 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0.dtsi
 create mode 100644 include/dt-bindings/clock/r8a779a0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a779a0-sysc.h
