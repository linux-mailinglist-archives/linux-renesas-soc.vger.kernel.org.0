Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBAB51D4B2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 May 2022 11:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381250AbiEFJhM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 May 2022 05:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390738AbiEFJg6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 May 2022 05:36:58 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4A46A00E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  6 May 2022 02:32:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:287c:a0f:7d45:dc7b])
        by laurent.telenet-ops.be with bizsmtp
        id TMYL2700q1UVucw01MYLdN; Fri, 06 May 2022 11:32:22 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJw-0038XC-Eq; Fri, 06 May 2022 11:32:20 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nmuJv-00AekG-R8; Fri, 06 May 2022 11:32:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM DT updates for v5.19 (take two)
Date:   Fri,  6 May 2022 11:32:13 +0200
Message-Id: <cover.1651828603.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651828600.git.geert+renesas@glider.be>
References: <cover.1651828600.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit aa70cbda745d5d2085f2847b875d0da3173a9032:

  ARM: dts: r9a06g032: Drop "arm,cortex-a7-timer" from timer node (2022-04-19 10:27:36 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.19-tag2

for you to fetch changes up to ad1bd2bf658062c6edc5ff1ee1725565a4fc8930:

  arm64: dts: renesas: Add initial device tree for RZ/V2M EVK (2022-05-06 11:09:57 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.19 (take two)

  - I2C, sound, USB, CANFD, timer, watchdog, (Q)SPI, cpufreq, and
    thermal support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVK
    development board,
  - Initial support for the R-Car V4H SoC and the Renesas White Hawk
    development board stack,
  - DMA, RTC, and USB support for the RZ/N1D SoC,
  - Initial support for the RZ/V2M SoC an the RZ/V2M Evaluation Kit
    Board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (20):
      arm64: dts: renesas: r9a07g043: Add I2C2 node and fillup the I2C{0,1,3} stub nodes
      arm64: dts: renesas: r9a07g043: Add SSI{1,2,3} nodes and fillup the SSI0 stub node
      arm64: dts: renesas: r9a07g043: Add USB2.0 support
      arm64: dts: renesas: r9a07g043: Fillup the CANFD stub node
      arm64: dts: renesas: r9a07g043: Fillup the OSTM{0,1,2} stub nodes
      arm64: dts: renesas: r9a07g043: Fillup the WDT{0,2} stub nodes
      arm64: dts: renesas: rzg2ul-smarc: Enable i2c{0,1} and wm8978
      arm64: dts: renesas: rzg2ul-smarc: Enable CANFD
      arm64: dts: renesas: rzg2ul-smarc-som: Enable OSTM
      arm64: dts: renesas: rzg2ul-smarc-som: Enable watchdog
      arm64: dts: renesas: rzg2l-smarc: Move ssi0 and cpu sound_dai nodes from common dtsi
      arm64: dts: renesas: rzg2ul-smarc: Enable Audio
      arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support
      arm64: dts: renesas: r9a07g044: Fix external clk node names
      arm64: dts: renesas: r9a07g054: Fix external clk node names
      arm64: dts: renesas: r9a07g043: Add RSPI{0,1,2} nodes
      arm64: dts: renesas: r9a07g043: Add OPP table
      arm64: dts: renesas: r9a07g043: Add TSU node
      arm64: dts: renesas: r9a07g043: Create thermal zone to support IPA
      arm64: dts: renesas: r9a07g043: Add SPI Multi I/O Bus controller node

Geert Uytterhoeven (4):
      Merge tag 'renesas-r8a779g0-dt-binding-defs-tag' into renesas-arm-dt-for-v5.19
      arm64: dts: renesas: Add interrupt-names to CANFD nodes
      arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
      Merge tag 'renesas-r9a09g011-dt-binding-defs-tag' into renesas-arm-dt-for-v5.19

Herve Codina (4):
      ARM: dts: r9a06g032: Add missing '#power-domain-cells'
      ARM: dts: r9a06g032: Add internal PCI bridge node
      ARM: dts: r9a06g032: Add USB PHY DT support
      ARM: dts: r9a06g032: Link the PCI USB devices to the USB PHY

Laurent Pinchart (2):
      arm64: dts: renesas: Remove empty lvds endpoints
      arm64: dts: renesas: Remove empty rgb output endpoints

Miquel Raynal (5):
      ARM: dts: r9a06g032: Add the two DMA nodes
      ARM: dts: r9a06g032: Describe the DMA router
      ARM: dts: r9a06g032: Fill the UART DMA properties
      ARM: dts: r9a06g032: Fix the NAND controller node
      ARM: dts: r9a06g032: Describe the RTC

Phil Edworthy (3):
      dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
      arm64: dts: renesas: Add initial DTSI for RZ/V2M SoC
      arm64: dts: renesas: Add initial device tree for RZ/V2M EVK

Yoshihiro Shimoda (4):
      dt-bindings: power: Add r8a779g0 SYSC power domain definitions
      dt-bindings: clock: Add r8a779g0 CPG Core Clock Definitions
      arm64: dts: renesas: Add Renesas R8A779G0 SoC support
      arm64: dts: renesas: Add Renesas White Hawk boards support

 arch/arm/boot/dts/r9a06g032.dtsi                   | 110 +++++
 arch/arm64/boot/dts/renesas/Makefile               |   4 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  10 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   7 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   5 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   7 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   7 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  74 ++--
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  45 +++
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  22 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 122 ++++++
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         | 444 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |  76 ----
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   8 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   8 +-
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |  44 ++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  93 +++++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |   8 -
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  11 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  11 +
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  56 +++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  18 +
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |  39 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  10 +-
 include/dt-bindings/clock/r8a779g0-cpg-mssr.h      |  90 +++++
 include/dt-bindings/clock/r9a09g011-cpg.h          | 352 ++++++++++++++++
 include/dt-bindings/power/r8a779g0-sysc.h          |  45 +++
 39 files changed, 1570 insertions(+), 204 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g011.dtsi
 create mode 100644 include/dt-bindings/clock/r8a779g0-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r9a09g011-cpg.h
 create mode 100644 include/dt-bindings/power/r8a779g0-sysc.h
