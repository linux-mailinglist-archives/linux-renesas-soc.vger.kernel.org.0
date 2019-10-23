Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC406E1A05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391305AbfJWM3W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:29:22 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37370 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730402AbfJWM3V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:29:21 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id H0VK2100505gfCL060VKmx; Wed, 23 Oct 2019 14:29:20 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlP-0000FR-3e; Wed, 23 Oct 2019 14:29:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFlP-0003B7-1d; Wed, 23 Oct 2019 14:29:19 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/5] dt-bindings: arm: renesas: Add core r8a77961 support
Date:   Wed, 23 Oct 2019 14:29:06 +0200
Message-Id: <20191023122911.12166-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

	Hi all,

This patch series updates the Renesas DT binding documentation for core
components on the new R-Car M3-W+ (R8A77961) SoC, and for the
Salvator-XS development board equipped with this SoC.

Changes compared to v1[1]:
  - Split in per-subsystem series,
  - Add Reviewed-by,
  - Add board part number.

I intend to queue this series in renesas-devel for v5.5.
The last patch will be put on a branch shared between driver and DTS.

Thanks for your comments!

[1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
    https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/

Geert Uytterhoeven (5):
  dt-bindings: arm: renesas: Document R-Car M3-W+ SoC DT bindings
  dt-bindings: arm: renesas: Add Salvator-XS board with R-Car M3-W+
  dt-bindings: reset: rcar-rst: Document r8a77961 support
  dt-bindings: power: rcar-sysc: Document r8a77961 support
  dt-bindings: power: Add r8a77961 SYSC power domain definitions

 .../devicetree/bindings/arm/renesas.yaml      |  6 ++++
 .../bindings/power/renesas,rcar-sysc.txt      |  1 +
 .../devicetree/bindings/reset/renesas,rst.txt |  1 +
 include/dt-bindings/power/r8a77961-sysc.h     | 32 +++++++++++++++++++
 4 files changed, 40 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a77961-sysc.h

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
