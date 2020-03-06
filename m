Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC7217B8DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2020 10:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbgCFJA6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 6 Mar 2020 04:00:58 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:44110 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726256AbgCFJA5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Mar 2020 04:00:57 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Ax0r2200s5USYZQ01x0rjc; Fri, 06 Mar 2020 10:00:54 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8qh-0002iz-PV; Fri, 06 Mar 2020 10:00:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jA8qh-0002KD-NJ; Fri, 06 Mar 2020 10:00:51 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Johan Hovold <johan@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sean Wang <sean.wang@mediatek.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] dt-bindings: serial: Convert slave-device bindings to json-schema
Date:   Fri,  6 Mar 2020 10:00:46 +0100
Message-Id: <20200306090046.8890-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200306090046.8890-1-geert+renesas@glider.be>
References: <20200306090046.8890-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the serial slave-device Device Tree binding documentation to
json-schema, and incorporate it into the generic serial bindings.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Update references to slave-device.txt,
  - Allow any child node names,
  - Typo s/connnected/connected/.
---
 .../devicetree/bindings/gnss/gnss.txt         |  2 +-
 .../bindings/net/broadcom-bluetooth.txt       |  2 +-
 .../bindings/net/mediatek-bluetooth.txt       |  2 +-
 .../devicetree/bindings/net/qca,qca7000.txt   |  2 +-
 .../bindings/net/qualcomm-bluetooth.txt       |  2 +-
 .../devicetree/bindings/net/ti-bluetooth.txt  |  3 +-
 .../devicetree/bindings/serial/serial.yaml    | 56 +++++++++++++++++++
 .../bindings/serial/slave-device.txt          | 45 ---------------
 MAINTAINERS                                   |  2 +-
 9 files changed, 63 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/slave-device.txt

diff --git a/Documentation/devicetree/bindings/gnss/gnss.txt b/Documentation/devicetree/bindings/gnss/gnss.txt
index f547bd4549fe4655..d6dc9c0d82499dd5 100644
--- a/Documentation/devicetree/bindings/gnss/gnss.txt
+++ b/Documentation/devicetree/bindings/gnss/gnss.txt
@@ -8,7 +8,7 @@ bus (e.g. UART, I2C or SPI).
 
 Please refer to the following documents for generic properties:
 
-	Documentation/devicetree/bindings/serial/slave-device.txt
+	Documentation/devicetree/bindings/serial/serial.yaml
 	Documentation/devicetree/bindings/spi/spi-bus.txt
 
 Required properties:
diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index dd258674633ca84e..a7d57ba5f2ac39bd 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -20,7 +20,7 @@ Required properties:
 
 Optional properties:
 
- - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
+ - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
  - shutdown-gpios: GPIO specifier, used to enable the BT module
  - device-wakeup-gpios: GPIO specifier, used to wakeup the controller
  - host-wakeup-gpios: GPIO specifier, used to wakeup the host processor.
diff --git a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
index 112011c51d5e3c1e..219bcbd0d34478ba 100644
--- a/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-bluetooth.txt
@@ -42,7 +42,7 @@ child node of the serial node with UART.
 
 Please refer to the following documents for generic properties:
 
-	Documentation/devicetree/bindings/serial/slave-device.txt
+	Documentation/devicetree/bindings/serial/serial.yaml
 
 Required properties:
 
diff --git a/Documentation/devicetree/bindings/net/qca,qca7000.txt b/Documentation/devicetree/bindings/net/qca,qca7000.txt
index 21c36e5249936c4c..8f5ae0b84eec2646 100644
--- a/Documentation/devicetree/bindings/net/qca,qca7000.txt
+++ b/Documentation/devicetree/bindings/net/qca,qca7000.txt
@@ -68,7 +68,7 @@ Required properties:
 Optional properties:
 - local-mac-address : see ./ethernet.txt
 - current-speed     : current baud rate of QCA7000 which defaults to 115200
-		      if absent, see also ../serial/slave-device.txt
+		      if absent, see also ../serial/serial.yaml
 
 UART Example:
 
diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
index beca6466d59a9d7d..d2202791c1d4c0c5 100644
--- a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
@@ -29,7 +29,7 @@ Required properties for compatible string qcom,wcn399x-bt:
 
 Optional properties for compatible string qcom,wcn399x-bt:
 
- - max-speed: see Documentation/devicetree/bindings/serial/slave-device.txt
+ - max-speed: see Documentation/devicetree/bindings/serial/serial.yaml
  - firmware-name: specify the name of nvm firmware to load
  - clocks: clock provided to the controller
 
