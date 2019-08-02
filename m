Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E16A07F664
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 14:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfHBMEL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 08:04:11 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:49038 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfHBMEL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 08:04:11 -0400
Received: from ramsan ([84.194.98.4])
        by laurent.telenet-ops.be with bizsmtp
        id kC462000205gfCL01C46MU; Fri, 02 Aug 2019 14:04:08 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1htWI1-0002hK-Tm; Fri, 02 Aug 2019 14:04:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1htWI1-0000P5-RU; Fri, 02 Aug 2019 14:04:05 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 0/3] Renesas SoC updates for v5.4
Date:   Fri,  2 Aug 2019 14:03:52 +0200
Message-Id: <20190802120355.1430-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.4.  As this is also my first pull request for arm-soc, I wanted
to start with something small.  You can expect more later.

It consists of 3 parts:

  [PULL 1/3] Renesas ARM64 DT updates for v5.4

    - CAN support for the HiHope RZ/G2E board,
    - BT and WLAN support for the HiHope RZ/G2[MN] boards,
    - Sound support for RZ/G2M,
    - Sort nodes in various SoC and board DTSes,
    - Small fixes and improvements.

  [PULL 2/3] Renesas driver updates for v5.4

    - Fix a flexible array member definition in the R-Car SYSC driver.

  [PULL 3/3] Renesas DT binding updates for v5.4

    - RZ/G2 updates for the R-Car CAN and CANFD DT bindings.

For now I more or less followed Simon's way of structuring the branches,
but I'm open for change.  Hence if you have any comments, or suggestions
for improving the workflow, please let me know.

Thanks for pulling, and for your comments!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
