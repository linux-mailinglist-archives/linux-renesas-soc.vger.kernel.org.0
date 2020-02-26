Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34BA716FCDA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2020 12:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbgBZLCb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:40252 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgBZLCb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Feb 2020 06:02:31 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id 7P2V2200H5USYZQ01P2ViD; Wed, 26 Feb 2020 12:02:29 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-0002Tx-7k; Wed, 26 Feb 2020 12:02:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6uST-00051y-5o; Wed, 26 Feb 2020 12:02:29 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.7
Date:   Wed, 26 Feb 2020 12:02:16 +0100
Message-Id: <20200226110221.19288-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.7.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM DT updates for v5.7

    - Miscellaneous fixes and improvements.

  [GIT PULL 2/5] Renesas ARM SoC updates for v5.7

    - Enable ARM global timer on Cortex-A9 MPCore SoCs,
    - A minor cleanup.

  [GIT PULL 3/5] Renesas ARM64 defconfig updates for v5.7

    - Restore R-Car M3-W support,
    - Enable additional support for Renesas platforms.

  [GIT PULL 4/5] Renesas ARM64 DT updates for v5.7

    - CryptoCell support for R-Car M3-W, M3-W+, M3-N, E3, and D3,
    - Miscellaneous fixes and improvements.

  [GIT PULL 5/5] Renesas driver updates for v5.7

    - Miscellaneous fixes and improvements.

Note that the first commit from "[GIT PULL 3/5] Renesas ARM64 defconfig
updates for v5.7" is also included in "[GIT PULL] Renesas fixes for
v5.6".

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
