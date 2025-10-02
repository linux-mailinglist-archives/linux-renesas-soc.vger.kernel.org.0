Return-Path: <linux-renesas-soc+bounces-22589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B946BB42EC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE46732703D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34822EC08E;
	Thu,  2 Oct 2025 14:40:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1C12C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416049; cv=none; b=CMkQw76I97aDt+y/DVfWpN9ehaoF4ihSizkhWyEl3QinY2pFzropwW/vanHiYhfn8t6lOgKF2BAur3+e4cflZFwOmu+KNd5LziH3Xgt4vtLc/iuYIh+nKSi/zSknMQrjErSnic9hfcvY1kluQ0koxxt941Gbx8/UvwGqUrsiCfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416049; c=relaxed/simple;
	bh=ksJRPGhBrP6PmzzrIa2iKyyJYpu2/wCO2tbjPHFW+Dg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=II3jznpceSGJg/HDCjhzvgFPdE3IluQhHd1vRBsfqO+/EIejr8eda+2rYhp0o1rm+1SBugfv1kcGXRQqTIloaYtiawBxJ4uGbfKjNr2N6nTfBGBi67SCeSN0g6u+5/w6mD666kPJnfMKy6fd3ZfTxN2yxr4g8helD3LOeFIBxGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C118C4CEF4;
	Thu,  2 Oct 2025 14:40:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] ARM: dts: renesas: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:28 +0200
Message-ID: <cover.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series is a follow-up to Morimoto-san's series[1] to move
interrupt-parent properties to the root nodes in Renesas ARM64
SoC-specific .dtsi files, which lets us replace several
interrupts-extended properties by the more concise interrupts
properties.  This series repeats the exercise for Renesas ARM32 SoCs.

Note that several .dtsi files predating the concept of the "soc" node
already had their GIC interrupt-parent properties at the root node.
Of the modified files, some had duplicate interrupt-parent properties.

I intend to queue this in renesas-devel for v6.19.

Thanks for your comments!

[1] "[PATCH 00/26] arm64: dts: renesas: move interrupt-parent to top
     node"
    https://lore.kernel.org/87cy7ga2x8.wl-kuninori.morimoto.gx@renesas.com/

Geert Uytterhoeven (13):
  ARM: dts: renesas: r7s72100: Move interrupt-parent to root node
  ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
  ARM: dts: renesas: r8a7742: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7743: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7744: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7745: Move interrupt-parent to root node
  ARM: dts: renesas: r8a77470: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7790: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7791: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7792: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7793: Move interrupt-parent to root node
  ARM: dts: renesas: r8a7794: Move interrupt-parent to root node
  ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node

 arch/arm/boot/dts/renesas/r7s72100.dtsi  |  4 ++--
 arch/arm/boot/dts/renesas/r7s9210.dtsi   |  1 -
 arch/arm/boot/dts/renesas/r8a7742.dtsi   | 26 ++++++++++++------------
 arch/arm/boot/dts/renesas/r8a7743.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7744.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7745.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a77470.dtsi  | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7790.dtsi   | 26 ++++++++++++------------
 arch/arm/boot/dts/renesas/r8a7791.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7792.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7793.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r8a7794.dtsi   | 14 ++++++-------
 arch/arm/boot/dts/renesas/r9a06g032.dtsi |  3 +--
 13 files changed, 85 insertions(+), 87 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

