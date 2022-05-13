Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6165152605F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 May 2022 12:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379627AbiEMKuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 13 May 2022 06:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233550AbiEMKuF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 May 2022 06:50:05 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7925C296BE3;
        Fri, 13 May 2022 03:50:04 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 7C5BBFF803;
        Fri, 13 May 2022 10:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1652439003;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=A2IC48sC2BqDK1qhGGtGZy4CQ73sH3Lc5IdbUgWh0VI=;
        b=X1mNUI2r3uApp3MzKyN+1xcS6LPWMKumNxwNcJWZul8XBEHiD3YqTdxJOg4kz4WYoJo8oF
        I4QeZjNR0pMyONGLKBiIrQiTva1PF2J2RrpJJdif7w6UIOeE/xGCn6RWPQTz2zuq9AtTdH
        vyVF0uEeCcOzYaxbqQdpHYyC81w3uGm3o7Jjr1ZYE5DTA6xxhuawD93kOOZzN599of5Rpg
        xtPvmHP11Lv3/3FgN+43owFb0kM7csyk823EbEyLaT7DPjyUmhI2WNWfpEEkM7OLuiUF80
        +rZCEFs3/zJBI7kSipeZ0zG6gDXpBQ7ym5sp+awmSEJosxj38mpVn9WKAj//FA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: mtd: renesas: Fix the NAND controller description
Date:   Fri, 13 May 2022 12:49:56 +0200
Message-Id: <20220513104957.257721-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513104957.257721-1-miquel.raynal@bootlin.com>
References: <20220513104957.257721-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing power-domain property which is needed on all the
RZ/N1 SoC IPs.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/renesas-nandc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
index 2870d36361c4..7b18bc5cc8b3 100644
--- a/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
+++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
@@ -36,11 +36,15 @@ properties:
       - const: hclk
       - const: eclk
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
   - clocks
   - clock-names
+  - power-domains
   - interrupts
 
 unevaluatedProperties: false
@@ -56,6 +60,7 @@ examples:
         interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
         clock-names = "hclk", "eclk";
+        power-domains = <&sysctrl>;
         #address-cells = <1>;
         #size-cells = <0>;
     };
-- 
2.27.0

