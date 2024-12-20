Return-Path: <linux-renesas-soc+bounces-11628-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32049F9046
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 11:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A43EE1885064
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:31:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5AD32C859;
	Fri, 20 Dec 2024 10:31:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A71B392C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Dec 2024 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734690660; cv=none; b=ov0Zv5xiyta4MafVDGFdXMH1fEtpdBVciGPm9AiK256XrS8iRwNjGf/aWefsudlbw0mJzlSKaJH2TRnMkB0uxvS0HC9RzjA3xcFcNWopTM8pF1fJbjlL6UsGx5lYskAELUsSzabquW5IUQdk4NekNQwkHanzXB+VrEhBdyaB/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734690660; c=relaxed/simple;
	bh=I6iLdSW1Gwmw1A2qxjhBIVnsmW575NIgE1U82sKhDb0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rz4DSFJT+Km14Q0JhjR9efsa7qgmuDhMAxcFJdoTydcP0kZl0FM6zu2jmMooxlOvbfQd4aU6E3Y/SmmLQDVIcI4VCQ7PIDVAh80cEIS2UZm1hFFqLaKBoRfQkGapz97syBTbthnTc5mThYg2/9SpfslnANiATPYbqtWCsxwi2Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by baptiste.telenet-ops.be with cmsmtp
	id qyWq2D00X5V3mYk01yWqKA; Fri, 20 Dec 2024 11:30:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3r-LJ;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gN8-Di;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.14
Date: Fri, 20 Dec 2024 11:28:44 +0100
Message-Id: <cover.1734689797.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.14.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.14

    - Enable Watchdog support for the RZ/V2H(P) SoC and the RZ/V2H EVK
      board in the ARM64 defconfig,
    - Refresh shmobile_defconfig for v6.13-rc1,
    - Enable support for the Renesas RZ/G3E (R9A09G047) SoC in the ARM64
      defconfig.

  [GIT PULL 2/3] Renesas driver updates for v6.14

    - Initial support for the Renesas RZ/G3E (R9A09G047) SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.14

    - Add more serial (SCIF), power monitor, ADC, and sound support for
      the RZ/G3S SoC and the RZ/G3S SMARC SoM and development board,
    - Add support for the R-Car V4H ES3.0 (R8A779G3) SoC on the White Hawk
      Single development board,
    - Add display support for the R-Car V4M SoC and the Gray Hawk Single
      development board,
    - Add video capture support for the Gray Hawk Single development
      board,
    - Add initial support for the RZ/G3E (R9A09G047) SoC and the RZ/G3E
      SMARC SoM and Carrier-II EVK development board,
    - Add support for 5-port MATEnet on the Falcon Ethernet sub-board,
    - Miscellaneous fixes and improvements.

Note that the third part includes DT bindings and binding definitions
for the RZ/G3E SoC, which are shared by DT source files and the clock
driver.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

