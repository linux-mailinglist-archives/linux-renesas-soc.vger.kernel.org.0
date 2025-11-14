Return-Path: <linux-renesas-soc+bounces-24646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 593CAC5CB28
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 11:54:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2EBF3349C35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 10:52:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30F21313E30;
	Fri, 14 Nov 2025 10:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JD/2V9zU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC7D313291
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763117529; cv=none; b=nTGg9GZTE6TWPEtBTHbO98uNOOievy4Eus1VbUYU+ws2YVBMMXwyf1HY46m1Vcb+dOt9NmKMOAkcW3H0C3e3cwG7Nxmn+aAaNfpPvhJm1J3suFRK6pFA8Fw0+UCkLvjyvH7AgE7BSVg5zNPp6JaxeKXGwmFETt+PuuZntYydh8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763117529; c=relaxed/simple;
	bh=8Bu2fKrShIIepljLuBCD9N8cR6F036LkHOFPwYoq3J0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+EIEotoAfknACjLvjRQQyk3WfVE8/zy3NKL1pBymyrrJukbxQrhNuTGTqAGCu/BOvagiVHjwNy8HmV+HZXKlFfx8KZjfoXEkDMOKIjcTa7jNivoFZEtAVcqwbyaC/cllDEsKwuTK/mJ0pypo+BPVJVc3d7/6HXc/ZDG6ae8X2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JD/2V9zU; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b38693c4dso912523f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 02:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763117525; x=1763722325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CYjJHm7EYtoIn1A0CwAr8hq5h6XMImyi3SSst8EGQk=;
        b=JD/2V9zU45BdtlwHkfmdTKNiGbUGWS0mX46XjNjVwMe3raQ/2HtbeLReQdQXZsy1Q3
         qVkgXD7dE8uuUsZT9BBZR6RzonDMkLFEYB6VPoBIB2Kbfx3F4zHHWDcKRM/z+/RWZZXX
         99Fn3Lcny+brEVaU6QtuMIvd3KUTfpIrXAFiHq7H0G62VcYKHDtdox9I69XqgStLkl/c
         qps2RweEWSUgLUbcwKSSnlmcvq/J3jcuDvBoQxvHm/Jdjxg4xboui8SVm6Wp6gj2J76W
         KjpU3ZnBqnlBcWtEtJeMQzFVnSk5JIFM2tre7ybTqsRdWiLejzOuInCCbt8SvEr0nn3p
         VlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763117525; x=1763722325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6CYjJHm7EYtoIn1A0CwAr8hq5h6XMImyi3SSst8EGQk=;
        b=fqFKu3p5twaxYX3yWQZNC8mhWkKs3wsKyA0ugVZpcQs5jF7WwK98wS83vvd9HZyKvE
         pojdaVl5eTwsDgxZI2Gf7kx+00Z9i50EUttV9TCxjzG0ItM+O1J0FAmlKazsHZF2eLVi
         uNirIag99+DgeEI+1XLV77j9v2BOuIWba3R/LGFqv+R9pzOutl1anOnYvkMmtNouxze1
         epn4mvKDsqadJQKc7Erjf6A4nh9wwkeUsFAHi6bmh3cqSBOIuQqP05fgz/mhYF79TnzK
         aw3YgRewLlj1Y+zXb9PJxwT0e6OKSA00PJJlNkVWTiDTjQumEhNFQJ+1wFSiod24/wQe
         DxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGT3lBVgOcB38jnUobMo4stvVl7729JlYDp+A0KOj+gThsA6U+uSW5Nhb5MaPDNPJ/BGytE7anHzJrHFNXokT8Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9lrCjlqMk5iusm8URQItbNHFDzx2akmYBSczrLNkudS97/xI
	q5Iv4KmrXnlCOwzzA/aCYd6xqLzeJqmEY0C1ElELKxVeMV20Dgj8866n
X-Gm-Gg: ASbGnctB4kXSJlIGBamyPG9Csn+CdSYTS8gek9cAYZF+Yt5IX6l1eEsxo09+DazEDI3
	zqNSvjz3YcSuXVQJSj/r3lBFpJAlUTQm4CrkuFM729ABXnilG07xqUIMtsYnjIKIG2roZ93BI+e
	sYsLGpn+tqYieCm+EINFwMkT55pdKT9YB2h39B+ogYgmK0tNMR9M9WuFhZo54S1Dp0pal3681qR
	wUNUvQmHyQ8pKUbcC/EErlO1Jyi1ntaSoLuQTA91y74GpmWAbibjYI6HYlv0TIiQqfh2MZRHSW7
	xDklpV/n9avEdhjKa1Pv+5lV8Y8WWY5+HAV1oATrlNkiPTTO6h6oDYM0lP6FDrBbaZ65AXAwHFT
	ugMNJQaeYwYoO5QwkHQwfIwJpqdMPSVz9ElJ2tgyuA7Tx++HepqmDVOvVHRFUXPV7JhuaFmRhw5
	/7cJKKioXS9GNWOBFMsL3f8hn6nGXD2HG9NsMpa3+o3QMRj164ZuVGHv02hsxKpy3eOIHc613lp
	sU19VUTxs9lLFtw
X-Google-Smtp-Source: AGHT+IHYWVQb/BAJyt/+hyC87axtZ32nfypZdLafafoHUs5x4w2ZkZ+Hu+qO9TnGug6+Ee/nfA8xpQ==
X-Received: by 2002:a05:6000:22c6:b0:429:cdd9:807f with SMTP id ffacd0b85a97d-42b595a1677mr2211016f8f.61.1763117524674;
        Fri, 14 Nov 2025 02:52:04 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f17cbfsm9031255f8f.35.2025.11.14.02.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:52:04 -0800 (PST)
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
Subject: [PATCH v3 01/13] dt-bindings: serial: renesas,rsci: Document RZ/G3E support
Date: Fri, 14 Nov 2025 10:51:10 +0000
Message-ID: <20251114105201.107406-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
References: <20251114105201.107406-1-biju.das.jz@bp.renesas.com>
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
 .../bindings/serial/renesas,rsci.yaml         | 85 ++++++++++++++++---
 1 file changed, 74 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 6b1f827a335b..1a35d6fa67b1 100644
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
@@ -42,14 +41,36 @@ properties:
 
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
+          - const: bus
+          - const: tclk
+          - const: tclk_div64
+          - const: tclk_div16
+          - const: tclk_div4
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
@@ -62,6 +83,48 @@ required:
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
+            enum:
+              - renesas,r9a09g047-rsci
+              - renesas,r9a09g047-rscif
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


