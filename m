Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8099C2DB6CE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 00:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730620AbgLOXBT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Dec 2020 18:01:19 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:36600 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730533AbgLOXAZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Dec 2020 18:00:25 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E28C6593;
        Tue, 15 Dec 2020 23:59:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608073178;
        bh=xoMtxA949fF+Ll5x4NfZx06ethoLb3wfdTfzB+Y8pwQ=;
        h=From:To:Cc:Subject:Date:From;
        b=K++9MclYfP+vJv+nB01CAQxwJ/YTX5vZFTmnfdhf4LN+tMs+u4T/UbKyePf/Ie4xp
         xt+u+nOTkXbj2RzObZwXSnAXBm5vkXYzNizlotd4jpWyr26mR1GGAxtnmfStU3lfjS
         MQlvFSrXU3OnCtK87lQANQY5b03u2PQ0NinpXci8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] dt-bindings: display: bridge: renesas,lvds: RZ/G2E needs renesas,companion too
Date:   Wed, 16 Dec 2020 00:59:27 +0200
Message-Id: <20201215225927.6552-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document RZ/G2E support for property renesas,companion.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Slight reword of SoC list in description
---
 .../devicetree/bindings/display/bridge/renesas,lvds.yaml    | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
index e5b163951b91..7eddcdb666dc 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
@@ -83,9 +83,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
       phandle to the companion LVDS encoder. This property is mandatory
-      for the first LVDS encoder on D3 and E3 SoCs, and shall point to
-      the second encoder to be used as a companion in dual-link mode. It
-      shall not be set for any other LVDS encoder.
+      for the first LVDS encoder on R-Car D3 and E3, and RZ/G2E SoCs, and shall
+      point to the second encoder to be used as a companion in dual-link mode.
+      It shall not be set for any other LVDS encoder.
 
 required:
   - compatible
-- 
Regards,

Laurent Pinchart

