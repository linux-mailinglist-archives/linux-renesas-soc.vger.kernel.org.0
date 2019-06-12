Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBA1C4282A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 15:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409242AbfFLN53 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 09:57:29 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:59326 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409241AbfFLN52 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 09:57:28 -0400
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id PpxR2000l3XaVaC06pxRkQ; Wed, 12 Jun 2019 15:57:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hb3kj-0002XP-G1; Wed, 12 Jun 2019 15:57:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hb3kj-00056E-Ds; Wed, 12 Jun 2019 15:57:25 +0200
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
Subject: [PATCH v3] dt-bindings: display: renesas: du: Document optional reset properties
Date:   Wed, 12 Jun 2019 15:57:23 +0200
Message-Id: <20190612135723.19561-1-geert+renesas@glider.be>
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
index aedb22b4d1613d1f..87e5fb2ce75e103f 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.txt
+++ b/Documentation/devicetree/bindings/display/renesas,du.txt
@@ -44,6 +44,14 @@ Required Properties:
     instance that serves the DU channel, and the channel index identifies the
     LIF instance in that VSP.
 
+Optional properties:
+  - resets: A list of phandle + reset-specifier pairs, one for each entry in
+    the reset-names property.
+  - reset-names: Names of the resets. This property is model-dependent.
+    - R8A779[0123456] use one reset for a group of one or more successive
+      channels. The resets must be named "du.x" with "x" being the numerical
+      index of the lowest channel in the group.
+
 Required nodes:
 
 The connections to the DU output video ports are modeled using the OF graph
@@ -88,6 +96,8 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
 			 <&cpg CPG_MOD 722>,
 			 <&cpg CPG_MOD 721>;
 		clock-names = "du.0", "du.1", "du.2", "du.3";
+		resets = <&cpg 724>, <&cpg 722>;
+		reset-names = "du.0", "du.2";
 		vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
 
 		ports {
-- 
2.17.1

