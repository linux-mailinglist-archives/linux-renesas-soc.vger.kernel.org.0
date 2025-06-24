Return-Path: <linux-renesas-soc+bounces-18659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 640D8AE6D61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 19:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42B903B9A9A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4FDF22DA06;
	Tue, 24 Jun 2025 17:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QSG828Xw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207B81A8F60;
	Tue, 24 Jun 2025 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750785373; cv=none; b=kwksxmBWHqFwUe08yG8a1Wf7ZdwcR0ZDT7wcrX1EtCY5yOOFpdtkRPfwzKo/y2hnAZq9q8SU8EEew6nrhRwOmpvjYKP+L0i7kz57nVuGnECXygKVW+xcNdMcgcv1WWYQ3eYZbKpApzsA/wuR21R3ijzgxRiYE7ygiwYjBsxuZhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750785373; c=relaxed/simple;
	bh=QZ1TcpdPgIFJyAZanFzW8cm4WLnFoJuVELAiMeyoopQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HEN7hcyH92PjFUIOmwRuDXIyhi/1zy8bE4tUn7KSm4nWZbIU6ijDJShVpXkBr8k0ICG5RZrObWfb/7jFqQHQSet/RYk0Usu4SbJtufe3QhraeZIeubjfZtPitbjU7ZZKuXTmQ1d1q+5PxwDNlz7W7Znr+bxWklkwdo06ugcmGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QSG828Xw; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4537deebb01so5851675e9.0;
        Tue, 24 Jun 2025 10:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750785369; x=1751390169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HsR7NJDAwXIG1UDTQq7wzW72HQmPr4b4eMr+oAxOFl0=;
        b=QSG828XwlltrUThQkxgoHzX8Vk4Pa4pHX5/ETXNA0bGBc/YVh+eBEwWpLlguxu6jHD
         QxN8BGttYG2iLF9KdNyjbCw25LKTjm2T6paBKXRq2C/g9uqyg0Z3AQS4pixr+wklZmjO
         bmaL35wXHj9qrdtWEeKtyUEOMKqRwm2/ihkkqK7URZrJO3UHdmsuLUuF/olibNQaoAGu
         FuaYYnlR0QR1ghQ1EAPCN5NNGUG6o7F3B2wIJ5s97kcxLSnmbehhfPxz5p4wJbGOFTcP
         noWSVnaXrPROQsmUWkNW1S0d8P/ODAnhsBSoze2umGYzFrdbru3XZJTcP/+381wU1Npb
         p+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750785369; x=1751390169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsR7NJDAwXIG1UDTQq7wzW72HQmPr4b4eMr+oAxOFl0=;
        b=r5gYg0nqOI0jV3PZvxhxspQHlJGrmouyuDkjEFaq/j9Jd9beIj/BcG2w2jD4fgOWgn
         MbOEsMsduJx1nTiZ7zbW59tFZsq59RhusieQN06zwvDfPnkcWCVbBOVUIbb6DPVbTso8
         3a51j5OErQLFOkVxi28jzASo+THPpxBMmqmcn3/c7DCosR9JyHyEB9un77qqWajXkUH1
         pD/6caucxmNwkE1XgXRKd1JyetfrsEEhwOtvYg0uDglxxEo6bPQX6k/35d1Kwj4UuJmC
         WT65MOmfXAcTueM8xr7iGFsfTiQMa1pGstVsdUBvv7E1v0atXuCS+6EGPADao8Ss+cKK
         y4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCUTu2LSAzZHAfsWrIgH6yvqbJVSk+8V3DqrGJykOOYtRLnxLHXBJPxH/nkHEEUMyXJjX32Ml7LKsjHZ@vger.kernel.org, AJvYcCX/HWOyXqlhAfv7XfsL1OfBLn0VvPSXvO9CYomt7yfjiaKdYXh4/skGKGjNs9VO9bTeq1A7jwz+7op/5zFGDF+YIKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpT78spLNtpJ0+wCHnSUsONJKlEt0urSdvGqeBniSEMu/ldkPm
	R67k9Br6huUjBmEE1pJI/HsQxRHWi1PuwT8bnvVJFUXJt0QY6ZKwq1Nu
X-Gm-Gg: ASbGnctvA84PsCZxQNi3cdvz5lY5zABaMwc3E4u6/AhHtzNc+MMy7L96I5vPlZpuWrq
	/zsOFYGuZ+MDubiKy8TmLl0RcgwFTgyXrkwK/dq1rTCcJSmO52UOmPB3zOxVFAx1ow57MHGKjZt
	ct16G8m87/bdh65XSeezojgF9SFDj1ntcHTGGCxelscfHAINhG/DS4A/a7tDm1buFnuLaqNPRLt
	s4lTJOx6AN2FH+JbkeB1n6f2OnusUfA2rJNTjv42IL1eAkXWX0bgEl7EyBcY7pfnmbjaZufpM3G
	/kTbPJfdCsXw6E+Js15x2lLmINS8JMPeUTakac5AhpkNt8MziAgIFda9aPsuTA4AWHIdLXY2NM8
	KU3vXw3o0EJHGiJM7alKX
X-Google-Smtp-Source: AGHT+IHi7nu6IpK9dIOlmVZ06kuGDTr8M6EYbD6JoMTVVj3VsN5JutQswHRnFATRwnDZUrHT3lbbBA==
X-Received: by 2002:a05:600c:1c88:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-4537e8dd620mr27161145e9.23.1750785369071;
        Tue, 24 Jun 2025 10:16:09 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:a522:16f6:ec97:d332])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2a4csm2433515f8f.65.2025.06.24.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:16:08 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: memory: renesas,rzg3e-xspi: Document RZ/V2H(P) and RZ/V2N support
Date: Tue, 24 Jun 2025 18:16:05 +0100
Message-ID: <20250624171605.469724-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the Expanded Serial Peripheral Interface (xSPI)
controller found on the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N
(R9A09G056) SoCs.

The xSPI hardware block on these SoCs is functionally identical to the
one on the RZ/G3E (R9A09G047) SoC. Therefore, the existing driver can be
reused without modification by using `renesas,r9a09g047-xspi` as a
fallback compatible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/memory-controllers/renesas,rzg3e-xspi.yaml  | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
index 2bfe63ec62dc..7a84f5bb7284 100644
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -23,7 +23,14 @@ allOf:
 
 properties:
   compatible:
-    const: renesas,r9a09g047-xspi  # RZ/G3E
+    oneOf:
+      - const: renesas,r9a09g047-xspi  # RZ/G3E
+
+      - items:
+          - enum:
+              - renesas,r9a09g056-xspi  # RZ/V2N
+              - renesas,r9a09g057-xspi  # RZ/V2H(P)
+          - const: renesas,r9a09g047-xspi
 
   reg:
     items:
-- 
2.49.0


