Return-Path: <linux-renesas-soc+bounces-12619-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C02A207BC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:54:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A689518892D3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 09:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4D2D19D89E;
	Tue, 28 Jan 2025 09:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iBOXOiW/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A18219CC31
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058045; cv=none; b=E84cbRjHp5q7aSG14OsX4b2lcmRNUWRnNKITPFOIRF/a6o+kDKepJ1/H1MmKJRyempoNqbioIK0AEYXR8iKmgUX5tNShP6LG9p2GrH9zRNOT3s1ZIBhzeis8EKsj541ET1nNzQKSfBai8oU3I+sXvsNKRFe7Nhf9LeLkr85SHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058045; c=relaxed/simple;
	bh=m/9A+vV18V8o3rxj75sgunitt9f7oIlfI/V0HVXTsIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9JzhUFoiYJzgNPP/RRPWqMBjvC/GcdIr6k+laWtD6hWpwNe/G6aPTKWmFeyZhcHfk8PtMBF6cIaNqvO64UpzQxYW3UgTaADvgfgbkWceOOXucHBjn5wJQs6fVMtJhzyFhImd31BHofe3nAd3ZFKRpnvi+smQw/lzQv3PDxy/28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iBOXOiW/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso4631045e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738058041; x=1738662841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mynkn1T58KbWxPJslgprg5ONuckX8jf1idYXFeWeEt8=;
        b=iBOXOiW/EznO4St6025LyF/RTSPkiyYF6q//6Z6KCstNnRllO+4ArfLlAL1doLy0SW
         Z4nxXiyHJBCrzQ0GLIbThZIfWNaSMU629v7mYmx89SridxjOVCp+r85UQdv4XxdJeGHv
         gYPrxNxuCiiwtSOw+mJj1Y7b0xRLlBs8FIJcZUev9knJb0lMyw+UmHyLx1lS5xvs9LNp
         c0kbP2l1zppOWoB3VRMgfUA7GtDW2+u9NyLl97omgxvu6GbsJIP/l0uCoARu7h8FgJcQ
         w68XiJysTICIqrkVxiR64dGVyZ4++4zlSDN6wCQPJVh7n1HHTdxZqwmOutT3/oyQQmHC
         96fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058041; x=1738662841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mynkn1T58KbWxPJslgprg5ONuckX8jf1idYXFeWeEt8=;
        b=qbt9num32JEwXBqnn0YkGRNDDa79yFqLPoTFowIDbPdMNQ57ccvkD1vccLu8LYELPF
         f7cpIjWfhYS91mQOXtHiZwnWDy/7Fe2AFDCHP4sMW8/88iMSYqYCwKLYG6os4dt/uJSi
         eXeEs4w/MN76CeosmRiWDGLVGIN72A6uI/3XbwL5IaGG6qHmlAChh01ICRfXU2R4c6Ih
         D6qDATyqmhfie+D7TvG79beKJizRLqzZmShd6dxjDx9MUQ7UkJwMxV35K6MV7jSak+An
         NQKneUWe8bD9Gjc9zgdKaf1OBJiL1HvmX8qNdCStWJ7rmUqnyOYKAUpkZrx9Cogl2yFo
         Z8XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBKRO1bzmmj0+AveFRMMYiS1uniVi4QRyVO3f3jb9pLpW1j/mTLxKNEhF9IIxll5Zi57eJHn5YLVXrlaPB0z28Vg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP/4/l5KdY7Y8sW97XCzbnzz3ITYE4/Bx2ang+Jw8kmx5yVxpQ
	JfXYkLauDEBdA65MOyA6ybCftYR2pWWgTrop7GzHAETxrvEutMrgDef4xHBFuIQ=
X-Gm-Gg: ASbGnct1oJ/nctEdqcF7muF3dcZR4LE/xSxtvQ3hqPxLcOqIE0b9aC2JOzrWugV80Te
	zjWYLs+BiMLb6bCZGn4pMBaYxNObNvyLRy0OEFp763qVOYMd2DL6JnE1fmYOBdXlhp2GyYU+IWh
	XAw7ziCTr9fKtMVc0iZmRX5q+s6LZ7rAaAZSRKYa5Sr9gYGmQoURuhyr4vMz0iaDU1lVlW8vt50
	aGQqq958aD2zCq+Zgd4FwL/X2QUzszlbH9YWr/ntaEF7V0B7q+JVGzy5ETfQEmb81m3jqjVMJX+
	84xI64pwWsP9r4ZahuL9v9DYXu07
X-Google-Smtp-Source: AGHT+IFaCb5uid+D45DpJt271ckjlQY8cqUkzEIatk9zjS+oh+oJJnaznv1MM2Dub/pe4P4CUIZarg==
X-Received: by 2002:a05:600c:8712:b0:434:9cb7:7321 with SMTP id 5b1f17b1804b1-438913c7930mr158611885e9.1.1738058041497;
        Tue, 28 Jan 2025 01:54:01 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd48ae56sm163002455e9.21.2025.01.28.01.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:54:01 -0800 (PST)
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
Subject: [PATCH v2 2/2] media: dt-bindings: renesas,vsp1: add top-level constraints
Date: Tue, 28 Jan 2025 10:53:55 +0100
Message-ID: <20250128095355.65766-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
References: <20250128095355.65766-1-krzysztof.kozlowski@linaro.org>
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
 .../bindings/media/renesas,vsp1.yaml          | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 1a03e67462a4..dc4b8f00aa7d 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -33,8 +33,18 @@ properties:
   interrupts:
     maxItems: 1
 
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+      - description: Video clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: pclk
+      - const: vclk
 
   power-domains:
     maxItems: 1
@@ -78,15 +88,7 @@ allOf:
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


