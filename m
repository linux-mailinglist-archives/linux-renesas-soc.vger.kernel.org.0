Return-Path: <linux-renesas-soc+bounces-16587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B58BCAA625C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 19:34:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7119B4C178B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 May 2025 17:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5669221B9F6;
	Thu,  1 May 2025 17:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ib+6vpc7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D33202983
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 May 2025 17:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120867; cv=none; b=t++iq+Q1E4OtIUd1bDOgiNOC4xXunu76t4GOwb0mcKYp0zR1mpKEjG0b0DBncw4jTJ7nGnPVjOtQpNirviJfixnBLcIFW+QjtHnN8l72ak4oqt7pKZydSB2w5puD2UABTN3uhFG0aiIThW2z2iTZnmxJsc9YI4bkyy7m7V/N7ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120867; c=relaxed/simple;
	bh=LDqLLggApqJ5PVDNie/ZAqsCU83zVZ4cmoFRlLZ1U4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8pJ4OzdPIY59C9wrTXw306OustkUB23MbxH5KVdagLo+lfkBIA6hvgxd8iJFT08iO8+hOmEDSFesDmHedVxfMLq7OEpfy7fBwYkGW8NsJdlPaFq0wZZY/9HnSxz51ERtt+yRgjeCH0S+/kU3OESnuDWugXFQat8u4sVBod8nU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ib+6vpc7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso1337395e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 May 2025 10:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746120862; x=1746725662; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xxVduul9s0ZwsIuQhKt66Lsc0DdSehiVZrN34LlfJg=;
        b=Ib+6vpc7aFgiMG0AKw6XQXT7QJ8SygKjJNFmPIFcn+JNkDdaUXxbhwYnZ4X9QShP4z
         M/VTiwbu/zwrvGA5Mw45fi8XaXKbrfb5gVCxdIhAhsGPu+uOrSC/+VS2uQxBl5V39MQt
         KucNdBfeeBAuibLqK4BtOwCUtqIh55nJjE5zEeDxxXAttkCf6Lig+kNTwGWP3QK/LNVY
         sjDhRCUuJZXEVPoPwjgCMgFp78VDZ+/tHX1NcW39InkvWJxWX2vIKdLStsYtyutmR5GD
         CglFKz+BSL5+pOnWIYm2ht3DoQDa80oy74BMTZGYsXRoDJRBImqcBoaEK9fmmP0yQ2NX
         iK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746120862; x=1746725662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9xxVduul9s0ZwsIuQhKt66Lsc0DdSehiVZrN34LlfJg=;
        b=wBCCn+IoARkpYE/ITr3lNoMlTlrycVyCiaEp4UNZyjnAH39Kzz9l4oI5MCROnKUVRt
         KGi9nbB6mY6uAK6VkE1Hm489l9uQqeRHLXWBpl4gWXw9M/5A4rPMlS2N1rhZiOokuse7
         xigCzYBcaL9Fx3N3oKJTCG/iTWMImTJvrnGHf9ORvoSCQm0uzMjRh43SnzPPMvnznJNL
         dt/FEl8k6V/CdIfRygVmVOMI6LGZvofdDmindQ8NUTHQgfJP5p6N18tvPSiJmjg0KQhQ
         Vzkz1n/AOw2d6P5pg8cJxaBE829rhlNdWlkIQSgvNyF2VzYq1Q4nmXt2F87qeB+1JO7+
         uoyg==
X-Forwarded-Encrypted: i=1; AJvYcCXurnsS4RjYwrmOSt07QgTm24NcM5DkX0O+9InuMGuUdp1Sg6pGL95R7qgalSl//U3ngbh3y63+hoBR5lH79ne5dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdemy5DuDRmunwe9Dwkmj1P0A36Ve3DdpELUoDEOTPRbAPdK1X
	s8TJFcw/yPTmTS5D7dNvlh9P+c9SLNx6S2/bkoAATVbJmsLnNi29olx31exWOFo=
