Return-Path: <linux-renesas-soc+bounces-23954-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147DC2491C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 11:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95F84465E0C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Oct 2025 10:45:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F217D33FE0A;
	Fri, 31 Oct 2025 10:43:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38AE20B21E;
	Fri, 31 Oct 2025 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907419; cv=none; b=cTHWFObMWNNqEiv98xrYGVBJfQPaTuQjtiZmUeo26h2jy/vExdvQC8fCIIar7En2H5q+D4klU/l5MdxVD9YHAElfSnGVXLrMfAsrBslUiGScCPn+pyWbAjtAY+jF2MB32MFP2mo8S/6ia0czCb6zJTbqhQeI0eaL4KWCaV7XpvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907419; c=relaxed/simple;
	bh=TSewfTpH5xBLtpTYq3pD2fzu1yJxIBT2F9nx3qxwc7s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7lnY5pQhbT3jYkgfvLqzu+5xd4Ep8fA7DiZUJip/uRqSgusPBqmflCaZBueQepyYnlqHTKMI6gyNROphXwaV+bmfvxCaxhDC+pHMwr00oZIeTTcM4W405Iu/j21YvkhNkG4Hhg/GpPowfyiRRvtJctiGZMYYtdz/NADZexRIyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A256C4CEF8;
	Fri, 31 Oct 2025 10:43:38 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas SoC updates for v6.19
Date: Fri, 31 Oct 2025 11:43:29 +0100
Message-ID: <cover.1761905410.git.geert+renesas@glider.be>
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
for v6.19.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.19

    - Enable support for the Renesas RZ/G3S and RZ/G3E thermal drivers,
      and the RZ/T2H and RZ/N2H ADC drivers in the ARM64 defconfig,
    - Refresh the ARM SH-Mobile defconfig for v6.18-rc1.

  [GIT PULL 2/3] Renesas driver updates for v6.19

    - Keep the WDTRSTCR.RESBAR2S bit in the default state on R-Car Gen4.

  [GIT PULL 3/3] Renesas DTS updates for v6.19

    - Add thermal support for the RZ/G3S and RZ/G3E SoCs,
    - Add DT overlay support for the Raspberry Pi Display 2 and Argon40
      fan hats on the Retronix Sparrow Hawk board,
    - Add eMMC support for the Eagle Function expansion board,
    - Add initial support for the R-Car X5H (R8A78000) SoC and the
      Ironhide development board,
    - Move interrupt-parent properties to root nodes,
    - Add system watchdog timer support for R-Car Gen3 and Gen4 SoCs,
      which is reserved for secure firmware on R-Car Gen3 boards,
    - Add ADC support for the RZ/T2H and RZ/N2H SoCs and their evaluation
      boards,
    - Add watchdog timer support on the R-Car V3M Starter Kit board,
    - Add Cortex-A55 PMU support on the RZ/V2H, RZ/V2N, RZ/T2H, and RZ/N2H
      SoCs,
    - Add Imagination Technologies PowerVR Series 6XT GX6250 GPU support
      on the R-Car M3-W and M3-W+ SoCs,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

