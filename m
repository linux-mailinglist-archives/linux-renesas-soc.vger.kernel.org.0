Return-Path: <linux-renesas-soc+bounces-6140-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9C906855
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:17:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 421AAB24112
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE40A13E8BF;
	Thu, 13 Jun 2024 09:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc9iAc56"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349F13DDD5;
	Thu, 13 Jun 2024 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270256; cv=none; b=qjaIgA2PCZkr/igHsi0+5UIrMQ3J5oMLbJ5S0ZAiKHn79ncXmYllXm+dDVaoaeWEwB4qACPmMdnjGeBvN1qayndobzXe7qUBwdxafgLf+i7xidUUYx1w/Vk/GhxfJs9lH2VbpJ7DgHN6nLzw+sikqxTkWaPEUXQ/fpPezePjaHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270256; c=relaxed/simple;
	bh=i0Z4diLdjlGTy/SSBhm783tpSsIqbqBR8t1KtUnqI0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nWWjsKcBzuLGXiCzlDw2/FkmRFPCfbfybaNw6HcKXR8qSrq/MzJQErKJZ+zy7zdFIMU2eERo8z+eCfEZsHxn7xrvI67PUk5k2Zn++G65/r+WX73RpqKHZ4Q2UfbtYkP3BwE9OfbmCS26zoMKF3gb1E7KZ65H/DK06uDERNztit8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc9iAc56; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5751bcb3139so710361a12.1;
        Thu, 13 Jun 2024 02:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718270253; x=1718875053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfX7+55cdj0PATTYT6yQleu5t39vHO+fi6GDir40ICI=;
        b=Sc9iAc56zw9r0upK2vRJLnOb+chefUXjZV3Puq50MnFvUCF7oQ5lkoKE5wUVUTzhYj
         KSUulek4e5+5MQ2vh7u2I6HOiwWYkvRmzdCfF2PM/uK4F9oPrCTLLl2XNSw2Hp1PKcF4
         1OfXjNfuGvo2wDNBpKp/XQxmstwoizV+bG/KQHBYH/Jzcquq0Z0xoa7q3ltRnQhnrE0y
         iOhX1Lgz9dKqKVC4kMwORicyFkBSY4A/Kbfd45FTfZm9Qw5rdZGyqFlYWFoybQ2UpSoC
         GA3FHeNe+1bK2pD23wLb70up9lD6bGboXl2txSFPRK+IEImBtZjblEK1fbiRI4BeEN4q
         AWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718270253; x=1718875053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfX7+55cdj0PATTYT6yQleu5t39vHO+fi6GDir40ICI=;
        b=Gms2J7CjUzeVrn5SVYv7iwa/BvxIW/I9Ozdwfo+mKVtS926p7qmBeW+vVLvCWfH48I
         PAegY9Phv2Vt4QoTfAM31ZJeE8ZYusnTVNEnZJ1546OXbRdvNh3u5gA+W1eqfMIGNY5V
         afks4FX/pWqauFTGkTgAlG7qn9LyN2LUYmVmMkG8OFNKr51nlkp4C5BySWqAdQMcNn+9
         hRJZ3tnrx3rivB5linPEeFn1ESSFiJ3kN2KgQ0g1lDTPh1YNnkRf4ix7SUODGeu9Rkpq
         XJTHPoDaWzbd3GzqZXZnkEqAsv11PNeQ2Yg39bdVo6G1HMQh2g7MYcA68AStgAqG4+w8
         H1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiIRUv7vpoCYfZAlpjq2TTDCv5uCuqptK+Q5IwAPE+UlKD0fRgCQoUTYWhd0lcNQUVCv05J9jfUTDIpWtPm/qM7/gbX2IUAujns6W5Wv32LjAB7LqKPuDzMg62e/w7ctVax9l/XdVP2eCTX8dOHbXMLiGZOJcyEIGa0Gz6HLQostLdOuAxgVKFk4rX
X-Gm-Message-State: AOJu0YyKynN3Lu3+tywAy0g+SAoJ8APWoEJxIcCp6WsrOBEjZM1lZhJc
	rDQRMxiks18tTOTn65cuxQFAAkqcd97nWYlS6x7U8Sf2/mHViFi2gPyQdlxldAo=
X-Google-Smtp-Source: AGHT+IGqRPbZM3SpUnObNeDR9lR6Y3O5cMMsL9nHseDgiU3xDdpW8iXKYK3fpOV69tQKXRZiPN4RfQ==
X-Received: by 2002:a17:907:94d1:b0:a6f:4bd5:16bb with SMTP id a640c23a62f3a-a6f4bd51782mr265782366b.56.1718270253123;
        Thu, 13 Jun 2024 02:17:33 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c79bsm1108122f8f.41.2024.06.13.02.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:17:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
Date: Thu, 13 Jun 2024 10:17:19 +0100
Message-Id: <20240613091721.525266-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240613091721.525266-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to that
of the R-Car Gen3, but it has some differences:
- HS400 is not supported.
- It supports the SD_IOVS bit to control the IO voltage level.
- It supports fixed address mode.

To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g057'
compatible string is added.

A "vqmmc-r9a09g057-regulator" regulator object is added to handle the
pwen and voltage level switch of the SD/MMC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Moved vqmmc object in the if block
- Updated commit message
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 3d0e61e59856..154f5767cf03 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -18,6 +18,7 @@ properties:
           - renesas,sdhi-r7s9210 # SH-Mobile AG5
           - renesas,sdhi-r8a73a4 # R-Mobile APE6
           - renesas,sdhi-r8a7740 # R-Mobile A1
+          - renesas,sdhi-r9a09g057 # RZ/V2H(P)
           - renesas,sdhi-sh73a0  # R-Mobile APE6
       - items:
           - enum:
@@ -118,7 +119,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,rzg2l-sdhi
+            enum:
+              - renesas,sdhi-r9a09g057
+              - renesas,rzg2l-sdhi
     then:
       properties:
         clocks:
@@ -204,6 +207,21 @@ allOf:
         sectioned off to be run by a separate second clock source to allow
         the main core clock to be turned off to save power.
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sdhi-r9a09g057
+    then:
+      properties:
+        vqmmc-r9a09g057-regulator:
+          type: object
+          description: VQMMC SD regulator
+          $ref: /schemas/regulator/regulator.yaml#
+          unevaluatedProperties: false
+      required:
+        - vqmmc-r9a09g057-regulator
+
 required:
   - compatible
   - reg
-- 
2.34.1


