Return-Path: <linux-renesas-soc+bounces-7203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE8292BBED
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 15:52:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAFD81F225D4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2024 13:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36998188CD7;
	Tue,  9 Jul 2024 13:52:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CB6186E21;
	Tue,  9 Jul 2024 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533140; cv=none; b=TD7BVbaF18DlChV202ZzMwKHmVXPIxnBjcCHIDlSneCpIiA6k1vzBycNJBS2/vEN1SXCeMAjcglFVPWF6h+iiWCbZ7Vxod1blnRMBfCTeekgNBMcCPRipTIm+UdmrxSKE+Z37KYdGpVKclDwedQ4lEatDdNLULQqPUSx4GCK8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533140; c=relaxed/simple;
	bh=j3UPoJE2m3Uut9smDc9QrXXWzYxX9YFknLhjSoFRmB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JA8CIba5541Tc9KBueHq8BRqN6ck3hApzqW6wJETy6Df3CbbDao0MPdX+0XPbb6givtxbbzgML6ELVc8u6cSFylN074hZAHy/Sqv10XH2yD61PBbxWQhgzlld8MkKmJeP+vuY/EfrWQ8k1veOdAJld03TOn6GuTyyXMrvt6pb7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,195,1716217200"; 
   d="scan'208";a="214766364"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2024 22:52:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.130])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 534C843DEDB6;
	Tue,  9 Jul 2024 22:52:12 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 3/9] dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
Date: Tue,  9 Jul 2024 14:51:41 +0100
Message-ID: <20240709135152.185042-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
References: <20240709135152.185042-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document DU found in RZ/G2UL SoC. The DU block is identical to RZ/G2L
SoC, but has only DPI interface.

While at it, add missing required property port@1 for RZ/G2L and RZ/V2L
SoCs. Currently there is no user for the DPI interface and hence there
won't be any ABI breakage for adding port@1 as required property for
RZ/G2L and RZ/V2L SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
v1->v2:
 * Updated commit description related to non ABI breakage.
 * Added Ack from Conor.
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 08e5b9478051..c0fec282fa45 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - renesas,r9a07g043u-du # RZ/G2UL
           - renesas,r9a07g044-du # RZ/G2{L,LC}
       - items:
           - enum:
@@ -60,9 +61,6 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         unevaluatedProperties: false
 
-    required:
-      - port@0
-
     unevaluatedProperties: false
 
   renesas,vsps:
@@ -88,6 +86,34 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043u-du
+    then:
+      properties:
+        ports:
+          properties:
+            port@0: false
+            port@1:
+              description: DPI
+
+          required:
+            - port@1
+    else:
+      properties:
+        ports:
+          properties:
+            port@0:
+              description: DSI
+            port@1:
+              description: DPI
+
+          required:
+            - port@0
+            - port@1
 examples:
   # RZ/G2L DU
   - |
-- 
2.43.0


