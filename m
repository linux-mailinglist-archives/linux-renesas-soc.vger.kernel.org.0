Return-Path: <linux-renesas-soc+bounces-505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EB682800ADE
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 13:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289BE1C20A5C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 12:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A585124B58;
	Fri,  1 Dec 2023 12:28:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34287D48
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 04:28:35 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:7f2e:4977:a943:cc87])
	by baptiste.telenet-ops.be with bizsmtp
	id H0UU2B00W0rKVV8010UUHC; Fri, 01 Dec 2023 13:28:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92cr-00ARcF-Tk;
	Fri, 01 Dec 2023 13:28:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r92dA-00CVD5-KM;
	Fri, 01 Dec 2023 13:28:28 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.8
Date: Fri,  1 Dec 2023 13:28:17 +0100
Message-Id: <cover.1701433489.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701433485.git.geert+renesas@glider.be>
References: <cover.1701433485.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.8-tag1

for you to fetch changes up to 95d516f3eb96bac466a6bfec28a1e55b8ed5160b:

  ARM: dts: renesas: r9a06g032: Add missing space in compatible (2023-11-28 10:29:11 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.8

  - Add FLASH support for the Renesas Marzen and Blanche development
    boards,
  - Add 4-bit TX support for the QSPI FLASHes on the RZ/G2L, RZ/G2LC,
    and RZ/V2L SMARC SoMs,
  - Add SDHI support for the RZ/G3S SMARC development kit,
  - Add LCD support for the Atmark Techno Armadillo-800-EVA development
    board, which requires switching from the legacy frame buffer device
    driver to the DRM driver,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: rzg2l-smarc-som: Enable 4-bit tx support
      arm64: dts: renesas: rzg2lc-smarc-som: Enable 4-bit tx support

Claudiu Beznea (2):
      arm64: dts: renesas: rzg3s-smarc-som: Enable SDHI2
      arm64: dts: renesas: rzg3s-smarc: Enable SDHI1

Conor Dooley (1):
      riscv: dts: renesas: Convert isa detection to new properties

Geert Uytterhoeven (10):
      ARM: dts: renesas: marzen: Add FLASH node
      ARM: dts: renesas: blanche: Add FLASH node
      ARM: dts: renesas: rcar-gen2: Fix I2C bus demux node names
      ARM: dts: renesas: Add missing ADV751[13] power supply properties
      arm64: dts: renesas: Add missing ADV751[13] power supply properties
      ARM: dts: renesas: iwg22d-sodimm: Fix stmpe node names
      ARM: dts: renesas: marzen: Rename keyboard nodes
      ARM: shmobile: defconfig: Switch to DRM_SHMOBILE
      ARM: dts: renesas: r8a7740: Add LCDC nodes
      ARM: dts: renesas: armadillo800eva: Add LCD panel

Niklas Söderlund (4):
      arm64: dts: renesas: draak: Make HDMI the default video input
      arm64: dts: renesas: draak: Move HDMI bus properties to correct node
      arm64: dts: renesas: r9a09g011: Add missing space in compatible
      ARM: dts: renesas: r9a06g032: Add missing space in compatible

 arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi   | 15 +++++
 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   | 28 +++++++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi             | 65 ++++++++++++++++++++++
 .../dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts  | 15 +++++
 .../arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts |  4 +-
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts       | 48 +++++++++++++---
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        | 23 ++++++--
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        | 15 +++++
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      | 30 +++++++++-
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       | 26 ++++++++-
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts      | 49 ++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts        | 21 +++++++
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         | 28 +++++++++-
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |  4 +-
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         | 17 +++++-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  2 +-
 arch/arm/configs/shmobile_defconfig                |  5 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             | 32 ++++++-----
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  6 ++
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     | 15 +++++
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  2 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  1 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  1 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   | 49 ++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       | 65 ++++++++++++++++++++++
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        |  4 ++
 26 files changed, 528 insertions(+), 42 deletions(-)

