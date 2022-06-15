Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD76254CA58
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jun 2022 15:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243532AbiFONx7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jun 2022 09:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354670AbiFONxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jun 2022 09:53:18 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43A2F42ECD
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jun 2022 06:53:16 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:5439:2bcc:4a70:48e8])
        by andre.telenet-ops.be with bizsmtp
        id jRtC2700S4lJ8fu01RtC4f; Wed, 15 Jun 2022 15:53:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TSK-0044nA-4Y; Wed, 15 Jun 2022 15:53:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1o1TSJ-006xcL-Md; Wed, 15 Jun 2022 15:53:11 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: usb: ehci: Increase the number of PHYs
Date:   Wed, 15 Jun 2022 15:53:09 +0200
Message-Id: <c5d19e2f9714f43effd90208798fc1936098078f.1655301043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

"make dtbs_check":

    arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb: usb@ee080100: phys: [[17, 0], [31]] is too long
	    From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml
    arch/arm/boot/dts/r8a77470-iwg23s-sbc.dtb: usb@ee0c0100: phys: [[17, 1], [33], [21, 0]] is too long
	    From schema: Documentation/devicetree/bindings/usb/generic-ehci.yaml

Some USB EHCI controllers (e.g. on the Renesas RZ/G1C SoC) have multiple
PHYs.  Increase the maximum number of PHYs to 3, which is sufficient for
now.

Fixes: 0499220d6dadafa5 ("dt-bindings: Add missing array size constraints")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
usb_phy_roothub_alloc() just loops over all PHYs found.
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 0b4524b6409ec4ec..1e84e1b7ab271fcf 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -136,7 +136,8 @@ properties:
       Phandle of a companion.
 
   phys:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   phy-names:
     const: usb
-- 
2.25.1

