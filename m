Return-Path: <linux-renesas-soc+bounces-25212-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D329C8ACA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 17:00:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A297E3B70E6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 15:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D4733C1AE;
	Wed, 26 Nov 2025 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="faU8sh3L"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374FF33BBBA
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172758; cv=none; b=fTI5KRDL8kUOd7cpyaqdZhYmn+vkE0iSznFQJb7mc3yqPtB1XcGuC8lYxut1IfV4KYbFDGPs7IAcFqLLkOZwBneH1E/6GP1TjOyCXpJocqBcSDgFZzkgIIblTRjxO07tAuw6Sqn5COOoW/B5/MpD8CyJJlym/ASpj8YPNkslUKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172758; c=relaxed/simple;
	bh=sBUk2K+LyWxsZ50kZXqzevdzeTfhAWsRwpcwQmtD5xA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9PxQcKj5RiXGCaEIVpBBZreaioFrsj/tx+VXOQx+lIWQI85GRkEjHVEDeknM7jd0b+VMGtX48fNhK8pKre1qBCEEb6qbe62I1x71AkGcTJDLwhxAkL8dfhFgNMR3vIo585kB+bDaLokxh6RV5umg2IuNj3b4EBv9OQdE29bxoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=faU8sh3L; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b2dc17965so6402075f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 07:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172754; x=1764777554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxqp4M5X4tgd8J3YZl7+OJdfIMx5GV6b0qSx7EidnZM=;
        b=faU8sh3LrH0MVhS5dDYQWjGIDqG4B7cZa3R/tAywZnuMbLIJc57FELzUgJNaEQv75o
         sz9tTghyeAtDy4qxjOjCq0uFIBdfg5A9k5skQCtz3pUt8NKzxZY7xFbO+iyv8AdryvXS
         gwC1WIr9h56rXzjq45oPZ+4+3QgFIBON24IbSs9yxMpqtbHH5YkHYhbtql1YxkBDZwIy
         4Bn51naBafwtY/FO2+ROHgCkrOqb+2VeEplV8rIG3UUIIQ43QcCDnflde+v86eqYV5Wj
         F2TfYSZ4cGL2s4trZKBDxz4flqq4mB/V3Cu88i/JhRPftIuOfYM/3gk8cZ7bL3L5yEVU
         UuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172754; x=1764777554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fxqp4M5X4tgd8J3YZl7+OJdfIMx5GV6b0qSx7EidnZM=;
        b=BeSmMvUdZm9cTTzE+Qa5PlB4aWwwfzqXCDzGlYWS3iOMjjp5RlGFgqx8VvclsFg0G1
         6N7oG/cHZcWyHw2IP4MLuVZKCeAAY47YSk7xrkq7FQ7hUt+A872/lYo8jiR13wHTUaE+
         Pp7xuVbixE3WJi11Jv/nFMHYOBjSKMmFZpUlTyggaCF+RhzBN4FIE0ndZg3PWDahRUkj
         pFzC6Tdgi/45t0ayaNZO5J8EsqR0OAE8wC15OCKfrlmNGb4io8u3ixQ7f6GVTWQR7ES/
         T/yFv6kQZLTGGVp75bcB2CvHZNT+tiLuSmZjXf8XZRMJHAbjSVzskksVJfKbgz/Ggf+/
         clig==
X-Forwarded-Encrypted: i=1; AJvYcCWKeeqpDDtwfVr/16my9jjYmM3EscxCyDA90tNP0/5zBnLJjmT82bhCE7CgKCmPaADNdLCzbuJ21MQ0Z2NYBxMDXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9vPe2UCV9egsS8BAyr3r8T65LNae0cLwNler2/6DbN0YkDpu9
	EDjOQ64qJBBHVKiVkdLL7QPmngU/Banq3cpQRu1oBVIGQgDFi4YDbge0
