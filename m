Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050BF3B1D0B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 17:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhFWPEx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 11:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhFWPEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 11:04:52 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC48FC061756
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 08:02:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9418:90dd:e41:936d])
        by laurent.telenet-ops.be with bizsmtp
        id Lf2Y2500A1TrtvA01f2YC7; Wed, 23 Jun 2021 17:02:32 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lw4Od-002yqa-VW; Wed, 23 Jun 2021 17:02:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lw4Od-0033RT-JE; Wed, 23 Jun 2021 17:02:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] arm64: dts: renesas: r8a779a0: Add INTC-EX support
Date:   Wed, 23 Jun 2021 17:02:27 +0200
Message-Id: <cover.1624460378.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series adds support for the Interrupt Controller for External
Devices (INT-EC) in the Renesas R-Car V3U (r8a779a0) SoC.

As there are two known issues, I'm posting this to a limited audience:

  1. External interrupts have not been tested.

     Kieran: perhaps IRQ0 can be tested on Falcon with the MIPI DSI/eDP
     bridge, by changing

	 -    interrupt-parent = <&gpio1>;
	 -    interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
	 +    interrupt-parent = <&intc_ex>;
	 +    interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;

     ? The "ti,sn65dsi86" driver doesn't seem to use interrupts, though,
     so I don't know how feasible this is.

     Alternatively, with physical access, IRQ0 is available on test
     point CP47, and IRQ2 on the GPIO CN.

  2. As recent revisions of R-Car Gen3 Hardware User's Manuals stopped
     documenting module clocks for interrupt controllers, I don't know
     which Module Stop bits control it.  Hence I could not add the intc-ex
     module clock to the R-Car V3U clock driver, but have used the CP
     clock instead in DTS.  Alternatively, as the driver doesn't really
     use the clock (except implicitly through Runtime PM), we can drop
     it, but that would need an update to the DT bindings.

This series been boot-tested on a remote Falcon development board.

Thanks for your comments!

Geert Uytterhoeven (2):
  dt-bindings: irqchip: renesas-irqc: Add R-Car V3U support
  arm64: dts: renesas: r8a779a0: Add INTC-EX device node

 .../interrupt-controller/renesas,irqc.yaml        |  1 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi         | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
