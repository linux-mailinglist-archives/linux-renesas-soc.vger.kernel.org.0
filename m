Return-Path: <linux-renesas-soc+bounces-1578-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229D482DA7C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 14:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58020B210C1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Jan 2024 13:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B36117547;
	Mon, 15 Jan 2024 13:46:53 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B07171D4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Jan 2024 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:1376:70aa:e074:32d3])
	by baptiste.telenet-ops.be with bizsmtp
	id b1mk2B00134Hgv9011mkqa; Mon, 15 Jan 2024 14:46:44 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPNHr-00FdxN-5H;
	Mon, 15 Jan 2024 14:46:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rPNIZ-00C0Wf-Tv;
	Mon, 15 Jan 2024 14:46:43 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] ARM/arm64: dts: renesas: Improve TMU interrupt descriptions
Date: Mon, 15 Jan 2024 14:46:38 +0100
Message-Id: <cover.1705325654.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

Some Timer Unit (TMU) instances with 3 channels support a fourth
interrupt: an input capture interrupt for the third channel.
The DT bindings are updated to reflect this in "PATCH] dt-bindings:
timer: renesas,tmu: Document input capture interrupt"[1], while this
patch series updates the DTS files.

I plan to queue this series in renesas-devel for v6.9, after acceptance
of the DT bindings update.

Thanks for your comments!

[1] https://lore.kernel.org/r/fb1e38c93e62221f94304edd980a2fb79c1f2995.1705325608.git.geert+renesas@glider.be

Geert Uytterhoeven (2):
  ARM: dts: renesas: Improve TMU interrupt descriptions
  arm64: dts: renesas: Improve TMU interrupt descriptions

 arch/arm/boot/dts/renesas/r8a7740.dtsi    |  2 ++
 arch/arm/boot/dts/renesas/r8a7778.dtsi    |  9 +++++++--
 arch/arm/boot/dts/renesas/r8a7779.dtsi    |  9 +++++++--
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 17 +++++++++++++----
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a77995.dtsi | 11 +++++++++--
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 17 +++++++++++++----
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 17 +++++++++++++----
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 17 +++++++++++++----
 18 files changed, 167 insertions(+), 42 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

