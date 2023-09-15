Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40CF7A19EF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Sep 2023 11:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjIOJGe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Sep 2023 05:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbjIOJGd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 05:06:33 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB08C49CF
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Sep 2023 02:04:52 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id m94q2A0031C8whw0694qsZ; Fri, 15 Sep 2023 11:04:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4kZ-003lJd-1N;
        Fri, 15 Sep 2023 11:04:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qh4ks-00Gdl1-1N;
        Fri, 15 Sep 2023 11:04:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFT 0/2] renesas: r8a7778/bockw: Add LBSC pin control and FLASH support
Date:   Fri, 15 Sep 2023 11:04:44 +0200
Message-Id: <cover.1694768311.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the NOR FLASH on the R-Car M1A-based
Bock-W development board.

As the remote Bock-W in Magnus' farm is MIA, I could not test this on
actual hardware.

Thanks for your comments!

Geert Uytterhoeven (2):
  [RFT] pinctrl: renesas: r8a7778: Add LBSC pins, groups, and functions
  [RFT] ARM: dts: renesas: bockw: Add FLASH node

 arch/arm/boot/dts/renesas/r8a7778-bockw.dts | 34 ++++++++++++++++++
 drivers/pinctrl/renesas/pfc-r8a7778.c       | 38 +++++++++++++++++++++
 2 files changed, 72 insertions(+)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
