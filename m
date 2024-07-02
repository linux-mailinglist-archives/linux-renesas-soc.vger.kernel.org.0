Return-Path: <linux-renesas-soc+bounces-6973-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F376923A75
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 11:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53B8B1F21969
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2024 09:47:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4528155CA5;
	Tue,  2 Jul 2024 09:46:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E1F13D8BA;
	Tue,  2 Jul 2024 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719913618; cv=none; b=sVQHBunXFkrQnMgXqL21T/8McyOIVgD4KRJ1FIOSg9OdMREgmg0d6gFGnDQpcivmD0Jwb+jMjGDR8HUEL+3oBSaNnRWGx/e2wbIqRDgNYtMPcAJ+FJMwyUohUWMjI8EIN/Imoa+hweRFrGkZjYr//zi5DHcx6sbGFAUGSHlqOF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719913618; c=relaxed/simple;
	bh=ZOhf+9w+6GduJ2h2t5rfADRDg3j/LLnfAMZDhPSjQ/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JZplc7M/jkjjaDcURBSiu25HUUO3rTFbhrYv1sXPMaCYNDpQxR27j6RlCDn57AmEMZSINkN1PxF+YoFq/tOg33jmhmOD0J+gm16Bdn8qytcglKeFVXhEvnwOjynFTh3z4fHIEuzLOQ72tzrsthPXsZer/I77A94sNhdUasT+N3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,178,1716217200"; 
   d="scan'208";a="213970926"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2024 18:46:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.72])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 071DC40031F9;
	Tue,  2 Jul 2024 18:46:49 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 3/9] dt-bindings: display: renesas,rzg2l-du: Document RZ/G2UL DU bindings
Date: Tue,  2 Jul 2024 10:46:13 +0100
Message-ID: <20240702094630.41485-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
References: <20240702094630.41485-1-biju.das.jz@bp.renesas.com>
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
SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


