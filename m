Return-Path: <linux-renesas-soc+bounces-33397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDsqImGHHWrAbQkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 15:21:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699861FF1E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Jun 2026 15:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33B0D3019459
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jun 2026 13:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43BDC3A5443;
	Mon,  1 Jun 2026 13:18:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D89375ABD;
	Mon,  1 Jun 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780319909; cv=none; b=YjLQqsmwpKR2F227aoqUlnIpf7RosCir/JB20L3L+vwF4NUu+EaYetyWVHa/cC7J9C9iopzkQ/p3UF1K6XGpxuC5FgYEpdB9jKLSPBb7+IsvaT9/jITT0I7Nv+sNbAu+0WHFuXJaB9Zo55AXcSNt4prvfXA1zEMWhv5u2c6yYts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780319909; c=relaxed/simple;
	bh=rrjRWU95C9JOgLWM8TkS4eTK2724i6ZBvuNTogKz4Lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8Lc9Fc2VcF0rY6hKc0Kj/hPnTMhXHIjIBoLg1W4SIcA8J5zhWXkc/eNWebB8GDYOL50rK+e/Np4FgoDuTQ744hDNcPsYB13yE18J7S9FuXmQngG4JkKMCgpj5muUTnOQdbTMjplLQUbZrX40pTfpU52AuIX4dro0eQDrg6/YuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF6E1F00893;
	Mon,  1 Jun 2026 13:18:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:19 +0200
Message-ID: <cover.1780319122.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33397-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 1699861FF1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:

  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag2

for you to fetch changes up to 0d4ed954061efc3e47fa889d3de0675f933f438f:

  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio (2026-05-31 10:52:23 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.2 (take two)

  - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
    SoCs and their EVK boards,
  - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
  - Add support for the R-Car M3Le SoC and the Geist development board,
  - Specify ethernet PHY reset timings on various R-Car boards,
  - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
  - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
    R-Car X5H SoC and Ironhide development board,
  - Add serial DMA support for the RZ/G2L SoC,
  - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
    SMARC SoM and EVK boards,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for R-Car X5H, which are
shared by driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (14):
      arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
      arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
      arm64: dts: renesas: r9a08g046: Add DMAC node
      arm64: dts: renesas: r9a08g046: Add SSI support
      arm64: dts: renesas: r9a08g046: Add audio clock nodes
      arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
      arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
      arm64: dts: renesas: r9a07g044: Add max-frequency to SDHI nodes
      arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes
      arm64: dts: renesas: rzg3e-smarc-som: Sort GMAC pinmux entries
      arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
      arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
      arm64: dts: renesas: rzg3l-smarc-som: Enable Versa clock generator
      arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

Claudiu Beznea (1):
      arm64: dts: renesas: r9a07g044: Add DMA properties to serial nodes

Cosmin Tanislav (3):
      arm64: dts: renesas: r9a07g0{43,44,54}: Remove TCIU8 interrupt from MTU3
      arm64: dts: renesas: r9a09g077: Add MTU3 support
      arm64: dts: renesas: r9a09g087: Add MTU3 support

Fabrizio Castro (1):
      arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins

Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag1' into renesas-dts-for-v7.2

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a78000: Add MFIS, MFIS-SCP, and transport nodes
      arm64: dts: renesas: ironhide: Enable to use SCMI

Lad Prabhakar (8):
      arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU port configuration
      arm64: dts: renesas: r9a09g056: Add PCIe node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC
      arm64: dts: renesas: r9a09g077: Add xSPI nodes
      arm64: dts: renesas: r9a09g087: Add xSPI nodes
      arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

Marek Vasut (22):
      arm64: dts: renesas: Simplify AA1024XD12 display DTO
      dt-bindings: clock: cirrus,cs2000-cp: Document CS2500
      dt-bindings: soc: renesas: Document R-Car R8A779MD Geist
      arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: salvator-common: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: salvator-common: Specify ethernet PHY reset timings
      arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
      arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
      arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
      arm64: dts: renesas: condor-common: Specify ethernet PHY reset timings
      arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
      arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
      arm64: dts: renesas: draak: Specify ethernet PHY reset timings
      arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
      arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
      arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings
      arm64: dts: renesas: r8a78000: Add PSCI node
      arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor description
      arm64: dts: renesas: ironhide: Describe all reserved memory

Nguyen Tran (2):
      arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
      arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
      arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes

Wolfram Sang (1):
      dt-bindings: soc: renesas: Document MFIS IP core

 .../bindings/clock/cirrus,cs2000-cp.yaml           |  11 +-
 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 187 ++++++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   6 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   2 +
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dtso   |  33 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   4 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   4 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |   2 +
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   2 +-
 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi   |  64 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts     | 720 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi          |  59 ++
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |  65 +-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 170 ++++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   7 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  17 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   7 +-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 384 ++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 127 +++-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  52 ++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  69 ++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  24 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 108 ++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  15 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 108 ++++
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |  15 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  49 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  72 +++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     | 274 +++++++-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   4 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dtso |  33 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   4 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |   2 +
 include/dt-bindings/soc/renesas,r8a78000-mfis.h    |  28 +
 40 files changed, 2575 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

