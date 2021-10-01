Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E349241E9F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Oct 2021 11:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353188AbhJAJok (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Oct 2021 05:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353246AbhJAJog (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:44:36 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC1EC06177D
        for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Oct 2021 02:42:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5c32:c2e7:df7:3731])
        by laurent.telenet-ops.be with bizsmtp
        id 0Zir260021ZoSwU01ZirkK; Fri, 01 Oct 2021 11:42:51 +0200
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF46-000zIk-J0; Fri, 01 Oct 2021 11:42:50 +0200
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mWF45-00BE6H-Ur; Fri, 01 Oct 2021 11:42:49 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/4] Renesas ARM DT updates for v5.16
Date:   Fri,  1 Oct 2021 11:42:44 +0200
Message-Id: <cover.1633081147.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633081144.git.geert+renesas@glider.be>
References: <cover.1633081144.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.16-tag1

for you to fetch changes up to 732e8ee0351c59ded4d88106437a7ad1cff4cb83:

  arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets (2021-09-28 09:59:26 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.16

  - I2C EEPROM support on the RZA2MEVB development board,
  - DMA, USB2.0, and audio support for the RZ/G2L SoC,
  - USB2.0, I2C, audio, ADC, and CANFD support for the RZ/G2L SMARC EVK
    development board,
  - Support for more R-Car Gen3e SoCs (H3e, M3e, M3Ne(-2G), D3e, E3e,
    H3Ne),
  - PWM support for the R-Car M3-W+ and V3U SoCs,
  - IPMMU support for SDHI on the R-Car V3U SoC,
  - Switches support for the Falcon development board,
  - Improve Ethernet PHY descriptions to fix reset handling after kexec,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (11):
      arm64: dts: renesas: r9a07g044: Add DMAC support
      arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
      arm64: dts: renesas: r9a07g044: Add USB2.0 device support
      arm64: dts: renesas: r9a07g044: Add external audio clock nodes
      arm64: dts: renesas: r9a07g044: Add SSI support
      arm64: dts: renesas: rzg2l-smarc: Enable USB2.0 support
      arm64: dts: renesas: rzg2l-smarc: Enable I2C{0,1,3} support
      arm64: dts: renesas: r9a07g044: Add DMA support to SSI
      arm64: dts: renesas: rzg2l-smarc: Add WM8978 sound codec
      arm64: dts: renesas: rzg2l-smarc: Enable audio
      arm64: dts: renesas: rzg2l-smarc: Add Mic routing

Duc Nguyen (1):
      arm64: dts: renesas: r8a779a0: Add TPU device node

Geert Uytterhoeven (25):
      ARM: dts: rza2mevb: Add I2C EEPROM support
      arm64: dts: renesas: Factor out Draak board support
      arm64: dts: renesas: Factor out Ebisu board support
      arm64: dts: renesas: Add Renesas R8A779M0 SoC support
      arm64: dts: renesas: Add Renesas R8A779M2 SoC support
      arm64: dts: renesas: Add Renesas R8A779M4 SoC support
      arm64: dts: renesas: Add Renesas R8A779M5 SoC support
      arm64: dts: renesas: Add Renesas R8A779M6 SoC support
      arm64: dts: renesas: Add Renesas R8A779M7 SoC support
      arm64: dts: renesas: Add Renesas R8A779M8 SoC support
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3Ne-2G
      ARM: dts: renesas: Fix SMSC Ethernet compatible values
      arm64: dts: renesas: beacon: Fix Ethernet PHY mode
      ARM: dts: renesas: Add compatible properties to KSZ8041 Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to KSZ8081 Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to KSZ9031 Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to LAN8710A Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to RTL8201FL Ethernet PHYs
      ARM: dts: renesas: Add compatible properties to uPD6061x Ethernet PHYs
      arm64: dts: renesas: Add compatible properties to AR8031 Ethernet PHYs
      arm64: dts: renesas: Add compatible properties to KSZ9031 Ethernet PHYs
      arm64: dts: renesas: Add compatible properties to RTL8211E Ethernet PHYs
      ARM: dts: r-mobile: Add missing Ethernet PHY resets
      ARM: dts: rzg1: Add missing Ethernet PHY resets
      arm64: dts: renesas: rcar-gen3: Add missing Ethernet PHY resets

Kieran Bingham (1):
      arm64: dts: renesas: r8a779a0: falcon-cpu: Add SW47-SW49 support

Lad Prabhakar (4):
      arm64: dts: renesas: rzg2l-smarc: Add scif0 pins
      arm64: dts: renesas: rzg2l-smarc-som: Move extal and memory nodes to SOM DTSI
      arm64: dts: renesas: rzg2l-smarc-som: Enable ADC on SMARC platform
      arm64: dts: renesas: rzg2l-smarc: Enable CANFD

Wolfram Sang (1):
      arm64: dts: renesas: r8a77961: Add TPU device node

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779a0: Add IPMMU nodes
      arm64: dts: renesas: r8a779a0: Add iommus into sdhi node

 arch/arm/boot/dts/emev2-kzm9d.dts                  |   2 +-
 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |   2 +
 arch/arm/boot/dts/r7s72100-genmai.dts              |   2 +
 arch/arm/boot/dts/r7s72100-gr-peach.dts            |   2 +
 arch/arm/boot/dts/r7s72100-rskrza1.dts             |   2 +
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |  21 +
 arch/arm/boot/dts/r8a73a4-ape6evm.dts              |   1 +
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts      |   3 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |   2 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |   2 +
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts             |   4 +
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        |   2 +
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts             |   4 +
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts          |   2 +
 arch/arm/boot/dts/r8a7778-bockw.dts                |   2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts               |   2 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |   2 +
 arch/arm/boot/dts/r8a7790-stout.dts                |   2 +
 arch/arm/boot/dts/r8a7791-koelsch.dts              |   2 +
 arch/arm/boot/dts/r8a7791-porter.dts               |   2 +
 arch/arm/boot/dts/r8a7793-gose.dts                 |   2 +
 arch/arm/boot/dts/r8a7794-alt.dts                  |   2 +
 arch/arm/boot/dts/r8a7794-silk.dts                 |   2 +
 arch/arm/boot/dts/sh73a0-kzm9g.dts                 |   2 +-
 arch/arm64/boot/dts/renesas/Makefile               |   2 +
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   3 +
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   2 +
 arch/arm64/boot/dts/renesas/draak.dtsi             | 686 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             | 801 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   2 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  11 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   4 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   4 +
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   4 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   4 +
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     | 788 +-------------------
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     | 671 +----------------
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |  37 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 109 +++
 arch/arm64/boot/dts/renesas/r8a779m0.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r8a779m2.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi          |  12 +
 .../boot/dts/renesas/r8a779m5-salvator-xs.dts      |  36 +
 arch/arm64/boot/dts/renesas/r8a779m5.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r8a779m6.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r8a779m7.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 248 +++++++
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |   7 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  35 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       | 229 +++++-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 54 files changed, 2375 insertions(+), 1469 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/draak.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/ebisu.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
