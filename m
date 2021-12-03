Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CAC467660
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243546AbhLCLfG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:35:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbhLCLe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:34:56 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E44C5C06173E
        for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Dec 2021 03:31:31 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:3191:9890:620a:6f4])
        by andre.telenet-ops.be with bizsmtp
        id RnXT2600Y3eLghq01nXTGf; Fri, 03 Dec 2021 12:31:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6ml-002IYN-FF; Fri, 03 Dec 2021 12:31:27 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mt6mk-000hQn-QQ; Fri, 03 Dec 2021 12:31:26 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/4] Renesas SoC updates for v5.17
Date:   Fri,  3 Dec 2021 12:31:17 +0100
Message-Id: <cover.1638530605.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi SoC folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.17.

It consists of 4 parts:

  [GIT PULL 1/4] Renesas ARM DT updates for v5.17

    - Serial, SPI, timer, watchdog, operating points, and QSPI FLASH
      support for the RZ/G2L SoC and the RZ/G2L SMARC EVK development
      board,
    - SDHI SDnH clocks for the R-Car Gen3 and RZ/G2 SoCs,
    - Display Unit support for the R-Car V3U SoC,
    - Miscellaneous fixes and improvements.

  [GIT PULL 2/4] Renesas ARM SoC updates for v5.17

    - Add a missing of_node_put().

  [GIT PULL 3/4] Renesas driver updates for v5.17

    - Add a remoteproc API for controlling the Cortex-R7 boot address on
      R-Car Gen3 SoCs,
    - Consolidate product register handling.

  [GIT PULL 4/4] Renesas DT binding updates for v5.17

    - Document SDHI SDnH clocks on R-Car Gen2 and later,
    - Document core support for the R-Car S4-8 (R8A779F0) SoC.

Note that due to dependencies between Renesas Clock and Renesas SDHI
driver changes, I'm handling Renesas SDHI changes for this cycle.
Hence the presence of a Renesas SDHI DT bindings update in part 4.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
