Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FB7DC381
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2019 13:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633623AbfJRLBL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Oct 2019 07:01:11 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:57518 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2633625AbfJRLBL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 07:01:11 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id Ez142100j05gfCL01z14W0; Fri, 18 Oct 2019 13:01:07 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLQ0G-0005q3-LN; Fri, 18 Oct 2019 13:01:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iLPEt-0006s2-SH; Fri, 18 Oct 2019 12:12:07 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 3/5] Renesas ARM64 DT updates for v5.5
Date:   Fri, 18 Oct 2019 12:11:34 +0200
Message-Id: <20191018101136.26350-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018101136.26350-1-geert+renesas@glider.be>
References: <20191018101136.26350-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm64-dt-for-v5.5-tag1

for you to fetch changes up to 3fa08cbb0662acc6cbd1a481956570a52dba8875:

  arm64: dts: renesas: r8a774b1: Add CAN and CAN FD support (2019-10-14 12:04:59 +0200)

----------------------------------------------------------------
Renesas ARM64 DT updates for v5.5

  - Support for the RZ/G2N (r8a774b1) SoC and the HiHope RZ/G2N board,
  - CPU idle support for R-Car H3 and M3-W,
  - LVDS and backlight support on the HiHope RZ/G2M and RZ/G2N boards,
    with Advantech idk-1110wr LVDS panel,
  - Minor fixes and improvements.

----------------------------------------------------------------
Biju Das (34):
      dt-bindings: power: Add r8a774b1 SYSC power domain definitions
      dt-bindings: clk: Add r8a774b1 CPG Core Clock Definitions
      arm64: dts: renesas: r8a774c0: Create thermal zone to support IPA
      arm64: dts: renesas: r8a774c0: Add dynamic power coefficient
      arm64: dts: renesas: Initial r8a774b1 SoC device tree
      arm64: dts: renesas: Add HiHope RZ/G2N main board support
      arm64: dts: renesas: r8a774a1: Remove audio port node
      arm64: dts: renesas: r8a774b1-hihope-rzg2n: Enable HS400 mode
      arm64: dts: renesas: r8a774b1: Add SYS-DMAC device nodes
      arm64: dts: renesas: r8a774b1: Add SCIF and HSCIF nodes
      arm64: dts: renesas: r8a774b1: Add GPIO device nodes
      arm64: dts: renesas: r8a774b1: Add Ethernet AVB node
      arm64: dts: renesas: Add HiHope RZ/G2N sub board support
      arm64: dts: renesas: r8a774b1: Add OPPs table for cpu devices
      arm64: dts: renesas: r8a774b1: Add RZ/G2N thermal support
      arm64: dts: renesas: r8a774b1: Add CMT device nodes
      arm64: dts: renesas: r8a774b1: Add TMU device nodes
      arm64: dts: renesas: r8a774b1: Add SDHI support
      arm64: dts: renesas: r8a774b1: Add I2C and IIC-DVFS support
      arm64: dts: renesas: r8a774b1: Add IPMMU device nodes
      arm64: dts: renesas: r8a774b1: Add FCPF and FCPV instances
      arm64: dts: renesas: r8a774b1: Add VSP instances
      arm64: dts: renesas: r8a774b1: Tie SYS-DMAC to IPMMU-DS0/1
      arm64: dts: renesas: r8a774b1: Connect Ethernet-AVB to IPMMU-DS0
      arm64: dts: renesas: hihope-common: Move du clk properties out of common dtsi
      arm64: dts: renesas: r8a774b1: Add DU device to DT
      arm64: dts: renesas: r8a774b1: Add HDMI encoder instance
      arm64: dts: renesas: r8a774b1-hihope-rzg2n: Add display clock properties
      arm64: dts: renesas: r8a774b1: Add FDP1 device nodes
      arm64: dts: renesas: r8a774b1: Add PWM device nodes
      arm64: dts: renesas: hihope-rzg2-ex: Enable backlight
      arm64: dts: renesas: hihope-rzg2-ex: Add LVDS support
      arm64: dts: renesas: Add support for Advantech idk-1110wr LVDS panel
      arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC device nodes

Dien Pham (2):
      arm64: dts: r8a7795: Add cpuidle support for CA53 cores
      arm64: dts: r8a7796: Add cpuidle support for CA53 cores

Fabrizio Castro (9):
      arm64: dts: renesas: r8a774b1: Add RWDT node
      arm64: dts: renesas: r8a774b1: Add all MSIOF nodes
      arm64: dts: renesas: r8a774b1: Add PCIe device nodes
      arm64: dts: renesas: hihope-rzg2-ex: Let the board specific DT decide about pciec1
      arm64: dts: renesas: r8a774b1: Add USB2.0 phy and host (EHCI/OHCI) device nodes
      arm64: dts: renesas: r8a774b1: Add USB-DMAC and HSUSB device nodes
      arm64: dts: renesas: r8a774b1: Add USB3.0 device nodes
      arm64: dts: renesas: r8a774b1: Add INTC-EX device node
      arm64: dts: renesas: r8a774b1: Add CAN and CAN FD support

Jacopo Mondi (1):
      arm64: dts: renesas: Add LIF channel indices to vsps properties

Khiem Nguyen (2):
      arm64: dts: r8a7795: Add cpuidle support for CA57 cores
      arm64: dts: r8a7796: Add cpuidle support for CA57 cores

Kieran Bingham (1):
      arm64: dts: renesas: r8a77970: Fix PWM3

Yoshihiro Shimoda (1):
      arm64: dts: renesas: Add iommus to R-Car Gen3 SDHI/MMC nodes

 arch/arm64/boot/dts/renesas/Makefile               |    2 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   28 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   51 +-
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dts  |    4 +
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     |   11 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   13 +-
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts  |   15 +
 .../boot/dts/renesas/r8a774b1-hihope-rzg2n.dts     |   41 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          | 2250 ++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   20 +-
 arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi       |    2 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |   34 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |   34 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |    4 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |    5 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |    3 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |    3 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |    1 +
 .../renesas/rzg2-advantech-idk-1110wr-panel.dtsi   |   41 +
 include/dt-bindings/clock/r8a774b1-cpg-mssr.h      |   57 +
 include/dt-bindings/power/r8a774b1-sysc.h          |   26 +
 21 files changed, 2603 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
 create mode 100644 include/dt-bindings/clock/r8a774b1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774b1-sysc.h
