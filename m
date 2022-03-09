Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 443454D3184
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Mar 2022 16:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232616AbiCIPMQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Mar 2022 10:12:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbiCIPMQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Mar 2022 10:12:16 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 759C7158EBA;
        Wed,  9 Mar 2022 07:11:16 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,167,1643641200"; 
   d="scan'208";a="113853367"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Mar 2022 00:11:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.170])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8429E400D0EB;
        Thu, 10 Mar 2022 00:11:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: drm: bridge: adi,adv7533: Document adi,disable-lanes-override property
Date:   Wed,  9 Mar 2022 15:11:08 +0000
Message-Id: <20220309151109.20957-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Renesas RZ/{G2L,V2L} platforms changing the lanes from 4 to 3 at
lower frequencies causes display instability. On such platforms, it
is better to avoid switching lanes from 4 to 3 as it needs different
set of PLL parameter constraints to make the display stable with 3
lanes.

This patch introduces 'adi,disable-lanes-override' property to disable
lane switching at lower frequencies.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/display/bridge/adi,adv7533.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
index f36209137c8a..2dc378039d21 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7533.yaml
@@ -84,6 +84,11 @@ properties:
       timings for HDMI output.
     type: boolean
 
+  adi,disable-lanes-override:
+    description:
+      Disables the overriding lanes at lower frequencies.
+    type: boolean
+
   adi,dsi-lanes:
     description: Number of DSI data lanes connected to the DSI host.
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.17.1

