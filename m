Return-Path: <linux-renesas-soc+bounces-9263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 365FE98BC75
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 14:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D293AB23D88
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2024 12:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988401C32FA;
	Tue,  1 Oct 2024 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iDX7IhOE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CDE1C2454
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Oct 2024 12:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727786605; cv=none; b=f5mBuu2r9K9qjhXYeU4/cZXkQT4zDOtufDcfI5I+rnMgyU/iwQBw6et8uqYXQ561pkuVb1BTzNrtCPqm1EXNWFefwfJ9PWxXFHY15wTxOkiE6P1fjP1tR3AUpRSbCJ5wZjJEAED9RC2bjuBNXsIABF/7m7Li5h37vm732XrkJSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727786605; c=relaxed/simple;
	bh=MYEGz7Pi5Ql49mBq5snuJbJ1vrBUSMYav6MrAyMfPWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgTUMSFIEcUrmLu8LoYjD0TZgBuF0mVFWQS2CSNJtBPT7v05n0XTzuurjU2ZJtoEJLvsj+ivmokkCyR2+Ow3Yjcfw4pXi33fweSQ4/Qf7pxkrOZow057/bjK9JdmgdltrHy2yNzSBSRxWnobCellt2vjayGyBOCAU5/BkkCSjHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iDX7IhOE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=Kq/ClsOFp8OdKAUZmyi6CPuE/vW+zZi52yvNZnPMzmo=; b=iDX7Ih
	OERCqwMPkWLH1zxadtAxtqx9ytONddFuYlQ/6Tw1AF6yJf5polp9OXhE8pnPT79J
	cs93mqJun4IWyZI5w0IizLvwHYF1LDqksuv0c0rSpYIws0zjcxQDggdLDeHoyQnb
	UXrRSdtDf0KYTQyc88+IR/QN/vv5VKYhBdDfCx9uwKhehdTVQIhSx+R/MvT51+2m
	scWkKpdYEtlHB0sbx9DvsghPNxy7C9SmmgW0xelvoFrpdkjK7046WujrBHPVgRHr
	F7RKflIH2HwgyA5m+0aHXmGHJ9OlnEFDRgtAHrzar/7abY2v2FZ2cUwmdFSPhlxg
	SAkL8fMqna7HuCFA==
Received: (qmail 2523660 invoked from network); 1 Oct 2024 14:43:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2024 14:43:14 +0200
X-UD-Smtp-Session: l3s3148p1@37k4qmkjwNoujnuV
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
Subject: [PATCH v2 2/3] dt-bindings: dma: rz-dmac: Document RZ/A1H SoC
Date: Tue,  1 Oct 2024 14:43:08 +0200
Message-ID: <20241001124310.2336-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241001124310.2336-1-wsa+renesas@sang-engineering.com>
References: <20241001124310.2336-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Renesas RZ/A1H DMAC block. This one does not require clocks
and resets, so update the bindings accordingly. Introduce a generic name
in the header to make future additions easier.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../bindings/dma/renesas,rz-dmac.yaml         | 27 +++++++++++++------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index ca24cf48769f..83d79b7d85d2 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -4,18 +4,16 @@
 $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/{G2L,G2UL,V2L} DMA Controller
+title: Renesas RZ DMA Controller
 
 maintainers:
   - Biju Das <biju.das.jz@bp.renesas.com>
 
-allOf:
-  - $ref: dma-controller.yaml#
-
 properties:
   compatible:
     items:
       - enum:
+          - renesas,r7s72100-dmac # RZ/A1H
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


