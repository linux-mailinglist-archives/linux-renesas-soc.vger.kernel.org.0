Return-Path: <linux-renesas-soc+bounces-7863-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791E7955E28
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 19:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB23B1C20BD9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Aug 2024 17:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C8C155322;
	Sun, 18 Aug 2024 17:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuPbivBB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF6D1494B0
	for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 17:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724002212; cv=none; b=bIwQkQj7BAWL2za+IP4Quxz8kgdbaelQ9tdGM1bzc3NV0sARJwZzcTfnbxLHy2+6b6Lhn5LvrX9pARebd4Ton9dS3650KQfj+ScwV5J1qkKXR+uoZs/1doWhRXpkWkiTYLNoBPSBCJY6vrt9RrSHphv9mZRTViCgIaxmYnyGWiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724002212; c=relaxed/simple;
	bh=ai8EcGvn1f5e3r+Qw9M6ElJt0rT1l/Pl133/TWP4dFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0zJJ87dZIK+dMa4lTS7MZ0T5HOrRFDhk9jztQeN4MNlyGmipEtTRw90VHzgIzPQN+GltR7/8uFRg54jx6Qibx8SQGVGCHVTk1B/nB+o29bC5wpee5O70m9Ks4U+5dSl5hRucEr661kCPAZFVWaBz1fTL089q7gsJuBk09maL70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuPbivBB; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3718706cf8aso2283052f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 18 Aug 2024 10:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724002209; x=1724607009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzVXqaruIBhv+u4Ahnh+PsR/HVOCMt8ptVRPRgst13E=;
        b=HuPbivBBQL6g5oRdJe3Y/ckl54+YjmviaKo0vFW/GLlcJyA8EmqmO6COUEgXYrH9Tx
         LwM2sl2MUfSlbqRFFBqo2yqAnPft1CrlPcJbTZv1y1QIaVt54Y2sQ5cYkgVL93iBJDUA
         1XvdMdZNbxioHauV9YjPmZ5bGuj1SYcYZx4T69sYcExJtJoHtE34Kg88YkgIW0gIUz89
         hiOxO8CKhUUFEldyfMFxtCSbrAOAvTeDYz7BLE9Q5tiDJt3QKhdRJCrlR1XZ3NaRnPsF
         2AHtruQuQuWFRwGwZ0YR8n7+jN2GIW+RVq6eYxMqXmha+RPQcxkkr+oMEEPgrfDd3E9N
         7WSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724002209; x=1724607009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzVXqaruIBhv+u4Ahnh+PsR/HVOCMt8ptVRPRgst13E=;
        b=OfZwDKUO+Z7QJldj4kwu0PnjAEAQr3uXcVTVabjwlMJQTUoK7z+v7YQsfI1Wz28GQd
         +iq4uwO0LLW6GJVO+d8M5FV6PBceUTqnLPGs33M0FHWuTRsSKGHAIU3SKdJMG7f+SZ5S
         Iixdnkuxb8zsN70VtnjPrJ85q1pdAoOaMg1ohjEayBWGb9Id88dNpaUGwcfHrk+PT/MD
         TUZpeX1ApmcO+QPdbcn1kOMWQEXhiMjUGxU+zEw8tRNBWj4sII/g5jgMv7lKzgUHBaqd
         eJS70wKnSfYpZM3xDqJ5yqGDUBr3qfwgeUBpSjL1lecSUAshhHeLZ3ra8enM5GmFELfv
         qvrw==
X-Forwarded-Encrypted: i=1; AJvYcCU5rXvyYlxJLS20Hek+tq8wfDk0iUcldoo+oHUbHcvMMYpjjhhl3D2ID3brVO8iLcBYvdFYZuxFo2yxRbgmt3Wz76x4DJi7KPxIqfY1K9jJufE=
X-Gm-Message-State: AOJu0YzuARLhY+xbxbIj8jB0LVVpRiSaVz6ihgUi7wVKNN6GrgCdCNvH
	JTKioCchPNsXiqIU2Mgqch6y7bsNYYL9NOj35ZWyPefnaKvmSO1iqhzdhFbfLYo=
X-Google-Smtp-Source: AGHT+IGy7uAdpT03IoTiHZdekgN7fKpPoq4+ZutDJaQOeuK+lQ2OB3OCj0nEBWkOrVAoBuCSlVRxXA==
X-Received: by 2002:adf:e907:0:b0:367:2945:4093 with SMTP id ffacd0b85a97d-371946a43damr4969916f8f.40.1724002208973;
        Sun, 18 Aug 2024 10:30:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded19839sm138973805e9.6.2024.08.18.10.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Aug 2024 10:30:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: display: renesas,du: add top-level constraints
Date: Sun, 18 Aug 2024 19:30:03 +0200
Message-ID: <20240818173003.122025-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
References: <20240818173003.122025-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/renesas,du.yaml          | 26 ++++++++++++++++---
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 147842b6465a..9a2d1c08cb1f 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -46,12 +46,26 @@ properties:
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
@@ -77,6 +91,8 @@ properties:
 
   renesas,cmms:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 2
+    maxItems: 4
     items:
       maxItems: 1
     description:
@@ -85,6 +101,8 @@ properties:
 
   renesas,vsps:
     $ref: /schemas/types.yaml#/definitions/phandle-array
+    minItems: 1
+    maxItems: 4
     items:
       items:
         - description: phandle to VSP instance that serves the DU channel
-- 
2.43.0


