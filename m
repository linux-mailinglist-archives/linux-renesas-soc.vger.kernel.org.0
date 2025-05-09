Return-Path: <linux-renesas-soc+bounces-16889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 121EEAB1744
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 833E2163236
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 14:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DF0213E89;
	Fri,  9 May 2025 14:22:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4008E2135DD
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 May 2025 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800579; cv=none; b=kW8YSKWX01utXZ2CtbkQgwOJAT4b/d3KQgQw1N03aUBYIFxVFBHkzDRfPIXOhmsQqXe2k6oSQczkg+cGyNzHj4Ght1/6JMLyc0k8xY113MEox2xDzIdrYPWGOyAXIUYEJin6QCJ9Z7dqS2DtoN43KLXimaMFGYtnqG8yEJo1nAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800579; c=relaxed/simple;
	bh=Z59UhVkh8HpVo25aLUl3L3YHpjAvvbvfcmFIMoWyezE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WU7GSzZPRPIhijFbvznP/WR/ywh6AAczKVoh8dkBcsdJN49MIl8VkLa1lPx+0F8irTRUEESrrCP6cFuIw+MjX7bhs910YyFYf9o769pAFS9xYcPOyPvmlZ/3qIVW4c5F1VIYQJPBCXkYDYH8mcYlMyJi3LFxxDLnW9XQNygObOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:805c:3876:152c:485c])
	by albert.telenet-ops.be with cmsmtp
	id n2No2E00T3X0DE5062NoaL; Fri, 09 May 2025 16:22:48 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOca-000000012Nh-3HGe;
	Fri, 09 May 2025 16:22:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uDOci-00000003ADD-1V9W;
	Fri, 09 May 2025 16:22:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM defconfig updates for v6.16 (take two)
Date: Fri,  9 May 2025 16:22:27 +0200
Message-ID: <cover.1746798748.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v6.16.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v6.16 (take two)

    - Enable modular support for the Renesas RZ/G2L GPT and MSIOF sound in
      the ARM64 defconfig,
    - Enable more support for RZN1D-DB/EB in shmobile_defconfig.

  [GIT PULL 2/3] Renesas driver updates for v6.16 (take two)

    - Cover all R-Car drivers in the ARM/RISC-V/RENESAS ARCHITECTURE
      maintainer entry,
    - Identify the Renesas RZ/V2N (R9A09G056) SoC.

  [GIT PULL 3/3] Renesas DTS updates for v6.16 (take two)

    - Add CANFD support for the RZ/G3E SoC and the RZ/G3E SMARC Carrier-II
      EVK development board,
    - Add support for Ethernet port A, 9-pin D-sub serial, and USB on the
      RZN1D-DB and RZN1D-EB development and expansion boards,
    - Add sound support for the Retronix Sparrow Hawk board,
    - Add General PWM Timer (GPT) support for the RZ/G2L and RZ/V2L SoCs
      and SMARC EVK boards,
    - Miscellaneous fixes and improvements.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

