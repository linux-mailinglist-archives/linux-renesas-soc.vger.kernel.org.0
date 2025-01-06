Return-Path: <linux-renesas-soc+bounces-11881-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2577A02E10
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 17:44:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3F8016467D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2025 16:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801241DFE1E;
	Mon,  6 Jan 2025 16:42:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4FA1DFE04
	for <linux-renesas-soc@vger.kernel.org>; Mon,  6 Jan 2025 16:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736181735; cv=none; b=W+P5GSi/w1CtxjyAL23It/MiWeKg0vQmCPvir+aLnJSz507iS0d/KoQM8fpQuUcBkuwK0POJckeHB2KDd6U6O/rgMzMK1ZylFWa51xNQXvqUHuyzLAg7Eyu6Aq43ZriJ54xgan2rG3PoygQnB1eI5mt5o/MGP9yr7zf+Q80e/Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736181735; c=relaxed/simple;
	bh=Sb9bnWNlRYAXxzo56P48HJw0zLmj+ov1VyzsNp3iw5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=M4tw/UpsYUsocm0tdfvWD/XimPOHy9eCuvGiYdPxmFggh34MkpW4kz7Q+5BfanAp0nJkRH7Wj0YkmbeRcK6SglM1/OuyDIVpjTSwAWx+Ox8/sr7Oldl8ZX/eADJ6qtwg6GnEQQdlEwcIqJgT1eeLS0W+Hei6MtdrKIpESe735Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4YRg253TX3z4x1m5
	for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jan 2025 17:42:05 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:39d4:dc4e:b4ce:1377])
	by laurent.telenet-ops.be with cmsmtp
	id xshx2D00L3AZZFy01shxk2; Mon, 06 Jan 2025 17:41:57 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqAs-00000008NTv-3A5o;
	Mon, 06 Jan 2025 17:41:57 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tUqAv-00000004YZR-0Irs;
	Mon, 06 Jan 2025 17:41:57 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] Renesas DTS updates for v6.14 (take two)
Date: Mon,  6 Jan 2025 17:41:53 +0100
Message-ID: <cover.1736180859.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.14.

The following changes since commit acb247afab5bc2b4462f4dfc17a9d930e1153e52:

  arm64: dts: renesas: r9a09g047: Add I2C nodes (2024-12-17 09:42:52 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.14-tag2

for you to fetch changes up to c357e2295b7880b1d9d365c3389f06ef2eb464d0:

  arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders (2025-01-06 16:26:29 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.14 (take two)

  - Add pin control support for the RZ/G3E SoC and the RZ/G3E SMARC
    Carrier-II EVK development board,
  - Add Image Signal Processor helper block (FCPVX and VSPX) support for
    the R-Car V4H SoC,
  - Describe odd C-PHY wiring on the White Hawk CSI/DSI sub-board,
  - Miscellaneous fixes and improvements.

Note that this includes Pin Control DT binding and bindings definitions
for the RZ/G3E and RZ/V2H SoCs, which are shared by DT source files and
the pin control driver.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      dt-bindings: pinctrl: renesas: Add alpha-numerical port support for RZ/V2H
      dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
      arm64: dts: renesas: r9a09g047: Add pincontrol node
      arm64: dts: renesas: r9a09g047e57-smarc: Add SCIF pincontrol

Geert Uytterhoeven (2):
      Merge tag 'renesas-r9a09g057-dt-binding-defs-tag2' into renesas-dts-for-v6.14
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag2' into renesas-dts-for-v6.14

Jacopo Mondi (2):
      arm64: dts: renesas: r8a779g0: Add FCPVX instances
      arm64: dts: renesas: r8a779g0: Add VSPX instances

Niklas Söderlund (1):
      arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders

 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  7 ++--
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 40 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 13 +++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 13 +++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 36 +++++++++----------
 .../arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi |  2 ++
 .../pinctrl/renesas,r9a09g047-pinctrl.h            | 41 ++++++++++++++++++++++
 .../pinctrl/renesas,r9a09g057-pinctrl.h            | 31 ++++++++++++++++
 8 files changed, 163 insertions(+), 20 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

