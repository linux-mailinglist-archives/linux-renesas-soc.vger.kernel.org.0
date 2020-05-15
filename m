Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA771D4A66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 12:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgEOKF7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 06:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728005AbgEOKF7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 06:05:59 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019DCC061A0C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 03:05:58 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:ad37:48f9:900a:523e])
        by xavier.telenet-ops.be with bizsmtp
        id ey5w2200B1TfvYq01y5w6J; Fri, 15 May 2020 12:05:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0008Qm-Df; Fri, 15 May 2020 12:05:56 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jZXE4-0003pc-Cd; Fri, 15 May 2020 12:05:56 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM DT updates for v5.8 (take two)
Date:   Fri, 15 May 2020 12:05:44 +0200
Message-Id: <20200515100547.14671-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515100547.14671-1-geert+renesas@glider.be>
References: <20200515100547.14671-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit cf8ae446bbcbf5c48214eb7ddaa6ac6e12f4633d:

  arm64: dts: renesas: Fix IOMMU device node names (2020-04-27 12:02:56 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.8-tag2

for you to fetch changes up to 0e36587c0832af5df894f5e5fcc45fb5a05cea5b:

  arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1 (2020-05-12 10:05:36 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.8 (take two)

  - Initial support for the Renesas RZ/G1H SoC on the iWave RainboW
    Qseven SOM (G21M) and board (G21D),
  - Support for the AISTARVISION MIPI Adapter V2.1 camera board on the
    Silicon Linux EK874 RZ/G2E evaluation kit.

----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a7742-dt-binding-defs-tag' into renesas-arm-dt-for-v5.8

Lad Prabhakar (9):
      dt-bindings: power: rcar-sysc: Add r8a7742 power domain index macros
      clk: renesas: Add r8a7742 CPG Core Clock Definitions
      ARM: dts: r8a7742: Initial SoC device tree
      ARM: dts: r8a7742-iwg21m: Add iWave RZ/G1H Qseven SOM
      ARM: dts: r8a7742-iwg21d-q7: Add iWave G21D-Q7 board based on RZ/G1H
      ARM: dts: r8a7742: Add IRQC support
      ARM: dts: r8a7742: Add [H]SCIF{A|B} support
      ARM: dts: r8a7742: Add GPIO nodes
      arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1

 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts            |  37 ++
 arch/arm/boot/dts/r8a7742-iwg21m.dtsi              |  53 ++
 arch/arm/boot/dts/r8a7742.dtsi                     | 648 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/Makefile               |   3 +-
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |  94 +++
 .../boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts   |  72 +++
 include/dt-bindings/clock/r8a7742-cpg-mssr.h       |  42 ++
 include/dt-bindings/power/r8a7742-sysc.h           |  29 +
 9 files changed, 978 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21m.dtsi
 create mode 100644 arch/arm/boot/dts/r8a7742.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
 create mode 100644 include/dt-bindings/clock/r8a7742-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a7742-sysc.h
