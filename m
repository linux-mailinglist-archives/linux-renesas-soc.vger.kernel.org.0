Return-Path: <linux-renesas-soc+bounces-9416-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A0709990436
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCC98B20DB9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19C0F21F434;
	Fri,  4 Oct 2024 13:22:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C91216A06
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048170; cv=none; b=Mku0dK/MW4Hz7dG4luOYwbboJAB5r5yigZtBHqeZ0dX1KK/Fnook5bZOT4X93CLl1CmKpgZ0vXS5042EBAq//2QDzBAeOZC0gxgVxRiNSU2TKC8Pf9MkigfWjhLsE/fgHcrarHMEXi7py5RakK6SDR24UWaVYLOd6zkbAyELSlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048170; c=relaxed/simple;
	bh=TGh7eOa0EBdIxKdSzn8xUltxSvBCZpatgt1kKjJJZqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WBlzX3gv7Cf5jvh5D6iyyVhNMStBvJMa9FikxkNZfO36H1+yewhNY50F9omKY+StPoflCuyfJzcAgvdSyNYy1uQcY+81OpVh3VGx8kjCsPE9aLymeotdF5u+QfvYRpYWN9X1l7HOlNwyaUxYEPeaFZkoXCHDIw5xvQQ8JLMHvMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by andre.telenet-ops.be with cmsmtp
	id LDNd2D00M4NXpdT01DNduz; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGL-001EmF-Cv;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yTe-4Z;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/20] renesas: dts: Use interrupts-extended
Date: Fri,  4 Oct 2024 14:52:42 +0200
Message-Id: <cover.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series is a follow-up to Wolfram's series "[PATCH 0/4] ARM:
dts: renesas: use interrupts-extended for gpio-keys"[1].  It replaces
pairs of "interrupt-parent" and "interrupts" properties in Renesas DTS
files by the more concise "interrupts-extended" property, as suggested
by [2].

To reduce the number of patches, I combined patches touching similar
device types.  I still have the original indiviual patches, so I can
easily remix upon request ;-)
    
I intend to queue this series in renesas-devel for v6.13.

Thanks for your comments!

[1] https://lore.kernel.org/20240927095414.10241-6-wsa+renesas@sang-engineering.com
[2] commit 6df58e485fd002f6 ("dt-bindings: Clarify interrupts-extended usage")

