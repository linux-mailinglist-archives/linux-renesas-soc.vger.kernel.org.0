Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB82B5AAB8D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Sep 2022 11:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235485AbiIBJhV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Sep 2022 05:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235579AbiIBJhK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 05:37:10 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E386B69F44
        for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Sep 2022 02:37:07 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id Exd4280024C55Sk06xd4Wr; Fri, 02 Sep 2022 11:37:05 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU36l-003han-J9; Fri, 02 Sep 2022 11:37:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oU36k-007eRC-Nd; Fri, 02 Sep 2022 11:37:02 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v6.1
Date:   Fri,  2 Sep 2022 11:36:50 +0200
Message-Id: <cover.1662111128.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111124.git.geert+renesas@glider.be>
References: <cover.1662111124.git.geert+renesas@glider.be>
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

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v6.1-tag1

for you to fetch changes up to 6f67580ca9edb33a95897d8c0056b961cbd2aeac:

  arm64: dts: renesas: Add V3H2 Condor-I board support (2022-09-02 10:45:12 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v6.1

  - SDHI and eMMC support for the R-Car S4-8 SoC and the Spider
    development board,
  - Timer (CMT and TMU) and SPI (MSIOF) support for the R-Car S4-8 SoC,
  - External and GPIO interrupt support for the RZ/G2L and RZ/V2L SoCs,
  - Initial support for the R-Car H3Ne-1.7G (R8A779MB) SoC,
  - SPI DMA support for the RZ/G2UL, RZ/G2L, and RZ/V2L SoCs,
  - Pin control and I2C support for the RZ/V2M SoC and the RZ/V2M
    Evaluation Kit,
  - initial support for the R-Car V3H2 (R8A77980A) SoC and the Condor-I
    development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (7):
      arm64: dts: renesas: r9a07g043: Add DMA support to RSPI
      arm64: dts: renesas: r9a07g044: Add DMA support to RSPI
      arm64: dts: renesas: r9a07g054: Add DMA support to RSPI
      arm64: dts: renesas: r9a07g043: Fix audio clk node names
      arm64: dts: renesas: r9a07g044: Fix SCI{Rx,Tx} interrupt types
      arm64: dts: renesas: r9a07g054: Fix SCI{Rx,Tx} interrupt types
      arm64: dts: renesas: r9a07g043: Fix SCI{Rx,Tx} interrupt types

Duc Nguyen (1):
      arm64: dts: renesas: r8a779f0: Add MSIOF nodes

Geert Uytterhoeven (2):
      arm64: dts: renesas: Add Renesas R8A779MB SoC support
      arm64: dts: renesas: r8a774e1: Rename i2c_dvfs to iic_pmic

Kuninori Morimoto (3):
      arm64: dts: renesas: Add condor-common.dtsi
      arm64: dts: renesas: Add r8a77980a.dtsi
      arm64: dts: renesas: Add V3H2 Condor-I board support

Lad Prabhakar (7):
      arm64: dts: renesas: r9a07g044: Add IRQC node
      arm64: dts: renesas: r9a07g044: Update pinctrl node to handle GPIO interrupts
      arm64: dts: renesas: r9a07g054: Add IRQC node
      arm64: dts: renesas: r9a07g054: Update pinctrl node to handle GPIO interrupts
      dt-bindings: interrupt-controller: Add macros for NMI and IRQ0-7 interrupts present on RZ/G2L SoC
      arm64: dts: renesas: rzg2l-smarc-som: Add PHY interrupt support for ETH{0/1}
      arm64: dts: renesas: Drop clock-names property from RPC node

Phil Edworthy (3):
      arm64: dts: renesas: r9a09g011: Add pinctrl node
      arm64: dts: renesas: r9a09g011: Add i2c nodes
      arm64: dts: renesas: rzv2m evk: Enable i2c

Wolfram Sang (10):
      arm64: dts: renesas: r8a779f0: Add SDHI0 support
      arm64: dts: renesas: spider-cpu: Enable eMMC0
      arm64: dts: renesas: r8a779f0: Add CMT support
      arm64: dts: renesas: r8a779f0: Add TMU nodes
      arm64: dts: renesas: r8a779{51|60|65}: Put I2C aliases to board files
      arm64: dts: renesas: r8a77970: Put I2C aliases to board files
      arm64: dts: renesas: r8a77980: Put I2C aliases to board files
      arm64: dts: renesas: r8a77990: Put I2C aliases to board files
      arm64: dts: renesas: r8a779a0: Put I2C aliases to board files
      arm64: dts: renesas: r8a774a1: Put I2C aliases to board files

 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     | 548 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   8 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   8 +
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |   8 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   1 -
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   1 -
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   3 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  11 -
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  11 -
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  11 -
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   5 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   5 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   9 -
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    | 534 +-------------------
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   6 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  10 -
 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts |  15 +
 arch/arm64/boot/dts/renesas/r8a77980a.dtsi         |  11 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  11 -
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   7 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  11 -
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  45 ++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 212 ++++++++
 arch/arm64/boot/dts/renesas/r8a779mb.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |  18 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  73 ++-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  73 ++-
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |  27 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  78 +++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  11 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   8 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   8 +
 .../dt-bindings/interrupt-controller/irqc-rzg2l.h  |  25 +
 35 files changed, 1198 insertions(+), 639 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/condor-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a-condor-i.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77980a.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
 create mode 100644 include/dt-bindings/interrupt-controller/irqc-rzg2l.h
