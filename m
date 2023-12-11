Return-Path: <linux-renesas-soc+bounces-892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3C80D060
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5072B20955
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C240749F8A;
	Mon, 11 Dec 2023 16:02:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61F1ED
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:32 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by andre.telenet-ops.be with bizsmtp
	id M41R2B0073oFjQr0141RLv; Mon, 11 Dec 2023 17:01:25 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiL-00BkAz-Gs;
	Mon, 11 Dec 2023 17:01:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiij-00BmVm-5D;
	Mon, 11 Dec 2023 17:01:25 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 0/7] arm64: dts: renesas: Add support for more R-Car V4H and White Hawk variants
Date: Mon, 11 Dec 2023 17:01:15 +0100
Message-Id: <cover.1702309604.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This RFC patch series extends the existing support for the Renesas White
Hawk CPU and Breakout board stack by adding support for:
  1. Standalone use of the White Hawk CPU board,
  2. The White Hawk Single board, which is a single-board integration
     of the Renesas White Hawk CPU and Breakout board stack, based on
     the R-Car V4H ES2.0 (R8A779G2) SoC.

Main topics for bike-shedding^Wdiscussion are the new compatible values,
and the naming of new DTS files.

Thanks for your comments!

Geert Uytterhoeven (7):
  [RFC] dt-bindings: soc: renesas: Document R-Car V4H White Hawk Single
  arm64: dts: renesas: r8a779g0: Add standalone White Hawk CPU support
  arm64: dts: renesas: Add Renesas R8A779G2 SoC support
  arm64: dts: renesas: Drop SoC part from White Hawk sub boards
  arm64: dts: renesas: r8a779g0: white-hawk-cpu: Factor out common parts
  arm64: dts: renesas: r8a779g0: white-hawk: Factor out common parts
  arm64: dts: renesas: r8a779g0: Add White Hawk Single support

 .../bindings/soc/renesas/renesas.yaml         |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dts   |  13 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 365 +-----------------
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  |  56 +--
 .../renesas/r8a779g2-white-hawk-single.dts    |  28 ++
 arch/arm64/boot/dts/renesas/r8a779g2.dtsi     |  12 +
 ...-white-hawk.dts => white-hawk-common.dtsi} |  12 +-
 ...wk-cpu.dtsi => white-hawk-cpu-common.dtsi} |  24 +-
 ...k-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} |   2 +-
 ...ethernet.dtsi => white-hawk-ethernet.dtsi} |   2 +-
 11 files changed, 84 insertions(+), 440 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2.dtsi
 copy arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk.dts => white-hawk-common.dtsi} (71%)
 copy arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-cpu.dtsi => white-hawk-cpu-common.dtsi} (97%)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} (97%)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ethernet.dtsi => white-hawk-ethernet.dtsi} (76%)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

