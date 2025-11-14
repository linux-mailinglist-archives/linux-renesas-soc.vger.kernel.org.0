Return-Path: <linux-renesas-soc+bounces-24638-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 06250C5C9C6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ABA6834F751
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A136311953;
	Fri, 14 Nov 2025 10:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1042BF015;
	Fri, 14 Nov 2025 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116226; cv=none; b=HiVFcfZ0NkGxkBy54iojZxlbPBVdi80vQKpMEzyPx58OVU3CyLs3XVNZrGCQDqwdJ2VeG3nmupM2DMg8jkAX6qFMerkdvcv1JxitObuxUg6ksJqXM2PZ+cWYPj4oJ6Q+/5kyE/q/QD20ZeplZu+urUvNpOFE4ddorunW6YfL4Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116226; c=relaxed/simple;
	bh=4s+ig5VXmM2yeBG/N5ZAWG164A3uanXCktTzNCQWeWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQmSdhVZIk0HLlyVWt4FvCl+9XKYpB3Tqya68WY1ySeQLFEgAUmy0bE51vZ/KQxVtOxfnwXhjsuLC7dsFHQScJME9aO5UyyIv/fCdkXsOQbQjTPKVkIlL8/dKR5tiacrrcrGdKLxmito0pBP8DHfQLnXlUkKhkvMbAko+YhFLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FA1C4CEF8;
	Fri, 14 Nov 2025 10:30:24 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v6.19 (take two)
Date: Fri, 14 Nov 2025 11:30:17 +0100
Message-ID: <cover.1763115234.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763115230.git.geert+renesas@glider.be>
References: <cover.1763115230.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 9d22a34a016313137b9e534a918f1f9aa790aa69:

  arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels (2025-10-31 10:16:03 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.19-tag2

for you to fetch changes up to b272b94fd223977a79cb521dc7f14a8041b3fb3f:

  arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support (2025-11-13 21:19:22 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.19 (take two)

  - Add Imagination Technologies PowerVR Series 7XE GE7800 GPU support
    for the R-Car M3-N and V3U SoCs,
  - Add Ethernet support for the RZ/T2H and RZ/N2H SoCs and their
    evaluation boards,
  - Add ADC support for the RZ/N1D SoC,
  - Add thermal, NMI pushbutton, and RTC support for the RZ/V2H SoC and
    the RZ/V2H EVK development board,
  - Add USB2.0 support for the RZ/G3S SoC and the RZ/G3S SMARC Carrier
    II board.

----------------------------------------------------------------
Claudiu Beznea (2):
      arm64: dts: renesas: r9a08g045: Add USB support
      arm64: dts: renesas: rzg3s-smarc: Enable USB support

Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a779a0-dt-binding-defs-tag2' into renesas-dts-for-v6.19

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add the ADC device

Lad Prabhakar (5):
      arm64: dts: renesas: r9a09g077: Add ETHSS node
      arm64: dts: renesas: r9a09g087: Add ETHSS node
      arm64: dts: renesas: r9a09g077: Add GMAC nodes
      arm64: dts: renesas: r9a09g087: Add GMAC nodes
      arm64: dts: renesas: rzt2h-n2h-evk: Enable Ethernet support

Marek Vasut (1):
      arm64: dts: renesas: r8a77965: Add GE7800 GPU node

Niklas Söderlund (2):
      dt-bindings: clock: r8a779a0: Add ZG core clock
      arm64: dts: renesas: r8a779a0: Add GE7800 GPU node

Ovidiu Panait (4):
      arm64: dts: renesas: r9a09g057: Add TSU nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add NMI pushbutton support
      arm64: dts: renesas: r9a09g057: Add RTC node
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable RTC

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  10 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 118 +++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  90 ++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  17 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 482 ++++++++++++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  70 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 485 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  78 ++++
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  57 +++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  70 +++
 include/dt-bindings/clock/r8a779a0-cpg-mssr.h      |   1 +
 13 files changed, 1512 insertions(+)

