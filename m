Return-Path: <linux-renesas-soc+bounces-3706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D699C87903C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F999281B44
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 09:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD76442A9E;
	Tue, 12 Mar 2024 09:02:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A877F12
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234167; cv=none; b=Yo0TDNouaLzU488413Qe+NXhlPsT/rcZSrnwe7HPFArGt5LuELebT2gl2eqYLf3d/Anj8WydRrN/cb0ZSjOYupxuHIL0MumeW9b7Jv35Wt730yy6qo5vKtO0yL9kRdx/G4jVbLNPsXRleffu2jETJaLTMJFn4nun/SItnMPIrVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234167; c=relaxed/simple;
	bh=9gnvzaueSysRfcvDGgD8244oB8z4z8auVBAL03DSCgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SdYgMAnP6esohgfppK8VyyYWa3SR1tN71fXeDj6irPnSOaXx027/4KZ8DbHyRg/E9XTZJ4H0IKl7/EVUH24OMgaAxPuoC0lpBfOxoIZBZBno+XPKrAQNtfFFiK6fdBMBdgrQhPSZJud28HAYiB21unxC8vk/hpivF6HxZBAws5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id xl2d2B0090SSLxL01l2ds8; Tue, 12 Mar 2024 10:02:38 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1d-003QlU-8U;
	Tue, 12 Mar 2024 10:02:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1t-005m6s-Es;
	Tue, 12 Mar 2024 10:02:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] arm64: dts: renesas: r8a779h0/gray-hawk-single: Add remaining serial ports
Date: Tue, 12 Mar 2024 10:02:33 +0100
Message-Id: <cover.1709741303.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series adds the remaining (High) Speed Serial Communication
Interfaces with FIFO ((H)SCIF) on the Renesas R-Car V4M (R8A779H0) SoC,
and enables the second debug serial port on the Renesas Gray Hawk Single
development board.

As SCIF0 can use the same pins as HSCIF0, it has been tested by
switching the first debug serial port from HSCIF0 to SCIF0.

I plan to queue this in renesas-devel for v6.10.

Thanks for your comments!

Geert Uytterhoeven (3):
  arm64: dts: renesas: r8a779h0: Add remaining HSCIF nodes
  arm64: dts: renesas: r8a779h0: Add SCIF nodes
  arm64: dts: renesas: gray-hawk-single: Add second debug serial port

 .../dts/renesas/r8a779h0-gray-hawk-single.dts |  25 +++-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi     | 127 +++++++++++++++++-
 2 files changed, 150 insertions(+), 2 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

