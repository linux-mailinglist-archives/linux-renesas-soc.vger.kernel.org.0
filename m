Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B3CB20744D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jun 2020 15:19:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgFXNTh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jun 2020 09:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387915AbgFXNTg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jun 2020 09:19:36 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD9EC061795
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Jun 2020 06:19:36 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:55d:3294:1dc4:d387])
        by michel.telenet-ops.be with bizsmtp
        id v1KY2200f3ySsk1061KY9j; Wed, 24 Jun 2020 15:19:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-00027J-KQ; Wed, 24 Jun 2020 15:19:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jo5JM-0000yI-Iz; Wed, 24 Jun 2020 15:19:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] ARM: shmobile: defconfig: Update for v5.8-rc1
Date:   Wed, 24 Jun 2020 15:19:24 +0200
Message-Id: <20200624131931.3686-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series refresh the defconfig for Renesas ARM boards for
v5.8-rc1, and enables missing support.

I intend to queue this in renesas-devel for v5.9, and plan to send a
similar (but modular) version for multi_v7_defconfig.

Thanks for your comments!

Geert Uytterhoeven (7):
  ARM: shmobile: defconfig: Refresh for v5.8-rc1
  ARM: shmobile: defconfig: Enable DA9063 ONKEY support
  ARM: shmobile: defconfig: Enable CAT9554 support
  ARM: shmobile: defconfig: Enable RZ/A watchdog support
  ARM: shmobile: defconfig: Enable RZ/A1 CEU support
  ARM: shmobile: defconfig: Enable ADV7612 CEC support
  ARM: shmobile: defconfig: Enable RZ/A1H RTC support

 arch/arm/configs/shmobile_defconfig | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
