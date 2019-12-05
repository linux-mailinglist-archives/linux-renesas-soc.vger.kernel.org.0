Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B560114217
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 14:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbfLEN7i (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 08:59:38 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:55348 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbfLEN7i (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 08:59:38 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id aDzY210065USYZQ01DzYQ6; Thu, 05 Dec 2019 14:59:36 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrfI-0002Ks-1D; Thu, 05 Dec 2019 14:59:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrfH-0001x4-VR; Thu, 05 Dec 2019 14:59:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/6] arm64: dts: renesas: r8a77961: Add more device nodes
Date:   Thu,  5 Dec 2019 14:59:24 +0100
Message-Id: <20191205135930.7454-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series broadens support for the R-Car M3-W+ (aka R-Car M3-W
ES3.0) Soc (R8A77961), by adding more device nodes to its DT source
file, up to what can be tested reasonably using remote access.

This has been tested on a Salvator-XS development board.
More details can be found in the individual patches.

To be queued in renesas-devel for v5.6.

Thanks for your comments!

Geert Uytterhoeven (6):
  arm64: dts: renesas: r8a77961: Add RWDT node
  arm64: dts: renesas: r8a77961: Add GPIO nodes
  arm64: dts: renesas: r8a77961: Add RAVB node
  arm64: dts: renesas: r8a77961: Add SYS-DMAC nodes
  arm64: dts: renesas: r8a77961: Add I2C nodes
  arm64: dts: renesas: r8a77961: Add SDHI nodes

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 390 +++++++++++++++++++++-
 1 file changed, 377 insertions(+), 13 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
