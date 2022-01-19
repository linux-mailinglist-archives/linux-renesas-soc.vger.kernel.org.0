Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D19493BCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 15:15:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355020AbiASOPR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 09:15:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355034AbiASOPN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 09:15:13 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9E37C06173F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jan 2022 06:15:12 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a44d:f245:bac9:611c])
        by xavier.telenet-ops.be with bizsmtp
        id keFB2600N2FKFx601eFBAW; Wed, 19 Jan 2022 15:15:11 +0100
Received: from rox.of.borg ([192.168.97.57] helo=rox)
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjz-00AS7u-5C; Wed, 19 Jan 2022 15:15:11 +0100
Received: from geert by rox with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nABjy-009ii4-55; Wed, 19 Jan 2022 15:15:10 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/3] dt-bindings: gpio: renesas,rcar-gpio: Add r8a779f0 support
Date:   Wed, 19 Jan 2022 15:15:06 +0100
Message-Id: <5b50ed3adab59e7b213b2d8ed3fa9a5cd82f9b38.1642601310.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1642601310.git.geert+renesas@glider.be>
References: <cover.1642601310.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document support for the GPIO controller blocks in the Renesas R-Car
S4-8 (R8A779F0) SoC, including a new family-specific compatible value
for the R-Car Gen4 family.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/gpio/renesas,rcar-gpio.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index f2541739ee3b9f7c..0681a4790cd62e23 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -51,6 +51,11 @@ properties:
       - items:
           - const: renesas,gpio-r8a779a0  # R-Car V3U
 
+      - items:
+          - enum:
+              - renesas,gpio-r8a779f0     # R-Car S4-8
+          - const: renesas,rcar-gen4-gpio # R-Car Gen4
+
   reg:
     maxItems: 1
 
-- 
2.25.1

