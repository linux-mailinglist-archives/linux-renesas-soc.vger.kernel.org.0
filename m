Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19BE2139C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Jul 2020 14:06:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgGCMG5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Jul 2020 08:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726022AbgGCMG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 08:06:57 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB31AC08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Jul 2020 05:06:56 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:e8cd:dde5:943b:dfd3])
        by albert.telenet-ops.be with bizsmtp
        id yc6t2200f1UkkT806c6upx; Fri, 03 Jul 2020 14:06:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKSz-0004Tw-SJ; Fri, 03 Jul 2020 14:06:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jrKSz-0001Lp-R8; Fri, 03 Jul 2020 14:06:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas ARM DT updates for v5.9
Date:   Fri,  3 Jul 2020 14:06:42 +0200
Message-Id: <20200703120642.5128-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703120642.5128-1-geert+renesas@glider.be>
References: <20200703120642.5128-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.9-tag1

for you to fetch changes up to b7f13b914730026ca7fdc0d5ef6a791f3c613fe2:

  ARM: dts: r8a7778: Enable IRLM setup via DT (2020-06-29 10:21:54 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.9

  - Increase support for the Renesas RZ/G1H SoC on the iWave RainboW
    Qseven board (G21D), and its camera expansion board,
  - IPMMU support for R-Car M3-W+,
  - Support for Rev.3.0/4.0 of the HopeRun HiHope RZ/G2M and RZ/G2N
    boards,
  - Minor fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      ARM: dts: r9a06g032: Correct GIC compatible value order

Lad Prabhakar (33):
      ARM: dts: r8a7742: Add I2C and IIC support
      ARM: dts: r8a7742: Add SDHI nodes
      ARM: dts: r8a7742: Add MMC0 node
      ARM: dts: r8a7742: Add SATA nodes
      ARM: dts: r8a7742: Add Ethernet AVB support
      ARM: dts: r8a7742: Add Ether support
      ARM: dts: r8a7742: Add APMU nodes
      ARM: dts: r8a7742: Add RWDT node
      ARM: dts: r8a7742: Add USB 2.0 host support
      ARM: dts: r8a7742: Add USB-DMAC and HSUSB device nodes
      ARM: dts: r8a7742: Add XHCI support
      ARM: dts: r8a7742-iwg21d-q7: Enable SCIFB2 node
      ARM: dts: r8a7742-iwg21d-q7: Enable SDHI2 controller
      ARM: dts: r8a7742-iwg21d-q7: Enable Ethernet AVB
      ARM: dts: r8a7742-iwg21d-q7: Add RWDT support
      ARM: dts: r8a7742: Add audio support
      ARM: dts: r8a7742-iwg21d-q7: Enable SGTL5000 audio codec
      ARM: dts: r8a7742-iwg21d-q7: Sound DMA support via DVC on DTS
      ARM: dts: r8a7742: Add thermal device to DT
      ARM: dts: r8a7742: Add CMT SoC specific support
      ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add device tree for camera DB
      ARM: dts: r8a7742: Add MSIOF[0123] support
      arm64: dts: renesas: r8a774a1-hihope-rzg2m[-ex/-ex-idk-1110wr]: Rename HiHope RZ/G2M boards
      arm64: dts: renesas: r8a774b1-hihope-rzg2n[-ex]: Rename HiHope RZ/G2N boards
      arm64: dts: renesas: hihope-common: Separate out Rev.2.0 specific into hihope-rev2.dtsi file
      arm64: dts: renesas: Add HiHope RZ/G2M[N] Rev.3.0/4.0 specific into common file
      arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 main board support
      arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 sub board support
      arm64: dts: renesas: hihope-rzg2-ex: Separate out lvds specific nodes into common file
      arm64: dts: renesas: Add HiHope RZ/G2M Rev.3.0/4.0 board with idk-1110wr display
      arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 main board support
      arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 sub board support
      arm64: dts: renesas: Add HiHope RZ/G2N Rev2.0/3.0/4.0 board with idk-1110wr display

Ulrich Hecht (1):
      ARM: dts: r8a7778: Enable IRLM setup via DT

Yoshihiro Shimoda (1):
      arm64: dts: renesas: r8a77961: Add IPMMU nodes

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  97 +++
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            | 187 +++++
 arch/arm/boot/dts/r8a7742.dtsi                     | 854 +++++++++++++++++++++
 arch/arm/boot/dts/r8a7778.dtsi                     |   3 +-
 arch/arm/boot/dts/r9a06g032.dtsi                   |   2 +-
 arch/arm64/boot/dts/renesas/Makefile               |  17 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |  71 +-
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi       |  86 +++
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       | 124 +++
 .../boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi      |  52 ++
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |  37 -
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        |  43 +-
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  |   6 +-
 .../r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts   |  15 +
 .../dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts  |  20 +
 .../dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts     |  37 +
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +
 .../r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts        |  15 +
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |   5 +-
 .../r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts   |  15 +
 .../dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts  |  15 +
 .../dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts     |  41 +
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  89 +++
 27 files changed, 1687 insertions(+), 161 deletions(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dts
