Return-Path: <linux-renesas-soc+bounces-25105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E8269C85AFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 16:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D4D474EB43E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 15:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 152ED327211;
	Tue, 25 Nov 2025 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7dlCiyZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA35326959
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 15:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083199; cv=none; b=hhiA6bntdIau81MQ7SlKT9jVNOY9AiFRmVlr9QBQCQz5HExsz1LfjNg37WQrYb679NV6aQGnuLnI+oBrJDz1VBntOBp5Flt6Kv98bPsU+YgVo26oqovo8lnxi1uUfy5hEuOmvxVTLQH1WGLEzn3og+gzAw+E76mnwyzn2ayeQ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083199; c=relaxed/simple;
	bh=URgCagji9ulEv/oC74kPYZAgNQrzgrocXvcqKJMHjg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0qF7CHlwOk5axot7JkdhUKjf+fKvB0THq512ySK3Djsl15wK5BIeeWQg8OyWe4p2cXjaswTvYFjmzhs+BN1YNsNIa0+F99Y7ajmbLuzGmiiYIKCX7QlKWpYo7tU2C4grrI7IjLYeiTFsmsxm+kTqup/inx324Zejbqqg/OdAGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7dlCiyZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d4d9ca6so4612101f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 07:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083196; x=1764687996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jWrl686rUuseHaR2IGQNw+X391sTPqfacAQ3nSnRP8=;
        b=d7dlCiyZ98NzqmBaMsK2m373qTGxOtyB1pu89OAtXgH/QaINpr3Ku6OTFZk5sOnxP8
         fnkH2CRhmSq4btAxGA+yF153+vX+yvbN21LTEsBwd/1+yxmQqe+8taiGwJrJZPBRhHrM
         f5V/LyvKs+VgmSgKlJAmm1cTKPoPRkTEJHVSnXioi9ZCYYaPTKVgmDs/aWADfF790jE+
         85k3N1L6zG3gUqRLen1r+iLtf/asN5pInF+PO2qdybyQcRTX5DRwvAmSMo4qBljlRHJH
         2XxwH62DSAtbXMgXtvj3iZHIQlThdBPR4sk1sIOuQ+eqqYrsf/Zu6QdkBGK/LamnGAyE
         S5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083196; x=1764687996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0jWrl686rUuseHaR2IGQNw+X391sTPqfacAQ3nSnRP8=;
        b=oWVyo8vqKjV9MfbEQFiUoUxT07WyFFTND+dcvsBaJlSxHw7KcBwUC4tAfhJEyOvtQJ
         +uZjywZ+MQlnon+yWZvqIxOU0qICtgXqXj6YcHQ9Op70mFv9tIxatuGKbf5K+TJ/MEYv
         S5VfhaYVV+6db1HWVMXHedpvgU8DzhLbC0gD8dCosvla6aXNpZnon6xMmUNG98SreUPd
         oR1NVnXq3nT7lHVYpsMGI567q24QK/E4Wzsyi6GNhp/npFIgyPtj0SXAqORGRAsdvwNS
         zYDZIW2lzX+HJhWQZdC/n//y0cS9iV4qzuw4UtcKn/9ojwO6Y4EDFGCiF9KkPbunHV6B
         4w2w==
X-Forwarded-Encrypted: i=1; AJvYcCV7IqqBFIw19FjHEPot1IjRLeQjkU0gasxA0M1EqiNTJbkjWhsKYeO1mduScO0ootUV8AcJVjcxFF0CDWKnT33ElA==@vger.kernel.org
X-Gm-Message-State: AOJu0YybXWrrtGmtYg65Ycx2AXeoapsf8ca76Y4VEfcJ1HSGPIZtxBDM
	4pClXRc6Z8UuqPUqUmw46GIkQCvc6RYmL4ZuBD682t301ZlCgDEcwppL
X-Gm-Gg: ASbGncsBN029viXDpXLgtDln10Nf2EB3+tGgBcLjRqGjNaO8Z7kXsrIbbmZeNMT1uZN
	atxt4jsaEBd7LFsmHztl3CuAF8rPGsyewJFoZ7IRYTW1SlkkilsUNkun/MWCpOfaPd3wpS5XEkt
	N/foq3A9m4NCRgeGuzjElBOsgv6CvC8o7iqrHlA3tVKo7Bmsy1cVYTyXd23sVb2t+toLd6hLrRF
	eQy7lDbbYNuCJcy2DOmidU9VmLej7SEGk2T1IvllIgZt9lFXZqWfYFBC+3R2Tc2/FU78hV9Yyj5
	BQ6/sMJwaT7jzm11CeBh/kSpcwRbbgbWKaaX+gL160vTpbXXxpzm4G7bzErCPEwEUXmUXnaQ38i
	VMxinCY3i/jjOeF0j0X0VowviRLRYQYnXF4kqt5KTQrU2UT8sIllDxksRF4xUvtEkG92lIKbyIx
	dcvCYGPt6bPCabIFRBbXA0BU8EFDgjttHGAcB0CXJq14P57BhjsSNDAWcz0/PAy7Lr8i7Dxi6oA
	g==
