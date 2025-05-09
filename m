Return-Path: <linux-renesas-soc+bounces-16890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04FAB1747
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5844A1C41D77
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FCF2147F1;
	Fri,  9 May 2025 14:23:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE82147E4
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800580; cv=none; b=M5H2ZJKONI2cjGiaUdMk5hLO7GkTjD7MqHjyrJXzBZBmBdI6CvBaFJOK6czFUWz7XD7R26cz1SyQ19vbvLQcjpdT2OBakaWIvBWNcZ/tJ3Fw9tug5l1VG7Ujg0m9cRNeEmxPwgjNaxRuwsHyTsUhMeMGqQ2ItuzU0j1XCgDbkY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800580; c=relaxed/simple;
	bh=r34xzEzEJtSPIhXHzk7C12YCBtwha2KQnq+PUqB998Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZ3mqEJRdtkaQUbF0pgb9UUvFqn435+lzns5AFfkpqd2GuL169B5do1YZE+YM+bzEir2/VGJxGKa2mchLeSSizy2u3fDhTCZFZJzB/A/XTU2lA60Jx0VooPuLWYu7DKcpY7WD4C8PXIrJsk0zuoxI327e9WhvGEBY4otS8qhXLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by michel.telenet-ops.be with cmsmtp
	id n2No2E00J3X0DE5062NomE; Fri, 09 May 2025 16:22:50 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Ns-3YHG;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADO-22u0;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:30 +0200
Message-ID: <cover.1746798755.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
References: <cover.1746798748.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9f78a29caacef6df5d6a43e85d1112e39cfa3b34:

  arm64: dts: renesas: r8a779h0: Add ISP core function block (2025-04-24 11:29:11 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag2

for you to fetch changes up to b280613d480aa170e51029d5582bb4b666982b7c:

  ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port (2025-05-08 20:23:33 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16 (take two)

  - Add CANFD support for the RZ/G3E SoC and the RZ/G3E SMARC Carrier-II
    EVK development board,
  - Add support for Ethernet port A, 9-pin D-sub serial, and USB on the
    RZN1D-DB and RZN1D-EB development and expansion boards,
  - Add sound support for the Retronix Sparrow Hawk board,
  - Add General PWM Timer (GPT) support for the RZ/G2L and RZ/V2L SoCs
    and SMARC EVK boards,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (6):
      arm64: dts: renesas: r9a09g047: Add CANFD node
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CAN Transceiver
      arm64: dts: renesas: r9a07g044: Add GPT support
      arm64: dts: renesas: r9a07g054: Add GPT support
      arm64: dts: renesas: rzg2l-smarc: Enable GPT on carrier board

Geert Uytterhoeven (1):
      arm64: dts: renesas: white-hawk-single: Improve Ethernet TSN description

Krzysztof Kozlowski (1):
      arm64: dts: renesas: beacon-renesom: Align wifi node name with bindings

Kuninori Morimoto (1):
      arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support

Wolfram Sang (5):
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Add GMAC1 port
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Describe 9-pin D-sub serial port
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Enable USB device port
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Add pinmux for the CPLD
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable USB host port

 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  14 +++
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  84 +++++++++++++++
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   2 +-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 106 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         | 115 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts  |   7 ++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         | 115 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g054l2-smarc.dts  |   7 ++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  60 +++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  53 ++++++++++
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  29 ++++++
 .../boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi  |   5 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi       |   8 ++
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  14 ++-
 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi |   8 +-
 15 files changed, 621 insertions(+), 6 deletions(-)

