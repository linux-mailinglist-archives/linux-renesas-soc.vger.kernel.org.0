Return-Path: <linux-renesas-soc+bounces-9206-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448DD98A805
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 17:00:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07224286829
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 30 Sep 2024 15:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A4420DF4;
	Mon, 30 Sep 2024 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ecP2nFxG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FCB1917F2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Sep 2024 14:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727708402; cv=none; b=oj13GbPbkTZ/8PnY5AkSREzjIJ6ns5Dtu8VC0uI21e6yJ42CVEMYdv1ftGUnhUntwPY/HCq5ja9PQhW+iKSNOuWb/w3Yt169Sji4XnhMGwCCK/Qkcm7BQ0bn4SCvhswK+KPt3RxiNtlM2Syy3UD6cNTgG1XVSP3CY3riFT4UYTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727708402; c=relaxed/simple;
	bh=tWVxh+mDiRso8hgcEW2YIjqsBCKAyFAz4gGQZ6URW5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioZir20Vvc8+BMHHM/50IR7VmmEKkTFCwnbj5tezjt75f2K+TzphKgTTEfepL/JNS9wJSgMUerQdfxlT2KB0Wm2Uv80u2uynBMcxHmAYO3HXgqGqWtUIarNNJPOaC0JKWxR0hJ5awrWWhMPNYiU3NqlKepBh3wKlF+iJ+RP37K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ecP2nFxG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=M/Y4Kc2EyplrNxJF8txEuGgV7c5bIUCEU73p6krr4TE=; b=ecP2nF
	xGP38W1UfsRCXewzCWYJwQzK+Y/CbqxbdODIgFsMuhiI17BPj3wDw2LIQn13m80e
	VUe2lnC9PR5sADxYPAx96CmjKTZpxD4gnLtYIJ5XgwxFg9MCpWq+grfiewjh59kO
	PeZksctFXDc7K14oQyx9ssznI91d5loXJUNGCm62Iwta65pQ+1ZattTNMl9w40Mt
	WmZA0rS6zPjRnjEx+ipf1Nju0lidjyiDkOB+pkMwC0z9bbq2mgLp1ZojVjoIgHV0
	KwyX5AF35MNXIAyCQ7aTWftrU06YWZOVqLIDlAriES9T9HzzY/vXQhyTNECYgP20
	cPs7waT3ETdwdmMg==
Received: (qmail 2222667 invoked from network); 30 Sep 2024 16:59:58 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 16:59:58 +0200
X-UD-Smtp-Session: l3s3148p1@NrtZdVcj6OYujnsJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: dma: rz-dmac: Document RZ/A1L SoC
Date: Mon, 30 Sep 2024 16:59:53 +0200
Message-ID: <20240930145955.4248-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930145955.4248-1-wsa+renesas@sang-engineering.com>
References: <20240930145955.4248-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Renesas RZ/A1L DMAC block. This one does not require clocks
and resets, so update the bindings accordingly.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/dma/renesas,rz-dmac.yaml         | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index ca24cf48769f..e05aaf24eb64 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -4,18 +4,16 @@
 $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/{G2L,G2UL,V2L} DMA Controller
+title: Renesas RZ/{A1L,G2L,G2UL,V2L} DMA Controller
 
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
-allOf:
-  - $ref: dma-controller.yaml#
-
 properties:
   compatible:
     items:
       - enum:
+          - renesas,r7s72100-dmac # RZ/A1L
           - renesas,r9a07g043-dmac # RZ/G2UL and RZ/Five
           - renesas,r9a07g044-dmac # RZ/G2{L,LC}
           - renesas,r9a07g054-dmac # RZ/V2L
@@ -93,13 +91,26 @@ required:
   - reg
   - interrupts
   - interrupt-names
-  - clocks
-  - clock-names
   - '#dma-cells'
   - dma-channels
   - power-domains
-  - resets
-  - reset-names
+
+allOf:
+  - $ref: dma-controller.yaml#
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,r7s72100-dmac
+    then:
+      required:
+        - clocks
+        - clock-names
+        - resets
+        - reset-names
 
 additionalProperties: false
 
-- 
2.45.2


