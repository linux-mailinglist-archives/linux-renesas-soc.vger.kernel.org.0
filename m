Return-Path: <linux-renesas-soc+bounces-5829-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 026E18FB9DC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 332731C21765
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706DE149E03;
	Tue,  4 Jun 2024 17:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGDOd6+H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A710F149DE5;
	Tue,  4 Jun 2024 17:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520746; cv=none; b=qj2ju6UtE8ZVlTAyKe6JNlvtX9u0tlzcdn1TbFNNddz29yCVdIX7hJ2Z+dksqLarRUmb7ZEPPfDdfLKXkaivXyW5MIemLESgsv7Mt6a2/wyq2eZAV8f4Fn4OewzKWwHSlHj+0kgRSuB0ycfkKIQlQAEE3heHHKfZnmMiqHEqGSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520746; c=relaxed/simple;
	bh=o90ck3Kd56d96IuxpeZ7QtB+L2DUKCTkGfu8HFrmCos=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=emK/aYToAEQvu8XbUZV8PMQ8s+2K8dFO6LN7Cg8DKAXe7/xug4WXPBo1ZNLerCEleG2wNMrSk9o+iuF0qNaoUKjz4qYBhJWEdq9bseoZbq4A7lH37cZnKTlc+lif8EkZ+vVJcKSbmq/mx3VQ8FcL+kIfOtckMNYY29Z2VBlmFEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGDOd6+H; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42138eadf64so26474205e9.3;
        Tue, 04 Jun 2024 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717520743; x=1718125543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emdPqQMKqFtrqJJMG1PmUzoKPRvDojo50sTNZA8Nb+E=;
        b=mGDOd6+H53YDLjJZiqPVcNDkUiuT067eHs4sv0KZIFtGO3ul3PnDQWj+rUMbfMkn3I
         pnVPodxtHdmPmuio8/HjTcjUGyMg2E3stVsF7FO5RcWmcdZDm1xmM/9hKy8lWkVjEPBy
         TgLQDTMRTm8GAIezKnAfcRzN4frNcqzNXloydBET1gFxM/Lz0kKzYlaOSo08MSopVNMZ
         AekT53flA2742FeOxRHYXwsmXrEb5CK0jpimO6EEeNDHpBqPUm65HG8p7+p6825Gjbpg
         5YiD2Uq64ohuodOmZWEUCk8piouWAHt0vjZCXLub11TljtlbSgfxM1+Y0bbpeAA8X1Q6
         p5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520743; x=1718125543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emdPqQMKqFtrqJJMG1PmUzoKPRvDojo50sTNZA8Nb+E=;
        b=WxXgvADeT/8NadS8QegPaKpPVR+6cPrm7mIHdb7e8SLopcj9qIPexmDHpdledXtHfH
         mXtiORonOctEg+D/UY56Kc9kM1hv6JVpCzk28hYagMr7Jpby7Z/0hjCsj/eJMRXqY3Nb
         j0E9oR3V+L2R6XsiGrMpm8DH6s+mX96DqJAnICYUXUQFSuQ5Onq1uqDCATZTUtN3uZjz
         DzkRc2GmnzlvIQ3f2X1nbZ2b6SecfoLit3/cYDOeVoFdP5xvHeg6SbbcnXFGNVyzilVn
         rwK/Imxz0Uq+qeZ79gsypLXNSexS2YOXQiBzdXrKgGV3GNd/PB7Vv61+SDx1edqQhaqd
         J+yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUihzVz48cY1yQFJ/MC9aVrrJ+Y2gVirPzi8QQGlU5zi9kxCMX7Eq+qKMYIi1qm2dLLuoBYzpiQLiraUUH+Niu9Ss55GdkP7C6TOy2DYoPnio0zKjvUc9EHlVVlK+FBdX8OKy0SOZicXT7E5zRdfg1xciCGI8KDp4Ivh6YEK5tqEauI4KtY1X14zGyzhjVOJzx4idLhT8dHcmPxd3q6r6tPAn8NFrogFsCn
X-Gm-Message-State: AOJu0Yzl/UkygPyAcPFzQPzGTQk46mKkktFcZNIxl3NShVcKbq19G9Gi
	pVvGUH2+aYrG+SMRZlZpUcmF9/1wVglP79gEzlXD4V2eDyWjgJBb33mBxi9b
X-Google-Smtp-Source: AGHT+IEI5Vs4fsvxPtNC5NpMwVZZaSNuM1LDF0hEzMQhuPbxGSNdCdzlzK4DjZToAlJVMjGxg3irGA==
X-Received: by 2002:a7b:c8cc:0:b0:416:3f85:d49 with SMTP id 5b1f17b1804b1-421562e73f9mr2095225e9.18.1717520742731;
        Tue, 04 Jun 2024 10:05:42 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f2asm12244077f8f.3.2024.06.04.10.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:05:42 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/5] dt-bindings: serial: renesas,scif: Move ref for serial.yaml at the end
Date: Tue,  4 Jun 2024 18:05:09 +0100
Message-Id: <20240604170513.522631-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240604170513.522631-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding more validation checks move the ref for
'serial.yaml' to the end and also move reset check in 'allOf' block.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v4->v5
- no change

v3->v4
- no change

v2->v3
- no change
---
 .../bindings/serial/renesas,scif.yaml         | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index f3a3eb2831e9..54f885f720f0 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -9,9 +9,6 @@ title: Renesas Serial Communication Interface with FIFO (SCIF)
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
-allOf:
-  - $ref: serial.yaml#
-
 properties:
   compatible:
     oneOf:
@@ -161,18 +158,21 @@ required:
   - clock-names
   - power-domains
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,rcar-gen2-scif
-          - renesas,rcar-gen3-scif
-          - renesas,rcar-gen4-scif
-          - renesas,scif-r9a07g044
-then:
-  required:
-    - resets
+allOf:
+  - $ref: serial.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen2-scif
+              - renesas,rcar-gen3-scif
+              - renesas,rcar-gen4-scif
+              - renesas,scif-r9a07g044
+    then:
+      required:
+        - resets
 
 unevaluatedProperties: false
 
-- 
2.34.1


