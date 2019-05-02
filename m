Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5680C11928
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2019 14:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfEBMcx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 May 2019 08:32:53 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:60516 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfEBMc1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 May 2019 08:32:27 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 7QYN2000F3XaVaC01QYNGw; Thu, 02 May 2019 14:32:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMAsw-0007dt-QJ; Thu, 02 May 2019 14:32:22 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hMAsw-0000nU-Np; Thu, 02 May 2019 14:32:22 +0200
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
Subject: [PATCH v3 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
Date:   Thu,  2 May 2019 14:32:15 +0200
Message-Id: <20190502123220.3016-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Unlike on most other Renesas SoCs, the GPIO controller block on RZ/A1
and RZ/A2 SoCs lack interrupt functionality.  While the GPIOs can be
routed to the GIC as pin interrupts, this is of limited use, as the
PL390 or GIC-400 supports rising edge and high-level interrupts only.

Fortunately RZ/A1 and RZ/A2 SoCs contain a small front-end for the GIC,
allowing to use up to 8 external interrupts, with configurable sense
select.

Hence this patch series adds DT bindings and a driver for this
front-end, adds a device node for it in the RZ/A1H DTS, and uses it to
enable support for the 3 input switches on the Renesas RSK+RZA1
development board.

Changes compared to v2:
  - Add Tested-by,
  - Use standard interrupt-map instead of custom renesas,gic-spi-base.
    I'm still a bit puzzled by the confusing semantics (double meaning)
    of child and parent unit addresses in interrupt-map.

Changes compared to v1:
  - Add Reviewed-by,
  - Replace gic_spi_base in OF match data by renesas,gic-spi-base in DT,
  - Document RZ/A2M,
  - Use u16 for register values,
  - Use relaxed I/O accessors,
  - Use "rza1-irqc" as irq_chip class name,
  - Enable driver on RZ/A2M.

Dependencies:
  - Patch 3 depends on patch 2,
  - Patch 4 can be applied as soon as the DT bindings in patch 1 have
    been accepted,
  - Patch 5 depends on patch 4.

Upstream strategy:
  - Patches 1-2 are intended to be applied to the irqchip tree,
  - Patches 3-5 are meant for the Renesas tree.

This has been tested on RSK+RZA1 with evtest and s2ram wake-up.
I have verified proper operation of low-level and rising/falling sense
select, too.

Thanks!

Geert Uytterhoeven (5):
  dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt
    Controller
  irqchip: Add Renesas RZ/A1 Interrupt Controller driver
  soc: renesas: Enable RZ/A1 IRQC on RZ/A1H and RZ/A2M
  ARM: dts: r7s72100: Add IRQC device node
  ARM: dts: rskrza1: Add input switches

 .../renesas,rza1-irqc.txt                     |  43 +++
 arch/arm/boot/dts/r7s72100-rskrza1.dts        |  38 +++
 arch/arm/boot/dts/r7s72100.dtsi               |  19 ++
 drivers/irqchip/Kconfig                       |   4 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rza1.c            | 283 ++++++++++++++++++
 drivers/soc/renesas/Kconfig                   |   4 +-
 7 files changed, 391 insertions(+), 1 deletion(-)
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
