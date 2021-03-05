Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E402332EC4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Mar 2021 14:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhCENhT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Mar 2021 08:37:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230468AbhCENhO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 08:37:14 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754AAC061756
        for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Mar 2021 05:37:11 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:403a:b688:43fc:72a5])
        by michel.telenet-ops.be with bizsmtp
        id cdd52400M0zmvuD06dd5Ut; Fri, 05 Mar 2021 14:37:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lIAdd-0057SJ-3L; Fri, 05 Mar 2021 14:37:05 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lIAdc-000Az4-Ln; Fri, 05 Mar 2021 14:37:04 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH RFC] dt-bindings: arm: renesas: Document Renesas Falcon sub-boards
Date:   Fri,  5 Mar 2021 14:37:03 +0100
Message-Id: <20210305133703.42179-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings documentation for the Renesas R-Car V3U Falcon
CSI/DSI and Ethernet sub-boards.  These are plugged into the Falcon
BreakOut board to form the full Falcon board stack.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Marked as RFC

The Falcon board stack consists of 4 boards:
  1. CPU board, containing the R-Car V3U SoC, and core system parts like
     RAM, console, eMMC,
  2. BreakOut board, providing power, an Ethernet PHY, and a backplane
     where boards 1, 3, and 4 are plugged in,
  3. CSI/DSI sub-board, providing 2 GMSL displays and 12 GMSL cameras,
  4. Ethernet sub-board, providing 6 Ethernet PHYs.

As the BreakOut board provides power, the CPU board cannot be used
without the BreakOut board.  However, both the CSI/DSI and Ethernet
sub-boards are optional.  So that means we have to support 4 stacks of
board combinations (1+2, 1+2+3, 1+2+4, 1+2+3+4).

That sounds like a good target for fdtoverlay, right?

For now[1] the Falcon include hierarchy looks like this (supporting only
the full stack 1+2+3+4):

    r8a779a0-falcon.dts
    |-- r8a779a0-falcon-cpu.dtsi
    |   `-- r8a779a0.dtsi
    |-- r8a779a0-falcon-csi-dsi.dtsi
    `-- r8a779a0-falcon-ethernet.dtsi

Traditionally, we augmented the "model" and "compatible" properties of
the root node in each additional layer:

    r8a779a0.dtsi:
	compatible = "renesas,r8a779a0";

    r8a779a0-falcon-cpu.dtsi:
	model = "Renesas Falcon CPU board";
	compatible = "renesas,falcon-cpu", "renesas,r8a779a0";

    r8a779a0-falcon.dts:
	model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";
	compatible = "renesas,falcon-breakout", "renesas,falcon-cpu", "renesas,r8a779a0";

(Note: I haven't done that yet for the CSI/DSI and Ethernet sub-boards)

With a stack of 4 boards, some optional, this becomes a bit cumbersome.
But it is still doable when using .dts and .dtsi files, by just adding 3
more r8a779a0-falcon*.dts files.

So we can add model/compatible properties to the sub-boards:

    r8a779a0-falcon-csi-dsi.dtsi
	model = "Renesas Falcon CSI/DSI sub-board";
	compatible = "renesas,falcon-csi-dsi";

    r8a779a0-falcon-ethernet.dtsi:
	model = "Renesas Falcon Ethernet sub-board";
	compatible = "renesas,falcon-ethernet";

and update r8a779a0-falcon*dts to augment the properties.

However, this is currently not possible when using overlays, as applying
an overlay would override the properties in the underlying DTB, not
augment them.

Questions:
  a. Should we document all possible combinations in the bindings file?
     After this patch, we only have 1, 1+2, and 1+2+3+4 documented.

  b. How to handle "model" and "compatible" properties for (sub)boards?
     Perhaps fdtoverlay could combine the "model" and "compatible"
     properties in the root nodes?  However, that is not always desired.

Thanks for your comments!

[1] [PATCH v2 0/3] arm64: dts: renesas: falcon: Add I2C EEPROMs and sub-boards
    https://lore.kernel.org/linux-renesas-soc/20210304153257.4059277-1-geert+renesas@glider.be
---
 Documentation/devicetree/bindings/arm/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 5fd0696a9f91f383..08ba12632f52c317 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -296,6 +296,13 @@ properties:
           - const: renesas,falcon-cpu
           - const: renesas,r8a779a0
 
+      - items:
+          - const: renesas,falcon-breakout # Falcon BreakOut board (RTP0RC779A0BOB0010S)
+          - const: renesas,falcon-csi-dsi # Falcon CSI/DSI sub-board (RTP0RC779A0DCS0010S)
+          - const: renesas,falcon-ethernet # Falcon Ethernet sub-board (RTP0RC779A0ETS0010S)
+          - const: renesas,falcon-cpu
+          - const: renesas,r8a779a0
+
       - description: RZ/N1D (R9A06G032)
         items:
           - enum:
-- 
2.25.1

