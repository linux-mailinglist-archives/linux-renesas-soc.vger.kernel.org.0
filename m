Return-Path: <linux-renesas-soc+bounces-10826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0C79E1C80
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 13:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EF0FB250DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56BC11E284D;
	Tue,  3 Dec 2024 10:55:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06DD1E2842;
	Tue,  3 Dec 2024 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223337; cv=none; b=oQ1IBAnNNteIfYI07FtTWsOpjXDivjUFYnMh6bGKB3/UlFn0wJdRgMFpxat2Hns+iEMRquZ3zfQYxG83hYxBNNz83rIns6r0rGI2A1UDbEZq9jZhyFK7UTXAhT8IqYEsEhsE0Ly9a9yeothDHMz39kSc0sxZ8CR1+QIWpSQ2bxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223337; c=relaxed/simple;
	bh=Vim/J6LsT0PZqvwl3u3LqVeBurE46EnszYLQJTsBeYI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YdoZ/nbHnHbAzpzrKsUgkP83shfkMfxYM31JBRb2cfPmglviOTyIikTIvc7M1lH5bbNCjl+0nGxHk3fxNM2DUlgf+b4KJIdxtFMS/pRmOrp9b4dgvGHVBsB933fOUV9AnpcqPrDPNUPTjTDqAOoT3HMVb1muwjeZSKMmUhooL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: oIfldQERQbeRmEyV1GqSrQ==
X-CSE-MsgGUID: /IvVzJx4SSCo1h/wlQm+3g==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754377"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC5C14003ED9;
	Tue,  3 Dec 2024 19:50:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 00/13] Add support for Renesas RZ/G3E SoC and SMARC-EVK platform
Date: Tue,  3 Dec 2024 10:49:27 +0000
Message-ID: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series adds initial support for the Renesas RZ/G3E SoC and
RZ/G3E SMARC EVK platform. The RZ/G3E device is a general-purpose
microprocessor with a quad-core CA-55, single core CM-33, Ethos-U55 NPU
, Mali-G52 3-D Graphics and other peripherals.

Support for below list of blocks added on SoC DTSI (r9a09g047.dtsi):
 - EXT CLKs
 - 4X CA55
 - SCIF
 - CPG
 - GIC
 - ARMv8 Timer

This adds also support for the RZ/G3E SMARC EVK board
(r9a09g047e57-smarc.dts) and enable the following peripheral:
 - SCIF

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20241202203916.48668-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Note:
 This patch series gives a linux prompt with initramfs. Later there is a
plan to add support for SoC Identification using SYSC driver and
pin controller.

v1->v2:
 * Collected tags.
 * Fixed typo "CORE_CLK*"->"CORECLK*" to match with hardware manual in the
   clk bindings.
 * Added MSTOP data for RZ/V2H CRU IP.
 * Fixed typo clock->clk in error path of rzv2h_cpg_register_mod_clk().
 * Added OPP table support for frequency scaling.

Biju Das (13):
  dt-bindings: serial: renesas: Document RZ/G3E (r9a09g047) scif
  dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
  dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II
    EVK
  dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
  soc: renesas: Add RZ/G3E (R9A09G047) config option
  clk: renesas: Add support for RZ/G3E SoC
  clk: renesas: rzv2h-cpg: Add MSTOP support
  clk: renesas: r9a09g047: Add CA55 core clocks
  arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
  arm64: dts: renesas: r9a09g047: Add OPP table
  arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
  arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK
    board
  arm64: defconfig: Enable R9A09G047 SoC

 .../bindings/clock/renesas,rzv2h-cpg.yaml     |  15 +-
 .../bindings/serial/renesas,scif.yaml         |   5 +
 .../bindings/soc/renesas/renesas.yaml         |  17 ++
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi    | 185 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi |  18 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   |  18 ++
 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi |  13 ++
 .../boot/dts/renesas/renesas-smarc2.dtsi      |  24 +++
 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     |  28 +++
 arch/arm64/configs/defconfig                  |   1 +
 drivers/clk/renesas/Kconfig                   |   7 +-
 drivers/clk/renesas/Makefile                  |   1 +
 drivers/clk/renesas/r9a09g047-cpg.c           | 116 +++++++++++
 drivers/clk/renesas/r9a09g057-cpg.c           | 153 ++++++++++-----
 drivers/clk/renesas/rzv2h-cpg.c               |  98 +++++++++-
 drivers/clk/renesas/rzv2h-cpg.h               |  27 ++-
 drivers/soc/renesas/Kconfig                   |   5 +
 .../dt-bindings/clock/renesas,r9a09g047-cpg.h |  21 ++
 19 files changed, 686 insertions(+), 68 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
 create mode 100644 drivers/clk/renesas/r9a09g047-cpg.c
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h

-- 
2.43.0


