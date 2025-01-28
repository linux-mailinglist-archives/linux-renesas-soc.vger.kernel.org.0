Return-Path: <linux-renesas-soc+bounces-12618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86DA207B8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58CBD3A69FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 09:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71FA2156C74;
	Tue, 28 Jan 2025 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBIAbyj+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761AB19B5A7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058042; cv=none; b=K1HlEQ8xTwkJrCsk0NI8e96EqcxLXptclifThcDdwt1CpCPlYDd5YIu8JzRsTMSAptvIGzGNKk9v5pc3qL1trelj8CO4q2In/8g0ZXeszNfd+fezpDsqMV1SpX8nu7/NpKScG11hFTAtx0VfMfGnGeVpxL1+a8usOS8FYV+jams=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058042; c=relaxed/simple;
	bh=NQ6ugZuFusyIBLTqNAToTvLloxPH1ohbfhkFV/P7xag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A3w5oN/YzeZuLPFuPDAsLF3FGZIOFzD5LnHFGi4aAlh6OWUUDb/ogLc/u+OVk1K1IAcmKKO6EySZ1T+b/7tqhdF5ig42kARikRPAvVk8yhE+yJo+CWkqU4D8bTrhdLeRgbJ791SfHmyLxZhWjetylTyFBRM12wPO1PwDng7pKq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBIAbyj+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434f398a171so4627645e9.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738058039; x=1738662839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gX3wCMKWuGdO9a8FLqSF+Jru9DaiVGtaRKDUVUUwAh4=;
        b=LBIAbyj+JuYdRwiS/v5efdibieD4f4gR1PzJh7k4gn9dYGIytmB5Gj4391wMcVgOaK
         Z2elCX7SOCJpoQKIvxzAePItzX5VLZrqAdtsD18JryF7DG+6pGESwFmll26QIUN6rRM2
         ZkTCRc3l8vpK5sHku2a0XCK/vNAyboNyBF2j6dgFa89/9ghm7udrwsBwt2OXiFm7sxtW
         XOOSXu0mRfrOZw81cbe0ayTBCsDlQf38BuSzcxpF+TeqzCL74Xb9kxg2Mmps7dBsZfVW
         enmNdTzIZ6WpHOSpt8MStpxqdvCsb7Zf2L5HwHwAnx7hMtkfM8mnfPKhfB2xPo7Eb0Cx
         K6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058039; x=1738662839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gX3wCMKWuGdO9a8FLqSF+Jru9DaiVGtaRKDUVUUwAh4=;
        b=LZmV1egUpYyATIZYV060maavMNhqcWUA40CqoKxQv5onyYvsBleh1W39Zy0b99mVR4
         z9FHckw7AnFiSmA0hXKWpJOYM4J2lInXdu1V5HR+CdlNFJ0DbFfNxbFhO3xZUGZhmEZB
         DCCylZpajCOIdy81pUH9bzvpzAQqTFGuPPvb9aUW9LnOvaM+8cT4b2jdF9ZX5jaaKGk9
         7jrYO5UyN2sMxoL6t34zk54Qa2nkAZ391yI+YH8TKbYckp0G+TK0L50fUN7q/km1jFDN
         RXFQX5HxoGbvjW3vnBdOlWpu27EkUR6Nc08Mqz1XUJ3vD2wm1m2Wj/cCrpPENS37gNNI
         hiuw==
X-Forwarded-Encrypted: i=1; AJvYcCXyzxz+5VYoAySmorcYZL06MU/VfeGrGcDo0ivkpX1A8c6/WVaW5zrcQC1i2pt5ZTjyC5i4yEB+aeYdNMRTa2nu7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx29U8dCkZYlkI9ozoOCBVqPdpg2SaiAB+HY5tHf7JFDWTQw+mc
	TgtNEVbN5fnRHnOarGTPqmOYb8KiszCPN4FTlbvd21HMKjiRbPCCehrgbY8RrFA=
X-Gm-Gg: ASbGncsLYUm/I37NpLNTBJS2pCtq4AyUWqrdfm6nzrsZajLPrXW2wsr5a5XMiOzzPVH
	S3AUUXUUiz+snFoT9gWwD8YwjlhiFFY15H77DlEQ6vOJUN56rUM92bgoPU+sNN027xaQioXnqYz
	vCf01Y/dmw+WzlayWA99GTXMRpi32I3ZM2eqO7d2HiyUGQjphsYGVVXcvSFtOEkYi/z65NDvzkW
	GsF13zBBlvYPIREbTyd9R5O+2bbT+MxmcNQyiE7xHrIs67X1j+18Ie/q2l2JADy285mjIS4hTES
	8MF8Dy+OD+tv4mcezMYYqcVBrHB5
X-Google-Smtp-Source: AGHT+IH2lJvke32NprHWtE9+fl3bZUwS8VksN+GlfIiEv0zBLl3ziaJ2HPij7vJA9/GwRDVHWl9vUQ==
X-Received: by 2002:a05:600c:1c23:b0:436:488f:4e4 with SMTP id 5b1f17b1804b1-4389149cc76mr150353635e9.8.1738058038800;
        Tue, 28 Jan 2025 01:53:58 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48ae56sm163002455e9.21.2025.01.28.01.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:53:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] media: dt-bindings: renesas,fcp: add top-level constraints
Date: Tue, 28 Jan 2025 10:53:54 +0100
Message-ID: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Properties with variable number of items per each device are expected to
have widest constraints in top-level "properties:" block and further
customized (narrowed) in "if:then:".  Add missing top-level constraints
for clocks and clock-names.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tag
2. Move clocks description to top level
---
 .../bindings/media/renesas,fcp.yaml           | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index f94dacd96278..acc08ba7940b 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -35,9 +35,18 @@ properties:
   reg:
     maxItems: 1
 
-  clocks: true
+  clocks:
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
 
-  clock-names: true
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
 
   iommus:
     maxItems: 1
@@ -69,15 +78,7 @@ allOf:
     then:
       properties:
         clocks:
-          items:
-            - description: Main clock
-            - description: Register access clock
-            - description: Video clock
-        clock-names:
-          items:
-            - const: aclk
-            - const: pclk
-            - const: vclk
+          minItems: 3
       required:
         - clock-names
     else:
-- 
2.43.0


