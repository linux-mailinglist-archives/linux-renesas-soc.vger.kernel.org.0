Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B23763C12
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 18:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjGZQNq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 12:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbjGZQNq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 12:13:46 -0400
X-Greylist: delayed 1808 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 26 Jul 2023 09:13:45 PDT
Received: from wp534.webpack.hosteurope.de (wp534.webpack.hosteurope.de [80.237.130.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 274E01BCD;
        Wed, 26 Jul 2023 09:13:45 -0700 (PDT)
Received: from [2001:a61:6206:cc01:c80a:ff:fe00:19d] (helo=cs-wrt.lan.local); authenticated
        by wp534.webpack.hosteurope.de running ExIM with esmtpa
        id 1qOgLj-0000ce-5j; Wed, 26 Jul 2023 17:22:51 +0200
From:   =?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>
To:     =?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: hwmon: add renesas,isl28022
Date:   Wed, 26 Jul 2023 17:22:34 +0200
Message-Id: <20230726152235.249569-3-mail@carsten-spiess.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230726152235.249569-1-mail@carsten-spiess.de>
References: <20230726152235.249569-1-mail@carsten-spiess.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;mail@carsten-spiess.de;1690388025;24d059cf;
X-HE-SMSGID: 1qOgLj-0000ce-5j
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dt-bindings for Renesase ISL28022 power monitor.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
---
 .../bindings/hwmon/renesas,isl28022.yaml      | 67 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
new file mode 100644
index 000000000000..5ecf892db269
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/renesas,isl28022.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas ISL28022 power monitor
+
+maintainers:
+  - Carsten Spieß <mail@carsten-spiess.de>
+
+description: |
+  The ISL28022 is a power monitor with I2C interface. The device monitors
+  voltage, current via shunt resistor and calculated power.
+
+  Datasheets:
+    https://www.renesas.com/us/en/www/doc/datasheet/isl28022.pdf
+
+Required properties:
+  compatible:
+    enum:
+      - renesas,isl28022
+
+  reg:
+    maxItems: 1
+
+Optional properties:
+  shunt-resistor-micro-ohms:
+    description:
+      Shunt resistor value in micro-Ohm
+      defaults to <0> when not set
+      monitoring of current and power not supported when <0>
+
+  shunt-gain:
+    description:
+      Shunt gain to scale maximal shunt voltage to
+      40mV, 80mV, 160mV, 320mV
+      defaults to <8> (320mV) when not set
+    enum: [1, 2, 4, 8]
+
+  average:
+    description: |
+      Number of samples to be used to report voltage, current and power values.
+      defaults to <0> when not set
+    enum: [0, 1, 2, 4, 8, 16, 32, 64, 128]
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-monitor@40 {
+            compatible = "renesas,isl28022";
+            reg = <0x10>;
+            shunt-resistor-micro-ohms = <8000>;
+            shunt-gain = <1>;
+            average = <128>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c61aa688cd11..ec9b97ace50b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11076,6 +11076,7 @@ ISL28022 HARDWARE MONITORING DRIVER
 M:	Carsten Spieß <mail@carsten-spiess.de>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 F:	Documentation/hwmon/isl28022.rst
 F:	drivers/hwmon/isl28022.c
 
-- 
2.34.1

