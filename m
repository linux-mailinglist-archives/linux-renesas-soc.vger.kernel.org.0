Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7308F25D7C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 13:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbgIDLsi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 07:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729897AbgIDLsc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 07:48:32 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1CDEC061245
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2020 04:48:31 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id PnoM2300S4C55Sk06noMoN; Fri, 04 Sep 2020 13:48:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0004eM-7Y; Fri, 04 Sep 2020 13:48:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0007so-6d; Fri, 04 Sep 2020 13:48:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/3] Renesas ARM DT updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:18 +0200
Message-Id: <20200904114819.30254-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200904114819.30254-1-geert+renesas@glider.be>
References: <20200904114819.30254-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.10-tag1

for you to fetch changes up to e9f0fb53ac88c1ccf3728b47c687838b6054f481:

  arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display (2020-09-04 09:54:39 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.10

  - Increase support for the RZ/G2H SoC on the HopeRun HiHope RZ/G2H
    board, and its display panel expansion board,
  - Increase support for the RZ/G1H SoC on the iWave RainboW SoM (G21M)
    and Qseven board (G21D),
  - SATA support for the HopeRun HiHope RZ/G2N board,
  - PCIe endpoint support for the RZ/G2M, RZ/G2E, and RZ/G2H SoCs,
  - Audio support for the R-Car M3-W+ SoC.
  - Minor fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      ARM: dts: iwg22d-sodimm: Fix dt nodes sorting
      arm64: dts: renesas: r8a774e1-hihope-rzg2h: Enable HS400 mode

Kuninori Morimoto (1):
      arm64: dts: renesas: r8a77961: Enable Sound / Audio-DMAC

Lad Prabhakar (28):
      arm64: dts: renesas: r8a774e1: Add PCIe device nodes
      arm64: dts: renesas: r8a774e1: Add SATA controller node
      arm64: dts: renesas: r8a774e1: Add USB2.0 phy and host (EHCI/OHCI) device nodes
      arm64: dts: renesas: r8a774e1: Add USB3.0 device nodes
      arm64: dts: renesas: r8a774e1: Add USB-DMAC and HSUSB device nodes
      arm64: dts: renesas: r8a774e1: Add audio support
      arm64: dts: renesas: r8a774e1: Add VIN and CSI-2 nodes
      ARM: dts: r8a7742-iwg21d-q7: Enable HSUSB, USB2.0 and xHCI
      ARM: dts: r8a7742-iwg21d-q7: Enable cmt0
      ARM: dts: r8a7742: Add PWM SoC support
      ARM: dts: r8a7742: Add TPU support
      ARM: dts: r8a7742: Add DU support
      ARM: dts: r8a7742: Add LVDS support
      arm64: dts: renesas: r8a774b1-hihope-rzg2n-ex: Enable sata
      ARM: dts: r8a7742: Add PCIe Controller device node
      arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks
      ARM: dts: r8a7742: Add QSPI support
      arm64: dts: renesas: r8a774a1: Add PCIe EP nodes
      arm64: dts: renesas: r8a774b1: Add PCIe EP nodes
      arm64: dts: renesas: r8a774c0: Add PCIe EP node
      ARM: dts: r8a7742: Add CAN support
      ARM: dts: r8a7742-iwg21m: Sort the nodes alphabetically
      ARM: dts: r8a7742-iwg21m: Add RTC support
      ARM: dts: r8a7742-iwg21m: Add SPI NOR support
      ARM: dts: r8a7742: Add IPMMU DT nodes
      ARM: dts: r8a7742-iwg21d-q7: Enable PCIe Controller
      arm64: dts: renesas: r8a774e1: Add cpuidle support for CA5x cores
      arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display

Marian-Cristian Rotariu (7):
      arm64: dts: renesas: r8a774e1: Add FCPF and FCPV instances
      arm64: dts: renesas: r8a774e1: Add VSP instances
      arm64: dts: renesas: r8a774e1: Populate DU device node
      arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
      arm64: dts: renesas: r8a774e1: Add LVDS device node
      arm64: dts: renesas: r8a774e1: Add PWM device nodes
      arm64: dts: renesas: r8a774e1: Add FDP1 device nodes

Yoshihiro Shimoda (1):
      arm64: dts: renesas: ulcb: add full-pwr-cycle-in-suspend into eMMC nodes

 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |   58 +
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi              |   79 +-
 arch/arm/boot/dts/r8a7742.dtsi                     |  303 +++++
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts        |  112 +-
 arch/arm64/boot/dts/renesas/Makefile               |    1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   38 +
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |    5 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   38 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   19 +
 .../r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts        |   15 +
 .../boot/dts/renesas/r8a774e1-hihope-rzg2h.dts     |   15 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          | 1294 +++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  483 +++++++-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |    1 +
 14 files changed, 2367 insertions(+), 94 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts
