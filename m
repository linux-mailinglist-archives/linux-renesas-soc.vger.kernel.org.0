Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8224FDDD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Apr 2022 13:43:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351038AbiDLLo2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Apr 2022 07:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345930AbiDLLlM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Apr 2022 07:41:12 -0400
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20F17A9A6;
        Tue, 12 Apr 2022 03:21:47 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 96844FF806;
        Tue, 12 Apr 2022 10:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1649758906;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wNpjgkUaNWn1Mm4Df5e8ycR/tOrOcvbl1JoeRb1Ktqk=;
        b=F1u+2eOcN78M3C3CZOZ/EZB2ScMt0y3hEauhcF7aUR4/CaW09owF+7ZoM5AWs0gVpT07Wp
        QsQBUtZVYWoQgJKFPECVJlKonNyvxqJs/7Lf/67JXf0RmUKC70Ef/RndweGzr809Kqzkva
        nRrkr4rQX/Lb1peM/IIGRZQaKGF886WBvBeBZFlCBGWGQrlsxlyspL4VYm9bWrGSw1Kkzz
        ywABhVU05FRoP65d/drqm3NNgyZwtv4A8OKgMgA/v8n7wxzpMhdnYOgtp2olQwRrdZASgZ
        H+LGiLW+tokeQ0FWcwWsOXn81GyOMz96F2Mz1y1WsVdaFwEZigyXX6/7p45BlA==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-renesas-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v9 1/9] dt-bindings: dmaengine: Introduce RZN1 dmamux bindings
Date:   Tue, 12 Apr 2022 12:21:30 +0200
Message-Id: <20220412102138.45975-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220412102138.45975-1-miquel.raynal@bootlin.com>
References: <20220412102138.45975-1-miquel.raynal@bootlin.com>
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

The Renesas RZN1 DMA IP is based on a DW core, with eg. an additional
dmamux register located in the system control area which can take up to
32 requests (16 per DMA controller). Each DMA channel can be wired to
two different peripherals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/dma/renesas,rzn1-dmamux.yaml     | 51 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml

diff --git a/Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml b/Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml
new file mode 100644
index 000000000000..d83013b0dd74
--- /dev/null
+++ b/Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/dma/renesas,rzn1-dmamux.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1 DMA mux
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: "dma-router.yaml#"
+
+properties:
+  compatible:
+    const: renesas,rzn1-dmamux
+
+  reg:
+    maxItems: 1
+    description: DMA mux first register offset within the system control parent.
+
+  '#dma-cells':
+    const: 6
+    description:
+      The first four cells are dedicated to the master DMA controller. The fifth
+      cell gives the DMA mux bit index that must be set starting from 0. The
+      sixth cell gives the binary value that must be written there, ie. 0 or 1.
+
+  dma-masters:
+    minItems: 1
+    maxItems: 2
+
+  dma-requests:
+    const: 32
+
+required:
+  - reg
+  - dma-requests
+
+additionalProperties: false
+
+examples:
+  - |
+    dma-router@a0 {
+      compatible = "renesas,rzn1-dmamux";
+      reg = <0xa0 4>;
+      #dma-cells = <6>;
+      dma-masters = <&dma0 &dma1>;
+      dma-requests = <32>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index fd768d43e048..120d3ae57a4b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19040,6 +19040,7 @@ SYNOPSYS DESIGNWARE DMAC DRIVER
 M:	Viresh Kumar <vireshk@kernel.org>
 R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 S:	Maintained
+F:	Documentation/devicetree/bindings/dma/renesas,rzn1-dmamux.yaml
 F:	Documentation/devicetree/bindings/dma/snps,dma-spear1340.yaml
 F:	drivers/dma/dw/
 F:	include/dt-bindings/dma/dw-dmac.h
-- 
2.27.0

