Return-Path: <linux-renesas-soc+bounces-26301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 533D9CF4B8C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD7FF3174439
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6FCD34DB7A;
	Mon,  5 Jan 2026 15:57:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB8734DB74;
	Mon,  5 Jan 2026 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628675; cv=none; b=mm/Ie/v2S6mKC2uxqHFmilzho1zrbZjGS69kjyUSMorYzvnjFliqdoIjQP+4JXEH/aWTX9sYBP8sNUyBdJWXPCmZeoFtpjxi0PvvFfsDSQxpugBDbVIXG787LP7hUBZsMpLJNgYb49XQY217posNtx2skA3nSxnCNXDT5i6RYeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628675; c=relaxed/simple;
	bh=th41lpA3q84OT8e4TYF3svkwAAI85Dp6YdYBxW8eUV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXXbeW1TdHK+9BSJohjknPktZ4vg0seRDOlnk3sSD2eU5RO/2PSNOqzv/krMaGhcfI49p7WB4n7yZj9zcwXuwAot/m95HqkCjF6p86jmA4FtJcX0ipsQrNbRXIsOAvn/FVOt8KMX7CcsoMi+WI8FO7By+kbX3LBZzuzX6zDl1KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC73C19421;
	Mon,  5 Jan 2026 15:57:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.20
Date: Mon,  5 Jan 2026 16:57:40 +0100
Message-ID: <cover.1767628169.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
References: <cover.1767628163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.20-tag1

for you to fetch changes up to aca3bbde0fdb263081b5ff1e60f066704dd1a19e:

  arm64: dts: renesas: r8a779h0: Add WWDT nodes (2026-01-05 14:37:18 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.20

  - Add USB3.2 host and more RSCI serial support for the RZ/G3E SoC and
    the RZ/G3E SMARC EVK board,
  - Add display and USB3.0 host support for the RZ/V2H and RZ/V2N SoCs
    and their EVK boards,
  - Add SPI NOR Flash support for the Yuridenki-Shokai Kakip board,
  - Add PCIe support for the RZ/G3S SoC and the RZ/G3S SMARC EVK board,
  - Add SPI, interrupt controller, and DMAC support for the RZ/T2H,
    RZ/N2H, and RZ/V2N SoCs,
  - Add NMI wakeup button support for the RZ/V2N EVK board,
  - Add thermal support for the RZ/V2N SoC,
  - Add system watchdog timer support for R-Car V3H, which is reserved
    for secure firmware,
  - Add window watchdog timer support for R-Car V3M, V3H, and Gen4 SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (5):
      arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
      arm64: dts: renesas: r9a09g047: Add RSCI nodes
      arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
      arm64: dts: renesas: r9a09g047e57-smarc: Enable rsci{2,4,9} nodes

Claudiu Beznea (3):
      arm64: dts: renesas: r9a08g045: Add PCIe node
      arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
      arm64: dts: renesas: rzg3s-smarc: Enable PCIe

Cosmin Tanislav (7):
      arm64: dts: renesas: rzt2h-n2h-evk: Add note about SD1 1.8V modes
      arm64: dts: renesas: r9a09g077: Add SPI nodes
      arm64: dts: renesas: r9a09g087: Add SPI nodes
      arm64: dts: renesas: r9a09g077: Add ICU support
      arm64: dts: renesas: r9a09g087: Add ICU support
      arm64: dts: renesas: r9a09g077: Add DMAC support
      arm64: dts: renesas: r9a09g087: Add DMAC support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r9a09g047e57-smarc: Remove duplicate SW_LCD_EN
      ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts

Lad Prabhakar (14):
      arm64: dts: renesas: r9a09g057: Add FCPV and VSPD nodes
      arm64: dts: renesas: r9a09g057: Add DU and DSI nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable DU and DSI
      arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
      arm64: dts: renesas: r9a09g056: Add DU and DSI nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable DU and DSI
      arm64: dts: renesas: r9a09g057: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB3.0 PHYs and xHCI controllers
      arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and xHCI controller
      arm64: dts: renesas: r9a09g056: Add ICU node
      arm64: dts: renesas: r9a09g056: Add DMAC nodes
      arm64: dts: renesas: r9a09g056: Add RSPI nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI wakeup button support

Nobuhiro Iwamatsu (1):
      arm64: dts: renesas: r9a09g057h48-kakip: Enable SPI NOR Flash

Ovidiu Panait (1):
      arm64: dts: renesas: r9a09g056: Add TSU nodes

Wolfram Sang (8):
      arm64: dts: renesas: r8a77980: Add SWDT node
      arm64: dts: renesas: condor/v3hsk: Mark SWDT as reserved
      arm64: dts: renesas: r8a77970: Add WWDT nodes
      arm64: dts: renesas: r8a77980: Add WWDT nodes
      arm64: dts: renesas: r8a779a0: Add WWDT nodes
      arm64: dts: renesas: r8a779f0: Add WWDT nodes
      arm64: dts: renesas: r8a779g0: Add WWDT nodes
      arm64: dts: renesas: r8a779h0: Add WWDT nodes

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   6 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  32 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   5 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  89 ++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 160 +++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 160 +++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 112 +++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 112 +++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  65 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 250 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  75 ++-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 514 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  97 ++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 149 ++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 101 ++++
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |  39 ++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 235 ++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |   3 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 235 ++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |   3 +
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  21 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   4 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  11 +
 25 files changed, 2481 insertions(+), 7 deletions(-)

