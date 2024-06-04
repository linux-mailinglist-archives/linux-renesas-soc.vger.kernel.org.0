Return-Path: <linux-renesas-soc+bounces-5830-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D598FB9DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 43ECA1C22063
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C5C14A099;
	Tue,  4 Jun 2024 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QANRQWjR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13812149DE3;
	Tue,  4 Jun 2024 17:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520747; cv=none; b=Hzs/UxONWusyqWb5Ea3W72KlH+0rxTkzC4Fr4K4IjTYgCjmk+2k02dmxnZJNuR6vQUEqw6D83WuTdC50ZGmzSmaCBUNiinc3c9XF+Vux0TZHcPDKAaUv3noFWgLPDQLzQ9PUB0170yWoTuQkX1Rp01khDc2+r7eroPERMeX5//Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520747; c=relaxed/simple;
	bh=d+2x9cGMo78aTqkczPA9yowgeFOlc6t4grq1Dv/ZbPk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RininzOPEyh69v/Z9pvhCCfpmmCvvugAtGZEzuTPMlRerpG872PF3iUPPsdroqXOsiJWH69g5vqKe+fAkVzSFBCC/kNBKc5sazQXEb9oteAQAs308Wc9mwzn/j1atYWZr4VX3eiTWDqX83wvwdgpEB8o5I+Wlt0IzAsozjw6F8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QANRQWjR; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-354f3f6c3b1so1203267f8f.2;
        Tue, 04 Jun 2024 10:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717520744; x=1718125544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgsAqME3hxSzwVXOIFIzJzM6T7MjbgDUONVzfuz1YfY=;
        b=QANRQWjRXbQy47iGgRnXvUdNxhSMo3q88qMEMLKnuV8IdRPta+/tOvav0kZ/PpSton
         ct2PhJTcGHj20AVtVQFbT6WVXB0ndngZ3G1hmHSBm0/kDXBXBe/FOR5h37BvdahxWuLw
         t2Gh6+ELX/OFu+VsZMBhV2t04DfHO8kfoz2x3nl2QxGCt3TLmEnRk9ZUVUyIyhNAMMxD
         ivPZieSB6xFevYf0oGf28vqXznHUfpUEwjwFbAzyG11fullqMlIfzhXmjzZeSzJnCzTn
         qJzsTI52vZPy5x7pguu0Fcf9vEx6myJB43pn6H6xhYGmlC0sJfN38Y4grtWU6tObivn6
         VXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520744; x=1718125544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgsAqME3hxSzwVXOIFIzJzM6T7MjbgDUONVzfuz1YfY=;
        b=hcvhUVbpgzCybJqtOlgupk3hEjRUnVchJ/QP9lCaaeT0uJa43TnzBpXz37qry+dVMo
         SNyaaXitSMyC5RR8nWRR6FJuJQmBv0vEJr4LfCoa/kidgde79tIli2+VUfAOVGuAdNzW
         9a4aJrr9Av2Vm/7opqUCB8UcNkvyc+GxXb2Lri1FW/mJ6dxE5So1cbTHACPcklpjO7Wl
         tjQNjaFNMveJD7BNjRoKjUD+jdlhfibKL7zpHn3QpDfL19PoF8JU32U7SN660kl/jv40
         tTwIeX9kX2H2kkqz/z04qn8nWX/xvItx3Sz5FwgHLjno2fHIZf/lZjIbHGuVZMY0KBUI
         oRAA==
X-Forwarded-Encrypted: i=1; AJvYcCXfK0bJOQohiDPGDMAHrT97/f5AgzPVvE02vzJ941D5+Gyye1mUjTFCKSmspxdMUEwWbxD+x2MUX5Cn5LlEwx7TyeNzNcraFyRDRXBsPxHUOcV6ZeH5cH90ycJV2mqi7UtypcpgUHHYUOhxhuGurayZFnU+dzM1xYc2twBJSIITDhY2UmTR5PNksT9B1UG3XjudxJfWc1jqCF+OyQnfoZ5I5rk1Dqr4WLxJ
X-Gm-Message-State: AOJu0Yw9L12syJXH/npwKefq5Rgm0/yNSM1uMTFnr2N9etGP5fQ8a2ar
	qur5Fk5GLmtSVBkYsNdwxfA89pYNYI1XgONMDHHfN+ZkuX7SLI3z
X-Google-Smtp-Source: AGHT+IEbyb8T4SxgcrrXFB3ksM+RBgj3AP2GOI0NxiXB6/dMujAECXAm6qQYkv2eN7AImaEh32Qojw==
X-Received: by 2002:a05:6000:a84:b0:354:fb1d:694e with SMTP id ffacd0b85a97d-35e8ef09959mr17262f8f.29.1717520744175;
        Tue, 04 Jun 2024 10:05:44 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f2asm12244077f8f.3.2024.06.04.10.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:05:43 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/5] dt-bindings: serial: renesas,scif: Validate 'interrupts' and 'interrupt-names'
Date: Tue,  4 Jun 2024 18:05:10 +0100
Message-Id: <20240604170513.522631-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This commit adds support to validate the 'interrupts' and 'interrupt-names'
properties for every supported SoC. This ensures proper handling and
configuration of interrupt-related properties across supported platforms.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v4->v5
- Included RB tag from Geert and Conor

v3->v4
- Reverted back to v2 version of the patch.
- Used suggestion from Krzysztof for interrupts
- Restored RB tag from Geert

v2->v3
- Listed interrupts and interrupt-names for every SoC in if check
---
 .../bindings/serial/renesas,scif.yaml         | 73 ++++++++++++++-----
 1 file changed, 55 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index 54f885f720f0..a750676064cf 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -87,11 +87,6 @@ properties:
     oneOf:
       - items:
           - description: A combined interrupt
-      - items:
-          - description: Error interrupt
-          - description: Receive buffer full interrupt
-          - description: Transmit buffer empty interrupt
-          - description: Break interrupt
       - items:
           - description: Error interrupt
           - description: Receive buffer full interrupt
@@ -99,21 +94,17 @@ properties:
           - description: Break interrupt
           - description: Data Ready interrupt
           - description: Transmit End interrupt
+        minItems: 4
 
   interrupt-names:
-    oneOf:
-      - items:
-          - const: eri
-          - const: rxi
-          - const: txi
-          - const: bri
-      - items:
-          - const: eri
-          - const: rxi
-          - const: txi
-          - const: bri
-          - const: dri
-          - const: tei
+    minItems: 4
+    items:
+      - const: eri
+      - const: rxi
+      - const: txi
+      - const: bri
+      - const: dri
+      - const: tei
 
   clocks:
     minItems: 1
@@ -174,6 +165,52 @@ allOf:
       required:
         - resets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen1-scif
+              - renesas,rcar-gen2-scif
+              - renesas,rcar-gen3-scif
+              - renesas,rcar-gen4-scif
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+
+        interrupt-names: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,scif-r7s72100
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+          maxItems: 4
+
+        interrupt-names:
+          maxItems: 4
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,scif-r7s9210
+              - renesas,scif-r9a07g044
+    then:
+      properties:
+        interrupts:
+          minItems: 6
+
+        interrupt-names:
+          minItems: 6
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


