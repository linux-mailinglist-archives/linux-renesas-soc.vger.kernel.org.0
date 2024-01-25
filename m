Return-Path: <linux-renesas-soc+bounces-1818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D183C537
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B0A329497E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 14:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92C376EB40;
	Thu, 25 Jan 2024 14:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FA46DD1D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194153; cv=none; b=auphDyvP5E2qfVWQjhl5J+0v+yJmwo/OrLiSQT2UYBmz+h9eFhPbSJa3h53NVUG4RKow1YI9kxW8WQFHwSyWPa2HSKYXw1fVbZ0gvFOKxX/HlAGkfk2VaORsXSoZ9sTVqasuMuImquhihJFHbxAZvfGx+J2xbNYhkiWw6CHbrf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194153; c=relaxed/simple;
	bh=2/zLGCywPXNMD5m9HYw0HjcUDon0DXnT/FXN55i69DU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uq35/SmpTnBODESwHkezHCVYNtFDutUCsbwcCb+IUriB/hLNcA7DPqxjjllUDcIBlMtOrD/RmL9r91Zk/tWg/iJA/vc09snP30PEg7zU5hlMKuyAOoCFJarPZGQEZOHHghVRXR4YhqKQhq1r7W8lMfccqlYNIgjAqUklikUCQ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by xavier.telenet-ops.be with bizsmtp
	id f2p02B00B58agq2012p01J; Thu, 25 Jan 2024 15:49:01 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT11W-00GUrv-Hu;
	Thu, 25 Jan 2024 15:49:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT12K-00Fltp-F0;
	Thu, 25 Jan 2024 15:49:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/9] arm64: dts: renesas: Add support for more R-Car V4H and White Hawk variants
Date: Thu, 25 Jan 2024 15:48:50 +0100
Message-Id: <cover.1706192990.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series extends the existing support for the Renesas White
Hawk CPU and Breakout board stack by adding support for:
  1. Standalone use of the White Hawk CPU board,
  2. The White Hawk Single board, which is a single-board integration
     of the Renesas White Hawk CPU and Breakout board stack, based on
     the R-Car V4H ES2.0 (R8A779G2) SoC.

Changes compared to v1[1]:
  - Add Reviewed-by.
  - Split off restoring sort order into its own patch,
  - New patch "[PATCH v2 5/9] arm64: dts: renesas: white-hawk: Add SoC
    name to top-level comment",
  - Rebase on top of commit fc67495680f60e88 ("arm64: dts: renesas:
    white-hawk-cpu: Fix missing serial console pin control",
  - Refer to hscif0_pins directly,
  - Add SoC name to top-level comment.

I plan to queue this in renesas-devel for v6.9.

For testing, this series can be found at
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/v4h-white-hawk-more-v2

Thanks for your comments!

[1] "[PATCH/RFC 0/7] arm64: dts: renesas: Add support for more R-Car V4H and
     White Hawk variants"
    https://lore.kernel.org/linux-renesas-soc/cover.1702309604.git.geert+renesas@glider.be

Geert Uytterhoeven (9):
  dt-bindings: soc: renesas: Document R-Car V4H White Hawk Single
  arm64: dts: renesas: r8a779g0: Add standalone White Hawk CPU support
  arm64: dts: renesas: white-hawk-cpu: Restore sort order
  arm64: dts: renesas: white-hawk: Drop SoC parts from sub boards
  arm64: dts: renesas: white-hawk: Add SoC name to top-level comment
  arm64: dts: renesas: white-hawk-cpu: Factor out common parts
  arm64: dts: renesas: white-hawk: Factor out common parts
  arm64: dts: renesas: Add Renesas R8A779G2 SoC support
  arm64: dts: renesas: r8a779g2: Add White Hawk Single support

 .../bindings/soc/renesas/renesas.yaml         |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dts   |  13 +
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 368 +-----------------
 .../boot/dts/renesas/r8a779g0-white-hawk.dts  |  58 +--
 .../renesas/r8a779g2-white-hawk-single.dts    |  26 ++
 arch/arm64/boot/dts/renesas/r8a779g2.dtsi     |  12 +
 ...-white-hawk.dts => white-hawk-common.dtsi} |  12 +-
 ...wk-cpu.dtsi => white-hawk-cpu-common.dtsi} |  21 +-
 ...k-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} |   2 +-
 ...ethernet.dtsi => white-hawk-ethernet.dtsi} |   2 +-
 11 files changed, 80 insertions(+), 444 deletions(-)
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

