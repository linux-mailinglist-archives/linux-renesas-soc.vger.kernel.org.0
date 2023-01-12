Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2F3766866C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240355AbjALWJK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:09:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240413AbjALWIf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:08:35 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 43269F76;
        Thu, 12 Jan 2023 13:59:24 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="146137080"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D9C26400B9F8;
        Fri, 13 Jan 2023 06:59:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 03/12] dt-bindings: usb: renesas,usb3-peri: Document RZ/V2MA bindings
Date:   Thu, 12 Jan 2023 21:58:57 +0000
Message-Id: <20230112215906.494394-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/V2MA usb3-peri bindings. RZ/V2MA usb3-peri is identical
to one found on the RZ/V2M SoC. No driver changes are required as
generic compatible string "renesas,rzv2m-usb3-peri" will be used as
a fallback.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change
---
 Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index 4ba36ebf0f1e..b2b811a0ade8 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - renesas,r9a09g011-usb3-peri # RZ/V2M
+              - renesas,r9a09g055-usb3-peri # RZ/V2MA
           - const: renesas,rzv2m-usb3-peri
 
   reg:
-- 
2.25.1