X-Google-Smtp-Source: AGHT+IHpViq69JVRoMCbsi/0+Kb8UZ+bDh+cIur/3biXiiriptKoLT5nCL3lIDewhvr9osrSVyuF0Q==
X-Received: by 2002:a05:6000:3104:b0:405:3028:1be2 with SMTP id ffacd0b85a97d-42cc1cd8ecamr15209763f8f.11.1764083196216;
        Tue, 25 Nov 2025 07:06:36 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm34797809f8f.32.2025.11.25.07.06.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:06:35 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 01/16] dt-bindings: serial: renesas,rsci: Document RZ/G3E support
Date: Tue, 25 Nov 2025 15:06:03 +0000
Message-ID: <20251125150632.299890-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
References: <20251125150632.299890-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add documentation for the serial communication interface (RSCI) found on
the Renesas RZ/G3E (R9A09G047) SoC. The RSCI IP on this SoC is identical
to that on the RZ/T2H (R9A09G077) SoC, but it has a 32-stage FIFO compared
to 16 on RZ/T2H. It supports both FIFO and non-FIFO mode operation. RZ/G3E
has 6 clocks(5 module clocks + 1 external clock) compared to 3 clocks
(2 module clocks + 1 external clock) on RZ/T2H, and it has multiple resets.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped separate compatible for non-FIFO mode and instead using single
   compatible "renesas,r9a09g047-rsci" as non-FIFO mode can be achieved
   by software configuration.
 * Renamed clock-names bus->pclk
 * Rearranged clock-names tclk{4, 16, 64}
 * Retained the tag as the changes are trivial.
v2->v3:
 * Dropped 1st and 3rd items from clk-names and added minItems for the
   range.
 * Added minItems for clk and clk-names for RZ/T2H as the range is 2-3
 * Added maxItems for clk and clk-names for RZ/G3E as the range is 5-6
 * Retained the tag as it is trivial change.
v1->v2:
 * Updated commit message
 * Added resets:false for non RZ/G3E SoCs.
---
 .../bindings/serial/renesas,rsci.yaml         | 82 ++++++++++++++++---
 1 file changed, 71 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 6b1f827a335b..0e1367dc4aa2 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -10,17 +10,15 @@ maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
-      - items:
-          - const: renesas,r9a09g087-rsci # RZ/N2H
-          - const: renesas,r9a09g077-rsci # RZ/T2H
+      - enum:
+          - renesas,r9a09g047-rsci # RZ/G3E
+          - renesas,r9a09g077-rsci # RZ/T2H
 
       - items:
+          - const: renesas,r9a09g087-rsci # RZ/N2H
           - const: renesas,r9a09g077-rsci # RZ/T2H
 
   reg:
@@ -42,14 +40,36 @@ properties:
 
   clocks:
     minItems: 2
-    maxItems: 3
+    maxItems: 6
 
   clock-names:
-    minItems: 2
+    oneOf:
+      - items:
+          - const: operation
+          - const: bus
+          - const: sck # optional external clock input
+
+        minItems: 2
+
+      - items:
+          - const: pclk
+          - const: tclk
+          - const: tclk_div4
+          - const: tclk_div16
+          - const: tclk_div64
+          - const: sck # optional external clock input
+
+        minItems: 5
+
+  resets:
+    items:
+      - description: Input for resetting the APB clock
+      - description: Input for resetting TCLK
+
+  reset-names:
     items:
-      - const: operation
-      - const: bus
-      - const: sck # optional external clock input
+      - const: presetn
+      - const: tresetn
 
   power-domains:
     maxItems: 1
@@ -62,6 +82,46 @@ required:
   - clock-names
   - power-domains
 
+allOf:
+  - $ref: serial.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-rsci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 3
+
+        clock-names:
+          minItems: 2
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-rsci
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          maxItems: 6
+
+        clock-names:
+          minItems: 5
+          maxItems: 6
+
+      required:
+        - resets
+        - reset-names
+    else:
+      properties:
+        resets: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


