Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 472B5E1A2E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Oct 2019 14:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391336AbfJWMaP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Oct 2019 08:30:15 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:37370 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388042AbfJWMaP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 08:30:15 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id H0WE2100C05gfCL060WEwH; Wed, 23 Oct 2019 14:30:14 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFmI-00011i-Af; Wed, 23 Oct 2019 14:30:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iNFmI-0003GO-9I; Wed, 23 Oct 2019 14:30:14 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: serial: sh-sci: Document r8a77961 bindings
Date:   Wed, 23 Oct 2019 14:30:10 +0200
Message-Id: <20191023123010.12501-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the SCIF and HSCIF serial ports in the Renesas
R-Car M3-W+ (R8A77961) SoC.

Update all references to R-Car M3-W from "r8a7796" to "r8a77960", to
avoid confusion between R-Car M3-W (R8A77960) and M3-W+.

No driver update is needed.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
v2:
  - Split v1[1] in per-subsystem series,
  - Add Reviewed-by,
  - Update R-Car M3-W references.

[1] "[PATCH/RFC 00/19] arm64: dts: renesas: Initial support for R-Car M3-W+"
    https://lore.kernel.org/linux-renesas-soc/20191007102332.12196-1-geert+renesas@glider.be/
---
 .../devicetree/bindings/serial/renesas,sci-serial.txt       | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
index b143d9a21b2de13e..a5edf4b70c7ab657 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
+++ b/Documentation/devicetree/bindings/serial/renesas,sci-serial.txt
@@ -54,8 +54,10 @@ Required properties:
     - "renesas,hscif-r8a7794" for R8A7794 (R-Car E2) HSCIF compatible UART.
     - "renesas,scif-r8a7795" for R8A7795 (R-Car H3) SCIF compatible UART.
     - "renesas,hscif-r8a7795" for R8A7795 (R-Car H3) HSCIF compatible UART.
-    - "renesas,scif-r8a7796" for R8A7796 (R-Car M3-W) SCIF compatible UART.
-    - "renesas,hscif-r8a7796" for R8A7796 (R-Car M3-W) HSCIF compatible UART.
+    - "renesas,scif-r8a7796" for R8A77960 (R-Car M3-W) SCIF compatible UART.
+    - "renesas,hscif-r8a7796" for R8A77960 (R-Car M3-W) HSCIF compatible UART.
+    - "renesas,scif-r8a77961" for R8A77961 (R-Car M3-W+) SCIF compatible UART.
+    - "renesas,hscif-r8a77961" for R8A77961 (R-Car M3-W+) HSCIF compatible UART.
     - "renesas,scif-r8a77965" for R8A77965 (R-Car M3-N) SCIF compatible UART.
     - "renesas,hscif-r8a77965" for R8A77965 (R-Car M3-N) HSCIF compatible UART.
     - "renesas,scif-r8a77970" for R8A77970 (R-Car V3M) SCIF compatible UART.
-- 
2.17.1

