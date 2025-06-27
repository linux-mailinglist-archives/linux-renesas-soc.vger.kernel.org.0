Return-Path: <linux-renesas-soc+bounces-18838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D827AEB7E4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 931EB1C235A1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AF7A2D3EE3;
	Fri, 27 Jun 2025 12:40:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D92676D9;
	Fri, 27 Jun 2025 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028031; cv=none; b=c92HBL+2vyWlCrajhsLLrJY7V12PIQxhboQl/f6pry7h5cnVnAq/GH+VudEECBae5z0kakRysnJVh9a2vy4XQrP5wm+CZO/rHvryeSdqxjPncCyymXPHbsmBafzm48ODXBHeEFZWPYLvaCswV41rPAjKLLawcWI6QwBRyBD1vyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028031; c=relaxed/simple;
	bh=PW1d7Rduf/cJX7ixCm/cZskHw7eA8WKCfp46/MG+gcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NyyyywVX4vWU79vgdmeITTdeofClY97p/CxIPnPnNS83hd494dukVjSC34NHftGBAdu7jbRZZKtgYzmRoNhNR0WMqWD6CuNsyZO00gcpw5i7CNaVjkt0UpKSC7aBtDDmanlY0nTzupiSwGqpeUqSoV1S35BmYZdVk2l9NBPoRMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD3AC4CEED;
	Fri, 27 Jun 2025 12:40:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.17
Date: Fri, 27 Jun 2025 14:40:19 +0200
Message-ID: <cover.1751026664.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.17-tag1

for you to fetch changes up to 41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f:

  arm64: dts: renesas: r9a09g047: Add GBETH nodes (2025-06-26 16:37:21 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.17

  - Add SPI FLASH, camera, and Ethernet support on the RZ/G3E SoC and/or
    the RZ/G3E SoM and SMARC Carrier-II EVK development board,
  - Add Ethernet, USB2, and PMIC support on the RZ/V2H and RZ/V2N SoCs
    and EVK boards,
  - Add timer, I2C, watchdog, and GPU support on the RZ/V2N SoC and the
    RZ/V2N EVK board,
  - Add debug LED support for the RZN1D-DB development board,
  - Improve PCIe clock description on the Retronix Sparrow Hawk board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g047: Add XSPI node
      arm64: dts: renesas: rzg3e-smarc-som: Enable serial NOR FLASH

Geert Uytterhoeven (2):
      arm64: dts: renesas: ebisu: Add CAN0 support
      Merge branch 'pwrctrl' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci into renesas-dts-for-v6.17

John Madieu (1):
      arm64: dts: renesas: r9a09g047: Add GBETH nodes

Lad Prabhakar (19):
      arm64: dts: renesas: r9a09g057: Add GBETH nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH
      arm64: dts: renesas: r9a09g056: Add GBETH nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
      arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable OSTM timers on RZ/V2N EVK
      arm64: dts: renesas: r9a09g056: Add RIIC controllers
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RIIC controllers
      arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
      arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable Mali-G31 GPU
      arm64: dts: renesas: r9a09g057: Add USB2.0 support
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support
      arm64: dts: renesas: r9a09g056: Add USB2.0 support
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2.0 support
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add RAA215300 PMIC
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add RAA215300 PMIC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Rename fixed regulator node names

Marek Vasut (5):
      PCI/pwrctrl: Add optional slot clock for PCI slots
      arm64: dts: renesas: r8a779g3-sparrow-hawk: Sort DTS
      arm64: dts: renesas: r8a779g0: Describe PCIe root ports
      arm64: dts: renesas: sparrow-hawk: Describe split PCIe clock
      arm64: dts: renesas: rcar-gen3: Add bootph-all to sysinfo EEPROMs

Tommaso Merciai (4):
      arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Add I2C0 pincontrol
      arm64: dts: renesas: renesas-smarc2: Enable I2C0 node
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU, CSI support

Wolfram Sang (2):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe debug LEDs
      ARM: dts: renesas: r9a06g032: Add second clock input to RTC

 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  64 +++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   4 +-
 arch/arm64/boot/dts/renesas/Makefile               |   3 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   2 +
 arch/arm64/boot/dts/renesas/draak.dtsi             |   2 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  16 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  20 +
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |  57 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 299 ++++++++++
 .../renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso |  21 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  10 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 635 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 262 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 322 +++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 150 ++++-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   6 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  46 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 drivers/pci/pwrctrl/slot.c                         |   8 +
 20 files changed, 1912 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso

