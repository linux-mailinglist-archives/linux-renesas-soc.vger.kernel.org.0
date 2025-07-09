Return-Path: <linux-renesas-soc+bounces-19465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A20AFF2C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 33D505C077A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28435235046;
	Wed,  9 Jul 2025 20:14:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B67723B63D;
	Wed,  9 Jul 2025 20:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092048; cv=none; b=t3yIkAuPlh2giy6B4RxriPADAnxFW6MIneZkUALaD+lsvZaHrvoLF3KfVZuHBJrfs6uaIL29iEHUEgg2DQ2yAaFUoQOAy7DE2NfuK7Q1eIilJ/xmZLYXVzOLzkA+yqycVcowtp37S+v5Cw7Rizpjj7HFCC6KkprvvEB/UwtZFPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092048; c=relaxed/simple;
	bh=7cOZEDC37PQUz6lOI2JpP4JtummP2MBbj48uUi5o0Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gU+jYkWePAW6Fgf0Ph+Zrzx0I5copvFTyAss7l5OkVRlLbfV7dr0BuU2xtRnqEzbeyvoEpLPLBJcH+VFp1b17+teFzrnL55jhDEhVilXBE1vNls4l0vrhsLKZdlsc2eEujy3fowtXwniqw9d7tKyLjIHNNAXOn+nqesAqnDxfRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E8AC4CEF0;
	Wed,  9 Jul 2025 20:14:06 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:13:27 +0200
Message-ID: <cover.1752090401.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1752090396.git.geert+renesas@glider.be>
References: <cover.1752090396.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f:

  arm64: dts: renesas: r9a09g047: Add GBETH nodes (2025-06-26 16:37:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.17-tag2

for you to fetch changes up to 145a2a9e27562926c592645a05d682fe8e1f82e9:

  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH (2025-07-08 12:06:26 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.17 (take two)

  - Add support for the Renesas Gray Hawk Single board with R-Car
    V4M-7 (R8A779H2),
  - Add eMMC and microSD expansion board support for the RZ/V2H and
    RZ/V2N EVK development boards,
  - Add GPIO keys and Ethernet support for the RZ/G3E SoM and SMARC
    Carrier-II EVK development board,
  - Add QSPI FLASH support for the RZ/V2H and RZ/V2N SoCs and their EVK
    development boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: r9a09g047e57-smarc: Add gpio keys

Geert Uytterhoeven (3):
      arm64: dts: renesas: Factor out Gray Hawk Single board support
      arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag4' into renesas-dts-for-v6.17

John Madieu (1):
      arm64: dts: renesas: rzg3e-smarc-som: Enable eth{0-1} (GBETH) interfaces

Lad Prabhakar (8):
      dt-bindings: clock: renesas,r9a09g056/57-cpg: Add XSPI core clock
      arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Fix pinctrl node name for GBETH1
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Fix pinctrl node name for GBETH1
      arm64: dts: renesas: r9a09g056: Add XSPI node
      arm64: dts: renesas: r9a09g057: Add XSPI node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable serial NOR FLASH
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable serial NOR FLASH

Niklas Söderlund (1):
      arm64: dts: renesas: r8a779g3-sparrow-hawk-fan-pwm: Add missing install target

Tam Nguyen (1):
      arm64: dts: renesas: Add Renesas R8A779H2 SoC support

 arch/arm64/boot/dts/renesas/Makefile               |  15 +
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  | 866 +++++++++++++++++++++
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 855 +-------------------
 .../boot/dts/renesas/r8a779h2-gray-hawk-single.dts |  17 +
 arch/arm64/boot/dts/renesas/r8a779h2.dtsi          |  12 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  37 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  21 +
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  66 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  21 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  66 +-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  31 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   | 111 +++
 .../arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso |  50 ++
 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso  |  69 ++
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |   1 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |   1 +
 16 files changed, 1383 insertions(+), 856 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso

