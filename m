Return-Path: <linux-renesas-soc+bounces-32799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DyxN+8/DGqPbgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:48:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EC657CC8E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 12:48:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC2BD3062F5F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 10:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80060352003;
	Tue, 19 May 2026 10:36:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675AB23393C;
	Tue, 19 May 2026 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779186973; cv=none; b=FC1lyq1i/Cz9GIuu1eX3Sa7tovTp/Pk+vdos77UMvzsJr1PauSeNcj2yJsPIsB4MU4LlftFijqhk/cCi6rnOANKkFZFizfXbKBAARlmY8/5xQf12mUwGhlV15ElyKROuDFjcykpKRhcAeRLQpYvywOYsMP6iMIQCPeJMi6L1HdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779186973; c=relaxed/simple;
	bh=YYYSibD/M6zecMN7nfYUk7zsiD8vR9cyDlLrgjuO2hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XyRpydwFRyVqWYcnH0dUEtFLuosGwTrG3eeI0i9vlwuCueIscPCCNpS4HLL9BoBUHpGENeKCJI+e+nBjZx1VCRpd63jO8Tfn7BTt4tMeM1KPDLUfh/VoDwImqg9I/AqI8HSt5dhYkqn9Gzvc2NIak4fIWPl05MUkaaT6okKYJJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82DAC2BCB3;
	Tue, 19 May 2026 10:36:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.2
Date: Tue, 19 May 2026 12:35:59 +0200
Message-ID: <cover.1779185462.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779185457.git.geert+renesas@glider.be>
References: <cover.1779185457.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32799-lists,linux-renesas-soc=lfdr.de,renesas];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.infradead.org,vger.kernel.org,glider.be];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,glider.be:mid]
X-Rspamd-Queue-Id: 41EC657CC8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag1

for you to fetch changes up to 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:

  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.2

  - Add GPU support for R-Car M3-W(+)-based ULCB and Salvator-X(S)
    development boards,
  - Add Ethernet, OPP table, interrupt, pin control, and watchdog
    support for the RZ/G3L SoC and the RZ/G3L SMARC SoM board,
  - Add Coresight support for the R-Mobile A1 and APE6 SoCs, and the
    Armadillo-800 EVA and APE6EVM development boards,
  - Miscellaneous fixes and improvements.

Note that this (1) is based on v7.1-rc3, as PowerVR GPU enablement has a
dependency on commit 26735dfdd8930d9e ("pmdomain: core: Fix detach
procedure for virtual devices in genpd"), and (2) includes:
  - Renesas SoC fixes for v7.1, which are already present in
    soc/for-next, but not yet in v7.1-rc4,
  - DT binding definition updates for the R-Mobile A1 and APE6 SoCs,
    which are shared by the clock subsystem and DT source files,
  - DT binding definitions for the RZ/G3L SoC, which are shared by the
    pin control subsystem and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (13):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document reset-names
      dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
      arm64: dts: renesas: r9a08g046: Add GBETH nodes
      arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH0) interface
      arm64: dts: renesas: Add pinctrl reset-names for RZ/G2L and RZ/V2H family SoCs
      arm64: dts: renesas: r9a08g046: Add OPP table
      arm64: dts: renesas: r9a08g046: Add ICU node
      arm64: dts: renesas: r9a08g046: Add pincontrol node
      arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
      arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for ETH0
      arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface
      arm64: dts: renesas: r9a08g046: Add wdt device node
      arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog

Geert Uytterhoeven (5):
      arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
      Merge tag 'renesas-fixes-for-v7.1-tag1' into renesas-dts-for-v7.2
      Merge tag 'renesas-r8a7740-dt-binding-defs-tag1' into renesas-dts-for-v7.2
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag2' into renesas-dts-for-v7.2
      Merge tag 'renesas-r8a73a4-dt-binding-defs-tag1' into renesas-dts-for-v7.2

Marek Vasut (24):
      arm64: dts: renesas: draak/ebisu-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: salvator-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: rz-smarc-cru-csi-ov5645: Fix missing cells and reg in CSI2 subnode
      arm64: dts: renesas: rz-smarc-du-adv7513-smarc: Fix missing cells and reg in DU subnode
      ARM: dts: renesas: r8a7778: Add missing unit address to bus node
      ARM: dts: renesas: r8a7779: Add missing unit address to bus node
      ARM: dts: renesas: r8a7792: Add missing unit address to bus node
      ARM: dts: renesas: r7s72100: Add missing unit address to bus node
      ARM: dts: renesas: genmai: Drop superfluous cells
      ARM: dts: renesas: rskrza1: Drop superfluous cells
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
      arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
      arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
      arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
      arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
      arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
      ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clocks
      ARM: dts: renesas: r8a7740: Describe coresight
      arm64: dts: renesas: gray-hawk-single: Fix AVB0 PHY node alignment
      arm64: dts: renesas: ebisu: Sort sound node
      arm64: dts: renesas: salvator-common: Sort sound node
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6
      ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
      ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
      arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

 .../bindings/clock/renesas,cpg-clocks.yaml         |   8 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  35 ++
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |   3 -
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |   2 -
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   2 +-
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             | 114 +++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi             | 116 +++++-
 arch/arm/boot/dts/renesas/r8a7778.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   2 +-
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dtso   |   5 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  34 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |  10 +-
 .../arm64/boot/dts/renesas/r8a77960-salvator-x.dts |   4 +
 .../boot/dts/renesas/r8a77960-salvator-xs.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts      |   4 +
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |   8 +-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 402 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  13 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   3 +
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |   5 +
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |   5 +
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 132 +++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  26 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dtso |   5 +
 include/dt-bindings/clock/r8a73a4-clock.h          |   2 +
 include/dt-bindings/clock/r8a7740-clock.h          |   2 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h            |  38 ++
 36 files changed, 945 insertions(+), 58 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

