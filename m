Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C09C6C9EBC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Mar 2023 10:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbjC0I7n (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Mar 2023 04:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233462AbjC0I7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 04:59:14 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 449075597
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Mar 2023 01:57:11 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by xavier.telenet-ops.be with bizsmtp
        id dLx82900G1C8whw01Lx8wN; Mon, 27 Mar 2023 10:57:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgieO-00ExZ7-UE;
        Mon, 27 Mar 2023 10:57:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pgif6-002atw-FG;
        Mon, 27 Mar 2023 10:57:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.4
Date:   Mon, 27 Mar 2023 10:57:04 +0200
Message-Id: <cover.1679907064.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679907055.git.geert+renesas@glider.be>
References: <cover.1679907055.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        LOTS_OF_MONEY,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.4-tag1

for you to fetch changes up to 4db0ce4038dec3cf5cb42587a111f4415be381b6:

  arm64: dts: renesas: r8a779a0: Update CAN-FD to R-Car Gen4 compatible value (2023-03-16 17:00:58 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.4

  - Add USB3 support for the RZ/V2M SoC and the RZ/V2M Evaluation Kit 2.0,
  - Add uSD card and eMMC support for the  RZ/V2M Evaluation Kit 2.0,
  - Add CAN-FD, thermal, GMSL2 video capture, and sound support for the
    R-Car V4H SoC and the White-Hawk development board,
  - Add PMU support for the RZ/G2UL, RZ/G2L{,C}, and RZ/V2L SoCs,
  - Drop support for the obsolete R-Car H3 ES1.* (R8A77950) SoC,
  - Add I2C EEPROM support for the Atmark Techno Armadillo-800-EVA, and
    the Renesas Condor and ULCB development boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (4):
      arm64: dts: renesas: r9a09g011: Add USB3 DRD, device and host nodes
      arm64: dts: renesas: rzv2mevk2: Enable USB3 DRD, Peripheral and Host
      arm64: dts: renesas: rzv2mevk2: Enable USB3 role switch
      arm64: dts: renesas: rzv2mevk2: Add uart0 pins

Fabrizio Castro (1):
      arm64: dts: renesas: rzv2mevk2: Add uSD card and eMMC support

Geert Uytterhoeven (11):
      arm64: dts: renesas: r8a779g0: Add CAN-FD node
      arm64: dts: renesas: white-hawk: Add CAN-FD support
      arm64: dts: renesas: falcon: Describe CAN clock
      arm64: dts: renesas: rcar-gen3: Remove bogus "turbo-mode" properties
      arm64: dts: renesas: r8a779g0: Add thermal nodes
      arm64: dts: renesas: r8a77990: Remove bogus voltages from OPP table
      arm64: dts: renesas: r8a774c0: Remove bogus voltages from OPP table
      ARM: dts: armadillo800eva: Add I2C EEPROM for MAC address
      arm64: dts: renesas: condor: Add I2C EEPROM for PMIC
      arm64: dts: renesas: ulcb: Add I2C EEPROM for PMIC
      arm64: dts: renesas: r8a779a0: Update CAN-FD to R-Car Gen4 compatible value

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a779g0: R-Car Sound support
      arm64: dts: renesas: white-hawk: Add R-Car Sound support

Lad Prabhakar (7):
      arm64: dts: renesas: r9a07g043u: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a07g044: Add Cortex-A55 PMU node
      arm64: dts: renesas: Drop specifying the GIC_CPU_MASK_SIMPLE() for GICv3 systems
      arm64: dts: renesas: r9a07g054: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a07g044: Update IRQ numbers for SSI channels
      arm64: dts: renesas: r9a07g054: Update IRQ numbers for SSI channels
      arm64: dts: renesas: r9a07g043: Update IRQ numbers for SSI channels

Nam Nguyen (1):
      arm64: dts: renesas: v3hsk: Add clock-skew for GEther's Micrel PHY

Niklas Söderlund (2):
      arm64: dts: renesas: r8a779g0: Add and connect all CSI-2, ISP and VIN nodes
      arm64: dts: renesas: white-hawk-csi-dsi: Add and connect MAX96712

Wolfram Sang (2):
      arm64: dts: renesas: r8a779f0: Use proper labels for thermal zones
      arm64: dts: renesas: Remove R-Car H3 ES1.* devicetrees

 arch/arm/boot/dts/r8a7740-armadillo800eva.dts      |  19 +-
 arch/arm64/boot/dts/renesas/Makefile               |   5 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   3 -
 .../arm64/boot/dts/renesas/r8a77950-salvator-x.dts |  49 --
 arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts   |  16 -
 arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts      |  37 -
 arch/arm64/boot/dts/renesas/r8a77950.dtsi          | 330 --------
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   1 -
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 -
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 -
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 -
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   8 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   3 -
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  11 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  17 +-
 .../r8a779g0-white-hawk-ard-audio-da7212.dtso      | 187 +++++
 .../dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi   | 172 ++++
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  44 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 880 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi          |   3 +
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi          |   3 +
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi          |   3 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |  19 +-
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  13 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  32 +-
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi       |   7 -
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi       |   7 -
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  32 +-
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi       |   7 -
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  | 216 +++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  45 ++
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   6 +
 34 files changed, 1649 insertions(+), 547 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a77950-salvator-x.dts
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a77950.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ard-audio-da7212.dtso
