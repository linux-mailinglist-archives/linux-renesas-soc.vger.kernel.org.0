Return-Path: <linux-renesas-soc+bounces-5831-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB478FB9E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 19:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 851CD2847AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Jun 2024 17:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DB314A4C9;
	Tue,  4 Jun 2024 17:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMl83VNI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006C13CFA3;
	Tue,  4 Jun 2024 17:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717520749; cv=none; b=IbmLAROZrlsrdHgepZs3IlUNAgh/Y5g3Svc4d3mSzR72XSJVTDoMhQlmGrEaXNrokh+KLvQcBp/oXeuNGRa3tom8om7ykwnUy33P7smW3G/SqjH7/pVVGdpdGnl7g2hpzFXkY/w+VVNhLsAyjNUh87ktf6B3HHyfUaF1OlVzA7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717520749; c=relaxed/simple;
	bh=J9/dO4DLvkrkDukD/1y3jtSYWitJIJkWj03S3ytOCQc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xk6PbivGEwvYQNiKN4I0/fOw+kaYR+34e7ZC+Hp/hNvicQiqaSrDoVB2ASbh48IbocBp9Im9Fma91Vj/wW+/XrLsGW2iXsbLjHeEKnPZ5vyprb88mehuOTdbxmPxn/HAljYI3EnJdn3lb/HUhGPHXRk4O5xAZiCd8pIbPSzbyb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMl83VNI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42120fc8cbfso45445405e9.2;
        Tue, 04 Jun 2024 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717520746; x=1718125546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sDI0tJ8DppyAzU+rIXjqFiVbixtM5M79SwvnNdus/w=;
        b=jMl83VNIjSS0rzbvFvQYon87wkIM6UY8ZmZ+6BQ4Ebt7pV9QUbSdrp+gslov+gbWIY
         /q04ki6FXgfgeGHeoMigp6Z5g4ZHHrvmBH2i9ttsCL2DV1nQ8ETN5UmzQfneCKGr/HmB
         Tuo6KWL3cED0wBeyLfig91wLusUbzN8wNIAPx7KW1Wnk32BBQBrtaZq0amptwbxAYhWv
         j1aTfCpOVZwrp/ZHLKlNTR8wCJeJynPmCM/AXX9w1KGVCmS6HTpqMKiZlkwEIFzX5Yh0
         2M3sEgOjHxKOmHqz2QF97h/ytKssMeFREnazeMtkOKhzEzKbQGpf1Du8l4RQqJxxqHiV
         bWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717520746; x=1718125546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sDI0tJ8DppyAzU+rIXjqFiVbixtM5M79SwvnNdus/w=;
        b=TX0nyeM7d1gbmWGzrVFg5rOsrVolXOA/7+iD5RIM/DhBrlF3JxlRiHo+Zv/hT0QI+8
         WzBrH0MZFSAPCDiJ0IXbbh2ZIBy/NysiJ8MaV0+X3jNsloXol0VwBT+F7nRbIdygeUqQ
         hSMP5GMCeD6KG/bd+lBqsZZIW7M0nha9PisxW7Y7iFqK+JNJ9re6gXVPyv/4XjMzj794
         uvQacXjnbXAUdlBlJytldHl+vCZ1r7UHXguc5Fkcutkc5GEP3og2ZIcyieWkSXF87HZL
         eGLHZkP5Aw1oNftuRFrQXvmuWKV4vXOJOx1WnI2DB0OGN/T3KpzgQwMTWjcGPDWUJWx3
         UTxw==
X-Forwarded-Encrypted: i=1; AJvYcCXLu6z1LzbSHyiIq9t1VPEpO8o9uskJ+zVtDkCqEXhZ2HH3W2/a3PHC+xAaJF+wkV5h22m1Rc7t+wTlZElQrldciuELBGLkzv0jad0C3R6SpQpClMXEJwJ35WJlE1BvCvwMxSVhO8X989Q6D27t4w3sjLlbYv9BaMJQuGTB1+WqEClSQw8m1FBjjYH61Mn2U34OLQHN9/NcU7VM95azp3hQhK1YON3DWieW
X-Gm-Message-State: AOJu0Yyt0glSOFoCOVzWpJHtdLulYnM3qI+zTAS0qdE6EbRoDRjg8EIL
	weklE3PeE2ZkAid1bngo4i0eM5sgph7Yel0Y2e9dx/lQQnreutGi
X-Google-Smtp-Source: AGHT+IGzvIZ7p0w249rrtOHCe8cN8FNjczXSU+jc26QrXG9ZEUWD1szVUIWpGeXmkGcgZyb3mZq+gw==
X-Received: by 2002:a05:600c:4695:b0:421:3464:dc7a with SMTP id 5b1f17b1804b1-4215635875bmr1539525e9.39.1717520745333;
        Tue, 04 Jun 2024 10:05:45 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd04c0f2asm12244077f8f.3.2024.06.04.10.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 10:05:44 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 3/5] dt-bindings: serial: renesas,scif: Make 'interrupt-names' property as required
Date: Tue,  4 Jun 2024 18:05:11 +0100
Message-Id: <20240604170513.522631-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

As all the SoCs having multiple interrupts have 'interrupt-names' property
in their respective DTSIs, make 'interrupt-names' property as required
so that we can validate them using dtbs_check.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5
- Included Ack from Conor
- Included RB tag from Geert

v3->v4
- New patch
---
 Documentation/devicetree/bindings/serial/renesas,scif.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/renesas,scif.yaml b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
index a750676064cf..fcead2150874 100644
--- a/Documentation/devicetree/bindings/serial/renesas,scif.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,scif.yaml
@@ -180,6 +180,9 @@ allOf:
           maxItems: 1
 
         interrupt-names: false
+    else:
+      required:
+        - interrupt-names
 
   - if:
       properties:
-- 
2.34.1


