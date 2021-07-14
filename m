Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC253C82A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jul 2021 12:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239044AbhGNKWc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 14 Jul 2021 06:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238638AbhGNKWb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 06:22:31 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6849CC061760
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jul 2021 03:19:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
        by michel.telenet-ops.be with bizsmtp
        id UyKe2500N1ccfby06yKe5u; Wed, 14 Jul 2021 12:19:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3bzO-0016eJ-HP; Wed, 14 Jul 2021 12:19:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3bzO-00A6S0-0G; Wed, 14 Jul 2021 12:19:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: display: renesas,du: Make resets optional on R-Car H1
Date:   Wed, 14 Jul 2021 12:19:36 +0200
Message-Id: <98575791b154d80347d5b78132c1d53f5315ee62.1626257936.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The "resets" property is not present on R-Car Gen1 SoCs.
Supporting it would require migrating from renesas,cpg-clocks to
renesas,cpg-mssr.

Reflect this in the DT bindings by removing the global "required:
resets".  All SoCs that do have "resets" properties already have
SoC-specific rules making it required.

Fixes: 99d66127fad25ebb ("dt-bindings: display: renesas,du: Convert binding to YAML")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 5f4345d43020fd53..e3ca5389c17d34e9 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -92,7 +92,6 @@ required:
   - reg
   - clocks
   - interrupts
-  - resets
   - ports
 
 allOf:
-- 
2.25.1

