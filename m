Return-Path: <linux-renesas-soc+bounces-21719-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B2EB518CC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 16:05:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB8C5E6F86
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 14:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42D12324B11;
	Wed, 10 Sep 2025 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="c430aQio"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC97322A1E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757513011; cv=none; b=RlHyT9ocnjJbPzVUboPMoFD2OKdT/0Jcs1A+yfDNOAw75k9457U7UtLo/7Ff4LV0DkufK/yywqFNyOSrxDB9Gc5B7OJFO7VdYxsdU8I/mRInqY8skasdOoCLH5lDBePK6Y3iB0N5n5fZMpYJrFGiOsfoSi28EG5/2l4A/75jYgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757513011; c=relaxed/simple;
	bh=wQK73c6sveRXcpQRikwfdxno7S+vuxPzSo++euQO9OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GZpPezS7vRj/6rVS7J1FG5uXQNT7JwKiw0rLGNhe+nAO37irmCRpCiVVIk3YlgkLZTikMsZ3pxBE4+jZQceWV54rgQrfpBT8JLjBOLRdT2klSCVKSlhA2sIPtQp/43BAft+ht+QswweQKGG+s7K+fwPx+w0GxpK4QHLsL8nYtkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=c430aQio; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45df0cde41bso13015255e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 10 Sep 2025 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757513007; x=1758117807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2v/qfrJwcDhrBtg7MhE4eAOkQayuMMHztt7+WMK54yY=;
        b=c430aQioNO3/4hCcqa1xteIWtp9OGPTVdgL/lZD+RdDelnF674+ZHEQme1byqe6gaa
         xy90KX6hByGUZdzv9rEkDwb9hVVt3pyWLZDz/5br44dlRGq1D4nmgIv3ewCngAoltyZX
         fAWzYrIjv2BSPUNw43nQuIpFx4ZN5ddVA9f1iBV8S1rrNcQI/7tER6YSEqlhA6JA6c9o
         hRf5/XUfMIxbwar/yhL7g176SIpRrS9Ak5HHxsdoEzLZ9WhJZ/7zezeZeU68RBPY29vx
         lXM2yNx/rPlPNuOmxGp5CHp3Sj1M64q5Ofr4aKuHqkaQbHpdFgU1VFrVeJyk2RkGFnTR
         MsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757513007; x=1758117807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v/qfrJwcDhrBtg7MhE4eAOkQayuMMHztt7+WMK54yY=;
        b=JqzP2Ur0ntzaA4CHWJMktk2aYiW7W3zdBN9aYR9t4hmRhEKuWBGWGS7PKqTlsk9Yx1
         yRernoS5nZQ5DTuMMc/OO6IqHp3Ib4S6ZD9HyCvTBeBcZzFn2LFSX8I5h/BSHDRpbcFr
         qUJxCuXiewBI8EKDG8RMWfBq93chjhoyl/L2gz9cNKND7bXU8ASAe+wdwDkeX8TH3tEV
         q/oMh8E65mCcGXBty+91pStY9CaL86GPl+UnWi/OQe5XDLXYqon4LMOeagAUBBTKZKFP
         kcPwbvU6J/Kjn/6QLSXGbdJF64pNDX18EGUZ9wu7lovIbJX7AlLe5mlS6vk9G3+VRk5e
         59nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUUBcpgDfpv8ut1cSdBr2EGJRt5aOxW8aAaz4e2EX5VE8FlQhPROM0IvFWUtJLvTc9wGWkVnoOB1IEZa7JU5bwjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybCEMKZZCrjSXEJDJS5bIiG5G4qNZlx/xRWnm6vlkfIqNVsP9J
	YYWMSrkaNh21EJvxZw0d5gaqIpNilDA1jLG2iDEijQnkQyfKrjRtj0cIhoheHuyhge0=
