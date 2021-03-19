Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B34C03417C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Mar 2021 09:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbhCSIwS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Mar 2021 04:52:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbhCSIv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Mar 2021 04:51:57 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5159C061760
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Mar 2021 01:51:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:207d:4b39:ec21:2531])
        by andre.telenet-ops.be with bizsmtp
        id i8rv240013CXdgx018rvcv; Fri, 19 Mar 2021 09:51:55 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNArK-008kg0-J3; Fri, 19 Mar 2021 09:51:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lNArK-00BMyA-45; Fri, 19 Mar 2021 09:51:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas ARM DT updates for v5.13
Date:   Fri, 19 Mar 2021 09:51:45 +0100
Message-Id: <20210319085146.2709844-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210319085146.2709844-1-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.13-tag1

for you to fetch changes up to c8aebc1346522d3569690867ce3996642ad52e01:

  arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding (2021-03-16 09:58:00 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.13

  - OV7725 camera support for the iWave RainboW Qseven board (G21D), and
    its camera expansion board,
  - Add mmc aliases to fix /dev/mmcblkN order,
  - HDMI Display support for the R-Car Starter Kit Pro with R-Car M3-W+,
  - Support for running upstream kernels on the RZA2MEVB board, using
    the SDRAM present on the sub-board,
  - I2C EEPROM support for the Falcon development board,
  - Timer, thermal sensor, and CAN support for the R-Car V3U SoC.
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (10):
      ARM: dts: renesas: Group tuples in APMU cpus properties
      ARM: dts: renesas: Group tuples in playback and capture properties
      ARM: dts: renesas: Group tuples in pin control properties
      arm64: dts: renesas: Group tuples in playback and capture properties
      arm64: dts: renesas: Group tuples in pin control properties
      arm64: dts: renesas: Consolidate Salvator-X(S) HDMI0 handling
      ARM: dts: rza2mevb: Upstream Linux requires SDRAM
      arm64: dts: renesas: falcon: Add I2C EEPROM nodes
      arm64: dts: renesas: falcon: Add CSI/DSI sub-board
      arm64: dts: renesas: falcon: Add Ethernet sub-board

Lad Prabhakar (2):
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Separate out ov5640 nodes
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sensors

Niklas Söderlund (1):
      arm64: dts: renesas: r8a779a0: Add thermal support

Phong Hoang (2):
      arm64: dts: renesas: r8a779a0: Add TMU support
      arm64: dts: renesas: r8a779a0: Add CMT support

Vladimir Barinov (1):
      arm64: dts: renesas: r8a77980: Fix vin4-7 endpoint binding

Yoshihiro Shimoda (3):
      ARM: dts: renesas: Add mmc aliases into R-Car Gen2 board dts files
      arm64: dts: renesas: Add mmc aliases into board dts files
      arm64: dts: renesas: r8a77961: Add CAN nodes

Yuya Hamamachi (1):
      arm64: dts: renesas: r8a77961-ulcb: add HDMI Display support

 arch/arm/boot/dts/iwg20d-q7-common.dtsi            |   4 +-
 arch/arm/boot/dts/r7s9210-rza2mevb.dts             |  55 +++---
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    | 159 ++++++++-------
 .../dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi  |  32 +++
 .../dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi  |  29 +++
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |   4 +-
 arch/arm/boot/dts/r8a7742.dtsi                     |   4 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts             |   2 +-
 arch/arm/boot/dts/r8a7743.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7744.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        |   4 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts             |   2 +-
 arch/arm/boot/dts/r8a7745.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a77470.dtsi                    |   2 +-
 arch/arm/boot/dts/r8a7790-lager.dts                |  11 +-
 arch/arm/boot/dts/r8a7790-stout.dts                |   4 +-
 arch/arm/boot/dts/r8a7790.dtsi                     |   4 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts              |  11 +-
 arch/arm/boot/dts/r8a7791-porter.dts               |   6 +-
 arch/arm/boot/dts/r8a7791.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7792-blanche.dts              |   2 +-
 arch/arm/boot/dts/r8a7792-wheat.dts                |   2 +-
 arch/arm/boot/dts/r8a7792.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7793-gose.dts                 |  11 +-
 arch/arm/boot/dts/r8a7793.dtsi                     |   2 +-
 arch/arm/boot/dts/r8a7794-alt.dts                  |   5 +-
 arch/arm/boot/dts/r8a7794-silk.dts                 |   8 +-
 arch/arm/boot/dts/r8a7794.dtsi                     |   2 +-
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |   4 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   3 +
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   2 +-
 .../boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts |   3 +
 .../boot/dts/renesas/r8a774b1-beacon-rzg2n-kit.dts |   3 +
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   6 +-
 .../boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts |   3 +
 .../arm64/boot/dts/renesas/r8a77950-salvator-x.dts |  37 +---
 .../arm64/boot/dts/renesas/r8a77951-salvator-x.dts |  37 +---
 .../boot/dts/renesas/r8a77951-salvator-xs.dts      |  37 +---
 .../arm64/boot/dts/renesas/r8a77960-salvator-x.dts |  46 -----
 .../boot/dts/renesas/r8a77960-salvator-xs.dts      |  46 -----
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |  46 -----
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |  11 ++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  26 ++-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |  45 -----
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |  45 -----
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  16 +-
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts     |   9 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   7 +
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  |  15 ++
 .../boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi |  15 ++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |  11 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 220 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  48 ++++-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |   1 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   8 +-
 55 files changed, 619 insertions(+), 506 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi
