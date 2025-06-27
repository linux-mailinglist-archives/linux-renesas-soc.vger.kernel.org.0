Return-Path: <linux-renesas-soc+bounces-18834-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44831AEB7E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38115640044
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6603F2D3EE3;
	Fri, 27 Jun 2025 12:40:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E132D3207;
	Fri, 27 Jun 2025 12:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028024; cv=none; b=IF+e2LHiH6NwyUEAQvpWPjGDOAf89sfGcAuajS2uCoK5OBiypLxgv+3fReS/oFbYzcUoBcjOLpAHl5IwrQuhOVTPJ9BoLt6i1Ssm7qxlZE2Vu78iKynuIQGbiTYefRMcOJK/FPcmJL6uZ0gdhWjm0c0PyZjlr5a+0KU2PVfLRZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028024; c=relaxed/simple;
	bh=v2lCpA0F4K4NMIyhzSKRRpKfWzSIpA5TU69L4qXZElE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HbXp3Kcz0v8kkiQS/0a02l+Q/biEuO/nZqQDqMQCUCe/eb74ZFerZbr4usZM24R/270Tyijsn5Z2Ika4cRjwFRDgah/zC4oEqo/Wo2vu9KhVaOs7snE4ixEm224PfFwnBfggzB+WulAHY+1KAF+7iYvjPoRMmmumB0KvvX8C09E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE71C4CEED;
	Fri, 27 Jun 2025 12:40:22 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.17
Date: Fri, 27 Jun 2025 14:40:15 +0200
Message-ID: <cover.1751026657.git.geert+renesas@glider.be>
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
for v6.17.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.17

    - Enable modular support for Renesas RZ/V2H USB2PHY Port Reset Control
      in the ARM64 defconfig,
    - Refresh shmobile_defconfig for v6.16-rc2.

  [GIT PULL 2/4] Renesas driver updates for v6.17

    - Initial support for the Renesas RZ/T2H (R9A09G077) and RZ/N2H
      (R9A09G087) SoCs,
    - Convert the RZ/V2M External Power Sequence Controller (PWC) driver
      to the new GPIO line value setter callbacks.

  [GIT PULL 3/4] Renesas DT binding updates for v6.17

    - Document more board part numbers.

  [GIT PULL 4/4] Renesas DTS updates for v6.17

    - Add SPI FLASH, camera, and Ethernet support on the RZ/G3E SoC and/or
      the RZ/G3E SoM and SMARC Carrier-II EVK development board,
    - Add Ethernet, USB2, and PMIC support on the RZ/V2H and RZ/V2N SoCs
      and EVK boards,
    - Add timer, I2C, watchdog, and GPU support on the RZ/V2N SoC and the
      RZ/V2N EVK board,
    - Add debug LED support for the RZN1D-DB development board,
    - Improve PCIe clock description on the Retronix Sparrow Hawk board,
    - Miscellaneous fixes and improvements.

Notes:
  - PR 4/4 includes an immutable branch in the PCI subsystem, as a
    dependency for reworking the PCIe clock topology on the Retronix
    Sparrow Hawk board.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

