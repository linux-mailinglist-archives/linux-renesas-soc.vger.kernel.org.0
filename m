Return-Path: <linux-renesas-soc+bounces-22367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DBB9E8B1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 12:04:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4A341BC1EA5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 10:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528E22EAB93;
	Thu, 25 Sep 2025 10:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OYdNO92J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A882EA490
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 10:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758794647; cv=none; b=SNSM+54O4vVqrNHwofQE+awTYO47RP287seLBBB/UGSbVcCwYhDQc5Tnc+PLjru0zCJTrYh5VnH50lP585lD4cvNzqnSypDdGlXrWPw2NDWWk34eRBlyUKvJYS6On/zp6y+BodJzzB4xK4TNmAxJleyeKovTSU7YfkbYkG2hpiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758794647; c=relaxed/simple;
	bh=fPHE+4SS6NADEeNKpXr5L2VRjNuZneALXLZC1DzOqF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZkDXP3B2KYGd6FELPdBT2Deoc4Ze+pgZXG434kx/2z4Wem9ynOsWZNgahYLEHPMsBGwaP1XckbtBYFo2dWjb502cTHoZNvnvN8DSV1b16tPGvZH08wbp4dpX9yotpQtj3+8ePxNyXHwg56KeWmwsqBsXKHxbmcAyY+P0LgFIho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OYdNO92J; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-46e2e363118so7336705e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 03:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758794644; x=1759399444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ev+V/JW5+QM+PIWIe4k3CE87ZcIEVc5Xt1x3/zgMw44=;
        b=OYdNO92JRVwJC5r+jv5N1iTcM5WDHjbfVTDMzo9IPjwrUs/r9NPRmmnGauFuWY6T3H
         Ebx78cisArMU1e0eu3TNk/baYdNrHa5RYde5Ce87bqK1t216M9Qkt325FRQaMWPG6Nsb
         BwvPwH9ckKyWgG5mkEjstrZakj9nEIxZLyTLsUQMENTVfW4gjcXi/uO2a23I6ty9vd9Z
         TMiTTyZomlIzaVX7+QlGO9f9YQlknsOpik7DECyJoI91YuZ5N9wNjdR8MXv2+e8Llm22
         jYhVwrAYbTYqCzJy7ElFnoyGP7pPQMEYcwSknKzyScMi3eBWaU/1w3cBjLafzQ7KC7nn
         kQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758794644; x=1759399444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ev+V/JW5+QM+PIWIe4k3CE87ZcIEVc5Xt1x3/zgMw44=;
        b=uMzI/3l60zIsVG4VNvKLel1p6ZnCQxSiTqb2z7uxQEiBapBSN2mPuwswmbQvsTUHoQ
         EA+3kcWfrxKug0pEPnuBFAHRP8POxDtLctsr5TMOxjWmC96+/s2yu6zAqWzjbeyCEUks
         AzW8EObUIhZjez6CQcN+F0/0sVHEI6inNmc4Qyal3XfKNVOPoxEtzVNND2rayUf3NSfu
         sT9YOHjaLmJQBOAgOWei1t3Gjc3kFDNGZIo9JkVZQZ2fD+FtuZIfxn8jd9M8lBron6To
         Gk8sAlQoIbSC3QXKbOhcqlEs2D2TEVS3wZjZV76Y24CCOl54vkPmAbjn6AdoG25eacyl
         jeAA==
X-Forwarded-Encrypted: i=1; AJvYcCWkHhwyoHvGbLBfpA0FntOrYi71qGMBjFGSbCvijMSCNFPH/PzzoVpWHWxmX8TvnWjkHTMtCNLr6Z4fdsig7T81RA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtiA2GG9Z7rROgJrkFCJ7txgxiCMO1CJqPsYmdW9xkzrpA3Wr3
	ngQP4oHkd2N3j4mW7Muh26NM6IGqyLU8Ajvk5NZbcO45BP4YHirmnKKJYKE9B2zZVVQ=
X-Gm-Gg: ASbGncuTzI8+x1UZMVbulUsyV8X9l1Au4OMABVZ3npXYsErrYqrAATGrKebJMGSV5ek
	/5ULcBgth8U9/2vDMIxrnNWLD5zevp38Kyv8Agh9UR/nvAEnpoVq+VGXO130Hv5LID9keZobqxc
	oznlojqx61SiROOWf/XjDzJaVmMhM9BKYVjyPEJmEtV2zw5i8sEW37FOzNCGIxyIYysW9OXw5XF
	JWp7JMafBg6QzYdm2imUAD7NXh3fqAhS3CDnKtf1a6tCFGxie1U6mIQsfvzduEKC8djeF0gkG6e
	maGqzeQGHqWl//Xh25a0hirezc2g5SN9gXprXer2XzLjRNiQm0vfQ6+2nPOR3kaxkNmA6YZQCEt
	hHyh3wVfEFGdC4wj896clajmwgKZA5WDppNAILfzw9gPnpkRPVVOn
X-Google-Smtp-Source: AGHT+IHF5IlDl81hhWyikMX5E0qyEzULKekaiiDeU818Ht7Ddn8on2/kQQ7mJhhr2YOOLfwqnUuxuw==
X-Received: by 2002:a05:600c:630f:b0:46e:1c16:7f42 with SMTP id 5b1f17b1804b1-46e329aec2dmr28177585e9.11.1758794643994;
        Thu, 25 Sep 2025 03:04:03 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb72fb6b7sm2501122f8f.2.2025.09.25.03.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:04:03 -0700 (PDT)
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
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v7 3/7] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Thu, 25 Sep 2025 13:02:58 +0300
Message-ID: <20250925100302.3508038-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250925100302.3508038-1-claudiu.beznea.uj@bp.renesas.com>
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
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v7:
- dropped Tb tag as it was reported that it is not valid on bindings

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


