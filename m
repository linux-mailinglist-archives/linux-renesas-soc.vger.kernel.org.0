Return-Path: <linux-renesas-soc+bounces-7101-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8F29284E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 11:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90BAA1F216D1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2024 09:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E8F145B3E;
	Fri,  5 Jul 2024 09:15:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A871459E2
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jul 2024 09:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170936; cv=none; b=IpVM6IzBTKmo3MyvnPvYitTIOIiqIUjeUAL4tFuDHQTsDSuem/t43yCgK7hJFBNsmAmfPIpGukUsdzQEf1LtuaDSewRdDsLXlW8sUtMyNtgvPLWaxw7uog00fMBXxKEELiLfTPGMF8unWmDQtcDNDvKTSq7I1ISx+2llnZSKOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170936; c=relaxed/simple;
	bh=JCZMTjW46n8NQ6uToNzYmd2jppFqEHJhP/YOZkuwjYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UWR9WiG2rRdf+3m1iPBpsw6saZq5v/OZgEvbfQK2yfSXdCTRLGZRl7eEYQFQKhUq7+ZGeyhr1vYWPaCSbnWOPfojnBj6I9h+huCSGsTXFrOLobkx4CCAhKVvnx5pieHLvRyqdaOAsQMmkXGkaMzQeoqeG1hhd4lWAp51DmI42JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:c3ba:e01c:f6c8:df75])
	by laurent.telenet-ops.be with bizsmtp
	id jlFX2C00J36r8Me01lFXzW; Fri, 05 Jul 2024 11:15:31 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sPf2G-001F95-PW;
	Fri, 05 Jul 2024 11:15:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sPf2R-002M5P-9j;
	Fri, 05 Jul 2024 11:15:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.11 (take three)
Date: Fri,  5 Jul 2024 11:15:30 +0200
Message-Id: <cover.1720170526.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 71062e52fc0aea0f3477aaaaa789226388a7eeaf:

  pinctrl: renesas: r8a779h0: Remove unneeded separators (2024-07-01 11:27:39 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.11-tag3

for you to fetch changes up to 2453e858e945e5e2fa8da9fde8584995e7dd17d1:

  pinctrl: renesas: rzg2l: Support output enable on RZ/G2L (2024-07-04 19:22:03 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.11 (take three)

  - Support output enable on RZ/G2L.

This is a hard dependency for setting output enable in the various
RZ/G2L family DTS files.  So I'd rather see this in v6.11, to avoid
having to postpone the DTS changes to v6.13.

Thanks for pulling!

----------------------------------------------------------------
Paul Barker (3):
      pinctrl: renesas: rzg2l: Clarify OEN read/write support
      pinctrl: renesas: rzg2l: Clean up and refactor OEN read/write functions
      pinctrl: renesas: rzg2l: Support output enable on RZ/G2L

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 144 +++++++++++++++++++++-----------
 1 file changed, 95 insertions(+), 49 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

