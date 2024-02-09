Return-Path: <linux-renesas-soc+bounces-2547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961884FA80
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 18:04:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D55C1C2319D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845097B3D2;
	Fri,  9 Feb 2024 17:04:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3AE78693
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707498243; cv=none; b=SrwzHupnwW7Vk3hED3OYaGdGzV14Qpr4iJB64Q6HNqeHgJ7rMGVKAXz7dTdXxTSu0Xd0c2E8H22Qhl3Kl5dQ936MSgNx2DVtRLRIixv4O6UC0cHePhymtNQd+Oq1fnSdMUES+2xmNBoYY4s3659YifOMjIBV4qJI56oTksOnPiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707498243; c=relaxed/simple;
	bh=0i+zQm1lsloStREmW3mmh68FDuqlS98hp/fK/7Xt/bk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d/Rc33ZSxHDmPIl1pZqhIgZoks5tuK6BJ3xULze+vzDj7gougkAJCpIJNC+5pw5mqX//4z6ofC1WxHEvzHG8xlPvWaFSpVII+Ufa7TPuTqOCjsbo/sqR/9SusByOwVjHSfgjwOF33fbzuaGLMCMeqg+H1Nqw4+fMAKIeH3K7Dno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TWg2L3mfhz4wxfS
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:55:06 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by baptiste.telenet-ops.be with bizsmtp
	id l4uy2B0094RKXn6014uykW; Fri, 09 Feb 2024 17:54:58 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9O-0008Gg-9Y;
	Fri, 09 Feb 2024 17:54:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9S-0061GV-Hf;
	Fri, 09 Feb 2024 17:54:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.9
Date: Fri,  9 Feb 2024 17:54:53 +0100
Message-Id: <cover.1707487834.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707487826.git.geert+renesas@glider.be>
References: <cover.1707487826.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.9-tag1

for you to fetch changes up to 785b3c25761a828c5e22b3361541c50fd3b92fde:

  arm64: dts: renesas: gray-hawk-single: Enable watchdog timer (2024-02-06 10:48:35 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.9

  - Add GPIO keys and watchdog support for the RZ/G3S SMARC development
    board,
  - Add GNSS support for Renesas ULCB development boards equipped with
    the Shimafuji Kingfisher extension,
  - Add support for the standalone White Hawk CPU board,
  - Add support for the R-Car V4H ES2.0 (R8A779G2) SoC and the White
    Hawk Single development board,
  - Add initial support for the R-Car V4M (R8A779H0) SoC and the Gray
    Hawk Single development board,
  - Add camera support for the RZ/G2UL SoC,
  - Miscellaneous fixes and improvements.

Note that this includes the "renesas-r8a779h0-dt-binding-defs-tag" tag,
which is based on the pmdomain immutable "dt" branch.  It contains DT
binding definitions for the Renesas R-Car V4M (R8A779H0) SoC, and is
shared by the pmdomain and clock drivers, and the DT source files.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: r9a07g043u: Add CSI and CRU nodes

Claudiu Beznea (3):
      arm64: dts: renesas: rzg3s-smarc: Add gpio keys
      arm64: dts: renesas: r9a08g045: Add watchdog node
      arm64: dts: renesas: rzg3s-smarc-som: Enable the watchdog interface

Duy Nguyen (3):
      dt-bindings: power: renesas,rcar-sysc: Document R-Car V4M support
      dt-bindings: power: Add r8a779h0 SYSC power domain definitions
      dt-bindings: clock: Add R8A779H0 V4M CPG Core Clock Definitions

Geert Uytterhoeven (19):
      ARM: dts: renesas: r8a73a4: Fix external clocks and clock rate
      ARM: dts: renesas: r8a73a4: Add cp clock
      ARM: dts: renesas: r8a73a4: Fix thermal parent clock
      arm64: dts: renesas: r8a779g0: Restore sort order
      arm64: dts: renesas: r8a779g0: Add standalone White Hawk CPU support
      arm64: dts: renesas: white-hawk-cpu: Restore sort order
      arm64: dts: renesas: white-hawk: Drop SoC parts from sub boards
      arm64: dts: renesas: white-hawk: Add SoC name to top-level comment
      arm64: dts: renesas: white-hawk-cpu: Factor out common parts
      arm64: dts: renesas: white-hawk: Factor out common parts
      arm64: dts: renesas: Add Renesas R8A779G2 SoC support
      arm64: dts: renesas: r8a779g2: Add White Hawk Single support
      dt-bindings: clock: renesas,cpg-mssr: Document R-Car V4M support
      arm64: dts: renesas: r8a779g0: Add missing SCIF_CLK2
      Merge tag 'renesas-r8a779h0-dt-binding-defs-tag' into renesas-dts-for-v6.9
      arm64: dts: renesas: Add Gray Hawk Single board support
      ARM: dts: renesas: Improve TMU interrupt descriptions
      arm64: dts: renesas: Improve TMU interrupt descriptions
      arm64: dts: renesas: gray-hawk-single: Enable watchdog timer

Hai Pham (1):
      arm64: dts: renesas: Add Renesas R8A779H0 SoC support

Minh Le (1):
      arm64: dts: renesas: r8a779h0: Add RWDT node

Wolfram Sang (2):
      arm64: dts: renesas: ulcb-kf: Drop duplicate 3.3v regulators
      arm64: dts: renesas: ulcb-kf: Add node for GNSS

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/power/renesas,rcar-sysc.yaml          |   1 +
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts      |  12 +
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             |  23 +-
 arch/arm/boot/dts/renesas/r8a7740.dtsi             |   2 +
 arch/arm/boot/dts/renesas/r8a7778.dtsi             |   9 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |   9 +-
 arch/arm64/boot/dts/renesas/Makefile               |   5 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  17 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  11 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  17 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  17 +-
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dts   |  13 +
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 368 +-------------------
 .../arm64/boot/dts/renesas/r8a779g0-white-hawk.dts |  58 +---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 101 +++---
 .../dts/renesas/r8a779g2-white-hawk-single.dts     |  26 ++
 arch/arm64/boot/dts/renesas/r8a779g2.dtsi          |  12 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts |  57 ++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 132 ++++++++
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  69 ++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  14 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  53 +++
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  42 +--
 arch/arm64/boot/dts/renesas/white-hawk-common.dtsi |  65 ++++
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    | 375 +++++++++++++++++++++
 ...e-hawk-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} |   2 +-
 ...hawk-ethernet.dtsi => white-hawk-ethernet.dtsi} |   2 +-
 .../dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h  |  96 ++++++
 include/dt-bindings/power/renesas,r8a779h0-sysc.h  |  49 +++
 41 files changed, 1233 insertions(+), 540 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h0.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/white-hawk-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} (97%)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ethernet.dtsi => white-hawk-ethernet.dtsi} (76%)
 create mode 100644 include/dt-bindings/clock/renesas,r8a779h0-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/renesas,r8a779h0-sysc.h

