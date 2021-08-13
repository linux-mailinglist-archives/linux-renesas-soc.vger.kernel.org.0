Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0603EB401
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Aug 2021 12:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240118AbhHMK3F (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Aug 2021 06:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232931AbhHMK2x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Aug 2021 06:28:53 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB774C061756
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Aug 2021 03:28:17 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b151:f011:b544:c545])
        by michel.telenet-ops.be with bizsmtp
        id gyUG250041MlFFN06yUG82; Fri, 13 Aug 2021 12:28:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUQB-002Wu8-Tr; Fri, 13 Aug 2021 12:28:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mEUQB-007SeM-FT; Fri, 13 Aug 2021 12:28:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.15 (take two)
Date:   Fri, 13 Aug 2021 12:28:14 +0200
Message-Id: <cover.1628850207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit d28b1e03dc8d1070538ca3ea3f4e6732109ddf42:

  clk: renesas: r9a07g044: Add entry for fixed clock P0_DIV2 (2021-07-26 14:15:23 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v5.15-tag2

for you to fetch changes up to e8425dd55abb12881694875972465f40bb0fe41b:

  clk: renesas: Make CLK_R9A06G032 invisible (2021-08-13 12:05:41 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.15 (take two)

  - Make CLK_R9A06G032 invisible.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: renesas: Make CLK_R9A06G032 invisible

 drivers/clk/renesas/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
