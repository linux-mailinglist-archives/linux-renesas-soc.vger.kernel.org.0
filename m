Return-Path: <linux-renesas-soc+bounces-17564-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7275AAC5BB7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 22:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECDAD4A4FF8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 May 2025 20:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A47920CCDC;
	Tue, 27 May 2025 20:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AJ0RhplB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5C420C47C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 20:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379516; cv=none; b=sYNNEViZBvBD1/oMbSb4lBF0QnpUNT/wXiubXV+naR7XQqtBAdOsZBYMlCD3no1vuNJs4EJfYNsTkeJJSrwspwMsOwtKPWMQz8bWi9t7MoGyEr4lvm3/aKS0CxL/7mX06oUElZ08wk24dfvNSANG54KYGuJR7EUvMA9PxiGuOCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379516; c=relaxed/simple;
	bh=2j55HxG++1o7+pdJWJRqq9KAan58dr5frReyQGE0B2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ow207fLWTKqNgI2ZDV6ireZc2oSYe3+ZK4CapNmGVTvtXkGEU/OI/iJXyGbPS86DaUie+anRqKnXF96f8/zDFGl8Q588+Q5pVhwWM0QrT3OQJr8S3giasV/WNB7j6AsNuP1HgjOlvSml6u32MxLnei/QAccLKcIw97d2LV+EhCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AJ0RhplB; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ad8826c05f2so333267766b.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 May 2025 13:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748379512; x=1748984312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=emZjqiREaoGi2yubeCTwRZ5yCy+c8DdCcg3D/FzZ4eY=;
        b=AJ0RhplBanWbCI5um31fl/RlDCLD8AZ33+lmwzwuatABE7i4B2FYcdmqEo/Evs9RsV
         KHGhld73XZSo66BuiiOsUqseQetsOvfkvrJefYTw/04G5kXJX/M381DPVfYSaBZyJUDW
         75jHG3LXuacm0w51ToeDNTjwbLS/D9nQ/pZ8GuL3ouKYsqqmP0O6JFvf6trpYdUu8Yvs
         p4F2dQTeQkQGYepnY1Wimj1LO+C8x8SKSDydKn696WOR413k+py4trLBDuwH2V7DRVJ1
         Jz8nDH5EBGeQNaRKcMNBcLPrB+LkFK8D0fVYH3/0Xax8jfyLJNZSaRzBPn8VUDER/2Hk
         p9kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379512; x=1748984312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=emZjqiREaoGi2yubeCTwRZ5yCy+c8DdCcg3D/FzZ4eY=;
        b=Vo+F46SwcXX+0AFLXUv/LS+NyQNrkpumeHND4FMXH/4x4Qax+YxFPT8RdYeN+F+1h+
         pXX2GPWihjVwArbc7H1vuMlSNzLCNHmwReQ9xc5tNbXXZ28+Y1+8bZftyc3+GvGzaKoY
         pOcjLaU4GJ8B88vS/16RAhZ3yDEtSTn6XsnKTBAHy8cpG9SiGSQNpzbH1y3EA3T4Qq8X
         PaGjfrJwgTWf6yiYY2SEaoMH1+D0VZdiTD0FU+6tnUf0XtZzQNdchAzcqoEFiC3IqwvG
         MNuP8tufOLHpa+whCW8ejD5NQEXHxgsKxVrEhWhwweVEU8UrsPdUUo0DTAbmthQKHgc1
         +Z1A==
X-Forwarded-Encrypted: i=1; AJvYcCUGxI3lGYlR6txCpbocVEcS+9gN47f4r0707oZ/6A16NiFFoduVvwJaZLaFKn2McLfbEXc6bcjB6JfIXIR/RfGQNA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkToSFjTt1PeXT5NJiyfSpQFb69aTVZkjByxAu7pDE/30ysyxH
	gi8Dls2IIsJ9chClDj4PT9MzdH9s4I0a34JxRlR0s2IwyaDzX7j2n8FBabkJiw8JFmc=
X-Gm-Gg: ASbGncuIlDw7/Afso2NPDzn8PJljtp9rDuwSAOw8WyC5NTrVEjDFv7tCJn/7SYPodhh
	0yZ0v1DOM1v4xqXL96BbOr9zbo2wiVX4GT5NHd/W1A5X0H7XDQuVCOoq8BwP4eeIqzRMpU8aymx
	WCVq027uEh00HT0ZB1Yj6qFLwHQIGspPAR35EZni1dFqOwVORVLyseieWvSpjZIjowfC72dICUI
	enuNLpLbBXLmAhne62SqFkR7B3zCvmCYwYSXiQkFU21OJahF67+T93ajuKD9CFlLJxacYbXG3dq
	CtDrrf5Wcf5NDFVH6HAwPYNksClt9Tq7KsBPPSsVbTnAaU1+Ab7QA9Tt
X-Google-Smtp-Source: AGHT+IFSEZFLth1i2WF8idDSnCTLky4n60ge/cYVhqY9JgIM5s7CPdNemkYhutHt9SrVLqbShViWHg==
X-Received: by 2002:a17:906:9fcc:b0:ad5:10d9:9061 with SMTP id a640c23a62f3a-ad85b2799cdmr1438576166b.54.1748379512173;
        Tue, 27 May 2025 13:58:32 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad89f087eb3sm10913366b.42.2025.05.27.13.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 13:58:31 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: timer: renesas,rz-mtu3: Use #pwm-cells = <3>
Date: Tue, 27 May 2025 22:58:22 +0200
Message-ID: <20250527205823.377785-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1236; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=2j55HxG++1o7+pdJWJRqq9KAan58dr5frReyQGE0B2E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoNidvchLGx7sJjDw3XkwQtzCLWhAeydC1fapAB pgG/EcJqb6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaDYnbwAKCRCPgPtYfRL+ TkqoB/wK0DVgPpFOwwCl+wHBSQVPaTp1DW1ZvFm00WeB35+fPi1flMBZ+hKGs/T0AhBdxZr2ywZ +wq8QkADqh6Flsu6YnJRv1exQltwYc7vjrxp4TwS208gkoVumNnXP7USgOE2+6uvnbq7jBSOUM0 48VTg7JHcBnzrtxwao8kXZCpnmEsONL+XqZQp9sEAbtPVEbCaYVfS/jjtYGQJBNmqNI+Dkc6+b9 wxH1QTw097C9jSTs4dTlpSz019TD/Slv72e0rfG225EsDJwBFlsUDSFI3/m0WdwZYItyzLHFQen ZtENDa39RRNxVRKqaQGJQ2Up5xqVPJv0xSPYTRI3OehU3sdW
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With the goal to unify all PWM bindings to use #pwm-cells = <3> update
the renesas,rz-mtu3 binding accordingly. Keep <2> documented as a
deprecated value at least until the in-tree device trees are fixed
accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 .../devicetree/bindings/timer/renesas,rz-mtu3.yaml         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml b/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
index 3931054b42fb..3ad10c5b66ba 100644
--- a/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,rz-mtu3.yaml
@@ -221,7 +221,10 @@ properties:
     maxItems: 1
 
   "#pwm-cells":
-    const: 2
+    oneOf:
+      - const: 2
+        deprecated: true
+      - const: 3
 
 required:
   - compatible
@@ -299,5 +302,5 @@ examples:
       clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
       power-domains = <&cpg>;
       resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
-      #pwm-cells = <2>;
+      #pwm-cells = <3>;
     };

base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.47.2


