Return-Path: <linux-renesas-soc+bounces-9841-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8DD9A3DCC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 14:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E02E1C20D11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Oct 2024 12:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A953511CA9;
	Fri, 18 Oct 2024 12:05:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F22D530
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 12:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253125; cv=none; b=HUh8w6jkjTucUsrl2Q3PQf3+xGRMioWUI3G4iFxMNZRDPtb6kRqNI15UPgFRkiuhgKnc6/r9WjB67Vas+tkl7Ifh0jSRxCs5d//6RTDNduxX+MyuW7VEZP/y2Zzhf5wr6jTWx2ePq4wRdVn73dJISnTlL76EYtsjX1eSxQlkwfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253125; c=relaxed/simple;
	bh=zdaEqqHPPeOo/0t0n/PB/TQ/aDe31pJ6VItsmuRPVDM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rCqKPZUJMNo5wRMax3ny24wey7sQUw/m28FqIaAlYXepOmS6ZLjdwaE7ig4HjayfkGqOIIlSwhQjDonT2AzyDB6GA1ZYc68eSC4nu4d3PK+nZpikSWNKgVa8vqz05MM/0MFNoJnEvf63sK4e1mza2ujDCRp8gAZIihp5ULIDDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by andre.telenet-ops.be with cmsmtp
	id Ro5E2D00G1MdCM201o5E0M; Fri, 18 Oct 2024 14:05:15 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1lj1-003zSJ-Fz;
	Fri, 18 Oct 2024 14:05:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1ljG-005ssf-FQ;
	Fri, 18 Oct 2024 14:05:14 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.13
Date: Fri, 18 Oct 2024 14:05:07 +0200
Message-Id: <cover.1729252769.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.13-tag1

