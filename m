Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D15223A76
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgGQLYq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:24:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgGQLYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:24:45 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62EC0C061755
        for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Jul 2020 04:24:45 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by andre.telenet-ops.be with bizsmtp
        id 4BQi230054C55Sk01BQigg; Fri, 17 Jul 2020 13:24:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTq-000263-AM; Fri, 17 Jul 2020 13:24:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwOTq-0006nM-8k; Fri, 17 Jul 2020 13:24:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.9 (take two)
Date:   Fri, 17 Jul 2020 13:24:25 +0200
Message-Id: <20200717112427.26032-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717112427.26032-1-geert+renesas@glider.be>
References: <20200717112427.26032-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit b7f13b914730026ca7fdc0d5ef6a791f3c613fe2:

  ARM: dts: r8a7778: Enable IRLM setup via DT (2020-06-29 10:21:54 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.9-tag2

for you to fetch changes up to 8aa937cb4aebc31746ceed1c28b20557ef105f08:

  ARM: dts: sh73a0: Add missing clocks to sound node (2020-07-17 10:58:24 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.9 (take two)

  - SPI Multi I/O Bus Controller (RPC-IF) support for R-Car V3H and V3M,
    including QSPI support for the Condor, Eagle, V3HSK, and V3MSK
    boards,
  - Initial support for the RZ/G2H SoC on the HopeRun HiHope RZ/G2H
    board,
  - Initial support for the Beacon EmbeddedWorks RZ/G2M board,
  - Minor fixes and improvements.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: renesas: Introduce r8a774a1-beacon-rzg2m-kit

Geert Uytterhoeven (4):
      arm64: dts: renesas: cat875: Drop superfluous phy-mode
      arm64: dts: renesas: Restructure Makefile
      Merge tag 'renesas-r8a774e1-dt-binding-defs-tag' into renesas-arm-dt-for-v5.9
      ARM: dts: sh73a0: Add missing clocks to sound node

Lad Prabhakar (6):
      arm64: dts: renesas: r8a774e1: Add SCIF and HSCIF nodes
      arm64: dts: renesas: r8a774e1: Add SDHI nodes
      arm64: dts: renesas: r8a774e1: Add I2C and IIC-DVFS support
      arm64: dts: renesas: r8a774e1: Add MSIOF nodes
      arm64: dts: renesas: r8a774e1: Add RWDT node
      arm64: dts: renesas: r8a774e1: Add CAN[FD] support

Marian-Cristian Rotariu (14):
      dt-bindings: power: Add r8a774e1 SYSC power domain definitions
      clk: renesas: Add r8a774e1 CPG Core Clock Definitions
      arm64: defconfig: Enable R8A774E1 SoC
      arm64: dts: renesas: Initial r8a774e1 SoC device tree
      arm64: dts: renesas: Add HiHope RZ/G2H main board support
      arm64: dts: renesas: Add HiHope RZ/G2H sub board support
      arm64: dts: renesas: r8a774e1: Add IPMMU device nodes
      arm64: dts: renesas: r8a774e1: Add SYS-DMAC device nodes
      arm64: dts: renesas: r8a774e1: Add GPIO device nodes
      arm64: dts: renesas: r8a774e1: Add Ethernet AVB node
      arm64: dts: renesas: r8a774e1: Add operating points
      arm64: dts: renesas: r8a774e1: Add RZ/G2H thermal support
      arm64: dts: renesas: r8a774e1: Add CMT device nodes
      arm64: dts: renesas: r8a774e1: Add TMU device nodes

Niklas Söderlund (3):
      ARM: dts: gose: Fix ports node name for adv7180
      ARM: dts: renesas: Remove unused remote property from adv7180 nodes
      ARM: dts: gose: Fix ports node name for adv7612

Sergei Shtylyov (4):
      arm64: dts: renesas: r8a77980: Add RPC-IF support
      arm64: dts: renesas: r8a77980: condor/v3hsk: Add QSPI flash support
      arm64: dts: renesas: r8a77970: Add RPC-IF support
      arm64: dts: renesas: r8a77970: eagle/v3msk: Add QSPI flash support

Yoshihiro Shimoda (3):
      arm64: dts: renesas: add full-pwr-cycle-in-suspend into eMMC nodes
      arm64: dts: renesas: Fix SD Card/eMMC interface device node names
      ARM: dts: renesas: Fix SD Card/eMMC interface device node names

 arch/arm/boot/dts/r7s72100.dtsi                    |    4 +-
 arch/arm/boot/dts/r7s9210.dtsi                     |    4 +-
 arch/arm/boot/dts/r8a73a4.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7740.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7742.dtsi                     |    8 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a77470.dtsi                    |    6 +-
 arch/arm/boot/dts/r8a7778.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7779.dtsi                     |    8 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |    1 -
 arch/arm/boot/dts/r8a7790.dtsi                     |    8 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |    1 -
 arch/arm/boot/dts/r8a7791-porter.dts               |    1 -
 arch/arm/boot/dts/r8a7791.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |    2 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |    5 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |    6 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |    1 -
 arch/arm/boot/dts/r8a7794-silk.dts                 |    1 -
 arch/arm/boot/dts/r8a7794.dtsi                     |    6 +-
 arch/arm/boot/dts/sh73a0.dtsi                      |    7 +-
 arch/arm64/boot/dts/renesas/Makefile               |   73 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  758 +++++++++
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |  312 ++++
 arch/arm64/boot/dts/renesas/cat875.dtsi            |    1 -
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |    4 +-
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |    4 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |    2 +-
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |   29 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |    8 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |    8 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |    6 +-
 .../boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dts  |   15 +
 .../boot/dts/renesas/r8a774e1-hihope-rzg2h.dts     |   26 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          | 1664 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |    8 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |    8 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |    8 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |    8 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   67 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   67 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   17 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   67 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   67 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   17 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |    1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |    6 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |    2 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |    1 +
 arch/arm64/configs/defconfig                       |    1 +
 include/dt-bindings/clock/r8a774e1-cpg-mssr.h      |   59 +
 include/dt-bindings/power/r8a774e1-sysc.h          |   36 +
 54 files changed, 3342 insertions(+), 119 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1.dtsi
 create mode 100644 include/dt-bindings/clock/r8a774e1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774e1-sysc.h
