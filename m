Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C56C482B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfFQMkM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:40:12 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:51556 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727207AbfFQMkL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:40:11 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Rofo2000F3XaVaC01ofoht; Mon, 17 Jun 2019 14:39:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0001pq-A7; Mon, 17 Jun 2019 14:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0003OJ-7q; Mon, 17 Jun 2019 14:39:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: mstp: Combine private data and array allocation
Date:   Mon, 17 Jun 2019 14:39:40 +0200
Message-Id: <20190617123943.12990-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Mike, Stephen,

This patch series combines multiple allocations of driver-private data
and arrays in the Renesas clock drivers to single allocations, using
flexible array members and the new struct_size() helper.

This has a contextual dependency on "[PATCH] clk: renesas: cpg-mssr:
Update kerneldoc for struct cpg_mssr_priv".

To be queued in clk-renesas-for-v5.3, if approved.

Thanks for your comments!

Geert Uytterhoeven (3):
  clk: renesas: cpg-mssr: Combine driver-private and clock array
    allocation
  clk: renesas: div6: Combine clock-private and parent array allocation
  clk: renesas: mstp: Combine group-private and clock array allocation

 drivers/clk/renesas/clk-div6.c         | 19 +++++--------------
 drivers/clk/renesas/clk-mstp.c         | 12 ++++++------
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++--------------
 3 files changed, 17 insertions(+), 34 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
