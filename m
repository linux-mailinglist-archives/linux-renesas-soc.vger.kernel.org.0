Return-Path: <linux-renesas-soc+bounces-23910-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83DC21942
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 18:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC2581A629F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Oct 2025 17:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2609A36CA9D;
	Thu, 30 Oct 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUoK0DHw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3405A36CA6F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 17:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761846933; cv=none; b=pOxLSeOPy1SoM4paJeitF0UVfShFBAst1S+LCScKNesxruz5h/duKrN6bJk7V2V5S/YjJ3giIi92L1GJ/zgNp4+ZTVunolJwvdRax+SVhnBhdaQCctDggV7FcqaOw94Lvo4GPjOn0BJLvCZs107x30Kd/J00B5vOekcWdEAb0JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761846933; c=relaxed/simple;
	bh=3z2mhzRxyfQNv1R0hi7ZTnOWImB9S2k6FugjQXRhwUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxNViQs24XOoh/VSt5mxMS/qH+h+WfTyO9i7u+cStfvqCxp+7kCnwI795RExEOqd+9bOQgBw1WxCYMcczgK+Ib4qrOgC6SD/t67ou3k5fTO1ey6JnFF+UGaQJ28bCWrgZNxxG14Jc4aKRydI1qhH0S387bUkUbsmCRimpkcmMjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUoK0DHw; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-421851bca51so1210603f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Oct 2025 10:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761846929; x=1762451729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8YnOhLYa4+B1Ekt7MbimeIIDg/J8LnZDYbx9DRe05Y=;
        b=GUoK0DHwVAUvfYncsyPHQ72jouRM6y4QLN89pB/okT/41amSnBd+vsfTFaw8vbp/gV
         QCxmrN1Tj67ZnkHnXfXzfju2lPdWJFXhyJKaAsoCJmGXqlAa6hwK30H9mf3wovxQDyEM
         QSrl0oVmomV8DWZgmsDSHSIFZ+u1s9uLXZiyEi4Ai1JiwjfoSR7hveCuKCU31d/dEJMR
         TjPZjqQDo9UH60X5fFZ+o6cHQ9u8VGB5zSsfKvFhadggIBuck1qIpmTRYWNfn0PG54ED
         CoxtcI9TY2Gt6lXSN607U+UsyO/wdJR5S/jbYcmGEjSwx9Uxgls/sdWNAAtPUtjsSndp
         LO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761846929; x=1762451729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8YnOhLYa4+B1Ekt7MbimeIIDg/J8LnZDYbx9DRe05Y=;
        b=kl2asc/9J4NcQm4zYODa0rPWU+aA4fGHiNPdXf8uZpBMBlpOQGfYYYBQRitUV0dB6/
         i9vJMA6gElvCrZC6yUBukNXQpkS8S5sHHdoZZFH8y8fo0Of/9BpQAaz8i1jTup3jYAGh
         h8x2k0uk/hY58WLtoXw+71k0lrT2vRaJp4eI+NyilRJ4bAox5PtfGamS++lUHCJ/tcoY
         5C0BMwBQE5I7a7JMm9ujWc4BTMz8ZB9c4mz/za3kgmq4F3MpT7fbPEtubgc/X5rf4SbO
         idzoOa2VPovPYjjOAOES54fGoZuexg++nN2mavP41jvm74NsGUowkbqkvweMleAS8TkO
         CcDA==
X-Forwarded-Encrypted: i=1; AJvYcCUvftT1nNn6MQeN1KJaHsO8C9iGAjBKtjvsaKXHYghyEWKxc2qX3zzWexFRqYE0Zn6/alwF+rk1WD/XkuaUvkfHCA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMXGmeBO4HgjRTAtFG19/SDzr6T+SibIQQ+qrtV25t9utn3zg
	HLVkLm5/G49mPKrA+JG4zU1nbv+XV0WY9v3Kx0UBYHhEprD6wiANHePP
X-Gm-Gg: ASbGnctNO7nIM2fudqPZzxDLt/3WXHAGGn54Acte+upWvj+nPl+bxnD0iAnIOdk7FNM
	IOg6fDCtvl+A63msnqffgk0OdNgN/dQVIQ3Vm7zC7o6jGwwUvS9mY/8UTutoaC49z6z4ApfBXgS
	fjl861EAg3IkBYOVCyKn2BTYrSUtBKGCPSGRNUpoKw9RJVoTPvLFlwPId0fcNFJbaH2jOJe1Urh
	aIhxb2FcYpnggDj3XCWnTo6t0l8K+WxVaQ64ukdKK26o8h4xCZQ8D7hMY5QJNwr6sSxg2ge9GxD
	RzlqpzTvxaIPy3YoTMCr6aLObu5v1elxfsGRsN6BgeaKkhvWgmlZiha2MaQby3/zFEuFv9yXWUV
	aP5h9SLa6KImhpekMI5ZLm9aLTyei/O25It4O8SkVjL/M/lroFkED/uzl9ibxvnjiWlvrzmgwwi
	KA8RxI2X/TvXEMQ/CXiJbhBxad1nb2caaOBusWCtPePiOTWRl8U5/ztEOAjgHj
X-Google-Smtp-Source: AGHT+IFwc9rIFO7apqC3XmXhkXUpx2h1S3c6wGBMHk4QlRiJ5KyIleWF8cbqLDTxKoIV//tw2zW3AQ==
X-Received: by 2002:a5d:5846:0:b0:3fb:9950:b9eb with SMTP id ffacd0b85a97d-429bd683f6cmr459520f8f.28.1761846929243;
        Thu, 30 Oct 2025 10:55:29 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de5f9sm33384041f8f.38.2025.10.30.10.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:55:29 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 01/13] dt-bindings: serial: renesas,rsci: Document RZ/G3E support
Date: Thu, 30 Oct 2025 17:55:05 +0000
Message-ID: <20251030175526.607006-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
References: <20251030175526.607006-1-biju.das.jz@bp.renesas.com>
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

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit message
 * Added resets:false for non RZ/G3E SoCs.
---
 .../bindings/serial/renesas,rsci.yaml         | 85 ++++++++++++++++---
 1 file changed, 74 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 6b1f827a335b..1c2ed4cd58fd 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -10,17 +10,16 @@ maintainers:
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
+          - renesas,r9a09g047-rsci # RZ/G3E non FIFO mode
+          - renesas,r9a09g047-rscif # RZ/G3E FIFO mode
+          - renesas,r9a09g077-rsci # RZ/T2H
 
       - items:
+          - const: renesas,r9a09g087-rsci # RZ/N2H
           - const: renesas,r9a09g077-rsci # RZ/T2H
 
   reg:
@@ -42,14 +41,40 @@ properties:
 
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
+      - items:
+          - const: operation
+          - const: bus
+          - const: sck # optional external clock input
+      - items:
+          - const: bus
+          - const: tclk
+          - const: tclk_div64
+          - const: tclk_div16
+          - const: tclk_div4
+      - items:
+          - const: bus
+          - const: tclk
+          - const: tclk_div64
+          - const: tclk_div16
+          - const: tclk_div4
+          - const: sck # optional external clock input
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
@@ -62,6 +87,44 @@ required:
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
+          maxItems: 3
+
+        clock-names:
+          maxItems: 3
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r9a09g047-rsci
+              - renesas,r9a09g047-rscif
+    then:
+      properties:
+        clocks:
+          minItems: 5
+
+        clock-names:
+          minItems: 5
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