for you to fetch changes up to 1e03bd2cf0d68a4138f2347bd77ef12b8726d214:

  arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys (2024-10-14 10:16:17 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.13

  - Add support for PCIe on the R-Car V4M SoC and the Gray Hawk
    development board,
  - Add support for watchdog, OS timer, keyboard switch, SDHI, and MMCIF
    on the Genmai development board,
  - Add support for watchdog on the RSK+RZA1 development board,
  - Add support for QSPI NOR FLASH on the RZ/G2UL SMARC SoM,
  - Add support for E-FUSE on the R-Car V3U, S4-8, V4H, and V4M SoCs,
  - Use interrupts-extended where it makes sense,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: rzg2ul-smarc-som: Enable serial NOR flash
      arm64: dts: renesas: rz{g2l,g2lc}-smarc-som: Update partition table for spi-nor flash

Geert Uytterhoeven (28):
      arm64: dts: renesas: rcar-gen4: Switch PCIe to reset-gpios
      ARM: dts: renesas: rskrza1: Enable watchdog timer
      arm64: dts: renesas: beacon-renesom: Switch to mic-det-gpios
      ARM: dts: renesas: rcar-gen2: Switch HS-USB to renesas,enable-gpios
      arm64: dts: renesas: r8a779a0: Add E-FUSE node
      arm64: dts: renesas: r8a779f0: Add E-FUSE node
      arm64: dts: renesas: r8a779g0: Add OTP_MEM node
      arm64: dts: renesas: r8a779h0: Add OTP_MEM node
      ARM: dts: renesas: Use interrupts-extended for Ethernet MACs
      ARM: dts: renesas: Use interrupts-extended for Ethernet PHYs
      ARM: dts: renesas: Use interrupts-extended for HDMI bridges
      ARM: dts: renesas: Use interrupts-extended for PMICs
      ARM: dts: renesas: Use interrupts-extended for touchpanels
      ARM: dts: renesas: Use interrupts-extended for video decoders
      ARM: dts: renesas: iwg22d-sodimm: Use interrupts-extended for port expander
      ARM: dts: renesas: r8a7742-iwg21m: Use interrupts-extended for RTC
      ARM: dts: renesas: kzm9g: Use interrupts-extended for I/O expander
      ARM: dts: renesas: kzm9g: Use interrupts-extended for sensors
      arm64: dts: renesas: Use interrupts-extended for DisplayPort bridges
      arm64: dts: renesas: Use interrupts-extended for Ethernet PHYs
      arm64: dts: renesas: Use interrupts-extended for HDMI bridges
      arm64: dts: renesas: Use interrupts-extended for I/O expanders
      arm64: dts: renesas: Use interrupts-extended for PMICs
      arm64: dts: renesas: Use interrupts-extended for USB muxes
      arm64: dts: renesas: Use interrupts-extended for video decoders
      arm64: dts: renesas: Use interrupts-extended for WLAN
      arm64: dts: renesas: beacon-renesom: Use interrupts-extended for touchscreen
      arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys

Sean Anderson (5):
      arm64: dts: renesas: salvator-xs: Add SD/OE pin properties
      arm64: dts: renesas: ulcb: Add SD/OE pin properties
      arm64: dts: renesas: salvator-x: Add SD/OE pin properties
      arm64: dts: renesas: hihope: Add SD/OE pin properties
      arm64: dts: renesas: beacon: Add SD/OE pin properties

Wolfram Sang (16):
      ARM: dts: renesas: genmai: Fix partition size for QSPI NOR Flash
      ARM: dts: renesas: genmai: Enable watchdog
      ARM: dts: renesas: genmai: Enable OS timer modules
      ARM: dts: renesas: genmai: Sort nodes
      ARM: dts: renesas: genmai: Define keyboard switch
      ARM: dts: renesas: Genmai: Update audio codec device node
      ARM: dts: renesas: Remove 'reg-io-width' properties from MMCIF nodes
      ARM: dts: renesas: marzen: Use interrupts-extended for gpio-keys
      ARM: dts: renesas: rskrza1: Use interrupts-extended for gpio-keys
      ARM: dts: renesas: rza2mevb: Use interrupts-extended for gpio-keys
      ARM: dts: renesas: Add proper node names to (L)BSC devices
      ARM: dts: renesas: r8a7778: Rename 'bsc' to 'lbsc'
      ARM: dts: renesas: Use proper node names for keys
      ARM: dts: renesas: r7s72100: 'bus-width' is a board property
      ARM: dts: renesas: genmai: Enable SDHI0
      ARM: dts: renesas: genmai: Enable MMCIF

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779h0: Add PCIe Host and Endpoint nodes
      arm64: dts: renesas: r8a779h0: gray-hawk-single: Enable PCIe Host

 arch/arm/boot/dts/renesas/emev2-kzm9d.dts          |  11 +-
 arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi    |   3 +-
 arch/arm/boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi   |   3 +-
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      | 199 +++++++++++++++------
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |  14 +-
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   4 +-
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts      |   3 +-
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             |   2 -
 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |   3 +-
 arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts    |   3 +-
 arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi      |   3 +-
 arch/arm/boot/dts/renesas/r8a7742.dtsi             |   2 -
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |   1 -
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |   1 -
 .../dts/renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts  |   3 +-
 .../arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts |   3 +-
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |   1 -
 arch/arm/boot/dts/renesas/r8a77470-iwg23s-sbc.dts  |   6 +-
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts        |   5 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts       |   9 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |  25 ++-
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |  15 +-
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |   2 -
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |  17 +-
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |  12 +-
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |   1 -
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts      |   9 +-
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts        |   3 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |  15 +-
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |   1 -
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |  14 +-
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |   9 +-
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |   1 -
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts         |  17 +-
 arch/arm/boot/dts/renesas/sh73a0.dtsi              |   1 -
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  10 +-
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |  11 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   3 +-
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   6 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   6 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  17 +-
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   5 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   3 +-
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   9 +-
 .../renesas/r8a77970-eagle-function-expansion.dtso |   7 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   6 +-
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   3 +-
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   3 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   8 +
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |   2 +-
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi |   9 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      |   6 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   5 +
 .../dts/renesas/r8a779g2-white-hawk-single.dts     |   3 +-
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts |  31 +++-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  72 ++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  21 ++-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |   3 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  18 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |   3 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  51 +++++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   6 +-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |   9 +-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  11 +-
 arch/arm64/boot/dts/renesas/salvator-x.dtsi        |   2 +
 arch/arm64/boot/dts/renesas/salvator-xs.dtsi       |   2 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  18 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   8 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |  11 +-
 .../boot/dts/renesas/white-hawk-ethernet.dtsi      |   6 +-
 arch/riscv/boot/dts/renesas/rzfive-smarc-som.dtsi  |   4 +
 80 files changed, 503 insertions(+), 351 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

