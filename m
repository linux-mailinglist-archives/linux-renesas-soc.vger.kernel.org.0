Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E51F4A512
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 17:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbfFRPT1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 11:19:27 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:33462 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728572AbfFRPT1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 11:19:27 -0400
X-IronPort-AV: E=Sophos;i="5.62,389,1554735600"; 
   d="scan'208";a="18772444"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 19 Jun 2019 00:19:25 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3AD974006A86;
        Wed, 19 Jun 2019 00:19:22 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: display: renesas: Add r8a774a1 support
Date:   Tue, 18 Jun 2019 16:18:37 +0100
Message-Id: <1560871119-16570-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560871119-16570-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2M (R8A774A1) SoC bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
index a41d280..db68041 100644
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
2.7.4

