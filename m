Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93114C1DB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2019 11:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730160AbfI3JPc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 30 Sep 2019 05:15:32 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:35906 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726952AbfI3JPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Sep 2019 05:15:32 -0400
X-IronPort-AV: E=Sophos;i="5.64,565,1559487600"; 
   d="scan'208";a="27901413"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Sep 2019 18:15:30 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B6CA14006192;
        Mon, 30 Sep 2019 18:15:27 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: display: renesas: du: Document the r8a774b1 bindings
Date:   Mon, 30 Sep 2019 10:15:02 +0100
Message-Id: <1569834905-42868-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
References: <1569834905-42868-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the RZ/G2N (R8A774B1) SoC in the R-Car DU bindings.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index c97dfac..17cb277 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -8,6 +8,7 @@ Required Properties:
     - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
     - "renesas,du-r8a77470" for R8A77470 (RZ/G1C) compatible DU
     - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
+    - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
     - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
     - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
     - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
@@ -60,6 +61,7 @@ corresponding to each DU output.
  R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
  R8A77470 (RZ/G1C)      DPAD 0         DPAD 1         LVDS 0         -
  R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
+ R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
  R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
  R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
  R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
-- 
2.7.4

