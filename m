Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB2936E802
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 11:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232714AbhD2Jb2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 05:31:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbhD2Jb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 05:31:28 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB00C06138B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 02:30:41 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by baptiste.telenet-ops.be with bizsmtp
        id yZWf2400J4p6Y3801ZWfa2; Thu, 29 Apr 2021 11:30:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc30I-001Cdz-UB; Thu, 29 Apr 2021 11:30:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc30I-006zpm-FT; Thu, 29 Apr 2021 11:30:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH renesas-drivers] dt-bindings: misc: Fix logic analyzer bindings
Date:   Thu, 29 Apr 2021 11:30:37 +0200
Message-Id: <8194aceb415e0585c0224bca0f5cbf3447105e99.1619688572.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

When running "make dt_binding_check":

    Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml: properties:required: ['compatible', 'probe-gpios'] is not of type 'object', 'boolean'
    Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml: properties: {'enum': ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum', 'if', 'items', 'maxItems', 'maximum', 'minItems', 'minimum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'propertyNames', 'required', 'then', 'unevaluatedProperties']} is not allowed for 'required'
      SCHEMA  Documentation/devicetree/bindings/processed-schema-examples.json
    Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml: ignoring, error in schema: properties: required
    warning: no schema found in file: Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml

and:

    Error: Documentation/devicetree/bindings/misc/gpio-logic-analyzer.example.dts:22.42-43 syntax error
    FATAL ERROR: Unable to parse input tree

Fix this by correcting the indentation of the "required" block, and
adding the missing include.

Fixes: 1c8e77fc12417023 ("misc: add simple logic analyzer using polling")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/misc/gpio-logic-analyzer.yaml      | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
index e664cec85a72facd..5516f95b72d53ff1 100644
--- a/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
+++ b/Documentation/devicetree/bindings/misc/gpio-logic-analyzer.yaml
@@ -22,14 +22,15 @@ properties:
     description:
       names used to distinguish the probes
 
-  required:
-    - compatible
-    - probe-gpios
+required:
+  - compatible
+  - probe-gpios
 
 additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/gpio/gpio.h>
     i2c-analyzer {
             compatible = "gpio-logic-analyzer";
 
-- 
2.25.1

