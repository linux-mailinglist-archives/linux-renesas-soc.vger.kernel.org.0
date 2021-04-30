Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA3136FB3D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Apr 2021 15:11:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhD3NLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Apr 2021 09:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbhD3NLt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Apr 2021 09:11:49 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C4FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Apr 2021 06:11:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by andre.telenet-ops.be with bizsmtp
        id z1Az240094p6Y38011Azio; Fri, 30 Apr 2021 15:10:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv5-001f3p-8E; Fri, 30 Apr 2021 15:10:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lcSv4-00FCOE-S2; Fri, 30 Apr 2021 15:10:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] ARM: dts: rcar2: Configure pull up for GPIO keys
Date:   Fri, 30 Apr 2021 15:10:50 +0200
Message-Id: <cover.1619785905.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patches series follows up on the work started with "[PATCH] ARM:
dts: koelsch: Configure pull-up for SOFT_SW GPIO keys"[1], and
explicitly configures pull-ups for pins used for GPIO keys without
external pull-up resistors on R-Car Gen2 boards, preceded by a small
cleanup.  Currently GPIO keys rely on the initial states of these pins,
which fortunately match the expectations, but it is better to be
explicit.

To actually make a difference, this depends on "[PATCH 00/12] pinctrl:
renesas: Add more bias pinconf support"[2].  Note that it is safe to
apply this series before [2] has landed, as pinctrl_bind_pins() does not
consider -ENOTSUPP a fatal error.

It would be great if people with access to the hardware could do similar
tests like I did on Koelsch[3].

I hope to queue this in renesas-devel for v5.14.

Thanks for your comments!

[1] https://lore.kernel.org/r/20210303132941.3938516-1-geert+renesas@glider.be/
[2] https://lore.kernel.org/r/cover.1619785375.git.geert+renesas@glider.be/	
[3] https://lore.kernel.org/r/20210303132619.3938128-1-geert+renesas@glider.be

Geert Uytterhoeven (5):
  ARM: dts: koelsch: Rename sw2 to keyboard
  ARM: dts: lager: Configure pull-up for SOFT_SW GPIO keys
  ARM: dts: blanche: Configure pull-up for SOFT_SW and SW25 GPIO keys
  ARM: dts: gose: Configure pull-up for SOFT_SW GPIO keys
  ARM: dts: silk: Configure pull-up for SOFT_SW GPIO keys

 arch/arm/boot/dts/r8a7790-lager.dts   |  8 ++++++++
 arch/arm/boot/dts/r8a7791-koelsch.dts |  4 ++--
 arch/arm/boot/dts/r8a7792-blanche.dts |  8 ++++++++
 arch/arm/boot/dts/r8a7793-gose.dts    | 10 +++++++++-
 arch/arm/boot/dts/r8a7794-silk.dts    | 10 +++++++++-
 5 files changed, 36 insertions(+), 4 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