X-Gm-Gg: ASbGncvwqVoH1K+ucHTyBY83zIWZgZY2KZHvkPx5Z7i2KxGJcDTE2/7N8hLi7BkcgLR
	ha1YTTXf5+eMSTsswJzOGyrJbMTQL78HF//9/CekIOrbzGpowEKpg7oaU24ccmBQx/PwQV4XA1M
	u/LXCk/3IalMOGsHFbZFGwhUhYIbvtSp2kFAGT7lDkx55QBUAuBtn99cjcffjoKgo1XEErwGEwR
	U5gnJVyFgrK12s/WaFQZvtWw5fqwsdjOFOKc2Dv5/I4+pU0cWP3grOH0o4zCVen37N5uxDXnpxZ
	C47ezgfp1RXcuYBpg22YWx0gEjJWaXyt9GQN3tHe+e/V0UUSNJ/jcS8YeygVFs+367uYAIY3Bbg
	VyA3SQ3DvsD/l/4mLUO2SoIIjjAPR3ELjtY50iOQbT37t8+eNCF1/5fRtyFTp8ecqdpXB9NDgmw
	sa1IvGgD9RlQppmsvcCh/uXiyj7pGN+cn2FmVmSJo2sX2kX1Bo1LW3yPygFCgzK36ARZu+mXI=
X-Google-Smtp-Source: AGHT+IGsHAyvJKxk7IgZs6cADiBilbwV9eEwOI5jq20QUYAnEsvLcBpBixq8p6RYLJIqdLmoTspabg==
X-Received: by 2002:a05:6000:2410:b0:42b:396e:2817 with SMTP id ffacd0b85a97d-42cc1d199cdmr20649023f8f.40.1764172754101;
        Wed, 26 Nov 2025 07:59:14 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cbd764dbesm38197188f8f.27.2025.11.26.07.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:59:13 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: can: renesas,rcar-canfd: Document renesas,fd-only property
Date: Wed, 26 Nov 2025 15:59:06 +0000
Message-ID: <20251126155911.320563-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251126155911.320563-1-biju.das.jz@bp.renesas.com>
References: <20251126155911.320563-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The CANFD on RZ/{G2L,G3E} and R-Car Gen4 support 3 modes FD-Only mode,
Classical CAN mode and CAN-FD mode. In FD-Only mode, communication in
Classical CAN frame format is disabled. Document renesas,fd-only to handle
this mode. As these SoCs support 3 modes, update the description of
renesas,no-can-fd property and disallow it for R-Car Gen3.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Dropped the node added in example for just testing.
v2->v3:
 * Added check to disallow the usage of both fd-only and no-can-fd.
v1->v2:
 * Added conditional check to disallow fd-only mode for R-Car Gen3.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 38 +++++++++++++++++--
 1 file changed, 35 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index f4ac21c68427..e129bdceef84 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -125,9 +125,17 @@ properties:
   renesas,no-can-fd:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      The controller can operate in either CAN FD only mode (default) or
-      Classical CAN only mode.  The mode is global to all channels.
-      Specify this property to put the controller in Classical CAN only mode.
+      The controller can operate in either CAN-FD mode (default) or FD-Only
+      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode. Specify this
+      property to put the controller in Classical CAN mode.
+
+  renesas,fd-only:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      The CANFD on RZ/{G2L,G3E} and R-Car Gen4 SoCs support 3 modes FD-Only
+      mode, Classical CAN mode and CAN-FD mode (default). In FD-Only mode,
+      communication in Classical CAN frame format is disabled. Specify this
+      property to put the controller in FD-Only mode.
 
   assigned-clocks:
     description:
@@ -267,6 +275,30 @@ allOf:
       patternProperties:
         "^channel[6-7]$": false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rcar-gen3-canfd
+    then:
+      properties:
+        renesas,fd-only: false
+
+  - if:
+      required:
+        - renesas,no-can-fd
+    then:
+      properties:
+        renesas,fd-only: false
+
+  - if:
+      required:
+        - renesas,fd-only
+    then:
+      properties:
+        renesas,no-can-fd: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0


