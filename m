Return-Path: <linux-renesas-soc+bounces-26916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2639D2FED0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 11:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170DA30A5E93
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 10:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D756236166E;
	Fri, 16 Jan 2026 10:50:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5EF32AACE;
	Fri, 16 Jan 2026 10:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768560629; cv=none; b=HKTYbsAOMDkV5nBQftXpdEK8sSj7TrUEXDy41ak0rucMCZo3LkZcpil8ivhcvbG05Lr6jjAS3WXepxVOeyUjfdST4nLTHC2GCguNzrM25fYj15teKpOBFAdq+HKEt5/YAZohQNzNMS0LsWgE3IUOqTLeP0TdNXKj06HKHd977XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768560629; c=relaxed/simple;
	bh=VHDp5cJhQVLSC4kLT36zM48yybRw9fcOacP2WroYvzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jhyGIHO+gGwg1gqjDVUFgsxRtQ6Wts+MwsU8vuWN9gb4l3CIBY5Ty7rI0kdGDlvgcN6EcasEMu/HV0L7fhV16WZ5lDGEIJcmj+FpCfTIXygRFsviNmSyhR5eGZ7XF0t6gJnyd+ibaP5Stmlu3A5hEFNDnCz+vxK8n+h7/ktS9cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FAD3C2BCC4;
	Fri, 16 Jan 2026 10:50:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.20 (take two)
Date: Fri, 16 Jan 2026 11:50:18 +0100
Message-ID: <cover.1768559769.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1768559762.git.geert+renesas@glider.be>
References: <cover.1768559762.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit aca3bbde0fdb263081b5ff1e60f066704dd1a19e:

  arm64: dts: renesas: r8a779h0: Add WWDT nodes (2026-01-05 14:37:18 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.20-tag2

for you to fetch changes up to 5979010bcc665e9bcf41b22f111b3fe7fc4eadb1:

  arm64: dts: renesas: rzt2h-rzn2h-evk: Reorder ADC nodes (2026-01-16 10:51:41 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.20 (take two)

  - Add cpufreq, thermal, GPIO IRQ, and CAN-FD support for the RZ/T2H
    and RZ/N2H SoCs and their EVK boards,
  - Add more serial (RSCI) and CAN-FD support for the RZ/V2H and RZ/V2N
    SoCs,
  - Drop unused .dtsi files,
  - Add I3C support for the RZ/G3E SMARC SoM,
  - Add GPIO support for the RZ/N1 SoC,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Cosmin Tanislav (8):
      arm64: dts: renesas: r9a09g077: Add OPP table
      arm64: dts: renesas: r9a09g087: Add OPP table
      arm64: dts: renesas: r9a09g077: Add TSU and thermal zones support
      arm64: dts: renesas: r9a09g087: Add TSU and thermal zones support
      arm64: dts: renesas: r9a09g077: Add GPIO IRQ support
      arm64: dts: renesas: r9a09g087: Add GPIO IRQ support
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add GPIO keys
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add GPIO keys

Geert Uytterhoeven (2):
      riscv: dts: renesas: r9a07g043f: Move interrupt-parent to top node
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag6' into renesas-dts-for-v6.20

Herve Codina (Schneider Electric) (2):
      ARM: dts: r9a06g032: Add GPIO controllers
      ARM: dts: r9a06g032: Add support for GPIO interrupts

Krzysztof Kozlowski (2):
      arm64: dts: renesas: Use hyphens in node names
      arm64: dts: renesas: Use lowercase hex

Lad Prabhakar (12):
      dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
      dt-bindings: clock: renesas,r9a09g077/87: Add PCLKCAN ID
      arm64: dts: renesas: r9a09g056: Add RSCI nodes
      arm64: dts: renesas: r9a09g057: Add RSCI nodes
      arm64: dts: renesas: r9a09g077: Add CANFD node
      arm64: dts: renesas: r9a09g087: Add CANFD node
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable CANFD
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Enable CANFD
      arm64: dts: renesas: r9a09g056: Add CANFD node
      arm64: dts: renesas: r9a09g057: Add CANFD node
      arm64: dts: renesas: rzt2h-n2h-evk-common: Use GPIO for SD0 write protect
      arm64: dts: renesas: rzt2h-rzn2h-evk: Reorder ADC nodes

Rob Herring (Arm) (1):
      arm/arm64: dts: renesas: Drop unused .dtsi

Tommaso Merciai (1):
      arm64: dts: renesas: rzg3e-smarc-som: Enable I3C support

 .../dts/renesas/gr-peach-audiocamerashield.dtsi    |  75 -----
 .../boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi  |  39 ---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           | 159 ++++++++++
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   2 +-
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   4 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   2 +-
 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi      | 332 ---------------------
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  52 ++--
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   4 +-
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   4 +-
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   4 +-
 arch/arm64/boot/dts/renesas/r8a779m0.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r8a779m2.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r8a779m4.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r8a779m6.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r8a779m7.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r8a779m8.dtsi          |  17 --
 arch/arm64/boot/dts/renesas/r8a779mb.dtsi          |  12 -
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi       |  25 --
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi       |  18 --
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   2 +-
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi       |  18 --
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi      |  18 --
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 280 +++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 280 +++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  99 ++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 109 +++++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  99 ++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 186 ++++++++----
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  14 +
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     | 161 +++++-----
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   4 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi        |   3 +-
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   3 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   3 +
 47 files changed, 1426 insertions(+), 986 deletions(-)
 delete mode 100644 arch/arm/boot/dts/renesas/gr-peach-audiocamerashield.dtsi
 delete mode 100644 arch/arm/boot/dts/renesas/r8a77xx-aa121td01-panel.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/gmsl-cameras.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m0.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m2.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m4.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m6.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m7.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779m8.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r8a779mb.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi
 delete mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi

