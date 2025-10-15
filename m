Return-Path: <linux-renesas-soc+bounces-23088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C22FEBDF6E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED3E6188E254
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2713232E73B;
	Wed, 15 Oct 2025 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="GyCp40ut";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="VneQcRni"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1BD320CD5;
	Wed, 15 Oct 2025 15:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542831; cv=none; b=p177syC8G2SPdc9QqJs2zUAU9FvW73FQqZpt/VZCAMV6jrZ3CZ01GLNGZpcxnpI0/ucTvasMxd/XAmX1tm+F+gyj8jLP1gZ20t5y2NIPAOdF/x3fIUgB7caiBTpdGE/KlHost5/P9LqMB4iKfmQGZfDThpJ4N5D77u59LcInWqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542831; c=relaxed/simple;
	bh=z+QcSwbVACZ66sguEWCnRO4SLvOSpINlrvPpx4qa1+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HE7XZlb/kqGq+m6yhZazFk/f90Z8p1S6BeYAUikSH344GXt8yJeCMfjArCOUyVLys8RqrTOdkP5csL5nnJrBDHg5+tHaGblPeUePQ3iZiy1rCTt93yKIT8b1wGzRfJfyt2cQY9BtGsgCco1ZyWFXg2zxTlG/uMVVgivmEWzcHVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=GyCp40ut; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=VneQcRni; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cmwJn6tv6z9tV5;
	Wed, 15 Oct 2025 17:40:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760542826;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6+5qS86AUVC6bRT92KLIuo619twokSRObf676Q+SPc4=;
	b=GyCp40utFwUbHBAVYke6cLZ61zeBsVmhxHvoFg5duEMXrn/hPHwZL5xBQZY311g863Plyn
	lWXbuOv152dvPCgBsnFw/XDXeje7A8e4Y6dg01y+pcvLsrEISUxx6uP09e9khmn7SVlews
	zzMhA/xZUASVaP+MIaREwB16QzyNccxIfbSqMVFP82lQUZaAPaYU76KlMHKorFZqFC8Hnz
	/I7rR0XsvsOD3nQ/C9Pt6aQ32Pf+pv+5HoEoV7THSL6HVHIQVwQCeU8x0P1pxxId4QS/kW
	3m+k1hrDmnk4VXjFQe4XRJv0YTVdz5EGD3Lzk0Q6t3j1Nchwnvl+fJunYXxO1w==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760542823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6+5qS86AUVC6bRT92KLIuo619twokSRObf676Q+SPc4=;
	b=VneQcRnidwu6dWaWawE0KZHkFrbklqqyPsGeRb3M/tE4NMnszWN8PYPp89NL6UNe0kkYlf
	5eKWm2qFf6BLrLo62V/RU/SdvCQD+URDLe773U5rX1XPPwAwzGVVCjF9yB6iMauOc76M16
	vq9ESPGPSHbVVMhbtn4HG1So3iDpVXi75vfO9jLZ2PR5jEBjU/Rwc0kduYNJZisVN3ZJ8I
	URo9GJK374E8hjgQJdkhNi7n886pMnhINythYZBLUMQGJZDfIT53fT/aT0nLUfNsF6vqsg
	GCwl9s+V4/6TzTy78Jk1eAr/pPKbPS8vdDTPxDLNdUJvydWy0ObjyrHO8rCe7Q==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: gpu: img,powervr-rogue: Document GX6250 GPU in Renesas R-Car M3-W/M3-W+
Date: Wed, 15 Oct 2025 17:38:56 +0200
Message-ID: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8c8d6cd9cc18a31f2bb
X-MBO-RS-META: x36nn1ic78som3741bjni5gpngooa4eh

Document Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W and R8A77961 M3-W+ SoC.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
See https://gitlab.freedesktop.org/imagination/linux-firmware/-/issues/13
for related userspace bits.
---
V2: - Add RB from Conor
    - Fill in allOf section for Renesas GPU, set fixed clock/clock-names
      maxItems count to 3 and power-domains/power-domain-names count to 2.
    - Use renesas,r8a7796-gpu for R8A77960 compatible string
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ecd..05fe9498dfa09 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -13,6 +13,12 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - renesas,r8a7796-gpu
+              - renesas,r8a77961-gpu
+          - const: img,img-gx6250
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -146,6 +152,29 @@ allOf:
         clocks:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,r8a7796-gpu
+              - renesas,r8a77961-gpu
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        power-domains:
+          items:
+            - description: Power domain A
+            - description: Power domain B
+        power-domain-names:
+          minItems: 2
+      required:
+        - power-domains
+        - power-domain-names
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.51.0


