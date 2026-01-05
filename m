Return-Path: <linux-renesas-soc+bounces-26298-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD45CF4B4A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 05 Jan 2026 17:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8860932B04D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Jan 2026 16:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E454334DB43;
	Mon,  5 Jan 2026 15:57:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2534DB42;
	Mon,  5 Jan 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628667; cv=none; b=MRpcYI5ZSkEVwogiXcqC/VCFN4PTJwzur2AcX2nY9f8cBB8mNED8RNUnGwkJn1+oxBLyD11klZRFRcuPkHZMRCa6Ipd7U5nStt8INuatAyC6H7oeswXTvrvN83W9Il5Ub5dn/rPFUGT7pxZ+HgvXEcCoVIxFGKu8TJwgiRM/fHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628667; c=relaxed/simple;
	bh=zXJVMM/a9guXo/CxRU7VFmFkrfab/Sw+x6rtZI0eT9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pGxbJUdhjSnneBlEiX+KU4g2hj9C1va9N2FxmREnXe9n1LnXXWkJZYxZ60JXxXQW9juXI/LRhPsFyh1ml7oqatMu3cDxezN0+xTLz3dEYJTkw134+xgnVKlIjE0IyVVOtB9cLKfhjlRS2AcBhcqqV5vUdjx/qfCguiwLvsnUNxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3435FC116D0;
	Mon,  5 Jan 2026 15:57:46 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.20
Date: Mon,  5 Jan 2026 16:57:37 +0100
Message-ID: <cover.1767628163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v6.20.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.20

    - Enable support for the Renesas RZ/G3E USB3 PHY and RZ/G3S PCIe
      drivers in the ARM64 defconfig,
    - Refresh the ARM SH-Mobile defconfig for v6.19-rc1.

  [GIT PULL 2/3] Renesas driver updates for v6.20

    - Enable Interrupt Controller (ICU) support on the RZ/N2H SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.20

    - Add USB3.2 host and more RSCI serial support for the RZ/G3E SoC and
      the RZ/G3E SMARC EVK board,
    - Add display and USB3.0 host support for the RZ/V2H and RZ/V2N SoCs
      and their EVK boards,
    - Add SPI NOR Flash support for the Yuridenki-Shokai Kakip board,
    - Add PCIe support for the RZ/G3S SoC and the RZ/G3S SMARC EVK board,
    - Add SPI, interrupt controller, and DMAC support for the RZ/T2H,
      RZ/N2H, and RZ/V2N SoCs,
    - Add NMI wakeup button support for the RZ/V2N EVK board,
    - Add thermal support for the RZ/V2N SoC,
    - Add system watchdog timer support for R-Car V3H, which is reserved
      for secure firmware,
    - Add window watchdog timer support for R-Car V3M, V3H, and Gen4 SoCs,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

