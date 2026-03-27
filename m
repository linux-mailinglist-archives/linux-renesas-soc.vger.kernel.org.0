Return-Path: <linux-renesas-soc+bounces-30442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAdII6TCxmm8OQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:47:16 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 336CB34893E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 18:47:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03FE430428A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Mar 2026 17:42:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24983FBEA0;
	Fri, 27 Mar 2026 17:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKSOcbl9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337B1221540
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 17:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633372; cv=none; b=HbSowOyJimyUTJCftDiQwbs1Vn7TS0S8qCsmZjQY9oPc+BqhXrvacxoWjLjSGXvBfDmEr5bQo/khtZ0B4Cx6ASg2qVlq5aKiBqcA3w6AhjcRrQ73WESAEoPWYq7msCxVJ3lj81mWmejU8TVV5z0t7YPhR2oP6yAByWZf7hwi+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633372; c=relaxed/simple;
	bh=n/SigdKyXTHXAMOgdOkyYoCjrKeCCVOvmY9wB8H71tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=egEfBBArMoSGpRHQYmd0QWTJPNd11oFM74I/1gzFoU/kVX0pI4r1fy92sdoTgD81bJ1t/heRN5X2S4icrdX2LCZm03tY1p7fSreU+lo9sC8d1vr9EmSfwvF1XfEXr6MuUGxBe3rwMDJBEnKhRiyOAuOVw4DgBosZaJEwXC+9ysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKSOcbl9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43b5bded412so1732931f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Mar 2026 10:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633370; x=1775238170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VH3wFzr09f4BWW4HDYRhxglvtqStayE7wEn/6/CruX8=;
        b=UKSOcbl96vhqeSAzYGgkmsBQhIwxl/VG2DzbXXfSprmGSxV24tBoKFyGHgWP1J6zcX
         3wWDMszdnbmTH8v5jwVEAtstM7nPB5mcMre6V1QMxKFygMxXmLcM2vy12l76sNDUyYnn
         P94RTNvGsaEy7pRX73f6DYawxTcg+HND+mY3doiVXyAsRAvE5aRveGZaNS8zvEUEf/oX
         JktP2htCpH4dwGHNgkIo8K2N/Vp4hCoFmahnDdWVAvWbd1EdQHFxprSqqt7oa8NdCA95
         o0PhvgT/jEhkeVaef+0vMulDGCkeNyJSWYjSgHfVnHMRr9FnnlQ/qA6Z/hLTiD86GY6k
         mQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633370; x=1775238170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VH3wFzr09f4BWW4HDYRhxglvtqStayE7wEn/6/CruX8=;
        b=sBCBTwNj0lRJ0COlv4l4xkmrz2inhDGr3/HQJyeBNg31TkTaFR2kRGghgk+iA+OJu2
         sVw+UEyG0qkJA2MqDsXgXxiYpTz0MpAngTGJgwoPLI8MsZEc/3qc+Vor7f4I07veM47E
         Yz7qEW3BaVCNku2JqipicMucvsuP2/wZN/P/Z/Axzh5SwHCbzcO0BHbLOYut7b350YvV
         JNmvcXr5mxfrBl2rBIDz5Ea/3S1duaZvz8yKxoyQCUI8bhmK0Jv8jnDzPtB3OaimJ7j8
         7JWMEsM6mxT79p1WKH+F2aS+FvhDazDfML9Syr1WXkszLGAnpQl/GJa1SS21XheWbAo1
         R+eA==
X-Forwarded-Encrypted: i=1; AJvYcCXiOvWrN/Gl/EsH6znMOJk+zZDCb1jfFjIfz7dGQaFtmUgKvGhbPm1+CI9sozB64lNkN+khmVR6egjEbJskbvW/xQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQD0euVLvqyWPCQfacCQe+7rpGBsmpy5ZmSPpg8L+Lss5CTaie
	FyONc8fKTIzQeVU/H0yQy4fTvBWpuqmRjh4yg0A/UuaY/qeNpdTlHXOt
