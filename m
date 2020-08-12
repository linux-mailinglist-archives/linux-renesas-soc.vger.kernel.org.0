Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA96242AE6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 16:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgHLOC4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 10:02:56 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:50532 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726434AbgHLOCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 10:02:54 -0400
X-IronPort-AV: E=Sophos;i="5.76,304,1592838000"; 
   d="scan'208";a="54230926"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 12 Aug 2020 23:02:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8D10B40078D1;
        Wed, 12 Aug 2020 23:02:49 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: [PATCH 1/9] dt-bindings: display: renesas,du: Document r8a774e1 bindings
Date:   Wed, 12 Aug 2020 15:02:09 +0100
Message-Id: <20200812140217.24251-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Document the RZ/G2H (a.k.a. r8a774e1) SoC in the R-Car DU bindings.

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index 51cd4d162770..67cded5ad827 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -10,6 +10,7 @@ Required Properties:
     - "renesas,du-r8a774a1" for R8A774A1 (RZ/G2M) compatible DU
     - "renesas,du-r8a774b1" for R8A774B1 (RZ/G2N) compatible DU
     - "renesas,du-r8a774c0" for R8A774C0 (RZ/G2E) compatible DU
+    - "renesas,du-r8a774e1" for R8A774E1 (RZ/G2H) compatible DU
     - "renesas,du-r8a7779" for R8A7779 (R-Car H1) compatible DU
     - "renesas,du-r8a7790" for R8A7790 (R-Car H2) compatible DU
     - "renesas,du-r8a7791" for R8A7791 (R-Car M2-W) compatible DU
@@ -75,6 +76,7 @@ corresponding to each DU output.
  R8A774A1 (RZ/G2M)      DPAD 0         HDMI 0         LVDS 0         -
  R8A774B1 (RZ/G2N)      DPAD 0         HDMI 0         LVDS 0         -
  R8A774C0 (RZ/G2E)      DPAD 0         LVDS 0         LVDS 1         -
+ R8A774E1 (RZ/G2H)      DPAD 0         HDMI 0         LVDS 0         -
  R8A7779 (R-Car H1)     DPAD 0         DPAD 1         -              -
  R8A7790 (R-Car H2)     DPAD 0         LVDS 0         LVDS 1         -
  R8A7791 (R-Car M2-W)   DPAD 0         LVDS 0         -              -
-- 
2.17.1

