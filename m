Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA5E207499
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:31:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403953AbgFXNbD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:31:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403951AbgFXNbC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:31:02 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E5BC061799
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:31:01 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by xavier.telenet-ops.be with bizsmtp
        id v1Wz2200V3ySsk1011Wz2C; Wed, 24 Jun 2020 15:30:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0002Zw-CQ; Wed, 24 Jun 2020 15:30:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5UR-0001XM-Az; Wed, 24 Jun 2020 15:30:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL 0/7] arm64: renesas: defconfig: Update for v5.8-rc1
Date:   Wed, 24 Jun 2020 15:30:50 +0200
Message-Id: <20200624133057.5860-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series refreshes the defconfig for Renesas R-Car Gen3 and
RZ/G2 boards for v5.8-rc1, and enables missing support.

This is not intended for upstream merge, but I intend to apply this to
the topic/renesas-defconfig branch of my renesas-drivers repository.
I also plan to send a similar (but modular) version for the arm64
defconfig.

Thanks for your comments!

Geert Uytterhoeven (7):
  arm64: renesas: defconfig: Refresh for v5.8-rc1
  arm64: renesas: defconfig: Enable WL1837 support
  arm64: renesas: defconfig: Enable GETHER support
  arm64: renesas: defconfig: Enable ADV7180 and ADV7604 support
  arm64: renesas: defconfig: Enable IMX219 and OV5645 support
  arm64: renesas: defconfig: Enable ADV7511 support
  arm64: renesas: defconfig: Enable HD3SS3220 support

 arch/arm64/configs/renesas_defconfig | 32 +++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 8 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
