Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E787276B9BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Aug 2023 18:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231216AbjHAQgW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Aug 2023 12:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbjHAQgW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2023 12:36:22 -0400
Received: from wp534.webpack.hosteurope.de (wp534.webpack.hosteurope.de [80.237.130.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B2D1BFD;
        Tue,  1 Aug 2023 09:36:17 -0700 (PDT)
Received: from [2001:a61:6215:d040:c80a:ff:fe00:409d] (helo=cs-wrt.lan.local); authenticated
        by wp534.webpack.hosteurope.de running ExIM with esmtpa
        id 1qQsM0-0007BE-KR; Tue, 01 Aug 2023 18:36:12 +0200
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
Subject: [PATCH v3 2/2] dt-bindings: hwmon: add renesas,isl28022
Date:   Tue,  1 Aug 2023 18:35:46 +0200
Message-Id: <20230801163546.3170-3-mail@carsten-spiess.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230801163546.3170-1-mail@carsten-spiess.de>
References: <20230801163546.3170-1-mail@carsten-spiess.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;mail@carsten-spiess.de;1690907778;8db166c8;
X-HE-SMSGID: 1qQsM0-0007BE-KR
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,
        T_SPF_TEMPERROR,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dt-bindings for Renesas ISL28022 power monitor.

Signed-off-by: Carsten Spieß <mail@carsten-spiess.de>
---
v3:
- changelog added
v2/v3:
- schema errors fixed
- properties reworked
- shunt-resistor minimum and default value added
---
 .../bindings/hwmon/renesas,isl28022.yaml      | 65 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
new file mode 100644
index 000000000000..1e0971287941
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
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
+properties:
+  compatible:
+    enum:
+      - renesas,isl28022
+
+  reg:
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: |
+      Shunt resistor value in micro-Ohm
+    minimum: 800
+    default: 10000
+
+  renesas,shunt-range-microvolt:
+    description: |
+      Maximal shunt voltage range of +/- 40 mV, 80 mV, 160 mV or 320 mV
+    default: 320000
+    enum: [40000, 80000, 160000, 320000]
+
+  renesas,average-samples:
+    description: |
+      Number of samples to be used to report voltage, current and power values.
+    default: 1
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [1, 2, 4, 8, 16, 32, 64, 128]
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
+            reg = <0x40>;
+            shunt-resistor-micro-ohms = <8000>;
+            renesas,shunt-range-microvolt = <40000>;
+            renesas,average-samples = <128>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index b02e3b991676..23b8e8183ece 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11069,6 +11069,7 @@ ISL28022 HARDWARE MONITORING DRIVER
 M:	Carsten Spieß <mail@carsten-spiess.de>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 F:	Documentation/hwmon/isl28022.rst
 F:	drivers/hwmon/isl28022.c
 
-- 
2.34.1