diff --git a/Documentation/devicetree/bindings/net/ti-bluetooth.txt b/Documentation/devicetree/bindings/net/ti-bluetooth.txt
index 6d03ff8c7068135e..f48c17b38f5851de 100644
--- a/Documentation/devicetree/bindings/net/ti-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/ti-bluetooth.txt
@@ -15,8 +15,7 @@ standard BT HCI protocol with additional channels for the other functions.
 TI WiLink devices also have a separate WiFi interface as described in
 wireless/ti,wlcore.txt.
 
-This bindings follows the UART slave device binding in
-../serial/slave-device.txt.
+This bindings follows the UART slave device binding in ../serial/serial.yaml.
 
 Required properties:
  - compatible: should be one of the following:
diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index ca2ae755b560141c..dd97ecd1a7fe8ddd 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -7,6 +7,7 @@ $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 title: Serial Interface Generic DT Bindings
 
 maintainers:
+  - Rob Herring <robh@kernel.org>
   - Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 
 description:
@@ -69,3 +70,58 @@ then:
   properties:
     cts-gpios: false
     rts-gpios: false
+
+patternProperties:
+  ".*":
+    if:
+      type: object
+    then:
+      description:
+        Serial attached devices shall be a child node of the host UART device
+        the slave device is attached to. It is expected that the attached
+        device is the only child node of the UART device. The slave device node
+        name shall reflect the generic type of device for the node.
+
+      properties:
+        compatible:
+          description:
+            Compatible of the device connected to the serial port.
+
+        max-speed:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            The maximum baud rate the device operates at.
+            This should only be present if the maximum is less than the slave
+            device can support.  For example, a particular board has some
+            signal quality issue or the host processor can't support higher
+            baud rates.
+
+        current-speed:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description: |
+            The current baud rate the device operates at.
+            This should only be present in case a driver has no chance to know
+            the baud rate of the slave device.
+            Examples:
+              * device supports auto-baud
+              * the rate is setup by a bootloader and there is no way to reset
+                the device
+              * device baud rate is configured by its firmware but there is no
+                way to request the actual settings
+
+      required:
+        - compatible
+
+examples:
+  - |
+    serial@1234 {
+            compatible = "ns16550a";
+            reg = <0x1234 0x20>;
+            interrupts = <1>;
+
+            bluetooth {
+                    compatible = "brcm,bcm43341-bt";
+                    interrupt-parent = <&gpio>;
+                    interrupts = <10>;
+            };
+    };
diff --git a/Documentation/devicetree/bindings/serial/slave-device.txt b/Documentation/devicetree/bindings/serial/slave-device.txt
deleted file mode 100644
index 40110e0196209fde..0000000000000000
--- a/Documentation/devicetree/bindings/serial/slave-device.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Serial Slave Device DT binding
-
-This documents the binding structure and common properties for serial
-attached devices. Common examples include Bluetooth, WiFi, NFC and GPS
-devices.
-
-Serial attached devices shall be a child node of the host UART device the
-slave device is attached to. It is expected that the attached device is
-the only child node of the UART device. The slave device node name shall
-reflect the generic type of device for the node.
-
-Required Properties:
-
-- compatible 	: A string reflecting the vendor and specific device the node
-		  represents.
-
-Optional Properties:
-
-- max-speed	: The maximum baud rate the device operates at. This should
-		  only be present if the maximum is less than the slave device
-		  can support. For example, a particular board has some signal
-		  quality issue or the host processor can't support higher
-		  baud rates.
-- current-speed	: The current baud rate the device operates at. This should
-		  only be present in case a driver has no chance to know
-		  the baud rate of the slave device.
-		  Examples:
-		    * device supports auto-baud
-		    * the rate is setup by a bootloader and there is no
-		      way to reset the device
-		    * device baud rate is configured by its firmware but
-		      there is no way to request the actual settings
-
-Example:
-
-serial@1234 {
-	compatible = "ns16550a";
-	interrupts = <1>;
-
-	bluetooth {
-		compatible = "brcm,bcm43341-bt";
-		interrupt-parent = <&gpio>;
-		interrupts = <10>;
-	};
-};
diff --git a/MAINTAINERS b/MAINTAINERS
index 59c14ee9a917a794..5f5d074c7b3927a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15034,7 +15034,7 @@ SERIAL DEVICE BUS
 M:	Rob Herring <robh@kernel.org>
 L:	linux-serial@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/serial/slave-device.txt
+F:	Documentation/devicetree/bindings/serial/serial.yaml
 F:	drivers/tty/serdev/
 F:	include/linux/serdev.h
 
-- 
2.17.1

