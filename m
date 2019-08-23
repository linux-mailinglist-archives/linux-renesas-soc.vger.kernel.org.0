Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 754029AFA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Aug 2019 14:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391797AbfHWMg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Aug 2019 08:36:56 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:47740 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732384AbfHWMgz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Aug 2019 08:36:55 -0400
Received: from ramsan ([84.194.98.4])
        by baptiste.telenet-ops.be with bizsmtp
        id sccr2000805gfCL01ccrV0; Fri, 23 Aug 2019 14:36:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0006YL-Cy; Fri, 23 Aug 2019 14:36:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i18oF-0004uG-B7; Fri, 23 Aug 2019 14:36:51 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PULL 0/5] Renesas SoC updates for v5.4 (take two)
Date:   Fri, 23 Aug 2019 14:36:38 +0200
Message-Id: <20190823123643.18799-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v5.4.

It consists of 5 parts:

  [PULL 1/5] Renesas ARM DT updates for v5.4

    - Fix HSCIF PM Domain on R-Car H1,
    - PMU support for RZ/G1C.

  [PULL 2/5] Renesas ARM SoC updates for v5.4

    - Low-level debugging support for RZ/A2M.

  [PULL 3/5] Renesas ARM64 DT updates for v5.4 (take two)

    - Sort nodes in various SoC and board DTSes,
    - HDMI sound for HiHope RZ/G2M and R-Car M3-N Salvator-X(S) boards,
    - Limit EtherAVB to 100Mbps on the Ebisu and Draak boards,
    - Small fixes and improvements.

  [PULL 4/5] Renesas driver updates for v5.4 (take two)

    - Improve "always-on" PM Domain handling on SH/R-Mobile SoCs,
    - Automatic errata selection for Cortex-A7/A9,
    - Small fixes and improvements.

  [PULL 5/5] Renesas DT binding updates for v5.4 (take two)

    - Renesas DT binding doc filename cleanups,
    - R-Car Gen3 and RZ/G1 updates for the R-Car CAN and CANFD DT
      bindings.

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
