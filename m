Return-Path: <linux-renesas-soc+bounces-1564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B40682D7FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 12:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D90D1F21217
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 11:03:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F9851E86C;
	Mon, 15 Jan 2024 11:03:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B61E867
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 11:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by xavier.telenet-ops.be with bizsmtp
	id az3A2B00j34Hgv901z3ArW; Mon, 15 Jan 2024 12:03:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPKjZ-00Fdgv-Tr;
	Mon, 15 Jan 2024 12:03:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPKkI-00Bz8j-LA;
	Mon, 15 Jan 2024 12:03:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] ARM: dts: renesas: r8a73a4: Clock fixes and improvements
Date: Mon, 15 Jan 2024 12:03:02 +0100
Message-Id: <cover.1705315614.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series contains fixes and improvements for clock descriptions
of the Renesas R-Mobile APE6 SoC and the APE6-EVM development board.

After comparing CPU core performance over a wide range of SoCs, I had
been wondering for a long time why DMIPS/MHZ for the Cortex-A15 CPU
cores on R-Mobile APE6 is slightly higher than on R-Car Gen2 SoCs.
It turned out to be untrue, as the R-Mobile APE6 DTS contains a wrong
crystal osciallator freqency, causing the CPU cores on R-Mobile APE6 to
run 4% faster than assumed by Linux.  The first patch fixes this.
The two other patches contain small improvements and a small fix, none
of which have any functional impact.

I plan to queue this in renesas-devel for v6.9.


Thanks for your comments!

Geert Uytterhoeven (3):
  ARM: dts: renesas: r8a73a4: Fix external clocks and clock rate
  ARM: dts: renesas: r8a73a4: Add cp clock
  ARM: dts: renesas: r8a73a4: Fix thermal parent clock

 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts | 12 ++++++++++
 arch/arm/boot/dts/renesas/r8a73a4.dtsi        | 23 +++++++++++++------
 2 files changed, 28 insertions(+), 7 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

