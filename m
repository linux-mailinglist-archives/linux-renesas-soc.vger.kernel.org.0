Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C0D5260799
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 02:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgIHAeG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Sep 2020 20:34:06 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:3635 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727769AbgIHAeG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Sep 2020 20:34:06 -0400
Date:   08 Sep 2020 09:34:04 +0900
X-IronPort-AV: E=Sophos;i="5.76,403,1592838000"; 
   d="scan'208";a="56396835"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Sep 2020 09:34:04 +0900
Received: from mercury.renesas.com (unknown [10.166.252.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E33B84003ECD;
        Tue,  8 Sep 2020 09:34:03 +0900 (JST)
Message-ID: <87mu21rtww.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/10] dt-bindings: display: renesas: du: Document the r8a77961 bindings
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        (Renesas) shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
In-Reply-To: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Document the R-Car M3-W+ (R8A77961) SoC in the R-Car DU bindings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/display/renesas,du.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index 51cd4d162770..317c9dd2d57c 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -18,6 +18,7 @@ Required Properties:
     - "renesas,du-r8a7794" for R8A7794 (R-Car E2) compatible DU
     - "renesas,du-r8a7795" for R8A7795 (R-Car H3) compatible DU
     - "renesas,du-r8a7796" for R8A7796 (R-Car M3-W) compatible DU
+    - "renesas,du-r8a77961" for R8A77961 (R-Car M3-W+) compatible DU
     - "renesas,du-r8a77965" for R8A77965 (R-Car M3-N) compatible DU
     - "renesas,du-r8a77970" for R8A77970 (R-Car V3M) compatible DU
     - "renesas,du-r8a77980" for R8A77980 (R-Car V3H) compatible DU
@@ -83,6 +84,7 @@ corresponding to each DU output.
  R8A7794 (R-Car E2)     DPAD 0         DPAD 1         -              -
  R8A7795 (R-Car H3)     DPAD 0         HDMI 0         HDMI 1         LVDS 0
  R8A7796 (R-Car M3-W)   DPAD 0         HDMI 0         LVDS 0         -
+ R8A77961 (R-Car M3-W+) DPAD 0         HDMI 0         LVDS 0         -
  R8A77965 (R-Car M3-N)  DPAD 0         HDMI 0         LVDS 0         -
  R8A77970 (R-Car V3M)   DPAD 0         LVDS 0         -              -
  R8A77980 (R-Car V3H)   DPAD 0         LVDS 0         -              -
-- 
2.25.1

