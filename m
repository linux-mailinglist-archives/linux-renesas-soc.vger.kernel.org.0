Return-Path: <linux-renesas-soc+bounces-23516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB4CC01A2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 16:07:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4F393B8FDD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDCF7328606;
	Thu, 23 Oct 2025 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Klomd+Rx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E884322523
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761227915; cv=none; b=aTpWMi1fSN9YouEDbl8d1AaqrRFjgeb4RX3/knuRiDgdvu70X7FrhZMqDtVAkhbUW7cMv1jhGVlQqayACdHldGkCSpUwPlohRsYcAwNzWj7cdq+6zKwzrec5nseuayVTY1U+FbjdIgPWvP6buEQzsJGkvz1CWcd/XV+kHOPBSqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761227915; c=relaxed/simple;
	bh=RP8a8zuf1k1PEjcvlI/NCNsC1HRv3VhEnHagA2m9GFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a6OYuZCHDOwX+a24lyObpdA+pqO63jAaXwJLcPWKthh+yIFH17HINQvD6HhP87l1id13W0eM39tLZctlYEcuJJKGxeLFz6Z7xZP3BF2BmSUwXRJ3phBRRvTDA80+OcXAwOj0I2rz2C+EgDiTO8X3ReaL0NlyaEkRWTRPewwqg+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Klomd+Rx; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3dbf11fa9eso182204066b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 06:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761227911; x=1761832711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0ptn8E/LhDaocVN69/KiZrW/OIwIcPB5zTMwm1G3mY=;
        b=Klomd+RxX2f0fd1QiAgAJ9RBrqtrzV5Pdskyi4fO7Hw4nDt0xTw3bXBnp4rvaFHkaq
         WVYea7NJ0Zda3Zzs8nnAAH7N7V+ek2WNnWNGkurd0SJVS5L6RtwIrEkq7syoAfw6X3Db
         1xpfmftl9LMAnJ6riGN5iVhMBIlic/iD3p8fmi5fKDvAOsV7vImI4MD+jkcJpm/DwRt3
         M3F3k/JjcWxF+Keny5V9AC/wf8WFoMJDrb8tUtOiLLACuRGL6IoEEajEhULP26PgVcdy
         vd+v/MTTWTHnkVLh0dHhookFx1F1PhO3kYnVWEHAdjsx2NHUU0uJOMIVolAaLLpY1mVl
         0jsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761227911; x=1761832711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0ptn8E/LhDaocVN69/KiZrW/OIwIcPB5zTMwm1G3mY=;
        b=CqDPrWNf+6VjllVQRmULCmkPd2SaOzEa+PULsf8jj5pb8MZmV85UirE0b0RKljav8D
         GRT20SKC4de5Uv7uWLP0kuec5dTuhqg3Iu+fKMl5mTJLhzzsIAvJOEt103L6xu3m9ZNa
         GfyqXJ8r4J0GS6beoxDDxmLpcUwune2jB2Xajhwtbh1i9Khrs7RJRQ45bCCEPt2eMKEw
         5J+6R0/prw+XYhpNr+O+fWfU0WEyNN6ADd97CULKk78EXCsxsoHS2qjd/ZsYx1ouJsXF
         mrb4M45qUtOj8uQCLh6IHHOgUvjDmqlOvDyMI1gvvKHKMt6MLNbjuOBSi+rvJ/dX0XX/
         sIUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcV1i/EWYFMcnRCYLJpoRmI6r7qIiDIowMob/FyWrjNE/uOezfs1wNOggM7O553Jqy7+5mHUR0cT5iTa8sHRC7kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRnnZeAgqmUlThWTjo9ajmOYL4zAiYmRSkZ8PLykrj7QVYWjSp
	KW7TeqkhkMjqK6LQwzVKUHUTlAnxfNuSdqB/XosIZMj+heWI0qJFYlO28Q28gfFn+j8=
X-Gm-Gg: ASbGncs1WFpMpbytQuPL3Jgh8Ze6v8SUJH59tpkhrk2N3WeXYkJh+8aTXrrybCvhIEm
	ZXyn/sr8tUjMFhivgdCWaKpqMPnYq5HKiFpTvFxY7Qt+eyY1M2e/j+PGqpj+8LY3q27rwL5FcJe
	rx2+HrP4K5DkhIom2ltvHReBAT7DhU8fcB68NNJVBN73MmGlxp4j2BwDd5mBi0e5P4rViVBwnFw
	QQZDT8MXxGDg38OlvKXdQiOFCv/reV4C8HQs44P/1oCPfCYvqrUgc2D5Ze4+5ajPlAfc1mURFAW
	+Ffi1VsNnCfal9kfFBrN45Gs4vWHKs50HfnzDGKHqXGeLJyAHG7iscPhLFiJNHsCnY0/FfzwSh5
	rBCYACgA1Qa0cJf+EZTEXLrLz5OMazikaZb9+oAqKJXB0ic8eW25UsZgfLSi752X8A1wZeGrPiz
	J4+HhIMCyozxFXcrpgLMxdKpDPJeMUUVJT0d5La9UU
X-Google-Smtp-Source: AGHT+IH5zxAjIq0T7KqfSxfMMJDn8BjHIDOb4sW4dH03nN6pd1cSkApPwJS1N7LfAd+GxeG4RMRMMw==
X-Received: by 2002:a17:907:9816:b0:b6d:5bc3:e158 with SMTP id a640c23a62f3a-b6d5bc3e4eemr167216766b.17.1761227911453;
        Thu, 23 Oct 2025 06:58:31 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d511f8634sm226114066b.29.2025.10.23.06.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:58:30 -0700 (PDT)
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
Subject: [PATCH v8 3/7] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document RZ/G3S support
Date: Thu, 23 Oct 2025 16:58:06 +0300
Message-ID: <20251023135810.1688415-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
References: <20251023135810.1688415-1-claudiu.beznea.uj@bp.renesas.com>
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

Changes in v8:
- none

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


