Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8F283DB93B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jul 2021 15:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230480AbhG3NTc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jul 2021 09:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhG3NTQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 09:19:16 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B223C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jul 2021 06:19:10 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:69f0:c617:e432:6919])
        by xavier.telenet-ops.be with bizsmtp
        id bRK62500T2oLRg901RK6vS; Fri, 30 Jul 2021 15:19:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SPq-002GQq-3t; Fri, 30 Jul 2021 15:19:06 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m9SPp-00HJrs-GP; Fri, 30 Jul 2021 15:19:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/3] Renesas ARM DT updates for v5.15
Date:   Fri, 30 Jul 2021 15:18:54 +0200
Message-Id: <cover.1627650696.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627650695.git.geert+renesas@glider.be>
References: <cover.1627650695.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 2734d6c1b1a089fb593ef6a23d4b70903526fe0c:

  Linux 5.14-rc2 (2021-07-18 14:13:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.15-tag1

for you to fetch changes up to 651f8cffade8615bb4fce1ecb3a929892c5e60d7:

  arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes (2021-07-30 15:07:25 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.15

  - Switches support for the Draak and Ebisu development boards,
  - I2C support on RZ/G2L,
  - I2C EEPROM support on the Ebisu development board,
  - Sound support for the R-Car D3 SoC and the Draak development board,
  - Support for the new R-Car H3e-2G and M3e-2G SoCs on the Salvator-XS
    and ULCB development boards,
  - IOMMU support for DMAC, EtherAVB, and SDHI on the R-Car M3-W+ SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: renesas: beacon: Enable micbias

Biju Das (2):
      arm64: dts: renesas: r9a07g044: Add I2C nodes
      arm64: dts: renesas: hihope-rzg2-ex: Add EtherAVB internal rx delay

Geert Uytterhoeven (21):
      arm64: dts: renesas: salvator-x(s): Factor out HDMI1 parts
      arm64: dts: renesas: salvator-x(s): Factor out SATA parts
      arm64: dts: renesas: salvator-x(s): Factor out USB ch2 parts
      arm64: dts: renesas: salvator-xs: Factor out USB ch3 parts
      ARM: dts: r8a73a4: Remove non-functional DMA support
      ARM: dts: rzg1: Add generic compatible strings to IIC nodes
      arm64: dts: renesas: r8a774c0: Add generic compatible string to IIC node
      arm64: dts: renesas: r8a77990: Add generic compatible string to IIC node
      arm64: dts: renesas: rzg2: Rename i2c_dvfs to iic_pmic
      arm64: dts: renesas: r8a779a0: Restore sort order
      arm64: dts: renesas: r8a77995: draak: Remove bogus adv7511w properties
      arm64: dts: renesas: r8a77990: ebisu: Add I2C EEPROM for PMIC
      arm64: dts: renesas: rcar-gen3: Add SoC model to comment headers
      arm64: dts: renesas: Add Renesas R8A779M1 SoC support
      arm64: dts: renesas: Add Renesas R8A779M3 SoC support
      arm64: dts: renesas: Add support for Salvator-XS with R-Car H3e-2G
      arm64: dts: renesas: Add support for H3ULCB with R-Car H3e-2G
      arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3e-2G
      arm64: dts: renesas: Add support for Salvator-XS with R-Car M3e-2G
      arm64: dts: renesas: Add support for M3ULCB with R-Car M3e-2G
      arm64: dts: renesas: Add support for M3ULCB+Kingfisher with R-Car M3e-2G

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a77995: Add R-Car Sound support
      arm64: dts: renesas: r8a77995: draak: Add R-Car Sound support

Magnus Damm (2):
      arm64: dts: renesas: r8a77995: draak: Add SW56 support
      arm64: dts: renesas: r8a77990: ebisu: Add SW4 support

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes

 arch/arm/boot/dts/r8a73a4.dtsi                     |  44 ------
 arch/arm/boot/dts/r8a7742.dtsi                     |   4 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |   4 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |   4 +-
 arch/arm64/boot/dts/renesas/Makefile               |   8 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   8 +
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   8 +-
 .../arm64/boot/dts/renesas/r8a77950-salvator-x.dts |  73 ---------
 arch/arm64/boot/dts/renesas/r8a77950-ulcb-kf.dts   |   2 +-
 arch/arm64/boot/dts/renesas/r8a77950-ulcb.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a77950.dtsi          |   2 +
 .../arm64/boot/dts/renesas/r8a77951-salvator-x.dts |  73 ---------
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      | 122 ---------------
 arch/arm64/boot/dts/renesas/r8a77951-ulcb-kf.dts   |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951-ulcb.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   5 +
 arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dts   |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb-kf.dts   |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |   3 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  29 ++++
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  14 --
 arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts   |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts      |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |  50 +++++-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   6 +-
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts     | 169 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          | 158 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  26 ++--
 .../boot/dts/renesas/r8a779m1-salvator-xs.dts      |  53 +++++++
 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts   |  19 +++
 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts      |  54 +++++++
 arch/arm64/boot/dts/renesas/r8a779m1.dtsi          |  12 ++
 .../boot/dts/renesas/r8a779m3-salvator-xs.dts      |  46 ++++++
 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts   |  18 +++
 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts      |  45 ++++++
 arch/arm64/boot/dts/renesas/r8a779m3.dtsi          |  12 ++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  80 ++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  76 ++++++++-
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       |  56 +++++++
 47 files changed, 943 insertions(+), 371 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb-kf.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m3.dtsi
