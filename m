Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1A6B6194CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Nov 2022 11:50:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbiKDKuO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Nov 2022 06:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbiKDKuH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Nov 2022 06:50:07 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3958C2BB0E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Nov 2022 03:50:05 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:c5ee:bf27:9df:5172])
        by michel.telenet-ops.be with bizsmtp
        id gAq32800W2kjr6L06Aq3P3; Fri, 04 Nov 2022 11:50:04 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGx-002mVJ-DG; Fri, 04 Nov 2022 11:50:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oquGw-00HWEn-NU; Fri, 04 Nov 2022 11:50:02 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/4] Renesas ARM DT updates for v6.2
Date:   Fri,  4 Nov 2022 11:49:54 +0100
Message-Id: <cover.1667558740.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667558738.git.geert+renesas@glider.be>
References: <cover.1667558738.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-arm-dt-for-v6.2-tag1

for you to fetch changes up to b9a0be2054964026aa58966ce9724b672f210835:

  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts (2022-10-28 14:23:00 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v6.2

  - DMA, SPI (MSIOF), external interrupt (INTC-EX), PWM (PWM and TPU),
    SDHI, HyperFLASH/QSPI (RPC), and serial ((H)SCIF) support for the
    R-Car V4H SoC,
  - I/O expander, eMMC, and QSPI FLASH support for the White Hawk
    development board,
  - Preparatory work to share r9a07g043.dtsi between the ARM-based
    RZ/G2UL (R9A07G043U) and the RISC-V-based RZ/Five (R9A07G043F) SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
CongDang (2):
      arm64: dts: renesas: r8a779g0: Add PWM device nodes
      arm64: dts: renesas: r8a779g0: Add TPU device node

Geert Uytterhoeven (10):
      arm64: dts: renesas: r8a779g0: Add DMA support
      arm64: dts: renesas: r8a779g0: Add MSIOF nodes
      arm64: dts: renesas: r8a779g0: Add INTC-EX node
      arm64: dts: renesas: white-hawk-cpu: Add PCA9654 I/O Expander
      arm64: dts: renesas: r8a779g0: Fix HSCIF0 "brg_int" clock
      arm64: dts: renesas: r8a779g0: Add SDHI node
      arm64: dts: renesas: r8a779g0: Add SCIF nodes
      arm64: dts: renesas: r8a779g0: Add remaining HSCIF nodes
      arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
      ARM: dts: renesas: Miscellaneous whitespace fixes

Hai Pham (2):
      arm64: dts: renesas: r8a779g0: Add RPC node
      arm64: dts: renesas: white-hawk-cpu: Add QSPI FLASH support

Kuninori Morimoto (1):
      arm64: dts: renesas: condor-common: Add missing bootargs

Lad Prabhakar (5):
      arm64: dts: renesas: rzg2lc-smarc: Include SoM DTSI into board DTS
      arm64: dts: renesas: rzg2ul-smarc: Move spi1 pinmux to carrier board DTSI
      arm64: dts: renesas: rzg2l: Drop WDT2 nodes
      arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro to specify interrupt property
      arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts

Takeshi Kihara (1):
      arm64: dts: renesas: white-hawk-cpu: Add eMMC support

 arch/arm/boot/dts/r8a7742.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   2 +-
 arch/arm/boot/dts/r9a06g032.dtsi                   |  10 +-
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  24 +-
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  |  85 ++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 470 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         | 362 +++++++---------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  72 ++++
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  15 -
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  |  30 ++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  15 -
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   5 -
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   5 -
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  28 --
 .../boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi |   7 +
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   7 -
 20 files changed, 830 insertions(+), 316 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
