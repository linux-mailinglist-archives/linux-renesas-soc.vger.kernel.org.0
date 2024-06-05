Return-Path: <linux-renesas-soc+bounces-5848-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4F8FC502
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 09:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0699A281796
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2024 07:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D9919048D;
	Wed,  5 Jun 2024 07:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CuqzB2Vc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA7A18FDC6;
	Wed,  5 Jun 2024 07:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717573793; cv=none; b=aKr/6NZeZ0atuA5Joq4SpQZ7KV+Wty48P6TSNxneDGyQMXSBuv9pAmQSag1jgfuy+/+aD2aU3JjWmsbDcl+rGjSLhmpD3piPn2AzeKRvRtsg+cO4GSvIocslljhHWP23SUV1d5ygmx9uLBeVRjl1iq88CkYViRifP2B+W0MwwRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717573793; c=relaxed/simple;
	bh=TyKyahdt4F4oRdL0xTtHczb4jdNxXFw31qd2zAJYHNA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=k9Cb3JKVRxgkVxSHAvRq++SDHACbnpazRzoFqQGiTgxRngktLPE2nPBhRe+4NY7wenI8lBcrOKkFw0X1vL1o3t0oyg7eh0Y1HitQbiTqYg2RaF1u2d0ejRJ4qxNphAZQT0hg/HFPzJqsL11LzTZyBbKmZTBG5aVMKp4oPlyDb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CuqzB2Vc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b7ffd9f6eso6483692e87.3;
        Wed, 05 Jun 2024 00:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717573790; x=1718178590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSxiemqQoIgjSV8XPLRpGscKuH5jcWFBmdotFuR94s0=;
        b=CuqzB2Vc26Fp6bm8jnEc9MEJ4UKJrSBQclCmsZqhLaM4+Y6gvFB4ds9Gul6s4EYBRT
         NOLJIwG8UwiskaZ+nXRPjliMirHMmpFYA7XJDs0fcjxwHinVXEMpa8tSOJbenG0Rc634
         Rn7yWOTPB86FV0B9QPaYnHgZJ2GHg4yoArIVJ9LJEcX5OjB2dKp5lIZmP8D80cPBZkPh
         n6QFKglXogBU9UugBBFitNOvqlxBUwovLaUuVAK+DeLRDgP8KeiOgBr4Pg3wLo2jUWSy
         6oqZfFaXWhI/jzKPqVohcHncd0a0EhUNndc4iNrDNiLBJLehBIDw/hAexlpEaRJm4U+b
         NeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717573790; x=1718178590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSxiemqQoIgjSV8XPLRpGscKuH5jcWFBmdotFuR94s0=;
        b=huTbgIpE4wv98LxkPtKHySs4IpINQayEaXsT+8xoHcX+yz/LFoSGZGxhE9nXUyp0Q6
         0pRkeY6MbTFVn4RyBoW7e9gJdL9Nr3vdFVpCjFmuQ6IAt6hxU3KkySLBW5OBUYeMDAM2
         iTYnLtBI/wU2uCz2GCWGaKiLOKTQMM995qJg4RS5/YePyaxX44euRLFqZJMFvabmMFD2
         GSm6Aydzg95mpVZ9unJNoImYnunQ+s05lcs9kGOR/S9Qdj8igIVQsVQIBhAMBVk4EC81
         PFUdB5LH3cDBhhkT/KMZXF5bsBtBYg2PO9MjC1qXK32vRXzboKymMfQ831K4Upw9kPgd
         RTRQ==
X-Forwarded-Encrypted: i=1; AJvYcCValdmRDh5sAMILx/lZy+sp+8P+J41bvpF3+gvJp5EKqJDhDUnqRPZS5u3kMypCXzHL/rBV20PCpcKmgjRoW4qgi97+4Mt8WHm4Xj++i19YW1tYQjuWy4UDykHj4YlNx7X4waSRhAhWXvPsZIj7hhOZGVxSNi8L6EOUjRAHPno3Ou2pO3y7T3CtxaVV
X-Gm-Message-State: AOJu0Yydf4Vq0NvBmbvdnInZH/KK26P+ee/U9tbEZYxoTUN54hXsYuda
	0cheQP3jChWeuSbBkuQ+kEUTlfz6kGhQ6FVEXhF8fOm2TRH4uA/D
X-Google-Smtp-Source: AGHT+IHCQVlWtdQT2vsFwuLCbEu7G3gCcNuvAI5D6EtbgKI5L7tF6BHgoxqxFNTrkKdVqmLmEyDUVQ==
X-Received: by 2002:ac2:491e:0:b0:52b:8871:9b31 with SMTP id 2adb3069b0e04-52bab4b0976mr980065e87.11.1717573789400;
        Wed, 05 Jun 2024 00:49:49 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd064bbb1sm13527200f8f.101.2024.06.05.00.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 00:49:48 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 3/4] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
Date: Wed,  5 Jun 2024 08:49:35 +0100
Message-Id: <20240605074936.578687-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240605074936.578687-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
voltage level switch of the SD/MMC pins.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


