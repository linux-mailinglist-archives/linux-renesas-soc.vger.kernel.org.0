Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 498325FAFC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Jul 2019 17:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727599AbfGDPhd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Jul 2019 11:37:33 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:41550 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfGDPhd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jul 2019 11:37:33 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id YfdX2000305gfCL01fdXlr; Thu, 04 Jul 2019 17:37:31 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hj3nf-000835-1Z; Thu, 04 Jul 2019 17:37:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hj3nf-0002kR-0c; Thu, 04 Jul 2019 17:37:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH rza_u-boot-2017.05 0/2] rza2mevb: Allow using Ethernet when SDRAM is enabled
Date:   Thu,  4 Jul 2019 17:37:24 +0200
Message-Id: <20190704153726.10507-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi Chris,

To use the 64 MiB of SDRAM on the RZA2MEVB development board, SW6-4 must
be switched off, making the first Ethernet port unavailable.
Fortunately RZA2MEVB has two Ethernet ports, so this patch series makes
U-Boot fall back to using the second port instead.

Note that this does not apply to upstream U-Boot, as the sh_eth driver
has been reworked in upstream, and as upstream does not support RZA2MEVB
yet.

While this allows me to use TFTP, I still cannot boot my own non-XIP
Linux kernel (uImage with LOADADDR=0x0c008000), as it seems to crash in
the "blcs cache_on" in linux/arch/arm/boot/compressed/head.S.  A similar
kernel boots fine on RSK+RZA1.

Thanks for your comments!

Geert Uytterhoeven (2):
  net: sh_eth: Fix port offset on RZ/A2
  rza2mevb: Use second Ethernet port if first one is not available

 drivers/net/sh_eth.h       | 11 ++++++++---
 include/configs/rza2mevb.h |  4 ++++
 2 files changed, 12 insertions(+), 3 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
