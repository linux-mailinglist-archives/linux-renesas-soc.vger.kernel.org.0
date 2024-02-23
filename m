Return-Path: <linux-renesas-soc+bounces-3126-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A54586103A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CF421C21CAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 11:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D165657A3;
	Fri, 23 Feb 2024 11:21:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE35B42A97
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687279; cv=none; b=DV9KfJlTBqUOvWMuGbK6cCT87VZQcP8nQAfmalVblH/nA+Pkwzo6tKVqctfeLPbe2WitcSK1ujNLogLiC6PcSyhLgM49c07iPhoKOFOhSqYOulAtsowL6G/HRG1waxaIEvTw48kA/WkcxiRHRoMStiY5bGTjfgY7z6bLjOriFVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687279; c=relaxed/simple;
	bh=CXhIB7CTwFh9W1MYWs0ZjNy4lYB+TiSBr/3loGNUszs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E10+X2QAjCR+rz4bPSqUQ9u10Nr1SWIaG0JWhPslO5CRWHN7JweUudJXws68ll9X/qcV/+w7pJ4MiVQPFUX/wHfz+TGTHer9FV2WbFW2Qg+tujXBlrwri7iCgeFjSMi3ELLMl9hk/1b7DOZkBHxXH3RCv62zETmGxfE1U5bWdoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6f61:ab26:80d6:d9d4])
	by michel.telenet-ops.be with bizsmtp
	id qbM72B00S2itsqh06bM7uS; Fri, 23 Feb 2024 12:21:09 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTbu-001P3n-Vu;
	Fri, 23 Feb 2024 12:21:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTc3-00D0P7-BC;
	Fri, 23 Feb 2024 12:21:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.9 (take two)
Date: Fri, 23 Feb 2024 12:20:59 +0100
Message-Id: <cover.1708687134.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708687130.git.geert+renesas@glider.be>
References: <cover.1708687130.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 785b3c25761a828c5e22b3361541c50fd3b92fde:

  arm64: dts: renesas: gray-hawk-single: Enable watchdog timer (2024-02-06 10:48:35 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.9-tag2

for you to fetch changes up to eaa5907bcc7611c7a07e994a69a905deca34a9b6:

  arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI (2024-02-23 11:42:41 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.9 (take two)

  - Add pin control, I2C, GPIO, CA76 cluster, Ethernet, SD/MMC, DMA, and
    HyperFLASH/QSPI (RPC) support for the R-Car V4M SoC,
  - Add I2C EEPROM, Ethernet, eMMC, and QSPI FLASH support for the Gray
    Hawk Single development board,
  - Fix PCIe power on ULCB development boards equipped with the
    Shimafuji Kingfisher extension,
  - Add PSCI support for the RZ/G3S SoC,
  - Add camera support for the RZ/G2UL SMARC EVK development board,
  - Add display support for the RZ/G2L{,C} and RZ/V2L SoCs and SMARC EVK
    development boards,
  - Miscellaneous fixes and improvements,

----------------------------------------------------------------
Biju Das (4):
      arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
      arm64: dts: renesas: r9a07g044: Add DU node
      arm64: dts: renesas: r9a07g054: Add DU node
      arm64: dts: renesas: rzg2l-smarc: Enable DU and link with DSI

Claudiu Beznea (2):
      arm64: dts: renesas: rzg3s-smarc-som: Guard Ethernet IRQ GPIO hogs
      arm64: dts: renesas: r9a08g045: Add PSCI support

Cong Dang (5):
      arm64: dts: renesas: r8a779h0: Add GPIO nodes
      arm64: dts: renesas: r8a779h0: Add SD/MMC node
      arm64: dts: renesas: gray-hawk-single: Add eMMC support
      arm64: dts: renesas: r8a779h0: Add RPC node
      arm64: dts: renesas: gray-hawk-single: Add QSPI FLASH support

Duy Nguyen (5):
      arm64: dts: renesas: r8a779h0: Add L3 cache controller
      arm64: dts: renesas: r8a779h0: Add secondary CA76 CPU cores
      arm64: dts: renesas: r8a779h0: Add CPUIdle support
      arm64: dts: renesas: r8a779h0: Add CPU core clocks
      arm64: dts: renesas: r8a779h0: Add CA76 operating points

Geert Uytterhoeven (5):
      arm64: dts: renesas: gray-hawk-single: Add serial console pin control
      arm64: dts: renesas: gray-hawk-single: Add I2C0 and EEPROMs
      arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
      arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes
      arm64: dts: renesas: r8a779h0: Add DMA support

Hai Pham (2):
      arm64: dts: renesas: r8a779h0: Add pinctrl device node
      arm64: dts: renesas: r8a779h0: Add I2C nodes

Kuninori Morimoto (1):
      ARM: dts: renesas: r8a7778: Add missing reg-names to sound node

Lad Prabhakar (2):
      arm64: dts: renesas: rzg2l: Add missing interrupts to IRQC nodes
      arm64: dts: renesas: r9a08g045: Add missing interrupts to IRQC node

Thanh Quan (2):
      arm64: dts: renesas: r8a779h0: Add Ethernet-AVB support
      arm64: dts: renesas: gray-hawk-single: Add Ethernet support

Wolfram Sang (3):
      arm64: dts: renesas: ulcb-kf: Add regulators for PCIe ch1
      arm64: dts: renesas: ulcb-kf: Adapt 1.8V HDMI regulator to schematics
      arm64: dts: renesas: ulcb-kf: Adapt sound 5v regulator to schematics

 arch/arm/boot/dts/renesas/r8a7778.dtsi             |   2 +
 arch/arm64/boot/dts/renesas/Makefile               |   3 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   4 +-
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 173 +++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 532 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  12 +-
 .../renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso |  21 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  68 ++-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  69 ++-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  13 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  14 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  14 +-
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   4 +
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  49 +-
 15 files changed, 940 insertions(+), 42 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso

