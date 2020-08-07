Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1235123F247
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Aug 2020 19:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbgHGRuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Aug 2020 13:50:02 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29111 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728107AbgHGRuB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 13:50:01 -0400
X-IronPort-AV: E=Sophos;i="5.75,446,1589209200"; 
   d="scan'208";a="54150725"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 08 Aug 2020 02:50:00 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E5486400A887;
        Sat,  8 Aug 2020 02:49:57 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/7] dt-bindings: display: renesas,du: Document the r8a7742 bindings
Date:   Fri,  7 Aug 2020 18:49:48 +0100
Message-Id: <20200807174954.14448-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the RZ/G1H (R8A7742) SoC in the R-Car DU bindings.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index 51cd4d162770..3f1e3ca4bea9 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -3,6 +3,7 @@
 Required Properties:
 
   - compatible: must be one of the following.
+    - "renesas,du-r8a7742" for R8A7742 (RZ/G1H) compatible DU
     - "renesas,du-r8a7743" for R8A7743 (RZ/G1M) compatible DU
     - "renesas,du-r8a7744" for R8A7744 (RZ/G1N) compatible DU
     - "renesas,du-r8a7745" for R8A7745 (RZ/G1E) compatible DU
@@ -68,6 +69,7 @@ corresponding to each DU output.
 
                         Port0          Port1          Port2          Port3
 -----------------------------------------------------------------------------
+ R8A7742 (RZ/G1H)       DPAD 0         LVDS 0         LVDS 1         -
  R8A7743 (RZ/G1M)       DPAD 0         LVDS 0         -              -
  R8A7744 (RZ/G1N)       DPAD 0         LVDS 0         -              -
  R8A7745 (RZ/G1E)       DPAD 0         DPAD 1         -              -
-- 
2.17.1

