Return-Path: <linux-renesas-soc+bounces-30531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAspJnnFx2mTcAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30531-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:11:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F9634E5A9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 13:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67798301A15A
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Mar 2026 12:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED452378D87;
	Sat, 28 Mar 2026 12:11:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496833D6D3;
	Sat, 28 Mar 2026 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774699876; cv=none; b=itzJsB+PB04mLo7f7ZI2eW2pEfYW1j4nBRBnCqaNxRPWmDyYOmfwn9FDdlQFJZ8ITB+pSyC1DYZdG6kq7Rrp0FvjQzw7i1RSISuxdFObT1sTnmSx3jmkS/ahrpiAIs2d1p0TJhvDHHtwHCQx4EHIPwJWqlFYDR7bdXt3kJPTADU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774699876; c=relaxed/simple;
	bh=fvBsFhuRYde5J/SUt+kmTmoaFwac7li+2oalBOGCssA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3Ur7OjOMvxAsHaZVIfltEkA7A9J+cOMajoYZfuoXBH7qgSPHtoHMuqfVkqFANEtuJHQhdxrq7ICNr+B25VwmjdkRUJr6NWG5cfD/hqciYejM/+iVOVLnmgGdqUOtcyC4oEIetuU3J0o6ekKZC3Euzf9agkgx1TOoa3qy8YYGlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73435C19424;
	Sat, 28 Mar 2026 12:11:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:06 +0100
Message-ID: <cover.1774606542.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
References: <cover.1774606536.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30531-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[glider.be];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 56F9634E5A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 0928a28daf017504e14920f4131bb99e3bc39dba:

  ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag2

for you to fetch changes up to be3810a2ebc0c81303a15392097bac9ee0cd6297:

  ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible strings (2026-03-26 20:00:35 +0100)

----------------------------------------------------------------
Renesas DTS updates for v7.1 (take two)

  - Add DT overlay support for the MayQueen PixPaper display on the
    Yuridenki-Shokai Kakip board,
  - Add Ethernet PHY interrupt support for the RZ/T2H and RZ/N2H EVK
    boards,
  - Add SPI and PCIe support for the RZ/G3E SoC and the RZ/G3E SMARC EVK
    board,
  - Add DT overlay support for the WaveShare 13.3" 1920x1080 DSI
    Capacitive Touch Display and the Olimex MIPI-HDMI adapter on the
    Retronix Sparrow Hawk board,
  - Drop several superfluous C22 Ethernet PHY compatible strings,
  - Remove WDT nodes meant for other CPU cores on the RZ/V2N SoC,
  - Remove unavailable LVDS panel support for the Beacon ReneSoM base
    board,
  - Add initial support for the RZ/G3L (R9A08G046) SoC, and the RZ/G3L
    SMARC SoM and EVK boards,
  - Add Versa3 clock generator support for the RZ/V2H EVK development
    board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: renesas: beacon-renesom: Remove LVDS Panel

Biju Das (5):
      dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3L SoC
      arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
      arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
      arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
      arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes

Geert Uytterhoeven (2):
      arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag1' into renesas-dts-for-v7.1

Herve Codina (Schneider Electric) (1):
      ARM: dts: r9a06g032: Add #address-cells to the GIC node

John Madieu (3):
      arm64: dts: renesas: r9a09g047: Add PCIe node
      arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference clock
      arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

Lad Prabhakar (4):
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jumpers
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jumper setup
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add PHY interrupt support
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY interrupt support

Marek Vasut (8):
      arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"
      arm64: dts: renesas: Drop RTL8211E PHY C22 compatible strings
      arm64: dts: renesas: Drop RTL8211F PHY C22 compatible strings
      arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible strings
      arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec properties
      ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop KSZ8081 PHY C22 compatible string
      ARM: dts: renesas: rza2mevb: Drop RTL8201F PHY C22 compatible string
      ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible strings

Ovidiu Panait (1):
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock generator node

Scott Murray (1):
      arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex MIPI-HDMI adapter

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add RSPI nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0

Wig Cheng (1):
      arm64: dts: renesas: r9a09g057h48-kakip: Add pixpaper display overlay

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  40 ++-
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts     |   3 +-
 .../boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts |   3 +-
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |   3 +-
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |   3 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |   3 +-
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |   3 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |   3 +-
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |   3 +-
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |   3 +-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   1 +
 arch/arm64/boot/dts/renesas/Makefile               |  11 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  74 -----
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   3 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   3 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   3 +-
 .../r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso     |  92 ++++++
 .../r8a779g3-sparrow-hawk-ws-display-13in.dtso     |  88 ++++++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 212 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  37 +++
 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   3 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 153 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  38 +++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  30 --
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   8 +-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  33 +-
 .../dts/renesas/r9a09g057h48-kakip-pixpaper.dtso   |  39 +++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  18 ++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  71 +++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  18 ++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  71 +++--
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  12 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   6 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   3 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   6 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  21 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  20 ++
 include/dt-bindings/clock/renesas,r9a08g046-cpg.h  | 342 +++++++++++++++++++++
 41 files changed, 1267 insertions(+), 235 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip-pixpaper.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g046-cpg.h

