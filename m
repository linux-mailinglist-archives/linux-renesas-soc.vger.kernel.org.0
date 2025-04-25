Return-Path: <linux-renesas-soc+bounces-16379-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48181A9C905
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 14:35:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E049A4E26DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Apr 2025 12:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745835695;
	Fri, 25 Apr 2025 12:35:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1A4248889
	for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Apr 2025 12:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745584518; cv=none; b=pJ//Oq+RcbPPOR1LFgvUSCw8UdY33iW+lUAqzYe1Iz3ylJ66R1a/d+UY+++XPiPBWa8VCGSXYMM2sLiBPZ39bbeJ7utLmkUxip4Zi6V47K/flSytYhHm3cYPNaZr3pOku68Q/0Md66m7vR95BcWKKtggjeSNe/f7skzgzVJt8Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745584518; c=relaxed/simple;
	bh=+95PuisuVgM6LMpt9XPu+Bq9aNp6OAXEXye9r1GPPQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7Ku5EcZpdtvYCkaZnq8dSwDkJV+EEU5zUreso0fwVuWtf1IZyJK5iMrXfuWMSuGW19QmddGV8c14JgzqMHnibyI82L0tWPLemryUWN5S2VjOAUdDyXCrxldIGWwJ/AGhd1eoIFbO2nmV0+1SPRfPW3CDqDQ02zlo3BKeypBIOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by andre.telenet-ops.be with cmsmtp
	id hQb42E00G16PE0201Qb4q4; Fri, 25 Apr 2025 14:35:05 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJm-3R8t;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKjB-0KLe;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.16
Date: Fri, 25 Apr 2025 14:34:59 +0200
Message-ID: <cover.1745582596.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag1

for you to fetch changes up to 9f78a29caacef6df5d6a43e85d1112e39cfa3b34:

  arm64: dts: renesas: r8a779h0: Add ISP core function block (2025-04-24 11:29:11 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16

  - Add SDHI, ICU, I2C, PMIC, and GPU support on the RZ/G3E SoC and the
    RZ/G3E SoM and SMARC Carrier-II EVK development board,
  - Add internal SDHI regulator support on the RZ/V2H(P) SoC,
  - Add UFS tuning parameters in E-FUSE on the R-Car S4-8 ES1.2 SoC,
  - Add support for Ethernet ports C and D, I2C, keys, and SDHI on the
    RZ/N1D SoC and the RZN1D-DB and RZN1D-EB development and expansion
    boards,
  - Add initial support for the RZ/V2N (R9A09G056) and the RZ/V2N EVK
    board,
  - Add support for the Retronix Sparrow Hawk board, which is based on
    R-Car V4H ES3.0,
  - Add ISP core support on R-Car V3U, V4H, and V4M,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (7):
      arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
      arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal regulator
      arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
      arm64: dts: renesas: rzg3e-smarc-som: Add support to enable SD on SDHI0
      arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
      arm64: dts: renesas: r9a09g047: Add ICU node
      arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a

Clément Léger (1):
      ARM: dts: renesas: Add r9a06g032-rzn1d400-eb board device-tree

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
      Merge tag 'renesas-r9a09g056-dt-binding-defs-tag1' into renesas-dts-for-v6.16

John Madieu (2):
      arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
      arm64: dts: renesas: rzg3e-smarc-som: Add RAA215300 pmic support

Lad Prabhakar (6):
      dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
      dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
      dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
      dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
      arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
      arm64: dts: renesas: Add initial device tree for RZ/V2N EVK

Marek Vasut (1):
      arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support

Niklas Söderlund (3):
      arm64: dts: renesas: r8a779a0: Add ISP core function block
      arm64: dts: renesas: r8a779g0: Add ISP core function block
      arm64: dts: renesas: r8a779h0: Add ISP core function block

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
      arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52

Wolfram Sang (6):
      ARM: dts: renesas: r9a06g032: Describe I2C controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe I2C bus
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Describe I2C bus
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe keys
      ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   5 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml         |   1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  15 +
 arch/arm/boot/dts/renesas/Makefile                 |   1 +
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 110 +++-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 160 +++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  46 ++
 arch/arm64/boot/dts/renesas/Makefile               |   6 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  60 +-
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  30 +-
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso |  43 ++
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 666 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  21 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 199 ++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  49 ++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 282 +++++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 114 ++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  21 +
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  18 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   2 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   2 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   | 207 +++++++
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |  24 +
 25 files changed, 2067 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

