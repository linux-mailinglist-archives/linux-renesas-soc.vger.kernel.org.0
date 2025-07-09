Return-Path: <linux-renesas-soc+bounces-19467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 646A2AFF2C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 22:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 655F51C85DD1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 20:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1AB23B63D;
	Wed,  9 Jul 2025 20:14:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1146712E1CD;
	Wed,  9 Jul 2025 20:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752092065; cv=none; b=oqbrQppXn8ZGANDQvDMghT+iL18jQas4j2BsanVP/5LcW0n1a60XJyeL4Gr8+mXc7Z4zabEk21b5KNp9kzqlnB/Kt7DV0JbuS3MErxJ0IoFmjtqv+NRGbcX8t0McCRiYcT4gN1NWg2Gg9lCA+p45PgnRK7bUVO3YdnQUBk03Ios=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752092065; c=relaxed/simple;
	bh=6P9u73XtgeeeCvPDJfW/fHVdoehXGiVg5NtthXuxTV8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ItboV6lFFTuU3IKMlZ3pOMaWWyu6sqAnuSWTuYQJ2yL4WCD+N5kBRR1qZavuQlLFcZSGyD8OB4TjbV8EHCmruz85ts3WzLJJuqauYMriLqU5WBC76k+C+mNPctynHfFrIf9JBMnvcAL+4UNKgWm4O9xLsAC9560mHENwEAAcLG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3EAC4CEEF;
	Wed,  9 Jul 2025 20:14:23 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] pinctrl: renesas: Updates for v6.17 (take two)
Date: Wed,  9 Jul 2025 22:14:20 +0200
Message-ID: <cover.1752090472.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi Linus,

The following changes since commit 52161035571cd62be9865039b4be65615860dce0:

  pinctrl: renesas: rzg2l: Validate pins before setting mux function (2025-06-19 19:25:20 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-pinctrl-for-v6.17-tag2

for you to fetch changes up to 7000167796a00d64322dc3ed0c0970e31d481ed6:

  pinctrl: renesas: Simplify PINCTRL_RZV2M logic (2025-07-02 20:16:45 +0200)

----------------------------------------------------------------
pinctrl: renesas: Updates for v6.17 (take two)

  - Sort Kconfig symbols and improve their descriptions,
  - Simplify PINCTRL_RZV2M logic.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      pinctrl: renesas: Simplify PINCTRL_RZV2M logic

Kuninori Morimoto (2):
      pinctrl: renesas: Sort Renesas Kconfig configs
      pinctrl: renesas: Unify config naming

 drivers/pinctrl/renesas/Kconfig | 249 ++++++++++++++++++++--------------------
 1 file changed, 124 insertions(+), 125 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

