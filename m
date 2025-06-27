Return-Path: <linux-renesas-soc+bounces-18840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3551AEB7E7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 14:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9B1A562481
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 12:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0FB2D3EE3;
	Fri, 27 Jun 2025 12:40:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F432676D9;
	Fri, 27 Jun 2025 12:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751028049; cv=none; b=PM9stzqi+IC5u1XKwOuVkk6P+nX2fZHB3pLKkbJYUjCkwqdywAo/zne9d11l/Y6TldgNg8OnTCWuumM4/wn0cPV12R/rcQlnDQ6YD5xbDOIeQzD1Hj3qR8x3fULZhkjaTk7p/ART/Qm6d7rfkroEyUY6T2ZVS9cFjaIxiPlf86A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751028049; c=relaxed/simple;
	bh=DcIi+xoDLI4cyhlFYtrSAv+rMTmWDelYO4iaxdla7iI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7Ksw0/9jaIz2AE1gm+WcwlfCz5+xuOv6NSPh/MUnGNbWUYXROJ6SFHbhD6XjsHk9IAyMmzBcXp6/oWP3ps71lKHRx58CsU4VWuwuqvnZs+HV7rvtr6mRn9Z9y5nnJgMPXHvGwAGNSvTePPJOAaXIlgxLUUy8ln+AwKN62Sg+Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DA65C4CEE3;
	Fri, 27 Jun 2025 12:40:48 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.17
Date: Fri, 27 Jun 2025 14:40:45 +0200
Message-ID: <cover.1751027166.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.17-tag1

for you to fetch changes up to 52161035571cd62be9865039b4be65615860dce0:

  pinctrl: renesas: rzg2l: Validate pins before setting mux function (2025-06-19 19:25:20 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.17

  - Use the new GPIO line value setter callbacks,
  - Validate pins before setting a mux function on RZ/G2L.

Thanks for pulling!

----------------------------------------------------------------
Bartosz Golaszewski (5):
      pinctrl: renesas: gpio: Use new GPIO line value setter callbacks
      pinctrl: renesas: rzg2l: Use new GPIO line value setter callbacks
      pinctrl: renesas: rza1: Use new GPIO line value setter callbacks
      pinctrl: renesas: rzv2m: Use new GPIO line value setter callbacks
      pinctrl: renesas: rza2: Use new GPIO line value setter callbacks

Lad Prabhakar (1):
      pinctrl: renesas: rzg2l: Validate pins before setting mux function

 drivers/pinctrl/renesas/gpio.c          |  6 ++--
 drivers/pinctrl/renesas/pinctrl-rza1.c  |  7 +++--
 drivers/pinctrl/renesas/pinctrl-rza2.c  |  7 +++--
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 53 +++++++++++++++++++--------------
 drivers/pinctrl/renesas/pinctrl-rzv2m.c |  8 +++--
 5 files changed, 47 insertions(+), 34 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