Geert Uytterhoeven (20):
  ARM: dts: renesas: Use interrupts-extended for Ethernet MACs
  ARM: dts: renesas: Use interrupts-extended for Ethernet PHYs
  ARM: dts: renesas: Use interrupts-extended for HDMI bridges
  ARM: dts: renesas: Use interrupts-extended for PMICs
  ARM: dts: renesas: Use interrupts-extended for touchpanels
  ARM: dts: renesas: Use interrupts-extended for video decoders
  ARM: dts: renesas: iwg22d-sodimm: Use interrupts-extended for port
    expander
  ARM: dts: renesas: r8a7742-iwg21m: Use interrupts-extended for RTC
  ARM: dts: renesas: kzm9g: Use interrupts-extended for I/O expander
  ARM: dts: renesas: kzm9g: Use interrupts-extended for sensors
  arm64: dts: renesas: Use interrupts-extended for DisplayPort bridges
  arm64: dts: renesas: Use interrupts-extended for Ethernet PHYs
  arm64: dts: renesas: Use interrupts-extended for HDMI bridges
  arm64: dts: renesas: Use interrupts-extended for I/O expanders
  arm64: dts: renesas: Use interrupts-extended for PMICs
  arm64: dts: renesas: Use interrupts-extended for USB muxes
  arm64: dts: renesas: Use interrupts-extended for video decoders
  arm64: dts: renesas: Use interrupts-extended for WLAN
  arm64: dts: renesas: beacon-renesom: Use interrupts-extended for
    touchscreen
  arm64: dts: renesas: rzg3s-smarc: Use interrupts-extended for
    gpio-keys

 arch/arm/boot/dts/renesas/emev2-kzm9d.dts      |  3 +--
 .../arm/boot/dts/renesas/iwg20d-q7-common.dtsi |  3 +--
 .../boot/dts/renesas/iwg20d-q7-dbcm-ca.dtsi    |  3 +--
 arch/arm/boot/dts/renesas/r8a73a4-ape6evm.dts  |  3 +--
 .../dts/renesas/r8a7740-armadillo800eva.dts    |  3 +--
 .../arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts |  3 +--
 arch/arm/boot/dts/renesas/r8a7742-iwg21m.dtsi  |  3 +--
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts |  3 +--
 .../renesas/r8a7745-iwg22d-sodimm-dbhd-ca.dts  |  3 +--
 .../boot/dts/renesas/r8a7745-iwg22d-sodimm.dts |  3 +--
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts |  3 +--
 .../boot/dts/renesas/r8a77470-iwg23s-sbc.dts   |  6 ++----
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts    |  3 +--
 arch/arm/boot/dts/renesas/r8a7779-marzen.dts   |  3 +--
 arch/arm/boot/dts/renesas/r8a7790-lager.dts    | 15 +++++----------
 arch/arm/boot/dts/renesas/r8a7790-stout.dts    | 15 +++++----------
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts  | 15 +++++----------
 arch/arm/boot/dts/renesas/r8a7791-porter.dts   | 12 ++++--------
 arch/arm/boot/dts/renesas/r8a7792-blanche.dts  |  9 +++------
 arch/arm/boot/dts/renesas/r8a7792-wheat.dts    |  3 +--
 arch/arm/boot/dts/renesas/r8a7793-gose.dts     | 15 +++++----------
 arch/arm/boot/dts/renesas/r8a7794-alt.dts      |  6 ++----
 arch/arm/boot/dts/renesas/r8a7794-silk.dts     |  9 +++------
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts     | 17 ++++++-----------
 .../dts/renesas/beacon-renesom-baseboard.dtsi  |  6 ++----
 .../boot/dts/renesas/beacon-renesom-som.dtsi   |  9 +++------
 arch/arm64/boot/dts/renesas/cat875.dtsi        |  3 +--
 arch/arm64/boot/dts/renesas/condor-common.dtsi |  6 ++----
 arch/arm64/boot/dts/renesas/draak.dtsi         |  6 ++----
 arch/arm64/boot/dts/renesas/ebisu.dtsi         | 17 ++++++-----------
 arch/arm64/boot/dts/renesas/hihope-common.dtsi |  3 +--
 .../arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi |  3 +--
 .../arm64/boot/dts/renesas/r8a774c0-cat874.dts |  9 +++------
 .../r8a77970-eagle-function-expansion.dtso     |  7 +++----
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts |  6 ++----
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts |  6 ++----
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts |  6 ++----
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi  |  3 +--
 .../arm64/boot/dts/renesas/r8a779a0-falcon.dts |  3 +--
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi  |  9 +++------
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts  |  6 ++----
 .../dts/renesas/r8a779g2-white-hawk-single.dts |  3 +--
 .../dts/renesas/r8a779h0-gray-hawk-single.dts  |  6 ++----
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi      |  6 ++----
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi   |  3 +--
 .../boot/dts/renesas/rzg2lc-smarc-som.dtsi     |  3 +--
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi  |  3 +--
 .../boot/dts/renesas/rzg2ul-smarc-som.dtsi     |  6 ++----
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi      |  6 ++----
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi   |  9 +++------
 .../boot/dts/renesas/salvator-common.dtsi      | 11 ++++-------
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi       | 18 ++++++------------
 arch/arm64/boot/dts/renesas/ulcb.dtsi          |  6 ++----
 .../dts/renesas/white-hawk-cpu-common.dtsi     |  9 +++------
 .../boot/dts/renesas/white-hawk-ethernet.dtsi  |  6 ++----
 55 files changed, 123 insertions(+), 241 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

