Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F12E567EADF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jan 2023 17:28:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232597AbjA0Q2d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 27 Jan 2023 11:28:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbjA0Q2b (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 27 Jan 2023 11:28:31 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7977D2A8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Jan 2023 08:28:28 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
        by xavier.telenet-ops.be with bizsmtp
        id DsUT290052rBNjs01sUTMv; Fri, 27 Jan 2023 17:28:27 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaG-007Zkk-Ng;
        Fri, 27 Jan 2023 17:28:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaS-005Taf-H1;
        Fri, 27 Jan 2023 17:28:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DT updates for v6.3 (take two)
Date:   Fri, 27 Jan 2023 17:28:14 +0100
Message-Id: <cover.1674815099.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674815093.git.geert+renesas@glider.be>
References: <cover.1674815093.git.geert+renesas@glider.be>
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

The following changes since commit 2ef9e3ef3b8d9a59455a79f02ce9aff8544bd02d:

  arm64: dts: renesas: condor-i: add HS400 support for eMMC (2023-01-12 17:22:22 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.3-tag2

for you to fetch changes up to 46fe3950ced3fcddb51acd0bc8c26aaa0b86ae70:

  arm64: dts: renesas: r8a779f0: Add iommus to MMC node (2023-01-27 10:41:19 +0100)

----------------------------------------------------------------
Renesas DT updates for v6.3 (take two)

  - High Performance mode (1.8 GHz) support for the Cortex-A76 CPU cores
    on R-Car V4H,
  - GPIO interrupt support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVK
    development board,
  - USB Function support for the RZ/N1D SoC,
  - Generic Sound Card driver examples for the Renesas R-Car Starter Kit
    Premier/Pro and Shimafugi Kingfisher development board stack,
  - Universal Flash Storage support for the Renesas Spider development
    board,
  - External Power Sequence Controller (PWC) support for the RZ/V2M SoC
    and the RZ/V2M Evaluation Kit 2.0,
  - IOMMU support for MMC on the R-Car S4-8 SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (4):
      arm64: dts: renesas: beacon-renesom: Fix gpio expander reference
      arm64: dts: renesas: beacon-renesom: Update Ethernet PHY ID
      arm64: dts: renesas: beacon-renesom: Fix audio clock rate
      arm64: dts: renesas: r8a774[be]1-beacon: Sync aliases with RZ/G2M

Fabrizio Castro (3):
      arm64: dts: renesas: r9a09g011: Reword ethernet status
      arm64: dts: renesas: r9a09g011: Add PWC support
      arm64: dts: renesas: v2mevk2: Add PWC support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779g0: Add Cortex-A76 1.8 GHz opp
      arm64: dts: renesas: eagle: Add SCIF_CLK support

Herve Codina (1):
      ARM: dts: r9a06g032: Add the USBF controller node

Kuninori Morimoto (8):
      ARM: dts: renesas: #sound-dai-cells is used when simple-card
      arm64: dts: renesas: #sound-dai-cells is used when simple-card
      arm64: dts: renesas: Add ulcb{-kf} Audio Graph Card dtsi
      arm64: dts: renesas: Add ulcb{-kf} Audio Graph Card2 dtsi
      arm64: dts: renesas: Add ulcb{-kf} Simple Audio Card dtsi
      arm64: dts: renesas: Add ulcb{-kf} Audio Graph Card2 MIX + TDM Split dtsi
      arm64: dts: renesas: Add ulcb{-kf} Audio Graph Card MIX + TDM Split dtsi
      arm64: dts: renesas: Add ulcb{-kf} Simple Audio Card MIX + TDM Split dtsi

Lad Prabhakar (4):
      riscv: dts: renesas: rzfive-smarc-som: Drop PHY interrupt support for ETH{0,1}
      arm64: dts: renesas: r9a07g043u: Add IRQC node
      arm64: dts: renesas: r9a07g043u: Update pinctrl node to handle GPIO interrupts
      arm64: dts: renesas: rzg2ul-smarc-som: Add PHY interrupt support for ETH{0/1}

Laurent Pinchart (1):
      ARM: dts: renesas: Use new media bus type macros

Yoshihiro Shimoda (2):
      arm64: dts: renesas: spider-cpu: Enable UFS device
      arm64: dts: renesas: r8a779f0: Add iommus to MMC node

 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  11 +-
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi  |   4 +-
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi  |   4 +-
 arch/arm/boot/dts/r8a7742.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7778.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   2 +-
 arch/arm/boot/dts/r9a06g032.dtsi                   |  12 ++
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  26 ++-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +-
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |   8 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   2 +-
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |   8 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |  12 ++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   2 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  38 +++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   6 +
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   2 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  72 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   5 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  10 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  11 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   3 -
 .../renesas/ulcb-audio-graph-card-mix+split.dtsi   |  91 +++++++++++
 .../boot/dts/renesas/ulcb-audio-graph-card.dtsi    |  85 ++++++++++
 .../renesas/ulcb-audio-graph-card2-mix+split.dtsi  | 111 +++++++++++++
 .../boot/dts/renesas/ulcb-audio-graph-card2.dtsi   |  26 +++
 .../ulcb-kf-audio-graph-card-mix+split.dtsi        | 171 ++++++++++++++++++++
 .../boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi |  88 ++++++++++
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi       | 178 +++++++++++++++++++++
 .../dts/renesas/ulcb-kf-audio-graph-card2.dtsi     |  30 ++++
 .../ulcb-kf-simple-audio-card-mix+split.dtsi       | 153 ++++++++++++++++++
 .../dts/renesas/ulcb-kf-simple-audio-card.dtsi     |  85 ++++++++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  72 ++-------
 .../renesas/ulcb-simple-audio-card-mix+split.dtsi  |  92 +++++++++++
 .../boot/dts/renesas/ulcb-simple-audio-card.dtsi   |  89 +++++++++++
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |  68 ++------
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |  10 ++
 52 files changed, 1463 insertions(+), 159 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-audio-graph-card2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-audio-graph-card2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-kf-simple-audio-card.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card-mix+split.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi
