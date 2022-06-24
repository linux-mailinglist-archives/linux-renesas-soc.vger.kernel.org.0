Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3012B559903
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jun 2022 14:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbiFXMBr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Jun 2022 08:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiFXMBp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Jun 2022 08:01:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD5117E02F
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Jun 2022 05:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id n01e2700C4C55Sk0601e0B; Fri, 24 Jun 2022 14:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0I-000gWa-9I; Fri, 24 Jun 2022 14:01:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o4i0H-009mq8-SR; Fri, 24 Jun 2022 14:01:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.20
Date:   Fri, 24 Jun 2022 14:01:30 +0200
Message-Id: <cover.1656069634.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656069631.git.geert+renesas@glider.be>
References: <cover.1656069631.git.geert+renesas@glider.be>
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

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.20-tag1

for you to fetch changes up to 3c7742a45c170430001c5a1767d9dd76686dc14d:

  ARM: dts: rza2mevb: Fix LED node names (2022-06-17 09:46:20 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.20

  - ADC and SPI support for the RZ/G2UL Soc and the RZ/G2UL SMARC EVK
    development board,
  - Ethernet support for the RZ/V2M SoC and the RZV2MEVK2 development
    board,
  - Thermal, IOMMU, Universal Flash Storage, octal Cortex-A55, and full
    serial support for the R-Car S4-8 SoC on the Spider development
    board,
  - RTC support for the RZN1D-DB board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (3):
      arm64: dts: renesas: r9a07g043: Add ADC node
      arm64: dts: renesas: rzg2ul-smarc: Enable RSPI1 on carrier board
      arm64: dts: renesas: rzg2ul-smarc-som: Enable ADC on SMARC platform

Clément Léger (1):
      ARM: dts: r9a06g032-rzn1d400-db: Enable rtc0

Geert Uytterhoeven (9):
      arm64: dts: renesas: beacon: Fix regulator node names
      arm64: dts: renesas: Rename numbered regulators
      arm64: dts: renesas: r8a779a0: Update to R-Car Gen4 compatible values
      arm64: dts: renesas: r8a779a0: Add CPU0 core clock
      arm64: dts: renesas: r8a779f0: Add L3 cache controller
      arm64: dts: renesas: r8a779f0: Add secondary CA55 CPU cores
      arm64: dts: renesas: r8a779f0: Add CPU core clocks
      arm64: dts: renesas: Fix thermal-sensors on single-zone sensors
      ARM: dts: rza2mevb: Fix LED node names

Krzysztof Kozlowski (1):
      arm64: dts: renesas: Adjust whitespace around '='

Linh Phung (3):
      arm64: dts: renesas: r8a779f0: Add thermal support
      arm64: dts: renesas: r8a779f0: Add HSCIF nodes
      arm64: dts: renesas: r8a779f0: Add SCIF nodes

Niklas Söderlund (1):
      arm64: dts: renesas: Add missing space after remote-endpoint

Phil Edworthy (2):
      arm64: dts: renesas: r9a09g011: Add ethernet nodes
      arm64: dts: renesas: rzv2mevk2: Enable ethernet

Tho Vu (1):
      arm64: dts: renesas: r8a779f0: Add CPUIdle support

Wolfram Sang (3):
      arm64: dts: renesas: rzg2l-smarc: Use proper bool operator
      arm64: dts: renesas: r8a779f0: Add DMA properties to SCIF3
      arm64: dts: renesas: spider-cpu: Enable SCIF0 on second connector

Yoshihiro Shimoda (3):
      arm64: dts: renesas: r8a779f0: Add IPMMU nodes
      arm64: dts: renesas: r8a779f0: Add iommus to DMAC nodes
      arm64: dts: renesas: r8a779f0: Add UFS node

 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |   4 +-
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts        |   4 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   6 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   4 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   8 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   4 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  31 +-
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dts    |   1 +
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 434 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |  21 +-
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts |   6 -
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |  14 +
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  51 +++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   4 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   4 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |   2 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  23 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      |   6 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   8 +-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  14 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   6 +-
 25 files changed, 619 insertions(+), 63 deletions(-)
