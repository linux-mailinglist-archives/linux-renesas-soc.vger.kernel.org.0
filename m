Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC33E4E2D0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfFUJNw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:13:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33852 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfFUJNw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:13:52 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 793DC25AEE7;
        Fri, 21 Jun 2019 19:13:50 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 870C69408C4; Fri, 21 Jun 2019 11:13:48 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     arm@kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [GIT PULL] Renesas ARM Based SoC DT Updates for v5.3
Date:   Fri, 21 Jun 2019 11:13:44 +0200
Message-Id: <cover.1561104194.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Olof, Hi Kevin, Hi Arnd,

Please consider these Renesas ARM based SoC DT updates for v5.3.


The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm-dt-for-v5.3

for you to fetch changes up to 9dd6f7c484fd2aaa468dfdf5087425ea9e4c7bf8:

  ARM: dts: r8a7792: Add CMT0 and CMT1 to r8a7792 (2019-06-21 09:45:37 +0200)

----------------------------------------------------------------
Renesas ARM Based SoC DT Updates for v5.3

* Renesas SoC based boards
  - Use ip=on for bootargs

* Renesas R-Car Gen 2 SOC based boards
  - Configure PMIC IRQ pinmux

* R-Car V2H (r8a7792) SoC
  - Describe CMT devices in DT

* RZ/G1C (r8a77470) based iWave SBC (iwg23s-sbc) and
  RZ/G1N (r8a7744) based boards:
  - Correct SDHI2 VccQ regulator to fix SDR50 mode

* RZ/A2M (r7s9210) based rza2mevb EVB
  RZ/A1H (r7s72100) based rskrza1 board
  - Describe input switch in DT

* RZ/A2M (r7s9210) based rza2mevb EVB
  - Sort nodes to ease future maintenance
  - Add USB host, Ethernet and SDHI support

* RZ/A2M (r7s9210) and RZ/A1H (r7s72100) SoCs
  - Describe IRQC device in DT

----------------------------------------------------------------
Chris Brandt (14):
      ARM: dts: r7s9210: Add RSPI
      ARM: dts: r7s9210: Add Ethernet support
      ARM: dts: r7s9210: Add RIIC support
      ARM: dts: r7s9210: Add SDHI support
      ARM: dts: rza2mevb: Add Ethernet support
      ARM: dts: rza2mevb: Add SDHI support
      ARM: dts: rza2mevb: add ethernet aliases
      ARM: dts: r7s9210: Add USB clock
      ARM: dts: rza2mevb: Add 48MHz USB clock
      ARM: dts: r7s9210: Add USB Host support
      ARM: dts: r7s9210: Add USB Device support
      ARM: dts: rza2mevb: Add USB Host support
      ARM: dts: r7s9210: Add IRQC device node
      ARM: dts: rza2mevb: Add input switch

Fabrizio Castro (2):
      ARM: dts: iwg20d-q7-common: Fix SDHI1 VccQ regularor
      ARM: dts: iwg23s-sbc: Fix SDHI2 VccQ regulator

Geert Uytterhoeven (2):
      ARM: dts: r7s72100: Add IRQC device node
      ARM: dts: rskrza1: Add input switches

Magnus Damm (2):
      ARM: dts: renesas: Use ip=on for bootargs
      ARM: dts: r8a7792: Add CMT0 and CMT1 to r8a7792

Marek Vasut (1):
      ARM: dts: r8a779x: Configure PMIC IRQ pinmux

Yoshihiro Kaneko (1):
      ARM: dts: rza2mevb: sort nodes of rza2mevb board

 arch/arm/boot/dts/emev2-kzm9d.dts             |   2 +-
 arch/arm/boot/dts/iwg20d-q7-common.dtsi       |   2 +-
 arch/arm/boot/dts/r7s72100-genmai.dts         |   2 +-
 arch/arm/boot/dts/r7s72100-rskrza1.dts        |  38 ++++
 arch/arm/boot/dts/r7s72100.dtsi               |  19 ++
 arch/arm/boot/dts/r7s9210-rza2mevb.dts        | 161 +++++++++++++--
 arch/arm/boot/dts/r7s9210.dtsi                | 286 ++++++++++++++++++++++++++
 arch/arm/boot/dts/r8a73a4-ape6evm.dts         |   2 +-
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts |   2 +-
 arch/arm/boot/dts/r8a7743-sk-rzg1m.dts        |   2 +-
 arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dts   |   2 +-
 arch/arm/boot/dts/r8a7745-sk-rzg1e.dts        |   2 +-
 arch/arm/boot/dts/r8a77470-iwg23s-sbc.dts     |   4 +-
 arch/arm/boot/dts/r8a7778-bockw.dts           |   2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts          |   2 +-
 arch/arm/boot/dts/r8a7790-lager.dts           |   9 +-
 arch/arm/boot/dts/r8a7790-stout.dts           |   9 +-
 arch/arm/boot/dts/r8a7791-koelsch.dts         |   9 +-
 arch/arm/boot/dts/r8a7791-porter.dts          |   9 +-
 arch/arm/boot/dts/r8a7792-blanche.dts         |   9 +-
 arch/arm/boot/dts/r8a7792-wheat.dts           |   2 +-
 arch/arm/boot/dts/r8a7792.dtsi                |  34 +++
 arch/arm/boot/dts/r8a7793-gose.dts            |   9 +-
 arch/arm/boot/dts/r8a7794-alt.dts             |   2 +-
 arch/arm/boot/dts/r8a7794-silk.dts            |   2 +-
 arch/arm/boot/dts/sh73a0-kzm9g.dts            |   2 +-
 26 files changed, 589 insertions(+), 35 deletions(-)
