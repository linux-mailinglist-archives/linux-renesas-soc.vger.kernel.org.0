Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2031A50D99B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 08:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiDYGpf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 02:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236428AbiDYGpa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 02:45:30 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED8922AE06;
        Sun, 24 Apr 2022 23:42:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="119051222"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 15:42:21 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0C4124009BE4;
        Mon, 25 Apr 2022 15:42:21 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-serial@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/7] dt-bindings: serial: renesas,hscif: Document r8a779g0 bindings
Date:   Mon, 25 Apr 2022 15:41:57 +0900
Message-Id: <20220425064201.459633-4-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
References: <20220425064201.459633-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

R-Car V4H (R8A779G0) SoC has the R-Car Gen4 compatible HSCIF ports,
so document the SoC specific bindings.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/serial/renesas,hscif.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
index ee9804cd49bb..d688a07a0e29 100644
--- a/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,hscif.yaml
@@ -55,6 +55,12 @@ properties:
           - const: renesas,rcar-gen3-hscif # R-Car Gen3 and RZ/G2
           - const: renesas,hscif           # generic HSCIF compatible UART
 
+      - items:
+          - enum:
+              - renesas,hscif-r8a779g0     # R-Car V4H
+          - const: renesas,rcar-gen4-hscif # R-Car Gen4
+          - const: renesas,hscif           # generic HSCIF compatible UART
+
   reg:
     maxItems: 1
 
@@ -113,6 +119,7 @@ if:
         enum:
           - renesas,rcar-gen2-hscif
           - renesas,rcar-gen3-hscif
+          - renesas,rcar-gen4-hscif
 then:
   required:
     - resets
-- 
2.25.1

