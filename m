Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF8015D3C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Feb 2020 09:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgBNI01 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Feb 2020 03:26:27 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:54182 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726769AbgBNI01 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Feb 2020 03:26:27 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 2YSQ2200V5USYZQ01YSQXn; Fri, 14 Feb 2020 09:26:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j2WIq-0005Cj-Es; Fri, 14 Feb 2020 09:26:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j2WIq-0001Hf-Bu; Fri, 14 Feb 2020 09:26:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5] dt-bindings: display: renesas: du: Document optional reset properties
Date:   Fri, 14 Feb 2020 09:26:23 +0100
Message-Id: <20200214082623.4893-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the optional properties for describing module resets, to
support resetting display channels on R-Car Gen2 and Gen3.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Who's taking this kind of patches?
V1 was submmitted in March 2017.

v5:
  - Rebase on top of renesas,cmms and renesas,vsps patches,

v4:
  - Use "All but R8A7779" instead of "R8A779[0123456]", to reduce future
    churn,

v3:
  - Add Acked-by,
  - Drop LVDS resets, as LVDS is now covered by a separate binding,
  - Update the example.

v2:
  - s/phandles/phandle/.
---
 .../devicetree/bindings/display/renesas,du.txt         | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.txt b/Documentation/devicetree/bindings/display/renesas,du.txt
index eb4ae41fe41f83c7..51cd4d1627703a15 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -50,6 +50,14 @@ Required Properties:
     VSP instance that serves the DU channel, and the channel index identifies
     the LIF instance in that VSP.
 
+Optional properties:
+  - resets: A list of phandle + reset-specifier pairs, one for each entry in
+    the reset-names property.
+  - reset-names: Names of the resets. This property is model-dependent.
+    - All but R8A7779 use one reset for a group of one or more successive
+      channels. The resets must be named "du.x" with "x" being the numerical
+      index of the lowest channel in the group.
+
 Required nodes:
 
 The connections to the DU output video ports are modeled using the OF graph
@@ -96,6 +104,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
 			 <&cpg CPG_MOD 722>,
 			 <&cpg CPG_MOD 721>;
 		clock-names = "du.0", "du.1", "du.2", "du.3";
+		resets = <&cpg 724>, <&cpg 722>;
+		reset-names = "du.0", "du.2";
 		renesas,cmms = <&cmm0>, <&cmm1>, <&cmm2>, <&cmm3>;
 		renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 
-- 
2.17.1