X-Gm-Gg: ATEYQzzP6b7pCjNR/diEqRisXdj+5p0BHW6fG8uikmjoR5mnEEThqqLyJUwRmDSrwDM
	Sx+S55a/Svdt05ELCI/U7fH5zWVWysdREoW4nSQ/GlV1jxk7jV225FEMFtDbRQu7bplA/w3zIzG
	gVnI6KI/CnHGAa+dEPZd/L614y4E7C+O9fnBc5pNBGXGApg/K1x3SiUH7rw0DR3RiHv4VeXMvL9
	9hVNAB5tA/Ylt5xEYEVz0hA8NXNikjXZW3+2F4MNF0wvjzQRjzDO54pQiB7ofbHJLSTRQLQVSSB
	ada5/bAUUb11jN8ZmfeGzQLCI046gTWDvYA8LUDKrlF4UKDBrn/T0yoSYzOZUCBFp7/cdJ7CPUF
	j3bm07xHVS5DTQu3nVRRXEHGtjS5zJc+x+W9m6/OCfhWv8Qx+sVAdUzFBQdGQdB7LDUt/WCo/iV
	ruKjc+Fr6D7ambm2904a9bMCZCuBVGI5h3EDR5Zjwu9lMLKBsz8x84ATfpF2dooiPnv6LzZ4I2u
	cmQXDz0nuVGdBbpEAnMPsgUFxaFO+mRkP0w5DPscsStSm0=
X-Received: by 2002:a05:6000:268a:b0:43b:4ec7:f90c with SMTP id ffacd0b85a97d-43b9ea4a504mr5718573f8f.26.1774633369466;
        Fri, 27 Mar 2026 10:42:49 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:cad3:5596:28d0:27e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e528sm15965933f8f.1.2026.03.27.10.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 10:42:49 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: memory: renesas,rzg3e-xspi: Add RZ/T2H and RZ/N2H support
Date: Fri, 27 Mar 2026 17:42:43 +0000
Message-ID: <20260327174245.3947213-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260327174245.3947213-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30442-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,gmail.com,bp.renesas.com,sang-engineering.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,renesas.com,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 336CB34893E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree binding support for the xSPI Interface on Renesas
RZ/T2H and RZ/N2H SoCs. The xSPI IP on these SoCs is closely related
to that found on the RZ/G3E SoC with some register bit differences
in the configuration registers.

The RZ/T2H variant has a reduced clock configuration, requiring only
the AHB and SPI clocks (without the AXI and spix2 clocks). It also
requires only the hardware reset (hresetn), without the AXI reset
(aresetn).

The RZ/N2H variant is compatible with RZ/T2H and uses the same clock
and reset configuration.

Update the binding schema to accommodate these differences using
conditional constraints based on the compatible string, while
maintaining backward compatibility with existing RZ/G3E and RZ/V2H(P)
implementations.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v1->v2:
- Add RB tag from Rob for the dt-bindings patch.
---
 .../renesas,rzg3e-xspi.yaml                   | 60 +++++++++++++++----
 1 file changed, 49 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 7a84f5bb7284..bf50d90051c9 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -24,7 +24,9 @@ allOf:
 properties:
   compatible:
     oneOf:
-      - const: renesas,r9a09g047-xspi  # RZ/G3E
+      - enum:
+          - renesas,r9a09g047-xspi  # RZ/G3E
+          - renesas,r9a09g077-xspi  # RZ/T2H
 
       - items:
           - enum:
@@ -32,6 +34,10 @@ properties:
               - renesas,r9a09g057-xspi  # RZ/V2H(P)
           - const: renesas,r9a09g047-xspi
 
+      - items:
+          - const: renesas,r9a09g087-xspi # RZ/N2H
+          - const: renesas,r9a09g077-xspi
+
   reg:
     items:
       - description: xSPI registers
@@ -53,28 +59,38 @@ properties:
       - const: err_pulse
 
   clocks:
-    items:
-      - description: AHB clock
-      - description: AXI clock
-      - description: SPI clock
-      - description: Double speed SPI clock
+    oneOf:
+      - items:
+          - description: AHB clock
+          - description: AXI clock
+          - description: SPI clock
+          - description: Double speed SPI clock
+      - items:
+          - description: AHB clock
+          - description: SPI clock
 
   clock-names:
-    items:
-      - const: ahb
-      - const: axi
-      - const: spi
-      - const: spix2
+    oneOf:
+      - items:
+          - const: ahb
+          - const: axi
+          - const: spi
+          - const: spix2
+      - items:
+          - const: ahb
+          - const: spi
 
   power-domains:
     maxItems: 1
 
   resets:
+    minItems: 1
     items:
       - description: Hardware reset
       - description: AXI reset
 
   reset-names:
+    minItems: 1
     items:
       - const: hresetn
       - const: aresetn
@@ -109,6 +125,28 @@ required:
   - '#address-cells'
   - '#size-cells'
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: renesas,r9a09g077-xspi
+then:
+  properties:
+    clocks:
+      maxItems: 2
+    clock-names:
+      maxItems: 2
+else:
+  properties:
+    clocks:
+      minItems: 4
+    clock-names:
+      minItems: 4
+    resets:
+      minItems: 2
+    resets-names:
+      minItems: 2
+
 unevaluatedProperties: false
 
 examples:
-- 
2.53.0


