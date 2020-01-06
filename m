Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCB81310C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2020 11:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgAFKtL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jan 2020 05:49:11 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:57874 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgAFKtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 05:49:11 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id myp52100S5USYZQ06yp5RR; Mon, 06 Jan 2020 11:49:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0001yi-LC; Mon, 06 Jan 2020 11:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0002Bt-KK; Mon, 06 Jan 2020 11:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/5] Renesas ARM DT updates for v5.6
Date:   Mon,  6 Jan 2020 11:48:54 +0100
Message-Id: <20200106104857.8361-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106104857.8361-1-geert+renesas@glider.be>
References: <20200106104857.8361-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.6-tag1

for you to fetch changes up to fe4a76fafdb4d072e0842d55cccfa141a1912457:

  ARM: dts: sh73a0: Add missing clock-frequency for fixed clocks (2019-12-31 10:33:41 +0100)

----------------------------------------------------------------
Renesas ARM DT updates for v5.6

  - Touch screen support for the iwg20d board,
  - ARM global timer support on Cortex-A9 MPCore SoCs,
  - Miscellaneous fixes for issues detected by "make dtbs_check".

----------------------------------------------------------------
Fabrizio Castro (1):
      ARM: dts: iwg20d-q7-common: Add LCD support

Geert Uytterhoeven (10):
      ARM: dts: sh73a0: Rename twd clock to periph clock
      ARM: dts: sh73a0: Add device node for ARM global timer
      ARM: dts: r8a7779: Add device node for ARM global timer
      ARM: dts: renesas: Group tuples in regulator-gpio states properties
      ARM: dts: renesas: Group tuples in interrupt properties
      ARM: dts: renesas: Group tuples in pci ranges and dma-ranges properties
      ARM: dts: rcar-gen2: Fix PCI high address in interrupt-map-mask
      ARM: dts: rcar-gen2: Add missing mmio-sram bus properties
      ARM: dts: r8a7778: Add missing clock-frequency for fixed clocks
      ARM: dts: sh73a0: Add missing clock-frequency for fixed clocks

 arch/arm/boot/dts/iwg20d-q7-common.dtsi       |  88 +++++++++++++-
 arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi      |   1 -
 arch/arm/boot/dts/r7s72100.dtsi               |  18 +--
 arch/arm/boot/dts/r8a73a4.dtsi                |  42 +++----
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts |   3 +-
 arch/arm/boot/dts/r8a7740.dtsi                | 102 ++++++++--------
 arch/arm/boot/dts/r8a7743.dtsi                | 162 +++++++++++++------------
 arch/arm/boot/dts/r8a7744.dtsi                | 162 +++++++++++++------------
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts   |   3 +-
 arch/arm/boot/dts/r8a7745.dtsi                | 122 ++++++++++---------
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts     |   3 +-
 arch/arm/boot/dts/r8a77470.dtsi               |  86 +++++++------
 arch/arm/boot/dts/r8a7778.dtsi                |  11 +-
 arch/arm/boot/dts/r8a7779-marzen.dts          |   3 +-
 arch/arm/boot/dts/r8a7779.dtsi                |  16 ++-
 arch/arm/boot/dts/r8a7790-lager.dts           |   6 +-
 arch/arm/boot/dts/r8a7790.dtsi                | 167 +++++++++++++-------------
 arch/arm/boot/dts/r8a7791-koelsch.dts         |   9 +-
 arch/arm/boot/dts/r8a7791-porter.dts          |   6 +-
 arch/arm/boot/dts/r8a7791.dtsi                | 159 ++++++++++++------------
 arch/arm/boot/dts/r8a7792.dtsi                |  67 ++++++-----
 arch/arm/boot/dts/r8a7793-gose.dts            |   9 +-
 arch/arm/boot/dts/r8a7793.dtsi                | 123 ++++++++++---------
 arch/arm/boot/dts/r8a7794-alt.dts             |   6 +-
 arch/arm/boot/dts/r8a7794-silk.dts            |   3 +-
 arch/arm/boot/dts/r8a7794.dtsi                | 111 ++++++++---------
 arch/arm/boot/dts/sh73a0.dtsi                 | 139 +++++++++++----------
 27 files changed, 878 insertions(+), 749 deletions(-)
