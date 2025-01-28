Return-Path: <linux-renesas-soc+bounces-12617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D48D3A207A6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 10:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1562B3A5163
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 09:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BB519C575;
	Tue, 28 Jan 2025 09:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tCCvlRRy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107DD199FC5
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738057647; cv=none; b=TtFSy+jOc7LX+N/b3dC3hqpgNBErLz7X7vmUOuFVO/96HPUtfU/b5QD2V1pRKadUbYlaGmxMRvnRU6tG4gwvLD1wgxRNrrXKwCAqEz+vDHRGiRtor0HteRq4ulEgM4eomzFiwWqvDO/Kwqt69vVgAUCVJVLbj/mH6PD1fLOWiq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738057647; c=relaxed/simple;
	bh=IFhvx6BUX5UIaFLR04bH4mI7m6JJMsY1nbvE2xXLgtI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HfIG136yShfMEueDKNi+suJsd641z0SEJ++V/HGiUEecOqIyJZx8PRY0+UtkYh6ZqB12yoyNW0rj1eICOnYi5URBxYvBhpHmntIJzT/y4amWBMl6vC3bV61GbJyX70SsC0mOOTeaVnCtJPlHmT/DeO5Vk9yCk+XxAlqmXH8PE6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tCCvlRRy; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-436230de7a3so8733115e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jan 2025 01:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738057644; x=1738662444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u9RDEfAjvytCStxuDVQwfhnYFZ5MAhhy9EXCC63scEM=;
        b=tCCvlRRyvXJpaZrV3hPlpwtCAtrZ0dGcpCGZBhtZyI3KyRQYx4ewY1VF26Ng2fpMy/
         IibLy5jW8SzutztxUt29KgCym/w3hO2SBA6rms9vPtKcsZiIsbvG4Jjaz6EYGoQf4Grz
         Eu49iJiZg5XXS3GmOOhiYSCnawTKy+4S/lAv3k9gM7nQzIEe2iM5LAGKbYPAQ4VrG/Nb
         fHG+Efz2l/VbIoz35D3maOVZv9mtBbbNKgoEX9PXG9dO8zsRulCd7lyqE/1Qj9NtVWKh
         TdQzbVERpALuC66ghOHmvR5XkQJbqK+RH3qBDw7q3OJWuSoEuOGPfK8EpAOlqXCnTJ3/
         MsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738057644; x=1738662444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9RDEfAjvytCStxuDVQwfhnYFZ5MAhhy9EXCC63scEM=;
        b=ukJLDED4LEOipvu81t/mIQTbqUt5G34hx6nUqcwGd5YLRysr68ORwO3SWndW1TU4j/
         QZlAv+51pO5BzSw+aybHbTnGGrqFryBumP56u/VF047e6d4Y/1f3qqW8/5sQiPXCEEIe
         CbJDiDAaXLo56Gx2sCEl/6Ntl9z8lW7ov6CmgQoUEWe5sZx6uS2GjNzEFyaD2YtdEwZv
         yEDMWmLa0R0iNGDOVX/BtOGHG3zn5CxD9x0j3tVoaqCUdQo7PgpWBNTHUIQTNqzGvQgf
         QUh6kpjeFITkJ7food0ziyMMLAgsNI81XNfZ5kCpluMFIDrcpYIMls+1hEi23s7EETek
         1Vig==
X-Forwarded-Encrypted: i=1; AJvYcCXc9UDhN5vvFk3tn6N3iodlG7BJ/YegBFj7/hsgJr8Xkvf45acdTmFjZ0cVdEB9pYp+Qk9Ub8ZkkZ6Py5v+URJj4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy97GKywl52DpOPG504xfYudGBlCVq7nUSRlqqZ2oDHEJJKaVnD
	rK+Ha2asDTJCDRd3a9wzU48cZcVTynio4ReaCJ2Q02UwZcxpf1VSfHBf7BUgD/M=
X-Gm-Gg: ASbGnctnQrkS1sh1aE/sxPaRDoiWSoaC7Iai9qWIJs//lirCcJzBQvrQjohnnoStwDC
	MEChuzVJk4Yu88uELDOM0DkBhjZRLkOs1/ONwRYKiW/e3yLbA4oF4vDLgzyig6tGkpJGqPqBvy1
	v5pmg9hQoTNxAHhm6BRLKDaeb/cdwJSgc4gBXeSLqHS+VdYzXEhg3/FqXLwdJzilU4BTdPvveux
	60REBydgLMgEBvsm9xE2tKRizdHtObj6qTOmMCZhUZMqXYGVFFV76a31VGp8vrBiwedVX8Ewdp+
	TmqIjgKxhDzFl3+ucdFd88CWxLNF
X-Google-Smtp-Source: AGHT+IGwnsZz41AB4AUv6kdCnTehqV69TD9WVf518U+GkQ/0HAHCLnXtGv4xpdScQIry/Deix8IjOw==
X-Received: by 2002:a7b:cb41:0:b0:438:a240:c62 with SMTP id 5b1f17b1804b1-438a2400e02mr131580915e9.8.1738057644322;
        Tue, 28 Jan 2025 01:47:24 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd50233dsm159711095e9.15.2025.01.28.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:47:23 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] dt-bindings: display: renesas,du: add top-level constraints
Date: Tue, 28 Jan 2025 10:47:19 +0100
Message-ID: <20250128094719.63776-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
References: <20250128094719.63776-1-krzysztof.kozlowski@linaro.org>
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
for clocks, clock-names, interrupts, resets, reset-names, renesas,cmms
and renesas,vsps.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags
2. Rebase
---
 .../bindings/display/renesas,du.yaml          | 24 +++++++++++++++----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 88ecabc4348d..c27dfea7fc62 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -47,12 +47,26 @@ properties:
     maxItems: 1
 
   # See compatible-specific constraints below.
-  clocks: true
-  clock-names: true
+  clocks:
+    minItems: 1
+    maxItems: 8
+
+  clock-names:
+    minItems: 1
+    maxItems: 8
+
   interrupts:
+    minItems: 1
+    maxItems: 4
     description: Interrupt specifiers, one per DU channel
-  resets: true
-  reset-names: true
+
+  resets:
+    minItems: 1
+    maxItems: 2
+
+  reset-names:
+    minItems: 1
+    maxItems: 2
 
   power-domains:
     maxItems: 1
@@ -74,7 +88,7 @@ properties:
 
   renesas,cmms:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 1
+    minItems: 2
     maxItems: 4
     items:
       maxItems: 1
-- 
2.43.0


