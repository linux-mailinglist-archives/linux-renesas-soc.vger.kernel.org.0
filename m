Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 737031310C8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Jan 2020 11:49:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726300AbgAFKtL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Jan 2020 05:49:11 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:57862 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgAFKtL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jan 2020 05:49:11 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id myp52100R5USYZQ06yp5RP; Mon, 06 Jan 2020 11:49:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0001yg-KJ; Mon, 06 Jan 2020 11:49:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ioPwX-0002Bp-IP; Mon, 06 Jan 2020 11:49:05 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/5] Renesas SoC updates for v5.6
Date:   Mon,  6 Jan 2020 11:48:52 +0100
Message-Id: <20200106104857.8361-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.6.

It consists of 5 parts:

  [GIT PULL 1/5] Renesas ARM defconfig updates for v5.6

    - Enable support for the display panel on the iwg20d board.

  [GIT PULL 2/5] Renesas ARM DT updates for v5.6

    - Touch screen support for the iwg20d board,
    - ARM global timer support on Cortex-A9 MPCore SoCs,
    - Miscellaneous fixes for issues detected by "make dtbs_check".

  [GIT PULL 3/5] Renesas ARM64 DT updates for v5.6

    - Remove now unused ARCH_R8A7796 config symbol,
    - Rename R-Car H3 and M3-W SoC, and ULCB board DTS files to increase
      naming consistency,
    - Miscellaneous fixes for issues detected by "make dtbs_check",
    - Enhance support for R-Car M3-W+,
    - Display support for the EK874 board,
    - Prepare for split of R-Car H3 ES1.x and ES2.0+ config symbols,
    - Minor fixes and improvements.

  [GIT PULL 4/5] Renesas driver updates for v5.6

    - Remove now unused ARCH_R8A7796 config symbol,
    - Fix a sparse warning,
    - Add split R-Car H3 ES1.x and ES2.0+ config symbols.

  [GIT PULL 5/5] Renesas DT binding updates for v5.6

    - Document TMU and CAN(FD) support for R-Car RZ/G2N.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
