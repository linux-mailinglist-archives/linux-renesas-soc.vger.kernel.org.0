Return-Path: <linux-renesas-soc+bounces-21812-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E76B54AC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 13:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10CB05A0DD3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 11:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4942FF642;
	Fri, 12 Sep 2025 11:14:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9C2E9EC4;
	Fri, 12 Sep 2025 11:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675646; cv=none; b=Od+MuzzZNWee49m1YQPqzzNqTm+pk1ebdea+U9lcGuCJ1gP4/48IO2FxxrErn6jaQ344X9jZe4mNPBadxdZNIOCVdYzbZWfZDUwLW1r7stMK3Jg2k3xBCb3w6hnHIa5hnWyIeGUCN68qQ7GiMsH6TgYVUjAZNX1gi1WoEXme7HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675646; c=relaxed/simple;
	bh=CrE8JRdZdxyllrbuaoGhLJdcgGcS8BG05DpryNSk3Vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EOZQ/7w4JAS/iWujXZenVYsmPajjRL0ntgg3s1al0dN0bdUy8D17lSefs8zDUKmWP12Qk+CKdo1oyQkOhUlkIH5cgGVm9K0I9vE3J3hvmpmh3MyuOYLeidKefxkPylQt51JqaqpV08LoTU+ofa0wDPHked+7p1/nlbw/G1LRtzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5570FC4CEF7;
	Fri, 12 Sep 2025 11:14:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:13:53 +0200
Message-ID: <cover.1757669917.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
References: <cover.1757669912.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 115b557b6f61ca279a4754b20b8686039fdb5234:

  arm64: dts: renesas: Minor whitespace cleanup (2025-08-20 09:07:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.18-tag2

for you to fetch changes up to 5bf682d9747277a0190e82e5ae6f9e201ce002d9:

  arm64: dts: renesas: sparrow-hawk-fan-pwm: Rework hwmon comment (2025-09-12 11:15:00 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.18 (take two)

  - Add pin control and I2C support for the RZ/N2H SoC and its
    evaluation board,
  - Add LED, EEPROM, eMMC, SD card, watchdog, and USB2.0 support for the
    RZ/T2H and RZ/N2H SoCs and their evaluation boards,
  - Add I3C support for the RZ/V2H and RZ/V2N SoCs,
  - Add IMX219 and IMX462 camera overlay support for the Sparrow Hawk
    board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control node
      arm64: dts: renesas: r9a09g047e57-smarc: Use Schmitt input for NMI function

John Madieu (1):
      arm64: dts: renesas: r9a09g047: Enable Tx coe support

Lad Prabhakar (17):
      arm64: dts: renesas: r9a09g087: Add pinctrl node
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
      arm64: dts: renesas: rzt2h-n2h-evk-common: Add pinctrl for SCI0 node
      arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1 support
      arm64: dts: renesas: rzt2h-n2h-evk-common: Enable EEPROM on I2C0
      arm64: dts: renesas: rzt2h-rzn2h-evk: Enable eMMC
      arm64: dts: renesas: rzt2h-rzn2h-evk: Enable MicroSD card slot
      arm64: dts: renesas: rzt2h-rzn2h-evk: Enable SD card slot
      arm64: dts: renesas: r9a09g077: Add WDT nodes
      arm64: dts: renesas: r9a09g087: Add WDT nodes
      arm64: dts: renesas: rzt2h-n2h-evk-common: Enable WDT2
      arm64: dts: renesas: r9a09g077: Add USB2.0 support
      arm64: dts: renesas: r9a09g087: Add USB2.0 support
      arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
      arm64: dts: renesas: r9a09g057: Add I3C node
      arm64: dts: renesas: r9a09g056: Add I3C node

Marek Vasut (2):
      arm64: dts: renesas: rcar: Rename dsi-encoder to dsi
      arm64: dts: renesas: sparrow-hawk-fan-pwm: Rework hwmon comment

Niklas Söderlund (4):
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

 arch/arm64/boot/dts/renesas/Makefile               |  12 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   4 +-
 .../r8a779g3-sparrow-hawk-camera-j1-imx219.dtso    | 116 +++++++++++
 .../r8a779g3-sparrow-hawk-camera-j1-imx462.dtso    | 117 +++++++++++
 .../r8a779g3-sparrow-hawk-camera-j2-imx219.dtso    | 116 +++++++++++
 .../r8a779g3-sparrow-hawk-camera-j2-imx462.dtso    | 117 +++++++++++
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso |  15 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  10 +-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |   7 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  33 ++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  33 ++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 107 ++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 136 ++++++++++++-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 120 +++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 213 ++++++++++++++++++++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     | 220 +++++++++++++++++++++
 18 files changed, 1356 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

