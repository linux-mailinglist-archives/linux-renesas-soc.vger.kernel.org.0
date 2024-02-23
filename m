Return-Path: <linux-renesas-soc+bounces-3125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E47E86103B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 12:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAE9A2869D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Feb 2024 11:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4709C651BD;
	Fri, 23 Feb 2024 11:21:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FC45CDEF
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Feb 2024 11:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687279; cv=none; b=pBKQdwAnITw13JCFw6JaV0pppeTG33/IQmIPEX6OYPRI/jtCZvveNJ0cnRUHOXwEVNQAFJPgNbvF0U+peIQ/sDVxsU+dOwXW422UQrm4eigN7pGYpYtthaUofBuZoY9Z6Wx5JLJRUVsCfemk6TtFCS+PZzbhNmtElb7orjmi+tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687279; c=relaxed/simple;
	bh=MLPybQEysbBy9zL7bLruM5MwMQbtuGBkG1aKOPd4XFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mbnFlrih+3oWxzzO/7yC5XNHvs24djFzpidame8t5xYJnfGv4kQjrDpB1qm6suyt7uvls9NSjgwIJOS4+F0L1sMFGB6QL/Azf5/6/q1sLicDYQ1aThg9RriCtMphjSbb3TixbjFZdCH2rgGlPRowPn885B3CjDxSm0aRx0DeVWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6f61:ab26:80d6:d9d4])
	by xavier.telenet-ops.be with bizsmtp
	id qbM72B00Q2itsqh01bM7gT; Fri, 23 Feb 2024 12:21:09 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTbu-001P3l-Vg;
	Fri, 23 Feb 2024 12:21:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rdTc3-00D0P1-9o;
	Fri, 23 Feb 2024 12:21:07 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v6.9 (take two)
Date: Fri, 23 Feb 2024 12:20:57 +0100
Message-Id: <cover.1708687130.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.9.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas DT binding updates for v6.9 (take two)

    - Restore sort order,
    - Document preferred compatible naming,

  [GIT PULL 2/2] Renesas DTS updates for v6.9 (take two)

    - Add pin control, I2C, GPIO, CA76 cluster, Ethernet, SD/MMC, DMA, and
      HyperFLASH/QSPI (RPC) support for the R-Car V4M SoC,
    - Add I2C EEPROM, Ethernet, eMMC, and QSPI FLASH support for the Gray
      Hawk Single development board,
    - Fix PCIe power on ULCB development boards equipped with the
      Shimafuji Kingfisher extension,
    - Add PSCI support for the RZ/G3S SoC,
    - Add camera support for the RZ/G2UL SMARC EVK development board,
    - Add display support for the RZ/G2L{,C} and RZ/V2L SoCs and SMARC EVK
      development boards,
    - Miscellaneous fixes and improvements,

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

