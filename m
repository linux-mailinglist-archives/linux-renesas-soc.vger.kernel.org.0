Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B44648799
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 18:19:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiLIRTR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 12:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiLIRSz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 12:18:55 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8BDFB26ABE;
        Fri,  9 Dec 2022 09:18:45 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,230,1665414000"; 
   d="scan'208";a="142849593"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Dec 2022 02:18:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.39])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 99EA04035BC0;
        Sat, 10 Dec 2022 02:18:42 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: usb: ti,hd3ss3220: Update interrupt property as optional
Date:   Fri,  9 Dec 2022 17:18:35 +0000
Message-Id: <20221209171836.71610-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209171836.71610-1-biju.das.jz@bp.renesas.com>
References: <20221209171836.71610-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On some platforms(for eg: RZ/V2M EVK), interrupt is not populated. Update
the binding to make interrupt property as optional.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * updated the typo in commit description.
---
 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
index b86bf6bc9cd6..a1cffb70c621 100644
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -46,7 +46,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
 
 additionalProperties: false
 
-- 
2.25.1