X-Gm-Gg: ASbGncsh0k6oS6QphO5DGvavDpiqjg4r6ESQ/qC1OaN+16G4d+7NbcI9eeOCVNfV+NN
	3xf25jSL1rFxSUwNDV9mC+vPdQcTN8i/izoo2n4EsPdnDX6N/PrG8K5oCatZeI1Dttiv45LanvL
	jCzQrHRnQ0i70dRzb7NlJcWXybx5/24am9BWCNhkBDKFuo93jKnKS6Lf8mBSKAzmkWtQ4wl+6X/
	dymQgWAG9D4JKQZQABtPP5iZ+PI+BjQvhg9xy9j36ckXsNMtsBggcnqedcq4lLZm+xaVaPVQlXZ
	GV2pt03NMMuA2aOBipR44+hO440G9Yd1s11my48ByafWcxUC1q6UV4Eb90umlLrJuOnv3Sc1fGF
	FqWWuzRqOl1Rq7X2QMdko34pzOAtcrKwonOkrWEUd0wD2hvAaxfkqTZzOzNuIDIU=
X-Google-Smtp-Source: AGHT+IER2la6Lcfz8bP/iHB1RQ8PkQa4R+3KjeerQ7zRfv0QQDireuWsIfKEUQrrW3yVDeUhRWK7Sw==
X-Received: by 2002:a05:600c:4587:b0:45d:d94b:a8fc with SMTP id 5b1f17b1804b1-45ddde8c757mr179992855e9.16.1757513007223;
        Wed, 10 Sep 2025 07:03:27 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df804bce3sm29523875e9.0.2025.09.10.07.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:03:26 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v6 3/7] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Wed, 10 Sep 2025 17:03:01 +0300
Message-ID: <20250910140305.541961-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250910140305.541961-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas USB PHY hardware block needs to have the PWRRDY bit in the
system controller set before applying any other settings. The PWRRDY bit
must be controlled during power-on, power-off, and system suspend/resume
sequences as follows:
- during power-on/resume, it must be set to zero before enabling clocks and
  modules
- during power-off/suspend, it must be set to one after disabling clocks
  and modules

Add the renesas,sysc-pwrrdy device tree property, which allows the
reset-rzg2l-usbphy-ctrl driver to parse, map, and control the system
controller PWRRDY bit at the appropriate time. Along with it add a new
compatible for the RZ/G3S SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v6:
- collected tags

Changes in v5:
- fixed description formatting
- collected tags

Changes in v4:
- dropped blank line from compatible section
- s/renesas,sysc-signals/renesas,sysc-pwrrdy/g
- dropped description from renesas,sysc-pwrrdy
- updated description of renesas,sysc-pwrrdy items
- updated patch description

Changes in v3:
- none; this patch is new

 .../reset/renesas,rzg2l-usbphy-ctrl.yaml      | 41 ++++++++++++++++---
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
index b0b20af15313..c83469a1b379 100644
--- a/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
+++ b/Documentation/devicetree/bindings/reset/renesas,rzg2l-usbphy-ctrl.yaml
@@ -15,12 +15,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
-          - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
-          - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
-      - const: renesas,rzg2l-usbphy-ctrl
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-usbphy-ctrl # RZ/G2UL and RZ/Five
+              - renesas,r9a07g044-usbphy-ctrl # RZ/G2{L,LC}
+              - renesas,r9a07g054-usbphy-ctrl # RZ/V2L
+          - const: renesas,rzg2l-usbphy-ctrl
+      - const: renesas,r9a08g045-usbphy-ctrl # RZ/G3S
 
   reg:
     maxItems: 1
@@ -48,6 +50,20 @@ properties:
     $ref: /schemas/regulator/regulator.yaml#
     unevaluatedProperties: false
 
+  renesas,sysc-pwrrdy:
+    description:
+      The system controller PWRRDY indicates to the USB PHY if the power supply
+      is ready. PWRRDY needs to be set during power-on before applying any
+      other settings. It also needs to be set before powering off the USB.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description:
+              System controller phandle required by USB PHY CTRL driver to set
+              PWRRDY
+          - description: Register offset associated with PWRRDY
+          - description: Register bitmask associated with PWRRDY
+
 required:
   - compatible
   - reg
@@ -57,6 +73,19 @@ required:
   - '#reset-cells'
   - regulator-vbus
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-usbphy-ctrl
+    then:
+      required:
+        - renesas,sysc-pwrrdy
+    else:
+      properties:
+        renesas,sysc-pwrrdy: false
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


