Return-Path: <linux-renesas-soc+bounces-6702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1647F91527A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 17:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C09B4280FAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2024 15:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0296419CD1E;
	Mon, 24 Jun 2024 15:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPd211sH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4198B1EB48;
	Mon, 24 Jun 2024 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719243184; cv=none; b=i90vtjfh3b2HPmUJNhYVgCTqvWAR6LWxTy5pYnv01Z2M9S84QKZReQKfA1I1dW0k6w4HDGxQ1fiss80SSgM88LywMzyDrMH6QcZ1T2kM495TfeJtJ9ba2U3jhq+xgX/t+Txs3Tma0sk+s2tq1Ox4O8miRxvSNgZtWGhPz5CmKGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719243184; c=relaxed/simple;
	bh=dI+O+K4tXYRg4n14ycoa2xwCrf/d4GNTj/gSVUUnAnw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AzcNkhAr9bRPyWddFnUsOtHtSstIfS95mFFf449dFgLzz8CgOIjc4DSlo+VL30oSHuPmb0EfxQ7lJaTthKQAXICHtG1u/whTWvtdoM157CsJLSG+5zpYSzxVFgm27ygwtNJoDm3TYDXt2zUpo2LPPXzk8NmPDKN3sQEDYkmJfsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPd211sH; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52cdf9f934fso2014262e87.1;
        Mon, 24 Jun 2024 08:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243181; x=1719847981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dZWcIwl5uaxu5zSkauiAQvuWIYEKfNr14pfwEdvYypY=;
        b=BPd211sH7m1zBG0/4d8f6fbOcUI7ANaRsSUyQWLBn/ESxgu8h27HbiYlYyHUZCivHy
         yOPdYwis1/hWuRH8x8bgCK2xA9EP89q0vJU8Ehqr+YlIKxC0HuPrC8J61ZWXOcF/9Wj3
         oO0Fyy81BiyrtLpRIxIaFaBFUce1dNjiytMU17uGSykxoJ8wo7WxqzyaVwkvomJjF+mN
         TIpqfLaldwSV+WWamuOlWhMgOJ1AtrzQc0knpPcFUEEZ2jVrKEZYAkqjjKcVPrajYJhc
         e8zzSk1zconSpjuRfXO3Ql2UWk6xYcSaJcvWl5BRFXkv2VvsunWdDW0oXJqygTBVgBl3
         z5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243181; x=1719847981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dZWcIwl5uaxu5zSkauiAQvuWIYEKfNr14pfwEdvYypY=;
        b=s9oZlWVtPto6+OOjhle7Z8SDYrrpW+C6c5oF8Al5tmVGY1wyHONdIscN4AEcxCHjd6
         1IaCg229YpY2z7BjCCLDJhuiFU3zl9zD/s9m05tVOs56T3yvRIO/luCk221UWXmVHVjW
         g15OevGnd7QRG9Ghg7h79Q81dDBqNOI5dH7H5YOQYb92yoJBN6Y57Np5l60JigvirZ+u
         A5ocvqnkaWoeFFT45KARtYCqz5gkoC6NDGXqycNENnugxQ/AMLSeFuRjAw42cVfzgXCW
         whL5/bsiIXnPYYc8xIztuuwMUGxCOgk2iSnlDeibspEyVLWt8HqGBw407bhh4kwHw0Sp
         cG1w==
X-Forwarded-Encrypted: i=1; AJvYcCVFjl5LQw0eF+1V8ezgjRSLmBOIx93pY9kPhTKf5UAqrd7WdtSyQ/dOsevM7pLCKdzSxMV6PpsJXNPJi4zeEHGWNpFt6h9q1HwGuDaOSuH2PceIoyHoQPzdwD7jyzS3DQFJxjKnKuOE31F8XrAQwc5v6Na3aJG1XAGfjROcIk+diTa4xGfSUHYyq+E=
X-Gm-Message-State: AOJu0YyLavC3OmodmzsfmwJnhD4CWEzqxUFaeR0BToSM/66VxCw1NNa2
	vnr1xKCgVix2Rz+IVAJlt7REKp98jNy8DxgBlt9mFnejPs1bjmLV
X-Google-Smtp-Source: AGHT+IHm1NiAQIngDJsUBVX1IVBdqwOg3YnZ7JinDjTnFmK4tuBMlzVPSiQ3dRujuniXVhWyFDy1Mw==
X-Received: by 2002:a05:6512:348c:b0:52c:da38:b2c6 with SMTP id 2adb3069b0e04-52ce0672770mr2837867e87.50.1719243181125;
        Mon, 24 Jun 2024 08:33:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:c315:5cc8:bc92:639])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817b6121sm138294675e9.27.2024.06.24.08.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:33:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-mmc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
Date: Mon, 24 Jun 2024 16:32:27 +0100
Message-Id: <20240624153229.68882-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240624153229.68882-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

A 'vqmmc-regulator' object is introduced to handle the power enable (PWEN)
and voltage level switching for the SD/MMC.

Additionally, the 'renesas,sdhi-use-internal-regulator' flag is introduced
to indicate that an internal regulator is used instead of a
GPIO-controlled regulator. This flag will help configure the internal
regulator and avoid special handling when GPIO is used for voltage
regulation instead of the SD_(IOVS/PWEN) pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
- Added regulator-compatible property for vqmmc-regulator
- Added 'renesas,sdhi-use-internal-regulator' property

v1->v2
- Moved vqmmc object in the if block
- Updated commit message
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 3d0e61e59856..20769434a422 100644
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
@@ -204,6 +207,31 @@ allOf:
         sectioned off to be run by a separate second clock source to allow
         the main core clock to be turned off to save power.
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sdhi-r9a09g057
+    then:
+      properties:
+        renesas,sdhi-use-internal-regulator:
+          $ref: /schemas/types.yaml#/definitions/flag
+          description:
+            Flag to indicate internal regulator is being used instead of GPIO regulator.
+
+        vqmmc-regulator:
+          type: object
+          description: VQMMC SD regulator
+          $ref: /schemas/regulator/regulator.yaml#
+          unevaluatedProperties: false
+
+          properties:
+            regulator-compatible:
+              pattern: "^vqmmc-r9a09g057-regulator"
+
+      required:
+        - vqmmc-regulator
+
 required:
   - compatible
   - reg
-- 
2.34.1


