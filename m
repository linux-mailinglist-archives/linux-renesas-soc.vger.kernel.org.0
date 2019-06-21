Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C36F4E2B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2019 11:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfFUJLc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Jun 2019 05:11:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33354 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbfFUJLc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Jun 2019 05:11:32 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 25EBF25BE3A;
        Fri, 21 Jun 2019 19:11:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 502A1940CB2; Fri, 21 Jun 2019 11:11:19 +0200 (CEST)
From:   Simon Horman <horms+renesas@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 9/9] dt-bindings: display: renesas: Add r8a774a1 support
Date:   Fri, 21 Jun 2019 11:11:16 +0200
Message-Id: <74a22e8f4350a9e096c84fc9e88cf72abf71887c.1561107729.git.horms+renesas@verge.net.au>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1561107729.git.horms+renesas@verge.net.au>
References: <cover.1561107729.git.horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Document RZ/G2M (R8A774A1) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index a41d280c3f9f..db680413e89c 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
@@ -12,10 +12,12 @@ following device-specific properties.
 Required properties:
 
 - compatible : Shall contain one or more of
+  - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
   - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
   - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
   - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
-  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 compatible HDMI TX
+  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
+			     HDMI TX
 
     When compatible with generic versions, nodes must list the SoC-specific
     version corresponding to the platform first, followed by the
-- 
2.11.0

