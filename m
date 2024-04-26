Return-Path: <linux-renesas-soc+bounces-4924-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3188B320B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Apr 2024 10:10:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0A68285E5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Apr 2024 08:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F46F13C8F8;
	Fri, 26 Apr 2024 08:10:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0020913C900
	for <linux-renesas-soc@vger.kernel.org>; Fri, 26 Apr 2024 08:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714119028; cv=none; b=hWgR9hhmVQ3E41ONuKeYIOM8oJ8ytFz50cDS+h5DPOKemy50tJnb88AYwmGGxPbgCvYf+QjFzah76H4QUPoL+Ebli/hNQMjf18VMMaecUJ2yC8hueVTsQ3HIoHdiJjB7nuNOtbsQr+SYcCWCd1BqxoVr4dQm0D7E8ju5MiCZ/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714119028; c=relaxed/simple;
	bh=PWs5K2o7hD2FhttCY45PVtj7N09NnHXkHaEhJQgE1ks=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r61L7gN7kfhcB/qhvc8wnYtIzVWYIxHgKoqAY6NrKPxeay+8roFnBHNumzA2ZsZtJ0vWLD7lc7zeRxDZmBoBrbBLi2i287eUMyAvvV4dY5huJJLBT+KOWnryb/LpeKHQE5JDrdDXC6ENIlTQITCVLvzyFSV3kLg2rJ9MJSxuj7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:a8cf:a8c7:966f:f6c0])
	by laurent.telenet-ops.be with bizsmtp
	id FkAK2C00C4stinQ01kAKnB; Fri, 26 Apr 2024 10:10:20 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s0GeH-00ACan-MB;
	Fri, 26 Apr 2024 10:10:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s0Gex-00Cea4-Lk;
	Fri, 26 Apr 2024 10:10:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.10
Date: Fri, 26 Apr 2024 10:10:18 +0200
Message-Id: <cover.1714118620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 02cd2d3be1c31a3fd328ee83e576340d34bc57d9:

  pinctrl: renesas: rzg2l: Configure the interrupt type on resume (2024-04-22 09:54:00 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.10-tag1

for you to fetch changes up to cd27553b0dee6fdc4a2535ab9fc3c8fbdd811d13:

  pinctrl: renesas: rzg2l: Limit 2.5V power supply to Ethernet interfaces (2024-04-25 10:35:05 +0200)

Thanks for pulling!

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.10

  - Add external interrupt pin groups on R-Car V4M,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Geert Uytterhoeven (2):
      pinctrl: renesas: r8a779h0: Fix IRQ suffixes
      pinctrl: renesas: r8a779h0: Add INTC-EX pins, groups, and function

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Remove extra space in function parameter

Paul Barker (1):
      pinctrl: renesas: rzg2l: Limit 2.5V power supply to Ethernet interfaces

 drivers/pinctrl/renesas/pfc-r8a779h0.c  | 136 +++++++++++++++++++++++++++++---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c |   4 +-
 2 files changed, 127 insertions(+), 13 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

