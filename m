Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBA10394100
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 May 2021 12:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236456AbhE1Khb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 May 2021 06:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235361AbhE1Kha (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 May 2021 06:37:30 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A33FC06174A
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 May 2021 03:35:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:751e:82a3:f2a2:3459])
        by andre.telenet-ops.be with bizsmtp
        id AAbs2500f20MPSF01Absbu; Fri, 28 May 2021 12:35:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmZqK-00AD9W-8a; Fri, 28 May 2021 12:35:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lmXtS-007G5u-In; Fri, 28 May 2021 10:30:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.14
Date:   Fri, 28 May 2021 10:30:48 +0200
Message-Id: <cover.1622188833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.14.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM defconfig updates for v5.14

    - Refresh shmobile_defconfig for v5.13-rc1
    - Enable R-Car USB2 clock selector support

  [GIT PULL 2/2] Renesas ARM DT updates for v5.14

    - GPIO extender support for the Falcon development board,
    - Switches support for the ALT development board,
    - Miscellaneous fixes and improvements.

Note that the second part is based on v5.13-rc3, as older versions do
not include tags/renesas-arm-dt-for-v5.13-tag3.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
