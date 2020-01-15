Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 920BC13C16F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jan 2020 13:46:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729163AbgAOMqA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jan 2020 07:46:00 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:56508 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgAOMqA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jan 2020 07:46:00 -0500
Received: from ramsan ([84.195.182.253])
        by baptiste.telenet-ops.be with bizsmtp
        id qclq210045USYZQ01clqd9; Wed, 15 Jan 2020 13:45:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-0003yz-3C; Wed, 15 Jan 2020 13:45:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iri3S-00012Z-1m; Wed, 15 Jan 2020 13:45:50 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
        David Lechner <david@lechnology.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/5] dt-bindings: display: sitronix,st7735r: Convert to DT schema
Date:   Wed, 15 Jan 2020 13:45:44 +0100
Message-Id: <20200115124548.3951-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115124548.3951-1-geert+renesas@glider.be>
References: <20200115124548.3951-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the DT binding documentation for Sitronix ST7735R displays to DT
schema.

Add a reference to the Adafruit 1.8" LCD while at it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 .../bindings/display/sitronix,st7735r.txt     | 35 ----------
 .../bindings/display/sitronix,st7735r.yaml    | 65 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 66 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.txt
 create mode 100644 Documentation/devicetree/bindings/display/sitronix,st7735r.yaml

diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt b/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
deleted file mode 100644
index cd5c7186890a2be7..0000000000000000
--- a/Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-Sitronix ST7735R display panels
-
-This binding is for display panels using a Sitronix ST7735R controller in SPI
-mode.
-
-Required properties:
-- compatible:	"jianda,jd-t18003-t01", "sitronix,st7735r"
-- dc-gpios:	Display data/command selection (D/CX)
-- reset-gpios:	Reset signal (RSTX)
-
-The node for this driver must be a child node of a SPI controller, hence
-all mandatory properties described in ../spi/spi-bus.txt must be specified.
-
-Optional properties:
-- rotation:	panel rotation in degrees counter clockwise (0,90,180,270)
-- backlight:	phandle of the backlight device attached to the panel
-
-Example:
-
-	backlight: backlight {
-		compatible = "gpio-backlight";
-		gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
-	};
-
-	...
-
-	display@0{
-		compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
-		reg = <0>;
-		spi-max-frequency = <32000000>;
-		dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
-		reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
-		rotation = <270>;
-		backlight = &backlight;
-	};
diff --git a/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
new file mode 100644
index 0000000000000000..21bccc91f74255e1
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/sitronix,st7735r.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sitronix ST7735R Display Panels Device Tree Bindings
+
+maintainers:
+  - David Lechner <david@lechnology.com>
+
+description:
+  This binding is for display panels using a Sitronix ST7735R controller in
+  SPI mode.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - description:
+          Adafruit 1.8" 160x128 Color TFT LCD (Product ID 358 or 618)
+        items:
+          - enum:
+              - jianda,jd-t18003-t01
+          - const: sitronix,st7735r
+
+  spi-max-frequency:
+    maximum: 32000000
+
+  dc-gpios:
+    maxItems: 1
+    description: Display data/command selection (D/CX)
+
+required:
+  - compatible
+  - reg
+  - dc-gpios
+  - reset-gpios
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    backlight: backlight {
+            compatible = "gpio-backlight";
+            gpios = <&gpio 44 GPIO_ACTIVE_HIGH>;
+    };
+
+    spi {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            display@0{
+                    compatible = "jianda,jd-t18003-t01", "sitronix,st7735r";
+                    reg = <0>;
+                    spi-max-frequency = <32000000>;
+                    dc-gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+                    reset-gpios = <&gpio 80 GPIO_ACTIVE_HIGH>;
+                    rotation = <270>;
+            };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index ea8262509bdd21ac..3007f83bd504194a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5382,7 +5382,7 @@ M:	David Lechner <david@lechnology.com>
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 S:	Maintained
 F:	drivers/gpu/drm/tiny/st7735r.c
-F:	Documentation/devicetree/bindings/display/sitronix,st7735r.txt
+F:	Documentation/devicetree/bindings/display/sitronix,st7735r.yaml
 
 DRM DRIVER FOR SONY ACX424AKP PANELS
 M:	Linus Walleij <linus.walleij@linaro.org>
-- 
2.17.1