X-Gm-Gg: ASbGncukS654qqzMk00MiEU7nhjghWOY+YZjYDfxlAIiIJmETXSRM18+HglDZ3+IE0j
	mZXRE/mfwqtqlZsFSSirbGjWC0r91x0qQ+Ej84sn3uGsvnxfd//blxDeAhOSrJ+F6kwlTXMJ4Md
	RUK/CCoqS64oIxRcFt4rc4AJB7VsV7i4WPbzTHa0ve+uapGJlxucSgvDpt+ASK9ko8mY8mUod4O
	yuTGDKAhmvw+mGu1nv9bk7pxU7zG4mGMBGsa2q10NstBgEyZCG6Kx8Yfapx1QWKSGpJC4Pc0RS4
	UCQU4vWQ5G3lg0hmUB9R1betfNTJnG1jxVH59WdTCrkIX6hSTQ==
X-Google-Smtp-Source: AGHT+IFk9h/uxz5GruikSneVU+LplZcnJ4TL1He5xGLqkJ/zWq9iGyQqoSc2AtT6IT2JWIoXipl+Vg==
X-Received: by 2002:a5d:5f82:0:b0:39f:6ca:9250 with SMTP id ffacd0b85a97d-3a0941604e5mr924950f8f.12.1746120862574;
        Thu, 01 May 2025 10:34:22 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a4650fsm1314481f8f.26.2025.05.01.10.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 10:34:22 -0700 (PDT)
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
Subject: [PATCH RESEND v2 2/2] media: dt-bindings: renesas,vsp1: add top-level constraints
Date: Thu,  1 May 2025 19:34:13 +0200
Message-ID: <20250501173411.134130-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250501173411.134130-3-krzysztof.kozlowski@linaro.org>
References: <20250501173411.134130-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=LDqLLggApqJ5PVDNie/ZAqsCU83zVZ4cmoFRlLZ1U4Y=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE7CXHGc5rgCVJSmaDS4XQrmvXJuIvMmFdU3ga
 JoJe2MarJ+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOwlwAKCRDBN2bmhouD
 18oJD/4l1I2hyr0amRpMFkpfeuVeFvLDNLGmmjOmSrYUJ4lD+AY8zC3x9FqfrnQuFDuMiKls205
 mlQpOjCIFUAq66Zj1l+hvHP0tkyvjOcMASce4XcXQvEamiHzWz8WWEMMHXi5Y2aQP8vAW4S4o1f
 OTnGYgu1MX+AVKHeasDrDXtZkCNKUm+Zs92ajtTnC2NZa1eC7m3Yob9Z+jdIBI7pkD/I2imel5H
 nVqoOYYHISGDkHLeBkGGCXeUsyjTxCkS5Q95YKa0pyQLBlPWR5OU4Jr6OTfWaAD2dVyRsK/vLNQ
 DUKJkEv5MvjPBFtp0+KIS1u7+IcNbftsWcrDgur81BvXnY8HtUiudIGl1T0LakwdIe6CMkp0hyh
 N7EK0uQ34ovCjL/hMWdSqyQd90+JHSKY2C80lt0Yzpbf8Wl2Vs4jTkCf3rPJhmurv2m5GCz1cDR
 sNDEBMGuqnBccqYU9GBA8V9X+U2AvFyJZcDmuPIfaIkgTAg7q66wZsX9b1hXQ7fKwrHZ1abe2N1
 n6NgWSFx1OrvLkwykUXUSQv384memimklF1SE4btGFTYF2aUZK7mmmsKil60paClcnkOIpWlqPb
 cJuoT9LuuzxrchEbr9/UBJjuieef/qKTwPdxmxfOciW7CcoBYjx6f4dokjMh8SpwewckLLsq9y4 TXugnQf2uKGzPQw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
index 9d03b972f522..fcf7219b1f40 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -34,8 +34,18 @@ properties:
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
@@ -79,15 +89,7 @@ allOf:
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
2.45.2


