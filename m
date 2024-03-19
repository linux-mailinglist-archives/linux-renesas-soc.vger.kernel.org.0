Return-Path: <linux-renesas-soc+bounces-3907-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54103880252
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 17:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3AE0B216CE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9508481AA7;
	Tue, 19 Mar 2024 16:29:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4A0823C4
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710865757; cv=none; b=YThE6chzvehhfbma4dYAtu+mmx1Qc7fTavueOektMDFDGQ0VPcE9g6ISb408Oj9X3YAuK6LtjBPZ51P6Oos71XKX/VYKgGL/X1fAolt0CuT3aXPnwI/tHPRr/fQ0QlfQvILSDkhCkM9ueSAzq/H2NFPWAm+TUOlbG2McKnlI22k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710865757; c=relaxed/simple;
	bh=+yEPRRVMSB2jQf67G51cwYKPa44I1w7pxw0dFFkkODQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OmsiJjIv5wuc5eTrDiCSpPPuil7NjMNaUWFPEapPANN/39Nw2O67oOFkgmASd8QL/wH3OuimiPwvD/V4syEs00e05+4ZkWkima5We8qoJjOfYJGVovmmufdiVX7E5w5jPIa7oWTDLtooeNVAc3VVUWD0zLHfd9+4+MgYP07IkNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id 0gVA2C00Y0SSLxL01gVAHt; Tue, 19 Mar 2024 17:29:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKZ-0046H4-QU;
	Tue, 19 Mar 2024 17:29:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKs-000pvP-Ll;
	Tue, 19 Mar 2024 17:29:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] ARM: dts: renesas: Add more TMU support
Date: Tue, 19 Mar 2024 17:29:04 +0100
Message-Id: <cover.1710864964.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds device nodes for the Timer Units (TMU) on the
R-Mobile APE6 SoC, and on various SoCs from the RZ/G1 and R-Car Gen2
family.

All TMU instances have been tested successfully using [1] on R-Mobile
APE6 (APE6EVM), and on R-Car H2 (Lager) and M2-W (Koelsch), except for
TMU3 on M2-W, which consistently fails the CLOCK_REALTIME test (why?).

Still to be queued in renesas-devel for v6.10?

Thanks for your comments!

[1] https://elinux.org/R-Car/Tests:timers

Geert Uytterhoeven (3):
  ARM: dts: renesas: r8a73a4: Add TMU nodes
  ARM: dts: renesas: rzg1: Add TMU nodes
  ARM: dts: renesas: rcar-gen2: Add TMU nodes

 arch/arm/boot/dts/renesas/r8a73a4.dtsi    | 37 ++++++++++++++
 arch/arm/boot/dts/renesas/r8a7742.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7743.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7744.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7745.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a77470.dtsi   | 44 +++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7790.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7791.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7792.dtsi    | 59 +++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7793.dtsi    | 58 ++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7794.dtsi    | 58 ++++++++++++++++++++++
 include/dt-bindings/clock/r8a73a4-clock.h |  4 ++
 12 files changed, 608 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

