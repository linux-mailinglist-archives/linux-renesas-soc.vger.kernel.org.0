Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0F91D91BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 10:11:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgESIJt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 04:09:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728237AbgESIJt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 04:09:49 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA71C05BD0A
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 01:09:48 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by andre.telenet-ops.be with bizsmtp
        id gY9n220014CPMDc01Y9nSn; Tue, 19 May 2020 10:09:47 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaxJr-0000hZ-03; Tue, 19 May 2020 10:09:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaxJq-0007VO-VF; Tue, 19 May 2020 10:09:46 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: serial: Add renesas,em-uart bindings
Date:   Tue, 19 May 2020 10:09:45 +0200
Message-Id: <20200519080945.28798-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document Device Tree bindings for the Renesas EMMA Mobile UART
Interface.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/serial/renesas,em-uart.yaml      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/renesas,em-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
new file mode 100644
index 0000000000000000..82aefdb0d45e5f1a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/renesas,em-uart.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/serial/renesas,em-uart.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas EMMA Mobile UART Interface
+
+maintainers:
+  - Magnus Damm <magnus.damm@gmail.com>
+
+allOf:
+  - $ref: serial.yaml#
+
+properties:
+  compatible:
+    const: renesas,em-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: sclk
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    uart0: serial@e1020000 {
+            compatible = "renesas,em-uart";
+            reg = <0xe1020000 0x38>;
+            interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&usia_u0_sclk>;
+            clock-names = "sclk";
+    };
-- 
2.17.1

