Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC9D450933
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 17:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232422AbhKOQJP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 11:09:15 -0500
Received: from www.zeus03.de ([194.117.254.33]:40860 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236687AbhKOQJM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 11:09:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=6gUTls22z+eIxQzXKfmovBe1hF6
        ZTKjEiIDzMmNc3jA=; b=Ps8ItQbChwoNyJSFga8QqmYmfWQrGjP+vreJJ34kf7c
        CyEHdyXwiQvHwBWSngvKKyziu5ztTMnuKTvjXr2cnl3IYoMSMAdY1Iojb9yFI53N
        jyQAMmqVEd7ztjeayDHgO7wrdxS9q+TZcCdBlTTwcRpyUdFmXYGWIp2sFMBmn42o
        =
Received: (qmail 2395182 invoked from network); 15 Nov 2021 17:06:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2021 17:06:14 +0100
X-UD-Smtp-Session: l3s3148p1@U473/NXQDoEgAQnoAGuqAcpaucS5KLT8
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3] dt-bindings: mmc: renesas,sdhi: add optional SDnH clock
Date:   Mon, 15 Nov 2021 17:06:00 +0100
Message-Id: <20211115160600.4455-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This only applies to R-Car Gen2 and later generations, so we need to
distinguish.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
---

v1 and v2 were part of a 21-patch-series which was accepted now except
for this patch. Updated according to Geert's comments and finally also
sent to Rob and the DT mailing list.

Tested with:
m dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml

I hope it really does what I intended to check.

If so, the patch can be applied individually. I think, however, it is
most convenient if Geert picks it up together with the 20 other patches.

 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 40 ++++++++++++++-----
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 9f1e7092cf44..43fc6ac56038 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -129,15 +129,37 @@ allOf:
         - clock-names
         - resets
     else:
-      properties:
-        clocks:
-          minItems: 1
-          maxItems: 2
-        clock-names:
-          minItems: 1
-          items:
-            - const: core
-            - const: cd
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,rcar-gen2-sdhi
+                - renesas,rcar-gen3-sdhi
+      then:
+        properties:
+          clocks:
+            minItems: 1
+            maxItems: 3
+          clock-names:
+            minItems: 1
+            maxItems: 3
+            uniqueItems: true
+            items:
+              - const: core
+              - enum: [ clkh, cd ]
+              - const: cd
+      else:
+        properties:
+          clocks:
+            minItems: 1
+            maxItems: 2
+          clock-names:
+            minItems: 1
+            maxItems: 2
+            items:
+              - const: core
+              - const: cd
 
   - if:
       properties:
-- 
2.30.2

