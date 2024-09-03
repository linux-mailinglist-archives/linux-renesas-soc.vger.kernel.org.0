Return-Path: <linux-renesas-soc+bounces-8663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8805696A134
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 16:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31E111F22880
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Sep 2024 14:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 010006F30D;
	Tue,  3 Sep 2024 14:52:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0AF2C6A3
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Sep 2024 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725375141; cv=none; b=lkp9OqmTWQNutSwDgmA39sUlrhu25qzo3cBXJYVWS+bwlWeEAxb76I7bhR9Km5RPGHbF7OpP3W+SQHQLXIzzqYWQQlwOUkilEKcmSIQ1VtDTzpBXjRc6HbIcHpKY1wPRGmuBbEOvB2HRb5GZLsAr45hI/5a3OCInJ96o21uAyI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725375141; c=relaxed/simple;
	bh=HCRhmkWorEV/mpOSIGTsirapYp3Ddg4LlHUeXyRzbsM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LUI3IidNZgfTE5rsvQXs/FFoRcrU84RBJg482A7jddFVIAGgDe1FBDMu4C53t2l+cAUhySnvDPqM3GM9z7J9KJ8QwQIWTWN3yUwDpJj6RLB4WNALrZ+Byrl30mCykD0x70bEO9R2hvLlYsGBR16QzhmsUaaUbJB9SCdT66VeR9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b015:4053:6b25:396c])
	by baptiste.telenet-ops.be with cmsmtp
	id 7qsK2D0040nYyzV01qsKfT; Tue, 03 Sep 2024 16:52:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slUtE-001zes-95;
	Tue, 03 Sep 2024 16:52:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1slUtH-003oSy-0d;
	Tue, 03 Sep 2024 16:52:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.12 (take two)
Date: Tue,  3 Sep 2024 16:52:17 +0200
Message-Id: <cover.1725374275.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.12.

The following changes since commit ab7d885a33a7ef328a97ccae0d1340b68c3db9ad:

  arm64: dts: renesas: gray-hawk-single: Add CAN-FD support (2024-08-20 09:40:52 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.12-tag2

for you to fetch changes up to cc41aa93bbafdfe4c4c9026d307adbb89c1d80fa:

  arm64: dts: renesas: r8a779h0: Add family fallback for CSISP IP (2024-09-03 10:23:02 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.12 (take two)

  - Add support for Ethernet TSN and PCIe on the R-Car V4H SoC and the
    White-Hawk (Single) development board,
  - Add display support for the RZ/G2UL SoC and the RZ/G2UL SMARC EVk
    board,
  - Add I2C support for the RZ/G3S SoC and the RZ/G3S SMARC EVK board,
  - Add support for HDMI audio on the RZ/G2L and RZ/G2LC SMARC EVK
    boards,
  - Add initial support for the RZ/V2H(P) (R9A09G057) SoC and the RZ/V2H
    EVK board,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for the new RZ/V2H(P)
SoC, which are shared by the clock driver and DT source files.  However,
due to an earlier oversight on my side, the actual DT binding definition
commit is not shared, but duplicated in the clock tree.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (7):
      arm64: dts: renesas: r9a07g0{43,44,54}: Move regulator-vbus device node
      arm64: dts: renesas: r9a07g043u: Add FCPVD node
      arm64: dts: renesas: r9a07g043u: Add VSPD node
      arm64: dts: renesas: r9a07g043u: Add DU node
      arm64: dts: renesas: rzg2l-smarc: Enable HDMI audio
      arm64: dts: renesas: rzg2lc-smarc: Enable HDMI audio
      arm64: dts: renesas: r9a07g043u11-smarc: Enable DU

Claudiu Beznea (3):
      arm64: dts: renesas: r9a08g045: Add I2C nodes
      arm64: dts: renesas: rzg3s-smarc: Enable I2C0 node
      arm64: dts: renesas: rzg3s-smarc-som: Enable I2C1 node

Geert Uytterhoeven (1):
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag' into renesas-dts-for-v6.12

Lad Prabhakar (14):
      arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
      arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
      arm64: dts: renesas: r9a07g054: Correct GICD and GICR sizes
      arm64: dts: renesas: r9a07g044: Correct GICD and GICR sizes
      dt-bindings: clock: renesas: Document RZ/V2H(P) SoC CPG
      dt-bindings: soc: renesas: Document RZ/V2H EVK board
      arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
      arm64: dts: renesas: Add initial DTS for RZ/V2H EVK board
      arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
      arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
      arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
      arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable OSTM, I2C, and SDHI
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable watchdog

Niklas Söderlund (8):
      arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
      arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN
      arm64: dts: renesas: r8a779g0: Add family fallback for VIN IP
      arm64: dts: renesas: r8a779a0: Add family fallback for VIN IP
      arm64: dts: renesas: r8a779h0: Add family fallback for VIN IP
      arm64: dts: renesas: r8a779g0: Add family fallback for CSISP IP
      arm64: dts: renesas: r8a779a0: Add family fallback for CSISP IP
      arm64: dts: renesas: r8a779h0: Add family fallback for CSISP IP

Yoshihiro Shimoda (2):
      arm64: dts: renesas: r8a779g0: Add PCIe Host and Endpoint nodes
      arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |  80 ++++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   2 +
 arch/arm64/boot/dts/renesas/Makefile               |   5 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 108 +++--
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 202 +++++++-
 .../dts/renesas/r8a779g2-white-hawk-single.dts     |  51 ++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  54 ++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   4 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  53 ++-
 .../dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso |  62 +++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   8 +-
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts  |   3 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   8 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  92 +++-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 513 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 256 ++++++++++
 arch/arm64/boot/dts/renesas/rz-smarc-common.dtsi   |   3 -
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |  76 +++
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |   6 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |  30 ++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |  33 ++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |   7 +
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |  18 +
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h  |  21 +
 25 files changed, 1617 insertions(+), 83 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g057-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

