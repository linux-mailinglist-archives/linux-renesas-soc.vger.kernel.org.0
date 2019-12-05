Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD981141CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 14:43:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729512AbfLENnw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 08:43:52 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:40040 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729165AbfLENnw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 08:43:52 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id aDjr210055USYZQ01Djrdi; Thu, 05 Dec 2019 14:43:51 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrQ7-0002BB-1D; Thu, 05 Dec 2019 14:43:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrQ6-0001g9-UC; Thu, 05 Dec 2019 14:43:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] mmc: renesas_sdhi: Add r8a77961 support
Date:   Thu,  5 Dec 2019 14:43:47 +0100
Message-Id: <20191205134349.6410-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series documents DT bindings for the SDHI controller in the
Renesas R-Car M3-W+ (R8A77961) SoC, and adds support for it to the
driver.

The second patch may be dropped, once "[PATCH] mmc: renesas_sdhi: remove
whitelist for internal DMAC"[1] has been accepted.

Thanks!

[1] https://lore.kernel.org/linux-mmc/20191203194859.917-1-wsa@the-dreams.de/

Geert Uytterhoeven (2):
  dt-bindings: mmc: renesas_sdhi: Document r8a77961 support
  mmc: renesas_sdhi_internal_dmac: Add r8a77961 support

 Documentation/devicetree/bindings/mmc/renesas,sdhi.txt | 3 ++-
 drivers/mmc/host/renesas_sdhi_internal_dmac.c          | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
