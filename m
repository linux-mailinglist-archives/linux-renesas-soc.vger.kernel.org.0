Return-Path: <linux-renesas-soc+bounces-8004-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CACFB95B0EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 10:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72CED282BB5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 08:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F27714C5A9;
	Thu, 22 Aug 2024 08:52:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2236A1CF8B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 08:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724316734; cv=none; b=og4isJmB1Pl1ZotY5Lu1LJXOUMfpsNQCdTlNEPKfyxSlXQZOqoe8W2wU0dpeCK7aNOEqYbUdlxjeQ+qN5g1o6JDO6uJ+rAM+Ool+0HTM/1oygWkK7epMcGzM1Ww+NnoZPWV1iVQPUYg2GXg7TRomKlyz4QY6WA78QFl6YTVd48c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724316734; c=relaxed/simple;
	bh=qhfXCmEObnAK2W8F8ACPSIlgszjoAaObyVQ+WZ0KQeQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4/8MKO/n30dYfNE1guyQOz9VP86ZOsyBOorRijsx46OJ15xbtZCfnwz2osh5YCR0OuE5j7K4xPkn1mmYqWoad5wCTX2Hi8sqSQpU8E7iH6tj9wgJrtlfOZy2L6gvHCC9D0kobI55c6glj//gPqNLpnyt9AqOkLzmNhtgYXaZe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:410c:b78a:c35b:cd3e])
	by albert.telenet-ops.be with bizsmtp
	id 2ws22D00W22R5AR06ws2yo; Thu, 22 Aug 2024 10:52:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y0-000VWx-23;
	Thu, 22 Aug 2024 10:52:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sh3Y2-002L5u-Ay;
	Thu, 22 Aug 2024 10:52:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.12
Date: Thu, 22 Aug 2024 10:51:53 +0200
Message-Id: <cover.1724316485.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724316478.git.geert+renesas@glider.be>
References: <cover.1724316478.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.12-tag1

for you to fetch changes up to ab7d885a33a7ef328a97ccae0d1340b68c3db9ad:

  arm64: dts: renesas: gray-hawk-single: Add CAN-FD support (2024-08-20 09:40:52 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.12

  - Add support for sound, push switches, and GP LEDs on the Gray Hawk
    Single development board,
  - Add missing iommus properties on R-Car Gen3/Gen4 and RZ/G2 SoCs,
  - Add PWM support for the R-Car V4M SoC,
  - Improve Ethernet descriptions on the RZ/G2L, RZ/G2LC, and RZ/G2UL
    SMARC SoMs,
  - Add DMAC support for the RZ/G3S SoC,
  - Add CAN-FD support for the R-Car V4M SoC and the Gray Hawk Single
    development board.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: dts: renesas: r9a08g045: Add DMAC node

Duy Nguyen (1):
      arm64: dts: renesas: r8a779h0: Add CAN-FD node

Geert Uytterhoeven (15):
      arm64: dts: renesas: r8a774a1: Add missing iommus properties
      arm64: dts: renesas: r8a774b1: Add missing iommus properties
      arm64: dts: renesas: r8a774c0: Add missing iommus properties
      arm64: dts: renesas: r8a774e1: Add missing iommus properties
      arm64: dts: renesas: r8a77960: Add missing iommus properties
      arm64: dts: renesas: r8a77961: Add missing iommus properties
      arm64: dts: renesas: r8a77965: Add missing iommus properties
      arm64: dts: renesas: r8a77970: Add missing iommus property
      arm64: dts: renesas: r8a77980: Add missing iommus properties
      arm64: dts: renesas: r8a779a0: Add missing iommus properties
      arm64: dts: renesas: r8a779g0: Add missing iommus properties
      arm64: dts: renesas: r8a779h0: Add missing iommus properties
      arm64: dts: renesas: gray-hawk-single: Add push switches
      arm64: dts: renesas: gray-hawk-single: Add GP LEDs
      arm64: dts: renesas: gray-hawk-single: Add CAN-FD support

Khanh Le (1):
      arm64: dts: renesas: r8a779h0: Add PWM device nodes

Kuninori Morimoto (1):
      arm64: dts: renesas: gray-hawk-single: Add Sound support

Paul Barker (6):
      arm64: dts: renesas: rzg2l: Enable Ethernet TXC output
      arm64: dts: renesas: rzg2lc: Enable Ethernet TXC output
      arm64: dts: renesas: rzg2ul: Enable Ethernet TXC output
      arm64: dts: renesas: rzg2l: Set Ethernet PVDD to 1.8V
      arm64: dts: renesas: rzg2lc: Set Ethernet PVDD to 1.8V
      arm64: dts: renesas: rzg2ul: Set Ethernet PVDD to 1.8V

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   6 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  26 +++
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   3 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   8 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  22 +++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  20 ++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   5 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 212 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  93 +++++++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  38 ++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |  86 +++++----
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |  43 +++--
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |  86 +++++----
 17 files changed, 575 insertions(+), 80 deletions(-)

