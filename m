Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8CA29FF77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Oct 2020 09:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJ3IP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Oct 2020 04:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725784AbgJ3IP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Oct 2020 04:15:29 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F59C0613D2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Oct 2020 01:15:27 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by xavier.telenet-ops.be with bizsmtp
        id m8FR2300T4C55Sk018FRlL; Fri, 30 Oct 2020 09:15:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kYPZF-0019fd-Gt; Fri, 30 Oct 2020 09:15:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kYPZE-009daP-Gi; Fri, 30 Oct 2020 09:15:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Phong Hoang <phong.hoang.wz@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v2 0/2] R-Car V3U GPIO support
Date:   Fri, 30 Oct 2020 09:15:20 +0100
Message-Id: <20201030081522.2297074-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This RFC patch series adds support for the GPIO blocks on the R-Car V3U
(r8a77990) SoC.  As this is an RFC, I didn't include patches from v1[1]
that have not changed.  This series depends on [2].

Compared to v1 and the BSP, v2 takes a different approach to handle the
new General Input Register (INDT): instead of programming this register
during GPIO line configuration and depending on GPIO line direction, v2
enables input unconditionally in probe and resume, so the driver can
read pin state at all times.

Due to lack of hardware, the second patch is compile-tested only.

Thanks for your comments!

[1] "[PATCH/RFC 0/6] R-Car V3U GPIO support"
    https://lore.kernel.org/linux-renesas-soc/20201019120614.22149-1-geert+renesas@glider.be/
[2] "[PATCH 0/4] gpio: rcar: Cleanups and improvements"
    https://lore.kernel.org/linux-renesas-soc/20201028141504.1729093-1-geert+renesas@glider.be/

Geert Uytterhoeven (2):
  gpio: rcar: Optimize GPIO pin state read on R-Car Gen3
  gpio: rcar: Add R-Car V3U (R8A7799A) support

 drivers/gpio/gpio-rcar.c | 64 ++++++++++++++++++++++++++++++++++------
 1 file changed, 55 insertions(+), 9 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
