Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7916725D7C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Sep 2020 13:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730006AbgIDLsi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Sep 2020 07:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729969AbgIDLsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Sep 2020 07:48:33 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279AEC061247
        for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Sep 2020 04:48:31 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id PnoM2300E4C55Sk06noMQy; Fri, 04 Sep 2020 13:48:21 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0004eK-71; Fri, 04 Sep 2020 13:48:21 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACb-0007sk-4i; Fri, 04 Sep 2020 13:48:21 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/3] Renesas ARM SoC updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:16 +0200
Message-Id: <20200904114819.30254-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.10.

It consists of 3 parts:

  [GIT PULL 1/3] Renesas ARM defconfig updates for v5.10

    - Enable touchscreen support on the iWave RZ/G1E platform,
    - Update for PCIE_RCAR => CONFIG_PCIE_RCAR_{HOST,EP} split, including
      enabling the latter,
    - Enable FLASH support on various R-Car Gen3 boards,
    - Refresh shmobile_defconfig for v5.9-rc1.

  [GIT PULL 2/3] Renesas ARM DT updates for v5.10

    - Increase support for the RZ/G2H SoC on the HopeRun HiHope RZ/G2H
      board, and its display panel expansion board,
    - Increase support for the RZ/G1H SoC on the iWave RainboW SoM (G21M)
      and Qseven board (G21D),
    - SATA support for the HopeRun HiHope RZ/G2N board,
    - PCIe endpoint support for the RZ/G2M, RZ/G2E, and RZ/G2H SoCs,
    - Audio support for the R-Car M3-W+ SoC.
    - Minor fixes and improvements.

  [GIT PULL 3/3] Renesas driver updates for v5.10

    - Improve visual Kconfig structure.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
