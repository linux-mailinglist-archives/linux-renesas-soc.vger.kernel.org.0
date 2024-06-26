Return-Path: <linux-renesas-soc+bounces-6808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 512499182AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099D6286D90
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 13:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06AC1836FB;
	Wed, 26 Jun 2024 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyI0OVxu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909CD27A;
	Wed, 26 Jun 2024 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409084; cv=none; b=rwlTNwO2O+RMxVjMeisX7zjvzOgFND579KEqSHRRGiWpTgAP+/9iiPisfSCs73YnrHhVnnOVRCljHw5T/UbK1GPFXau4Fve8MoQhRRKVmc/C+Dj+QtetkmWqlVX+MZIZ7kR+/a5YZESW3mXy5L02tVM3ewCFdTF1oZAAmkSEaBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409084; c=relaxed/simple;
	bh=vk48MR9EzjoI2jaF0p6WgCMJHjByzxIvnAIULnADVG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RWYB0Jvm9pdlR2GYa67ndlZtivY5hBFsyDTPT1VU837bxy9H3qn+iJ71SuGcIBGOmKpoIfX5Wrv9Gmf/Zgub4x8eAn6MlScZb8ut1VfFAjgSAb3/dcb0tUlGH2yVgl2LxL2VauWg2DodCdnCOspdJ3fjtv7rGkNdRTUAllFflvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyI0OVxu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42172ed3487so49354925e9.0;
        Wed, 26 Jun 2024 06:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719409081; x=1720013881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TB8YC9r/pNVo3szIFkQUK7lIzZkpCnsGySKiWCzkEj0=;
        b=HyI0OVxuaAC2Now9v5fw59ZPbgZB4c6IJSJh1NhopAIpnvaaCd6jwGsPc163ODeRAI
         FOGurCWucikRZHwl5GcWY+0i6IugJdTvl/clFHPaqPFuTS2R8FZo83Mtm/5wU/0L6Egl
         h/E5UKaaEyRbTy9f/ezjanPhJc0vDpgkg2znoD0KSnInSOBotI/kbO8bU5jdXTlYAQTn
         S1nCRdxwjeLDyMUiH0fRXxeyn4RkCRJS5e3yaCdE/8Y00VNQCidkOjrcFUzKCeqzQaVY
         IDGdWqsfegCg7RFBm8sX8z3cRBdZtoJg6pcDo9P2bEE20oo8t4bq3uO6mrfyAnoss7ee
         neCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409081; x=1720013881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TB8YC9r/pNVo3szIFkQUK7lIzZkpCnsGySKiWCzkEj0=;
        b=gpOXc2toDZqYcq2NaFSp+EXaaM21njAM1qSYyg+w4aYIKY5XBTks4BH8aJ9Dh+EJrP
         +/Rg//+2WtOrgU8mLlBXkInPj+TPTpERo0bG5A3Gtv7wVTS2qAQdg9HtJPYtd2mriwsw
         I6cptml3upHaJxY5BUjfHdNEHba3FJg5XOyvrSfLmw1B7yun3FH5y1XJTWWZL8A9QTiv
         XYxnHsk/zqNH246oqZCXN2jhhwABZ/gaSjYF06YmqZMdrtrUdjTgMJTYosNVUPCloGme
         AAFlQRvNs2NL8sDNPR2NMF7snAnPjTrU17KfXS6pnp8yVn2NnkgVQfF0cvK8z/QLFC3Z
         DFYA==
X-Forwarded-Encrypted: i=1; AJvYcCU+9j5ql5cAzVaXwYxrupX2E7VDeyRymGbbo1SWRyT6eai+VaeMiL8da2reMmsWTn757/ID55gePpO92irfiNwaTSrR79iICi/ESWouRYWzd7jc9hABac2RQ67syfucFhA9fcTrI4B4sw1USh92eNWyozQMR99TJ0s2+qAVpNyzFlEYb2etXaQPrWU=
X-Gm-Message-State: AOJu0Yz+wlT6Q27IFOQrWtrTAN1HcNVe8BVLn4tOl62A6WvWATrfQjXc
	bwBc1b1g4SQSAHQGD2Twc4GKPkGtzYGLskGWXfYRybgq2v+kmeD6
X-Google-Smtp-Source: AGHT+IFkV7LGWZvtdG5BiFC4rDGso0yMN8O543cNWVQgW53Fy9AaDEaaVtpJK3g4NHgfJrmEpbzLvw==
X-Received: by 2002:a05:600c:4fc9:b0:424:8e5b:e71d with SMTP id 5b1f17b1804b1-4248e5be7d2mr62956255e9.28.1719409081057;
        Wed, 26 Jun 2024 06:38:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8246297sm27107225e9.8.2024.06.26.06.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:38:00 -0700 (PDT)
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
Subject: [PATCH v4 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
Date: Wed, 26 Jun 2024 14:23:39 +0100
Message-Id: <20240626132341.342963-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4
- Dropped 'renesas,sdhi-use-internal-regulator' property
- Moved 'vqmmc-regulator' to the top level

v2->v3
- Renamed vqmmc-r9a09g057-regulator object to vqmmc-regulator
- Added regulator-compatible property for vqmmc-regulator
- Added 'renesas,sdhi-use-internal-regulator' property

v1->v2
- Moved vqmmc object in the if block
- Updated commit message
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 3d0e61e59856..d632b67080bd 100644
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
@@ -111,6 +112,15 @@ properties:
 
   max-frequency: true
 
+  vqmmc-regulator:
+    type: object
+    description: VQMMC SD regulator
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+    properties:
+      regulator-compatible:
+        pattern: "^vqmmc-r9a09g057-regulator"
+
 allOf:
   - $ref: mmc-controller.yaml
 
@@ -118,7 +128,9 @@ allOf:
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
@@ -204,6 +216,18 @@ allOf:
         sectioned off to be run by a separate second clock source to allow
         the main core clock to be turned off to save power.
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sdhi-r9a09g057
+    then:
+      required:
+        - vqmmc-regulator
+    else:
+      properties:
+        vqmmc-regulator: false
+
 required:
   - compatible
   - reg
-- 
2.34.1


