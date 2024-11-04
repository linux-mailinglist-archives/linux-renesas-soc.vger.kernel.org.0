Return-Path: <linux-renesas-soc+bounces-10280-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CB09BB612
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 14:28:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DC8B20B87
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Nov 2024 13:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DCA7DA8C;
	Mon,  4 Nov 2024 13:26:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848F2AE93
	for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Nov 2024 13:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726811; cv=none; b=ZECY5NkraCeFmCkjvjletU5PdIbgGkqTZ8srJX1JBUiuRTYlU70cVdid8g5rXTUfICySM6EoEJZGYc8hNFFzDmdPGeECVJyxvtx2PBoubY+KcPKXEqiwPvvNWLMonwJnUBDdn95R1Kj2eANkrLe73ddv/Z8tsWEQGEm2FuJeXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726811; c=relaxed/simple;
	bh=u79EFjEce3LuiNq9nNPGrseYOD4AArZlNT1muD7o8/I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J54dAh+ihPsRQ6Vzpm6mRV0BhvRruoZ4YW+r9ZZjuVlxLkRTHxIoxL82OFawzSihAci0Jn/uNXJ7fMEOdsdAMh5DO9ZnQCByd70UOsXc8c5TsxgRwwpHrxeIVpkEcpg+Y5UfBZD+EaDdt/CrcUMnsAmKGJRVDThTYmKJtjZL7F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by baptiste.telenet-ops.be with cmsmtp
	id YdSh2D00X31l0Qj01dShxN; Mon, 04 Nov 2024 14:26:42 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvO-U9;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BK3-KO;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.13 (take two)
Date: Mon,  4 Nov 2024 14:26:40 +0100
Message-Id: <cover.1730726155.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730726152.git.geert+renesas@glider.be>
References: <cover.1730726152.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 1e03bd2cf0d68a4138f2347bd77ef12b8726d214:

  arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for gpio-keys (2024-10-14 10:16:17 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.13-tag2

for you to fetch changes up to 0cd647cd53db0315361e41056e10739a5ee1e668:

  arm64: dts: renesas: rzg3s-smarc-som: Enable RTC (2024-11-03 12:29:51 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.13 (take two)

  - Add a CPU Operating Performance Points table for the RZ/V2H SoC,
  - Add Battery Backup Function (VBATTB) and RTC support for the RZ/G3S
    SoC and the RZ/G3S SMARC SoM,
  - Add DMAC support for MMC on the RZ/A1H SoC and the Genmai
    development board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Claudiu Beznea (6):
      dt-bindings: clock: r9a08g045-cpg: Add power domain ID for RTC
      dt-bindings: clock: renesas,r9a08g045-vbattb: Document VBATTB
      arm64: dts: renesas: r9a08g045: Add VBATTB node
      arm64: dts: renesas: r9a08g045: Add RTC node
      arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
      arm64: dts: renesas: rzg3s-smarc-som: Enable RTC

Geert Uytterhoeven (2):
      arm64: dts: renesas: white-hawk-cpu-common: Add pin control for DSI-eDP IRQ
      Merge tag 'renesas-r9a08g045-dt-binding-defs-tag3' into renesas-dts-for-v6.13

Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g057: Add OPP table
      arm64: dts: renesas: hihope: Drop #sound-dai-cells

Wolfram Sang (2):
      ARM: dts: renesas: r7s72100: Add DMAC node
      ARM: dts: renesas: r7s72100: Add DMA support to MMCIF

 .../bindings/clock/renesas,r9a08g045-vbattb.yaml   | 84 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r7s72100.dtsi            | 33 +++++++++
 arch/arm64/boot/dts/renesas/hihope-rev2.dtsi       |  3 -
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |  3 -
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 34 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 41 +++++++++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   | 16 +++++
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |  8 +++
 include/dt-bindings/clock/r9a08g045-cpg.h          |  1 +
 .../dt-bindings/clock/renesas,r9a08g045-vbattb.h   | 13 ++++
 10 files changed, 230 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a08g045-vbattb.yaml
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g045-vbattb.h

