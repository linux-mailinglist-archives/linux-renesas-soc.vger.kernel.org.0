Return-Path: <linux-renesas-soc+bounces-2587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F9850997
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 15:21:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9738AB21475
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 14:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47E35B5CA;
	Sun, 11 Feb 2024 14:21:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCED2599
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661303; cv=none; b=iS6gqri1Ly0UWDV6Qs1x7EhrOUjTpki7ZVEn3kTRqmUlqjbP9dGzkyEjgPq7rlbu17a+bKgZkJBYhF+DO5Lrw+vVRSH8yIv5XgLKSFSaDyWD87npp59aVxm9DEx8g5bYcBmTLz7FHMt1WPV0icgmDZNpoIJgDdfNgNQESEYbPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661303; c=relaxed/simple;
	bh=GWx/Oiz/PE85SPIToVPZhpca6aWbQI8XG8SZ8sqKG00=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ekekafljg37ZHoyqgjDSS6OsTBKCUG/z7o/j/ZHpscuEGJr+R6hx6H+o/OkOuqxmCj3btk73MO7ZNo8tE+5Lk1+rHPGUXnxdS+AizyNiAQZR7R8A2kcFuTOM6tiIW+0NUFiYQH9oMUJo4IWaGRCIGNjca/at10NBvCrBdtxv9hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by andre.telenet-ops.be with bizsmtp
	id lqMY2B00U493aJM01qMYJf; Sun, 11 Feb 2024 15:21:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAhz-000Qh5-K8;
	Sun, 11 Feb 2024 15:21:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAi4-006Wmo-Ix;
	Sun, 11 Feb 2024 15:21:32 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: rcar-gen4: Correct avb[01] reg sizes
Date: Sun, 11 Feb 2024 15:21:29 +0100
Message-Id: <cover.1707660323.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

All Ethernet AVB instances on R-Car Gen4 SoCs have registers related to
UDP/IP support, starting at offset 0x800.  However, the register blocks
for some (but not all) instances are too small to cover them.

This patch series fixes this by extending the register block sizes where
needed.  Note that this has no immediate impact on actual operation, as
the Linux driver does not use the UDP/IP registers.  Besides, ioremap()
granulatity is PAGE_SIZE, so the registers are accessible anyway.

I also considered introducing a new reg tuplet to cover the UDP/IP
registers.  However, that would complicate handling as some instances
(on some R-Car Gen2/3 SoCs) already have two reg tuplets, and there are
no reg-names defined:

    reg:
      items:
	- description: MAC register block
	- description: Stream buffer

So I think just enlarging the first register block would be fine.

To be queued in renesas-devel for v6.9, if you agree.

Thanks for your comments!

Geert Uytterhoeven (2):
  arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
  arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 4 ++--
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

