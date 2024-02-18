Return-Path: <linux-renesas-soc+bounces-2927-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1B88597D3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 17:49:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 82D3EB20EBA
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Feb 2024 16:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7B96EB47;
	Sun, 18 Feb 2024 16:49:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D61BFBEA;
	Sun, 18 Feb 2024 16:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708274945; cv=none; b=pOG1SrWmW+SqENHEJdbfUpm7iI3wk+an03G8gPZj2R5WZC7HzevoRgEgVlIYH/dN6ikMLIJY6+w1rqQR6q6WGfYRLlnyPG1KbXznyCCNSHIvMZBwPSUVW7NciGxrfAoC/C5I/1DVposSshY4Xev5aYLuQtQ2bzqi8/FMnvmPYWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708274945; c=relaxed/simple;
	bh=AWnMkOvUxY27f6JfiY3UJsthb2nxmPpUzd5mhI1hJsk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XADZQCaFyUeyXJYWvZQ8BVtcldjfSd5Mwf9AQejh79Ddg8o8uRycxH4nFgg4gLvLzrWWofDfZLhaorFDpaXc4lCicompDDaNBap6rOaoqo4urDT2k328+4PWFZ6GIMtCk22rSIJ6BKKQ5UcRe3PChl4NbOvTKM5/5WiV12/3KiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,168,1705330800"; 
   d="scan'208";a="198244681"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Feb 2024 01:49:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.34])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 87AEE4007F4A;
	Mon, 19 Feb 2024 01:48:57 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v17 2/5] dt-bindings: display: renesas,rzg2l-du: Document RZ/V2L DU bindings
Date: Sun, 18 Feb 2024 16:48:37 +0000
Message-Id: <20240218164840.57662-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
References: <20240218164840.57662-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document DU found in RZ/V2L SoC. The DU block is identical to RZ/G2L
SoC and therefore use RZ/G2L fallback to avoid any driver changes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v16->v17:
 * No change.
v15->v16:
 * No change.
v14->v15:
 * No change.
v13->v14:
 * No change.
v12->v13:
 * No change.
v11->v12:
 * No change.
v10->v11:
 * No change.
v9->v10:
 * No change.
V8->v9:
 * Added Rb tag from Laurent and Geert.
v7->v8:
 * Fixed the typo vsp2->du
 * Added Rb tag from Rob as the change is trivial.
v7:
 * New patch.
---
 .../devicetree/bindings/display/renesas,rzg2l-du.yaml    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
index c0ad194c538d..08e5b9478051 100644
--- a/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
@@ -16,8 +16,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - renesas,r9a07g044-du # RZ/G2{L,LC}
+    oneOf:
+      - enum:
+          - renesas,r9a07g044-du # RZ/G2{L,LC}
+      - items:
+          - enum:
+              - renesas,r9a07g054-du    # RZ/V2L
+          - const: renesas,r9a07g044-du # RZ/G2L fallback
 
   reg:
     maxItems: 1
-- 
2.25.1


