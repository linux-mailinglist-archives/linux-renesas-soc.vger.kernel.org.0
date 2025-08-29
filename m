Return-Path: <linux-renesas-soc+bounces-21075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA6B3BAF5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 14:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB2B4201B65
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Aug 2025 12:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB2B314B64;
	Fri, 29 Aug 2025 12:18:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525BF314A8F;
	Fri, 29 Aug 2025 12:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756469903; cv=none; b=D/lSpoIklkrM8sbmiZKGPkgDOUcGxnUSGvyCIBziu3twC52nGbrl9wGiU6hv4GuI/7NyoQF+lRWDg1RDL570P05p7oWDyI1UVVwOrKiu8PsOsftCF4hCqEmt2hhJ3dEsOI2Vw38JLyUWeZyp6DMcr2ZkvzKJ24MxsEsi7hhn8P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756469903; c=relaxed/simple;
	bh=QwiOf0aCdnIJ9vinpN6RIATqIzH+5BZ9UJ3oz2zv8Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tKQhektev5sMm2VoObNhOH3tOSYwcRJf231hfScNzqgwfqTtsFVZRsD1474yQCsPtcqE0EXL67ioF7cGRf2YPtqCGE/Ze/rXRWsCogFGfjNedjyj43gi/BJHwBqe5FCJm/0PkB6AcWQjPjVk6BQqKEvGthbwIXs4AZX/mVMoO6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A41C4CEF0;
	Fri, 29 Aug 2025 12:18:21 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v6.18
Date: Fri, 29 Aug 2025 14:18:11 +0200
Message-ID: <cover.1756468041.git.geert+renesas@glider.be>
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
for v6.18.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v6.18

    - Enable support for the Renesas RZ/T2H serial driver and the
      RZ/V2H(P) RSPI driver in the ARM64 defconfig.

  [GIT PULL 2/4] Renesas ARM SoC updates for v6.18

    - Use the SZ_256K definition.

  [GIT PULL 3/4] Renesas driver updates for v6.18

    - Add syscon/regmap support to the RZ System Controller driver.

  [GIT PULL 4/4] Renesas DTS updates for v6.18

    - Add initial support for the RZ/T2H (R9A09G077) and RZ/N2H
      (R9A09G087) SoCs and their evaluation boards,
    - Add SPI support for the RZ/V2H SoC,
    - Add DMAC and I3C support for the RZ/G3E SoC,
    - Add I3C support for the RZ/G3S SoCs,
    - Miscellaneous fixes and improvements.

Note that PR 4/4 includes DT binding definition updates for the RZ/T2H
and RZ/N2H SoCs, which are shared by clock driver, pin control driver,
and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

