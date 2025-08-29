Return-Path: <linux-renesas-soc+bounces-21079-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F501B3BAFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9ABC1C8265D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF5C313537;
	Fri, 29 Aug 2025 12:18:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64135298CC4;
	Fri, 29 Aug 2025 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469910; cv=none; b=uOo9MGhwko4msxW6B0lp+r3+pyrQkRe1GJo7l+NhvJ3NkeFao603zSDbJzbeeO3PG+FT+02pqxfdrX5wuWXHk7UNqyOrKlD78XIsjMMCuTS5PJXuV73nDrXjfuk1a8SwrPvyTdM/PlOic3CEo/lzUPo5Vtw5w89fAdrvWvkZAcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469910; c=relaxed/simple;
	bh=3T5a1M4CafKehoG6JBvA2rX4uqymqtaD5IqtUyLlklU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tW2EQnDSbzQvY9tdAewxLT560s7UDDmKnXWdNEeH5pE9YZoXk6MDayZQWcQt6fvO7GdZGVIdbvfYsJx/o9D0QP8+svLXzQLH/BEchERCRDnLmscGUIX2UPGdhMJc083sdgu5vcuykY+cbpy/Gf8S19IxwkLs4uWj7yURZBkdvlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B54C4CEF0;
	Fri, 29 Aug 2025 12:18:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.18
Date: Fri, 29 Aug 2025 14:18:15 +0200
Message-ID: <cover.1756468048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756468041.git.geert+renesas@glider.be>
References: <cover.1756468041.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.18-tag1

for you to fetch changes up to 115b557b6f61ca279a4754b20b8686039fdb5234:

  arm64: dts: renesas: Minor whitespace cleanup (2025-08-20 09:07:05 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.18

  - Add initial support for the RZ/T2H (R9A09G077) and RZ/N2H
    (R9A09G087) SoCs and their evaluation boards,
  - Add SPI support for the RZ/V2H SoC,
  - Add DMAC and I3C support for the RZ/G3E SoC,
  - Add I3C support for the RZ/G3S SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD channel0

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g057: Add RSPI nodes

Geert Uytterhoeven (5):
      arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced article
      ARM: dts: renesas: porter: Fix CAN pin group
      arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
      arm64: dts: renesas: rzg2: Increase CANFD clock rates
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag3' into renesas-dts-for-v6.18

Krzysztof Kozlowski (1):
      arm64: dts: renesas: Minor whitespace cleanup

Lad Prabhakar (10):
      arm64: dts: renesas: Add initial SoC DTSI for the RZ/N2H SoC
      dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
      dt-bindings: pinctrl: renesas: Document RZ/T2H and RZ/N2H SoCs
      arm64: dts: renesas: r9a09g077: Add I2C controller nodes
      arm64: dts: renesas: r9a09g087: Add I2C controller nodes
      arm64: dts: renesas: r9a09g077: Add SDHI nodes
      arm64: dts: renesas: r9a09g087: Add SDHI nodes
      arm64: dts: renesas: r9a09g077: Add DT nodes for SCI channels 1-5
      arm64: dts: renesas: r9a09g087: Add DT nodes for SCI channels 1-5
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable I2C0 and I2C1 support

Marek Vasut (5):
      arm64: dts: renesas: sparrow-hawk: Describe generic SPI NOR support
      ARM: dts: renesas: r7s72100: Add boot phase tags
      arm64: dts: renesas: sparrow-hawk: Update thermal trip points
      arm64: dts: renesas: sparrow-hawk: Invert microSD voltage selector on EVTB1
      arm64: dts: renesas: sparrow-hawk: Set VDDQ18_25_AVB voltage on EVTB1

Paul Barker (3):
      arm64: dts: renesas: Refactor RZ/T2H EVK device tree
      arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H
      arm64: dts: renesas: Add initial support for the RZ/N2H EVK

Quynh Nguyen (1):
      arm64: dts: renesas: r9a08g045: Add I3C node

Thierry Bultel (3):
      arm64: dts: renesas: Add initial support for the Renesas RZ/T2H SoC
      arm64: dts: renesas: Add initial support for the Renesas RZ/T2H eval board
      arm64: dts: renesas: r9a09g077: Add pinctrl node

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add DMAC nodes
      arm64: dts: renesas: r9a09g047: Add I3C node

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         | 172 ++++++++++++
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |   4 +-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts    |   4 +-
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |   3 +
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   3 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |   2 +-
 arch/arm64/boot/dts/renesas/Makefile               |   4 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   2 +-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 149 ++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  36 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 205 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  16 +-
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  79 +++++-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |   4 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 292 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  52 ++++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 279 ++++++++++++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  16 ++
 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |   5 +-
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  26 ++
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   1 +
 .../pinctrl/renesas,r9a09g077-pinctrl.h            |  22 ++
 37 files changed, 1390 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

