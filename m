Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929EA514797
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 12:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237455AbiD2K4C (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 06:56:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237696AbiD2Kzz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 06:55:55 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D294EDFA;
        Fri, 29 Apr 2022 03:52:35 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 04BDDFF805;
        Fri, 29 Apr 2022 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1651229554;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=dJ+tLuwq1BPOlvX+T85enpsOsl9owZcJnnnX3M9eI/E=;
        b=WYeu8IauKgebNrE5LqW60Ux/HLh2WCDLAb64VJegHbKgp3WSYNtafUn/rqJmQTw8rT01J4
        D5UOZ3iDAFzhJn34qLr5uhirP5kHez7jtrrE9lc8KI3b1qiNQKvrhdxPFO/RDCjXBlGLRu
        uefh6mKF7PCzemDKkxdMZFN7MKmMDWkptpAY8kOOVhDEu25a3WL0dPQ+gLd6n190h9Sc2W
        Ik1YJ7zWO4zsOsauwJK5pzyb4LuXSXXR8F7xKHu6+W/DP7taurlq30HIqJJcZdpXCtUEzj
        Rv02bSkR/EhVn/oBP2+p4uMdSc+TcxcJy3PlUJ59d3jXvTtC37nCDjnVpKlC/w==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] dt-bindings: mtd: renesas: Fix the NAND controller description
Date:   Fri, 29 Apr 2022 12:52:27 +0200
Message-Id: <20220429105229.368728-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220429105229.368728-1-miquel.raynal@bootlin.com>
References: <20220429105229.368728-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the missing power-domain property which is needed on all the
RZ/N1 SoC IPs.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
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

