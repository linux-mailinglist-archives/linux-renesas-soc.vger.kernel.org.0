Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA683DF8B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 11:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbfD2Jgm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 05:36:42 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:36632 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727228AbfD2Jgl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 05:36:41 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 69cd200053XaVaC019cdzb; Mon, 29 Apr 2019 11:36:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0000we-3P; Mon, 29 Apr 2019 11:36:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hL2iD-0002p0-13; Mon, 29 Apr 2019 11:36:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Date:   Mon, 29 Apr 2019 11:36:26 +0200
Message-Id: <20190429093631.10799-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Unlike on most other Renesas SoCs, the GPIO controller block on RZ/A1
SoCs lack interrupt functionality.  While the GPIOs can be routed to the
GIC as pin interrupts, this is of limited use, as the PL390 GIC supports
rising edge and high-level interrupts only.

Fortunately RZ/A1 SoCs contain a small front-end for the GIC, allowing
to use up to 8 external interrupts, with configurable sense select.

Hence this patch series adds DT bindings and a driver for this
front-end, adds a device node for it in the RZ/A1H DTS, and uses it to
enable support for the 3 input switches on the Renesas RSK+RZA1
development board.

I expect this driver to be reusable for RZ/A2, after adding a match
entry with .gic_spi_base = 4.
  - Should this information come from DT instead?
  - Originally I had interrupts properties in DT to define the mapping
    from external interrupts to GIC interrupts (cfr. "renesas,irqc",
    which also calls request_irq()), but other similar drivers seem to
    hardcode this information in the driver, so I went that route.

Dependencies:
  - Patch 3 depends on patch 2,
  - Patch 4 can be applied as soon as the DT bindings in patch 1 have
    been accepted,
  - Patch 5 depends on patch 4.

This has been tested on RSK+RZA1 with evtest and s2ram wake-up.
I have verified proper operation of low-level and rising/falling sense
select, too.

Thanks for your comments!

Geert Uytterhoeven (5):
  dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt
    Controller
  irqchip: Add Renesas RZ/A1 Interrupt Controller driver
  soc: renesas: Enable RZ/A1 IRQC on RZ/A1H
  ARM: dts: r7s72100: Add IRQC device node
  ARM: dts: rskrza1: Add input switches

 .../renesas,rza1-irqc.txt                     |  27 ++
 arch/arm/boot/dts/r7s72100-rskrza1.dts        |  38 +++
 arch/arm/boot/dts/r7s72100.dtsi               |   8 +
 drivers/irqchip/Kconfig                       |   4 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rza1.c            | 238 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   1 +
 7 files changed, 317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rza1-irqc.txt
 create mode 100644 drivers/irqchip/irq-renesas-rza1.c

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
