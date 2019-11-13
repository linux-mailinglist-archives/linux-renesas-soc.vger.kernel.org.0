Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAC60FB43C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728105AbfKMPw1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:27 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:43910 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727907AbfKMPw1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:27 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593939"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:26 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id ADDC2400EE6B;
        Thu, 14 Nov 2019 00:52:21 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v4 09/13] dt-bindings: display: bridge: lvds-codec: Document ti,ds90cf384a
Date:   Wed, 13 Nov 2019 15:51:28 +0000
Message-Id: <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The DS90CF384A from TI is a transparent LVDS receiver (decoder),
and therefore it is compatible with the lvds-codec driver and
bindings.

Document the ti,ds90cf384a compatible string with the dt-bindings.
No driver change required.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch
---
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 0ecc8a4..21f8c6e 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -40,7 +40,10 @@ properties:
           - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
           - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
         - const: lvds-encoder # Generic LVDS encoder compatible fallback
-      - const: lvds-decoder   # Generic LVDS decoders compatible fallback
+      - items:
+        - enum:
+          - ti,ds90cf384a     # For the DS90CF384A FPD-Link LVDS Receiver
+        - const: lvds-decoder # Generic LVDS decoders compatible fallback
 
   ports:
     type: object
@@ -102,7 +105,7 @@ examples:
 
   - |
     lvds-decoder {
-      compatible = "lvds-decoder";
+      compatible = "ti,ds90cf384a", "lvds-decoder";
 
       ports {
         #address-cells = <1>;
-- 
2.7.4

