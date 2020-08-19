Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D46C249A0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Aug 2020 12:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgHSKO7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Aug 2020 06:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbgHSKO6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Aug 2020 06:14:58 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 19 Aug 2020 03:14:58 PDT
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F02C061757
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2020 03:14:58 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id HN9u2300G4C55Sk01N9uLQ; Wed, 19 Aug 2020 12:09:54 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L2Y-0008SN-C5; Wed, 19 Aug 2020 12:09:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1k8L2Y-000377-A9; Wed, 19 Aug 2020 12:09:54 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/2] arm64: renesas: defconfig: Updates
Date:   Wed, 19 Aug 2020 12:09:50 +0200
Message-Id: <20200819100952.11913-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series contains two updates for the defconfig for Renesas
R-Car Gen3 and RZ/G2 systems.

As usual, these are not intended for upstream merge, but to be applied
to my topic/renesas-defconfig branch.

Thanks for your comments!

Geert Uytterhoeven (2):
  [LOCAL] arm64: renesas: defconfig: Enable RPC-IF support
  [LOCAL] arm64: renesas: defconfig: Refresh for v5.9-rc1

 arch/arm64/configs/renesas_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
