Return-Path: <linux-renesas-soc+bounces-6552-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95623910724
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 16:01:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A2381C22A64
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 14:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64291AE857;
	Thu, 20 Jun 2024 13:57:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837A11AE85B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 13:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718891877; cv=none; b=mmxQN/55Tz9AAhoeD9bSUiU7Df6w/VAUTwdCez33p/YG90TwITfodA4uNIaguH7iqIRY3w+9V6UNAP6nGsHzm8AYkxpamnrcmw4v/pFkwMxphIEqTyNkfaVTgx1sdOjvpBHbK4QmpfBW5gvZAmpLW5jfGEef69azVDEXr+bQU/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718891877; c=relaxed/simple;
	bh=Q4TcSVNStTxtsPmVeYRqOnYR2eA7vSzu88AqX8i9SLY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gusK2JNuWhfEQK87FIF0/dSRVkX8dboSwr1Ht8gkKigHMQMicqEl9XQQL4FpUMpX9HlP3OQpt8JZUvQXeoX2pDmeAW3Ni+fBGUtS0ghzjEi/hXub6ASKHRsKABs8Qo7eBP6SXL2HO0HoJISMwSBGXzKBNaBiP09ZofMykCpr4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:260f:cd5c:91b1:523c])
	by baptiste.telenet-ops.be with bizsmtp
	id dpxm2C0010Y0hZi01pxmK8; Thu, 20 Jun 2024 15:57:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKIIL-00057o-Ur;
	Thu, 20 Jun 2024 15:57:45 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sKIIL-000Com-R5;
	Thu, 20 Jun 2024 15:57:45 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/9] dts: renesas: Add missing hypervisor virtual timer IRQs and interrupt-names
Date: Thu, 20 Jun 2024 15:57:30 +0200
Message-Id: <cover.1718890849.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Support for the hypervisor virtual timer interrupt of the ARM
architected timer was only added, together with interrupt-names support,
in commits a6cf39fbe133857a ("dt-bindings: timer: arm,arch_timer: Add
interrupt-names support") and 86332e9e3477af8f ("arm64: arch_timer:
Implement support for interrupt-names") in v5.13.

This patch series enhances device nodes that represent ARM architected
timers on Renesas SoCs, by (a) adding the missing hypervisor virtual
timer interrupts, and (b) adding interrupt-names properties for clarity.

I plan to queue this in renesas-devel for v6.11.

Thanks for your comments!

Geert Uytterhoeven (9):
  arm64: dts: renesas: r8a779a0: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r8a779f0: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r8a779g0: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r9a07g043u: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r9a07g044: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r9a07g054: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r9a08g045: Add missing hypervisor virtual timer
    IRQ
  ARM: dts: renesas: Add interrupt-names to arch timer nodes
  arm64: dts: renesas: Add interrupt-names to arch timer nodes

 arch/arm/boot/dts/renesas/r8a73a4.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7742.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7743.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7744.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7745.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a77470.dtsi     | 1 +
 arch/arm/boot/dts/renesas/r8a7790.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7791.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7792.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7793.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r8a7794.dtsi      | 1 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi    | 1 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77951.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77960.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77961.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77990.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a77995.dtsi   | 1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi   | 5 ++++-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi   | 5 ++++-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi   | 5 ++++-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi   | 2 ++
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 5 ++++-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi  | 5 ++++-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi  | 5 ++++-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi  | 5 ++++-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi  | 1 +
 33 files changed, 55 insertions(+), 7 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

