Return-Path: <linux-renesas-soc+bounces-13484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC877A3FCC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 18:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC607071C2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2025 16:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFDB224B11;
	Fri, 21 Feb 2025 16:57:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3CE215F7A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740157059; cv=none; b=heDIZG54PYRkMjh2usukLRmwmI6AMc6Ov6UjWM1dReA3FCrsoGa98c74fGqImtEdExw6kxQXJO/aqd3dixPU09XoZPvt1uFehg9cI1kwtRLgD5TVfvDUstT5cEQgO3UhbzEFCVq0v+KIRLdGgKnKW2giEESqz1U4pXYFcs5YIEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740157059; c=relaxed/simple;
	bh=DNyUxkvQh+jj4FajV3X+zIJTVHqRaSSKqO1BPPOnmXg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JiEmh2hUXn0TozKKCdKgq5MdI2SZDP08mx/vfOyiJDU0fFd5kXQwZNtYj2Llm830AF0l9rS2Ot8q1mMXq6uFh+y2on4wsfLUEFYgkiNSjATIH2tQRCet7/8thN4gTzpPN9ru0mC47mZWhxfkCwms9Zna9e4bUIxbKWlDHyOrmvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by albert.telenet-ops.be with cmsmtp
	id GGxX2E00F0y8aK506GxXMo; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsd-3qnf;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOr3-1PtZ;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 5/5] Renesas DTS updates for v6.15
Date: Fri, 21 Feb 2025 17:57:26 +0100
Message-ID: <cover.1740156747.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.15-tag1

for you to fetch changes up to 5f7ebb81112c3f50ffbb8e576e4d35cedd8aabb1:

  ARM: dts: renesas: r9a06g032: Fix UART dma channel order (2025-02-21 16:23:01 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.15

  - Add support for the second and third Ethernet interfaces on the Gray
    Hawk Single development board,
  - Add Image Signal Processor helper block (FCPVX and VSPX) support for
    the R-Car V3U and V4M SoCs,
  - Add Watchdog and System Controller support for the RZ/G3E SoC and
    the RZ/G3E SMARC Carrier-II EVK development board,
  - Add initial support for the Yuridenki-Shokai Kakip and MYIR Remi Pi
    boards,
  - Add support for the spare UART and PMOD serial ports on the RZ/G3S
    SMARC Carrier II board,
  - Add a CPU Operating Performance Points table for the RZ/G3S SoC,
  - Add boot phase tags on R-Car Gen2/3/4 and RZ/G2 boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g047: Add WDT1-WDT3 nodes
      arm64: dts: renesas: rzg3e-smarc-som: Enable watchdog

Claudiu Beznea (5):
      arm64: dts: renesas: rzg3s-smarc-switches: Add a header to describe different switches
      arm64: dts: renesas: rzg3s-smarc: Enable SCIF3
      arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add overlay for SCIF1
      arm64: dts: renesas: r9a08g045: Enable SYS node
      arm64: dts: renesas: r9a08g045: Add OPP table

Geert Uytterhoeven (6):
      arm64: dts: renesas: r8a774c0: Re-add voltages to OPP table
      arm64: dts: renesas: r8a77990: Re-add voltages to OPP table
      arm64: dts: renesas: gray-hawk-single: Restore sort order
      arm64: dts: renesas: r8a779g0: Restore sort order
      arm64: dts: renesas: r8a779f0: Disable rswitch ports by default
      ARM: dts: renesas: r9a06g032: Fix UART dma channel order

John Madieu (2):
      arm64: dts: renesas: r9a09g047: Add SYS node
      arm64: dts: renesas: r9a09g057: Enable SYS node

Julien Massot (1):
      arm64: dts: renesas: Add initial support for MYIR Remi Pi

Krzysztof Kozlowski (1):
      arm64: dts: renesas: eagle-function-expansion: Align GPIO hog name with bindings

Kuninori Morimoto (1):
      arm64: dts: renesas: ulcb/kf: Use TDM Split Mode for capture

Marek Vasut (8):
      arm64: dts: renesas: r8a779f0: Add labels for rswitch ports
      arm64: dts: renesas: spider-ethernet: Access rswitch ports via phandles
      arm64: dts: renesas: s4sk: Access rswitch ports via phandles
      arm64: dts: renesas: spider-ethernet: Add ethernetN aliases for rswitch
      arm64: dts: renesas: s4sk: Fix ethernet0 alias for rswitch
      ARM: dts: renesas: rcar-gen2: Add boot phase tags
      arm64: dts: renesas: rcar: Add boot phase tags
      arm64: dts: renesas: rzg2: Add boot phase tags

Niklas Söderlund (7):
      arm64: dts: renesas: r8a779h0: Remove #address- and #size-cells from AVB[0-2]
      arm64: dts: renesas: gray-hawk-single: Describe AVB1 and AVB2
      arm64: dts: renesas: r8a779a0: Add FCPVX instances
      arm64: dts: renesas: r8a779a0: Add VSPX instances
      arm64: dts: renesas: r8a779h0: Add FCPVX instance
      arm64: dts: renesas: r8a779h0: Add VSPX instance
      arm64: dts: renesas: white-hawk-csi-dsi: Use names for CSI-2 data line orders

Nobuhiro Iwamatsu (1):
      arm64: dts: renesas: Add initial device tree for Yuridenki-Shokai Kakip board

 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |   1 +
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |   1 +
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |   7 +
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |   1 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |   1 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |   7 +
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts      |   1 +
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts        |   1 +
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   6 +
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |   1 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |   7 +
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |   1 +
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |   1 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  20 +-
 arch/arm64/boot/dts/renesas/Makefile               |   5 +
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   1 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   1 +
 arch/arm64/boot/dts/renesas/draak.dtsi             |   1 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   1 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     |   1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts    |   1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  11 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   7 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   8 +
 .../renesas/r8a77970-eagle-function-expansion.dtso |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   1 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   7 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   7 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  11 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   7 +
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi      |   1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  88 ++++++
 .../boot/dts/renesas/r8a779f0-spider-cpu.dtsi      |   1 +
 .../boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 104 ++++---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  17 +-
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts      |  69 ++---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  88 +++---
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 154 ++++++++--
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  34 ++-
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 339 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  29 +-
 .../renesas/r9a08g045s33-smarc-pmod1-type-3a.dtso  |  48 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  37 +++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   1 -
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts | 136 +++++++++
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   4 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |  20 +-
 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h |  40 +++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  13 +
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   1 +
 .../ulcb-kf-audio-graph-card-mix+split.dtsi        |  73 ++++-
 .../ulcb-kf-audio-graph-card2-mix+split.dtsi       |  66 +++-
 .../ulcb-kf-simple-audio-card-mix+split.dtsi       |  53 +++-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   1 +
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |   1 +
 .../arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi |   8 +-
 64 files changed, 1382 insertions(+), 221 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g045s33-smarc-pmod1-type-3a.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3s-smarc-switches.h

