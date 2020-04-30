Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D25D1BF369
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2020 10:49:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726692AbgD3Isw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Apr 2020 04:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726549AbgD3Isw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Apr 2020 04:48:52 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06F5EC035494
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2020 01:48:51 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by laurent.telenet-ops.be with bizsmtp
        id Ywor2200e0w8ZL601worGe; Thu, 30 Apr 2020 10:48:51 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0002l6-HP; Thu, 30 Apr 2020 10:48:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sF-0000OP-Fb; Thu, 30 Apr 2020 10:48:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM DT updates for v5.8
Date:   Thu, 30 Apr 2020 10:48:46 +0200
Message-Id: <20200430084849.1457-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430084849.1457-1-geert+renesas@glider.be>
References: <20200430084849.1457-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.8-tag1

for you to fetch changes up to cf8ae446bbcbf5c48214eb7ddaa6ac6e12f4633d:

  arm64: dts: renesas: Fix IOMMU device node names (2020-04-27 12:02:56 +0200)

----------------------------------------------------------------
Renesas ARM DT updates for v5.8

  - USB, UART, PWM, and PCIe support for R-Car M3-W+,
  - PWM (16-bit Timer Pulse Unit and PWM Timers) support for R-Car M2-W,
  - Minor fixes and cleanups.

----------------------------------------------------------------
Geert Uytterhoeven (4):
      arm64: dts: renesas: r8a77961: Add SCIF and HSCIF nodes
      ARM: dts: r8a7791: Add TPU device node
      ARM: dts: r8a7791: Add PWM device nodes
      ARM: dts: shmobile: Update CMT1 compatible values

Yoshihiro Shimoda (6):
      arm64: dts: renesas: r8a77961: Add USB2.0 device nodes
      arm64: dts: renesas: r8a77961: Add USB3.0 device nodes
      arm64: dts: renesas: r8a77961: Add PWM device nodes
      arm64: dts: renesas: r8a77961: Add PCIe device nodes
      ARM: dts: renesas: Fix IOMMU device node names
      arm64: dts: renesas: Fix IOMMU device node names

 arch/arm/boot/dts/r8a7740.dtsi            |   2 +-
 arch/arm/boot/dts/r8a7743.dtsi            |  12 +-
 arch/arm/boot/dts/r8a7744.dtsi            |  12 +-
 arch/arm/boot/dts/r8a7745.dtsi            |  12 +-
 arch/arm/boot/dts/r8a7790.dtsi            |  12 +-
 arch/arm/boot/dts/r8a7791.dtsi            |  95 ++++++-
 arch/arm/boot/dts/r8a7793.dtsi            |  14 +-
 arch/arm/boot/dts/r8a7794.dtsi            |  12 +-
 arch/arm/boot/dts/sh73a0.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi |  18 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi |  18 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi |  18 +-
 arch/arm64/boot/dts/renesas/r8a77950.dtsi |  14 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi |  34 +--
 arch/arm64/boot/dts/renesas/r8a77960.dtsi |  22 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 403 ++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi |  20 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi |  10 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi |  16 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |  20 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi |  20 +-
 21 files changed, 620 insertions(+), 166 deletions(-)
