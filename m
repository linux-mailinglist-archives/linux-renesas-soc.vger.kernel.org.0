Return-Path: <linux-renesas-soc+bounces-8074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5A495BBEC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 18:28:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B58B1F2741A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 16:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 113ED1CCED8;
	Thu, 22 Aug 2024 16:28:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A780D1CC8BA;
	Thu, 22 Aug 2024 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344119; cv=none; b=SmOP+1hZ3r5dC1BmrI9j8xoePXx9zoWl5F46FA3ZUivs3I4F7Zhm1ca+/cn5mTVLeDWSp+odocDLfeQDfdaQol4BsIlvQ4XCag9t8zPmtvAGD1eJstP7eBdQnPTMhXI1PpPEvQ8qjS4UB3Cl6vboS7CjIByH5TKa3NPnw55EsMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344119; c=relaxed/simple;
	bh=o/KOq/nHYT0ugpWxb8b6BMIFszQPiryYq8qRnakk31I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rkDdvDAgCJtNl/kvBcKLrmW59hUiKumkwKWQPD3j+5LNqYCnYbvsp0QxCJSMy79dl/6lnIEx0hcJ9KPxyHx/TNliY52ZlpGhGjg2UwyhWefKHDBxCKNUrOvC3W6PO4wkQFLU0MYo94l1ObmEHhg0MIuuKAASZGHE/JWDahNSoqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,167,1719846000"; 
   d="scan'208";a="216311613"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Aug 2024 01:23:33 +0900
Received: from localhost.localdomain (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id A712C4007CF2;
	Fri, 23 Aug 2024 01:23:28 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v4 1/4] dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
Date: Thu, 22 Aug 2024 17:23:14 +0100
Message-ID: <20240822162320.5084-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
References: <20240822162320.5084-1-biju.das.jz@bp.renesas.com>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Restored the ports property for RZ/G2UL and described port@0 for the
   DPI interface.
 * Restored tags from Geert and Conor as the change is trivial
   (Replaced port 1->0 from v2).
v2->v3:
 * Replaced ports->port property for RZ/G2UL as it supports only DPI.
   and retained ports property for RZ/{G2L,V2L} as it supports both DSI
   and DPI output interface.
 * Added missing blank line before example.
 * Dropped tags from Conor and Geert as there are new changes.
v1->v2:
 * Updated commit description related to non ABI breakage.
 * Added Ack from Conor.
---
 .../bindings/display/renesas,rzg2l-du.yaml    | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index 08e5b9478051..95e3d5e74b87 100644
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
+            port@0:
+              description: DPI
+
+          required:
+            - port@0
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
+
 examples:
   # RZ/G2L DU
   - |
-- 
2.43.0


