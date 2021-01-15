Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A2742F75C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Jan 2021 10:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbhAOJq5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 Jan 2021 04:46:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726849AbhAOJqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 Jan 2021 04:46:55 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC8B2C061757
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 Jan 2021 01:46:23 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id GxmL2400J4C55Sk06xmLMT; Fri, 15 Jan 2021 10:46:21 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l0LgS-003iyC-Bt; Fri, 15 Jan 2021 10:46:20 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l0LgR-009nCv-No; Fri, 15 Jan 2021 10:46:19 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas ARM SoC updates for v5.12
Date:   Fri, 15 Jan 2021 10:46:08 +0100
Message-Id: <20210115094610.2334058-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi arm-soc folks,

This is my first pull request for the inclusion of Renesas SoC updates
for v5.12.

It consists of 2 parts:

  [GIT PULL 1/2] Renesas ARM DT updates for v5.12

    - Timer (CMT/TMU) support for R-Car Gen3 SoCs,
    - Watchdog (RWDT), pincontrol (PFC), GPIO, and DMA (SYS-DMAC) support
      for the R-Car V3U SoC,
    - USB2 clock selector and SPI Multi I/O Bus Controller (RPC-IF)
      support for RZ/G2 SoCs,
    - Support for the Beacon EmbeddedWorks RZ/G2H and RZ/G2N kits,
    - Various fixes and improvements.

  [GIT PULL 2/2] Renesas DT binding updates for v5.12

    - Document suport for the Beacon EmbeddedWorks RZ/G2N and RZ/H kits.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
