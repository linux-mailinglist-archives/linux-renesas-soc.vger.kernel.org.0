Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D50C02B4C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2019 14:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbfE0MRR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 May 2019 08:17:17 -0400
Received: from albert.telenet-ops.be ([195.130.137.90]:33506 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726883AbfE0MRR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 May 2019 08:17:17 -0400
Received: from ramsan ([84.194.111.163])
        by albert.telenet-ops.be with bizsmtp
        id HQHF2000d3XaVaC06QHFcc; Mon, 27 May 2019 14:17:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEZ1-0001Sy-Oa; Mon, 27 May 2019 14:17:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hVEZ1-0001Le-Mb; Mon, 27 May 2019 14:17:15 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 0/2] irqchip/renesas: Add RZ/A1 IRQC support
Date:   Mon, 27 May 2019 14:17:09 +0200
Message-Id: <20190527121711.5138-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

Unlike on most other Renesas SoCs, the GPIO controller blocks on RZ/A1
and RZ/A2 SoCs lack interrupt functionality.  While the GPIOs can be
routed to the GIC as pin interrupts, this is of limited use, as the
PL390 or GIC-400 supports rising edge and high-level interrupts only.

Fortunately RZ/A1 and RZ/A2 SoCs contain a small front-end for the GIC,
allowing to use up to 8 external interrupts, with configurable sense
select.  This patch series adds DT bindings and a driver for this
front-end.

Changes compared to v3:
  - Add Reviewed-by,
  - Split off drivers/soc/renesas and DTS changes.

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

This has been tested using the input switches on the Renesas RSK+RZA1
development board, with evtest and s2ram wake-up.  I have verified
proper operation of low-level and rising/falling sense select, too.
Chris Brandt has tested this driver on RZ/A2M.

Thanks for applying!

Geert Uytterhoeven (2):
  dt-bindings: interrupt-controller: Add Renesas RZ/A1 Interrupt
    Controller
  irqchip: Add Renesas RZ/A1 Interrupt Controller driver

 .../renesas,rza1-irqc.txt                     |  43 +++
 drivers/irqchip/Kconfig                       |   4 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-renesas-rza1.c            | 283 ++++++++++++++++++
 4 files changed, 331 insertions(+)
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
