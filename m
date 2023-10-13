Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A27D17C85EE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Oct 2023 14:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbjJMMj2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Oct 2023 08:39:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231754AbjJMMj1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2023 08:39:27 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC11CF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Oct 2023 05:39:24 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:f151:5551:1af6:b316])
        by xavier.telenet-ops.be with bizsmtp
        id xQfM2A00G56FAx301QfMq9; Fri, 13 Oct 2023 14:39:23 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRl-006Ggi-UP;
        Fri, 13 Oct 2023 14:39:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qrHRp-002Jo7-C2;
        Fri, 13 Oct 2023 14:39:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.7 (take two)
Date:   Fri, 13 Oct 2023 14:39:15 +0200
Message-Id: <cover.1697200123.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697200117.git.geert+renesas@glider.be>
References: <cover.1697200117.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit d70be079c3cf34bd91e1c8f7b4bc760356c9150c:

  arm64: dts: renesas: ulcb/kf: Use multi Component sound (2023-09-25 09:25:04 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.7-tag2

for you to fetch changes up to a09c3e105a208580b9d9c868bac630c9263ff564:

  arm64: dts: renesas: Apply overlays to base dtbs (2023-10-12 20:34:21 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.7 (take two)

  - Improve audio clock accuracy on the RZ/{G2L,G2LC,V2L} SMARC EVK
    development boards,
  - Add FLASH support for the Renesas Bock-W development board,
  - Add L2 cache and non-coherent DMA support on the RZ/Five SoC and the
    RZ/Five SMARC development board,
  - Add initial support for the RZ/G3S SoC and the RZ/G3S SMARC SoM and
    SMARC Carrier-II EVK development boards,
  - Add initial support for the R8A779F4 variant of the R-Car S4-8 SoC
    and the R-Car S4 Starter Kit development board,
  - Apply DT overlays to base DTBs to improve validation and usability.

Note that this includes:
  - Tag clk-fixes-for-linus from the clock tree, which contains the
    fixed Versa3 clock generator clock index handling that was merged
    in v6.6-rc4,
  - Tag renesas-r9a08g045-dt-binding-defs-tag, which contains clock
    definitions for the Renesas RZ/G3S (R9A08G045) SoC, shared by the
    clock driver and DT source files.
----------------------------------------------------------------
Biju Das (5):
      dt-bindings: clock: versaclock3: Add description for #clock-cells property
      clk: vc3: Fix 64 by 64 division
      clk: vc3: Fix output clock mapping
      clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
      arm64: dts: renesas: rz-smarc: Use versa3 clk for audio mclk

Claudiu Beznea (8):
      dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3S SoC
      arm64: dts: renesas: Add initial DTSI for RZ/G3S SoC
      arm64: dts: renesas: Add initial support for RZ/G3S SMARC SoM
      arm64: dts: renesas: Add initial device tree for RZ SMARC Carrier-II Board
      arm64: dts: renesas: Add initial device tree for RZ/G3S SMARC EVK board
      arm64: dts: renesas: r9a08g045: Add nodes for SDHI1 and SDHI2
      arm64: dts: renesas: r9a08g045: Add missing cache-level for L3 cache
      arm64: dts: renesas: rzg3s-smarc-som: Spelling s/device-type/device_type/

Geert Uytterhoeven (3):
      Merge tag 'clk-fixes-for-linus' of https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux into renesas-dts-for-v6.7
      ARM: dts: renesas: bockw: Add FLASH node
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag' into renesas-dts-for-v6.7

Kuninori Morimoto (2):
      arm64: dts: renesas: Add Renesas R8A779F4 SoC support
      arm64: dts: renesas: Add R-Car S4 Starter Kit support

Lad Prabhakar (3):
      riscv: dts: renesas: r9a07g043f: Add L2 cache node
      riscv: dts: renesas: r9a07g043f: Add dma-noncoherent property
      riscv: dts: renesas: rzfive-smarc: Enable the blocks which were explicitly disabled

Marek Vasut (2):
      clk: si521xx: Use REGCACHE_FLAT instead of NONE
      clk: si521xx: Fix regmap write accessor

Rob Herring (1):
      arm64: dts: renesas: Apply overlays to base dtbs

Timo Alho (1):
      clk: tegra: fix error return case for recalc_rate

Wolfram Sang (1):
      arm64: dts: renesas: ebisu: Document Ebisu-4D support

Zhifeng Tang (1):
      clk: sprd: Fix thm_parents incorrect configuration

 .../devicetree/bindings/clock/renesas,5p35023.yaml |  11 +-
 .../bindings/clock/renesas,rzg2l-cpg.yaml          |   1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   2 +-
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts        |  34 +++
 arch/arm64/boot/dts/renesas/Makefile               |  38 ++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   2 +-
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      | 240 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 170 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dts |  18 ++
 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi      |  14 ++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |  14 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  20 ++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  20 ++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |  24 ++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   | 142 ++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  28 +++
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        |  13 ++
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |  23 --
 arch/riscv/boot/dts/renesas/rzfive-smarc.dtsi      |  56 -----
 drivers/clk/clk-si521xx.c                          |   9 +-
 drivers/clk/clk-versaclock3.c                      |  81 ++++---
 drivers/clk/sprd/ums512-clk.c                      |   2 +-
 drivers/clk/tegra/clk-bpmp.c                       |   2 +-
 include/dt-bindings/clock/r9a08g045-cpg.h          | 242 +++++++++++++++++++++
 26 files changed, 1080 insertions(+), 140 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779f4.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
 create mode 100644 include/dt-bindings/clock/r9a08g045-cpg.h
