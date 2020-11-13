Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1682A2B1E48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Nov 2020 16:09:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbgKMPJF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 Nov 2020 10:09:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgKMPJE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Nov 2020 10:09:04 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F648C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2020 07:09:04 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id rr912300F4C55Sk06r91jz; Fri, 13 Nov 2020 16:09:01 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdahB-0028AM-1p; Fri, 13 Nov 2020 16:09:01 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kdahA-00GSnI-FR; Fri, 13 Nov 2020 16:09:00 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas ARM SoC updates for v5.11
Date:   Fri, 13 Nov 2020 16:08:50 +0100
Message-Id: <20201113150854.3923885-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.11.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM defconfig updates for v5.11

    - Enable support for the new R-Car V3U SoC in the arm64 defconfig,
    - Refresh shmobile_defconfig for v5.10-rc1.

  [GIT PULL 2/4] Renesas ARM DT updates for v5.11

    - Touch screen and OV5640 camera support for the iWave RainboW Qseven
      board (G21D), and its camera expansion board,
    - Support for the AISTARVISION MIPI Adapter V2.1 board connected to
      HiHope RZ/G2 boards,
    - SPI (MSIOF) support for the R-Car M3-W+ SoC,
    - Digital Radio Interface (DRIF) support for the R-Car M3-N SoC,
    - Initial support for the R-Car M3-W+ ULCB/Kingfisher board combo,
    - Minor fixes and improvements.

  [GIT PULL 3/4] Renesas driver updates for v5.11

    - Fix a mapping leak in the failure path of the R-Mobile System
      Controller driver.

  [GIT PULL 4/4] Renesas DT binding updates for v5.11

    - Document suport for the R-Car M3-W+ ULCB/Kingfisher board combo.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
