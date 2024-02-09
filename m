Return-Path: <linux-renesas-soc+bounces-2544-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E0884FA5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 17:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75F6EB2B672
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Feb 2024 16:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E520F84A26;
	Fri,  9 Feb 2024 16:55:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DA58175C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 16:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707497734; cv=none; b=fXeQi2AZSqbiCcMCiO5Ky9fRX3qyELy7/7Vdhz1e0LeIqUuB2KMrIIOS5p0tv66mQabLbUbQvTHYrnrqN83W8UMaEHXeyy/Q+QEj7YQRd7RZUIRAZDb+y+e+g1gBCBa6HmJrEVR6NGyJEqPnengh63UCHy1IKYb3udbiznjOXyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707497734; c=relaxed/simple;
	bh=x1le34vOMVl/IlIT2r3MCIDdNdMV7yRThEmSiBmvv3k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dda/SB3BajGZw9WUJzcVDXPPUTdJlroaNzaePE1KXge3W85KVMdMfqjfUw5hSo5ztP4gf0Yr5OkbEHh4GXEav5/UmTJY5g7muXp+BuRroySyBJlx9sTdmHBz4ZKjzaDCoOd8/OBBnV7lEZf7Tx9R0uE2XTTzGF1u5rq2L1yNcgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4TWg2n4GRlz4wyN1
	for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Feb 2024 17:55:29 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:55fd:ff17:c1c8:954d])
	by michel.telenet-ops.be with bizsmtp
	id l4vN2B00D4RKXn6064vNE1; Fri, 09 Feb 2024 17:55:22 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9m-0008H1-46;
	Fri, 09 Feb 2024 17:55:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rYU9q-0061HK-AI;
	Fri, 09 Feb 2024 17:55:22 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.9
Date: Fri,  9 Feb 2024 17:55:21 +0100
Message-Id: <cover.1707497084.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.9-tag1

for you to fetch changes up to fea58424e2523376ece6f734479e63061e17ad7f:

  pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28 (2024-01-31 14:50:44 +0100)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.9

  - Add pin groups for SCIF_CLK2 on R-Car V4H,
  - Add support for port pins P19 to P28 on RZ/Five,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Claudiu Beznea (1):
      pinctrl: renesas: rzg2l: Fix locking in rzg2l_dt_subnode_to_map()

Geert Uytterhoeven (2):
      pinctrl: renesas: r8a779g0: Add missing SCIF_CLK2 pin group/function
      pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs

Lad Prabhakar (3):
      pinctrl: renesas: rzg2l: Improve code for readability
      pinctrl: renesas: rzg2l: Include pinmap in RZG2L_GPIO_PORT_PACK() macro
      pinctrl: renesas: pinctrl-rzg2l: Add the missing port pins P19 to P28

 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |   4 +
 drivers/pinctrl/renesas/core.c              |   4 +-
 drivers/pinctrl/renesas/pfc-r8a779g0.c      |  14 ++
 drivers/pinctrl/renesas/pinctrl-rzg2l.c     | 307 +++++++++++++++++++++++-----
 4 files changed, 276 insertions(+), 53 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

