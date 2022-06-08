Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26D965431E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 15:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbiFHNtl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 09:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240563AbiFHNtk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 09:49:40 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB20F27C242
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jun 2022 06:49:37 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:243a:e14b:d107:1f56])
        by baptiste.telenet-ops.be with bizsmtp
        id gdpb2700B1qF9lr01dpbFn; Wed, 08 Jun 2022 15:49:35 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyw3y-003DB9-Qt; Wed, 08 Jun 2022 15:49:34 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nyw3y-008L36-C1; Wed, 08 Jun 2022 15:49:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas,rzg2l: Simplify header file references
Date:   Wed,  8 Jun 2022 15:49:33 +0200
Message-Id: <f274ad16010798dd4a45d2dca5f870da8acbb470.1654696009.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The bindings already uses <dt-bindings/clock/r9a0*-cpg.h> to refer to
the header files with DT binding definitions for core clocks.
Use more wildcards to simplify more references to these files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk-for-v5.20.

 .../devicetree/bindings/clock/renesas,rzg2l-cpg.yaml       | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index 8880b834f264cd9f..d036675e0779addc 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -45,10 +45,9 @@ properties:
     description: |
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
         and a core clock reference, as defined in
-        <dt-bindings/clock/r9a0*-cpg.h>
+        <dt-bindings/clock/r9a0*-cpg.h>,
       - For module clocks, the two clock specifier cells must be "CPG_MOD" and
-        a module number, as defined in the <dt-bindings/clock/r9a07g0*-cpg.h> or
-        <dt-bindings/clock/r9a09g011-cpg.h>.
+        a module number, as defined in <dt-bindings/clock/r9a0*-cpg.h>.
     const: 2
 
   '#power-domain-cells':
@@ -62,7 +61,7 @@ properties:
   '#reset-cells':
     description:
       The single reset specifier cell must be the module number, as defined in
-      the <dt-bindings/clock/r9a07g0*-cpg.h> or <dt-bindings/clock/r9a09g011-cpg.h>.
+      <dt-bindings/clock/r9a0*-cpg.h>.
     const: 1
 
 required:
-- 
2.25.1

