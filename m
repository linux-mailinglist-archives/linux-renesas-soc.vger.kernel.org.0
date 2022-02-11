Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65AD44B27B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Feb 2022 15:19:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347704AbiBKOTt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Feb 2022 09:19:49 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348701AbiBKOTs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Feb 2022 09:19:48 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56835B66
        for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Feb 2022 06:19:45 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d5d:ef67:a872:c0be])
        by albert.telenet-ops.be with bizsmtp
        id tqKi2600C3ZSXJh06qKiu3; Fri, 11 Feb 2022 15:19:42 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIWlx-000M8j-QD; Fri, 11 Feb 2022 15:19:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nIWLx-00Gh8e-LI; Fri, 11 Feb 2022 14:52:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.18
Date:   Fri, 11 Feb 2022 14:52:12 +0100
Message-Id: <cover.1644587200.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1644587197.git.geert+renesas@glider.be>
References: <cover.1644587197.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.18-tag1

for you to fetch changes up to 5c65ad12785205d5c57bd92e19d0296f93c19e33:

  arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for eMMC/SDHI device selection (2022-02-08 09:48:28 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.18

  - External interrupt (INTC-EX) support for the R-Car V3U SoC,
  - Initial support for the RZ/G2LC and RZ/V2L SoCs, and the RZ/G2LC and
    RZ/V2L SMARC EVK development boards,
  - Support for MAX9286 GMSL deserializers and GSML cameras on the Eagle
    and Condor development boards,
  - NAND support for the RZ/N1D SoC,
  - DMA engine (SYS-DMAC) support for the R-Car S4-8 SoC,
  - LVDS support for the R-Car M3-W+ SoC,
  - HDMI output and 9-axis sensor support for the Kingfisher (ULCB
    extension) board,
  - MAX96712 GMSL serializer support for the Falcon development board,
  - MOST network support for the R-Car H3, M3-W, M3-W+, M3-N, E3, and D3
    SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (13):
      arm64: dts: renesas: rzg2l-smarc: Move pinctrl definitions
      arm64: dts: renesas: Add initial DTSI for RZ/G2LC SoC
      arm64: dts: renesas: Add initial device tree for RZ/G2LC SMARC EVK
      dt-bindings: clock: Add R9A07G054 CPG Clock and Reset Definitions
      arm64: dts: renesas: Add initial DTSI for RZ/V2L SoC
      arm64: dts: renesas: Add initial device tree for RZ/V2L SMARC EVK
      arm64: dts: renesas: rzg2lc-smarc-som: Enable eMMC on SMARC platform
      arm64: dts: renesas: rzg2lc-smarc: Enable microSD on SMARC platform
      arm64: dts: renesas: rzg2l-smarc: Add common dtsi file
      arm64: dts: renesas: rzg2lc-smarc: Add macros for DIP-Switch settings
      arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
      arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1
      arm64: dts: renesas: rzg2lc-smarc: Use SW_SD0_DEV_SEL macro for eMMC/SDHI device selection

Fabio Estevam (1):
      arm64: dts: renesas: beacon: Remove the 'pm-ignore-notify' property

Geert Uytterhoeven (3):
      arm64: dts: renesas: r8a779a0: Add INTC-EX device node
      arm64: dts: renesas: Miscellaneous whitespace fixes
      Merge tag 'renesas-r9a07g054-dt-binding-defs-tag' into renesas-arm-dt-for-v5.18

Jacopo Mondi (1):
      arm64: dts: renesas: condor: Enable MAX9286

Kieran Bingham (2):
      arm64: dts: renesas: eagle: Enable MAX9286
      arm64: dts: renesas: Add GMSL cameras .dtsi

Kuninori Morimoto (1):
      arm64: dts: renesas: ulcb/ulcb-kf: switch to use audio-graph-card2 for sound

Miquel Raynal (1):
      ARM: dts: r9a06g032: Describe the NAND controller

Nikita Yushchenko (4):
      arm64: dts: renesas: r8a77961: Add lvds0 device node
      arm64: dts: renesas: ulcb-kf: Add KF HDMI output
      arm64: dts: renesas: ulcb-kf: Add 9-asix sensor device
      arm64: dts: renesas: rcar-gen3: Add MOST devices

Niklas Söderlund (1):
      arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a779f0: Add sys-dmac nodes

 arch/arm/boot/dts/r9a06g032.dtsi                   |  11 +
 arch/arm64/boot/dts/renesas/Makefile               |   3 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   9 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   1 -
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi      | 332 ++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  14 +-
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  10 +-
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  26 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  26 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  43 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  26 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     | 102 +++++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    | 191 ++++++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  24 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  24 +-
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  | 229 ++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  35 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  70 +++
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi       |  32 ++
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  |  91 ++++
 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi       |  20 +
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |   2 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         | 491 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi       |  25 ++
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |  26 ++
 arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi       |  13 +
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   | 207 +++++++++
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 137 ++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   2 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       | 322 +-------------
 .../boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  94 ++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  | 208 +++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  77 ++++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           | 139 +++++-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |  20 +-
 include/dt-bindings/clock/r9a07g054-cpg.h          | 229 ++++++++++
 40 files changed, 2905 insertions(+), 418 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
 create mode 100644 include/dt-bindings/clock/r9a07g054-cpg.h
