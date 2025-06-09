Return-Path: <linux-renesas-soc+bounces-17982-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1730DAD26A8
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 21:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D74E31886505
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 19:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DD721C18C;
	Mon,  9 Jun 2025 19:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRMah0rw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFF19258E;
	Mon,  9 Jun 2025 19:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497034; cv=none; b=stDXh0LPDDJx4CxKaq2/D0S8ra4eFwCoNw5vQLxyzrVB2nr7AqV6ll4xFPKVcZUw460mKGqIigqjWf4cru2oN5CJC6nDizdwRj68A4r+H8uWav4nLjHs/OIy5k2Li77wwCTap+Na1Gy9U+Opt/I2T+LmuPNiF02h+oj8kMxqrLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497034; c=relaxed/simple;
	bh=AbQYkT7CdMUdntdjXLRc8xTX3MDCPW0NlQFSGoYY+WA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GyB52/ermVK5fZ7N+t7/F+QYLiXbzRx7rTxuofyoYoHbz9YYIilp7C8ihuUA++KdF+GS8dQzCu8IvLYFPHRYHQ4zfgKZtIHtdZBC8ZeebuSDpKcEY1OzbHIY4CmkXUeU48Ici9+9p3DERYIxTX2dzVq0/mnlLlMNb2DFy1up93g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRMah0rw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso29472075e9.1;
        Mon, 09 Jun 2025 12:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749497031; x=1750101831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8m2SIKgEeh11NXiSgiEtvpyuW0o22vDjLrJzj6QvLlw=;
        b=lRMah0rwUpBIUQfDSUGZxtFQdLmYjcFnZ7o7PK0z4zVZIeoagCXX89lHZuKMRnHsJc
         A8LCJXrE1+UyO3dAGNa8F29z63i7C0VZFUkK+GXSsB0aoeDa/mDTUA/TfIgmBw77F/hz
         M+b2F6zQ7DnyI3IxaJ1vkJs4q/Xs2fepGmHqykqn6MC3NU463g5FFX6M20HvuoJHGVph
         8Um0CvnikfnG6h9QMwGAJW4wPNEo/UKjlLCQycIPOJ/H/TfPVh97IXMchhm+yb4n7naH
         euKV3IwSEwK1Y847v330wbw3U52SjglRWC5IXXCe9adrXbAZlwxUotrLdYTLcBQYmfgm
         my3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749497031; x=1750101831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8m2SIKgEeh11NXiSgiEtvpyuW0o22vDjLrJzj6QvLlw=;
        b=DID97WS8jiMZEZdzT7LbDBHTpnHyV4TY74EqC7tRy0oUAld2JsydI0kUVtXhKG5Myf
         yV8ThBaau2oAeQK0qdQ3ojzZcrbZ1j/RD2mh8wolIszre6I7yfTfn2by69nFZlbkdd/H
         MQYcUMrEahpnt5SMhoGUnhUc6voy4xMLMZayq0KCPhmdNemIcCKLjWQPtctd6WFyKU3q
         8mp7kUWOiFYmWLJ2fMA9EADy7Omam0MKUDOJ6igJAlVmjiJyD6Rd1Cm6R2XMPCVoEhtl
         kCA2zGaRT5SzlEbSdVht58n8L4IRi1sdooEGoexQZFqPYdRXWj8Mj1ZlQrQrcjlCwpI4
         9WxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmLSHyT7FMf66DeQzF7pkmgoU0qz7RctdCRT+TTaA5x+c0ga+rgmw4uo/BjTOMUYfVrVjgVvOYtj8XHkjd@vger.kernel.org, AJvYcCVPscCvFi8ikqG/GF6Oj3PgtMBRIdpmhpEXLzJ83XtL2GFi++bYDzL+/X8RAKSdYkN/BV7rQ30R9bYlsTPZuOKUJKE=@vger.kernel.org, AJvYcCXj6KUJCeoHEaBGpVYqT/LTro27r0ARaumMUh5nU6//Gxsnvs2o+xNrpGq7Cg8pxbkWr6pcQzA9t5rF@vger.kernel.org
X-Gm-Message-State: AOJu0YwEmdLhzXwij1SBpCI5Z8+hHJqWuiRaryjSS/b306LBsEXc7OlH
	jNTk3jEOCkZCzt4DnGu0K1EO4cbTBMP+mgas6WUXejkFToS4EL9WDm1A
X-Gm-Gg: ASbGnctoEM19HHy4ALJtSWH/kUP5/L07JgzAWb9eBwaX2/+df3XtWvAvGlRl/V9Belh
	wo9MNFRhJxY0caAkOLIC2ny8ZEHx1PQsYUM3Q2o27w34aH+U49rWh8CKOBytcBWonsi4ICkBnjI
	2rIa8C6wyiqH3dC7vcLLv9mvO5kR5bU95PJapg3Q0FlJ6ywucYwBCsnEVIUXlGVZ6/GsJiq7lNi
	yClFrNmkbaa77ty7/5DJ9KrCZ2axI4dRrHX0LwVCIz0qxa+4mRubM+HSMw2gjhbxl+6UP3R5GpL
	TsaqZWI7mN9JnVN85jb0IVMHzWvaPM4x3GRU+IW4+232//XpTNu4NaEt7fL4cYRSEPGOaTVeypQ
	FFLWmJG09
X-Google-Smtp-Source: AGHT+IH2c2VCeRIAR5Qjq3rtO0ssmIvCuMnonfmD9bjdjUBx45jnBpYNKx/oyk2iVPxBCk+tKfAQ9A==
X-Received: by 2002:a05:600c:a49:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-452014165a9mr138219205e9.13.1749497030717;
        Mon, 09 Jun 2025 12:23:50 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e158a19sm117639055e9.12.2025.06.09.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 12:23:50 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: serial: renesas,rsci: Document RZ/N2H support
Date: Mon,  9 Jun 2025 20:23:44 +0100
Message-ID: <20250609192344.293317-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add documentation for the serial communication interface (RSCI) found on
the Renesas RZ/N2H (R9A09G087) SoC. The RSCI IP on this SoC is identical
to that on the RZ/T2H (R9A09G077) SoC. Therefore, "renesas,r9a09g077-rsci"
is used as a fallback compatible string for RZ/N2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/serial/renesas,rsci.yaml          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 1bf255407df0..f20de85d5304 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -15,7 +15,13 @@ allOf:
 
 properties:
   compatible:
-    const: renesas,r9a09g077-rsci      # RZ/T2H
+    oneOf:
+      - items:
+          - const: renesas,r9a09g087-rsci # RZ/N2H
+          - const: renesas,r9a09g077-rsci # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g077-rsci # RZ/T2H
 
   reg:
     maxItems: 1
-- 
2.49.0


