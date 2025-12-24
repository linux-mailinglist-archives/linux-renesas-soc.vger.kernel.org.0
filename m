Return-Path: <linux-renesas-soc+bounces-26105-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0CECDCEFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:33:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F09433025301
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5049B31987D;
	Wed, 24 Dec 2025 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j9lJFDRY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896EE294A10
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766597613; cv=none; b=eMJDBEWhW1/nAsSkJHz1+jBq7JyB4uUf18bo7SMFsfVisWTKV/2/InuV7wMHVGHjIjuCUVGgxcQDh39DHuOqOyDcuBjW+78xrqeu8dYy7krr4L5MnRlyzb/dEjSJj3SXGRNLPZ2Puddoeh8H0AfI2Q9QDw+crhgXejD3sRhM8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766597613; c=relaxed/simple;
	bh=2cCd22upSW/KmRBE8hQQ25UsubWS3S0H6lX6K/nhVNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s+ycEMn+KdUlut88aIM9//V3CgNPD2VGwPQEyhfhZWIGGYGjhZYEW3VSUfO0Qda7rC8DGxYGny+UPp5eV7Ngzt73wM0LhwOPw09LEoTPKqM94Nq5ClxmXVaZx+UrZVz0R3UhGiWVbAWNTxpRKVWyE3vuVpKOPBjuJy3l5dVz5r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j9lJFDRY; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430f9ffd4e8so3367308f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766597610; x=1767202410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jL+U/H2FA4I8JmtU1VFqn2gDXH0xURV9q9TTs1K583U=;
        b=j9lJFDRY6WGfpzoSn1J4eTq8BmqupqbseSS3cq7um55JG00P+F4xAMpwyUpuGZTbHW
         CQUcEcrFiGmSKMzll88YngHR4dAelxF7/Wvoamr5l1LC1mAVjHo7TpyvLwGJk9yu5oZE
         UrWpCv+wo2mWSVqAHxtplisTTtJo68Tp4wVz03vQ2+euyBxRo2HsAS/tFmU6dHm+hYp0
         wFcvPkXz18XgvQaj+IrrKuhaZpaD/pJt5JjK/I3pff6e6L6Eld1lY7L3Mk4O/lCEhu1E
         MF2BxkMBdXTBA7B91U7JzhWjswYmBRlECcuwsIDW2YZt5T8SDz/CVlzCT2/KLdVzA4c1
         Mt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766597610; x=1767202410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jL+U/H2FA4I8JmtU1VFqn2gDXH0xURV9q9TTs1K583U=;
        b=G7M5vjtdFreBmfSzdpnyWlPVMNqHWhsP5Ih6PGLGqmZB9cpjZNGjfFUcAh4w0VoB/m
         ZM3cvkeQ4zWTkGRmnTH3Qw2VZ7iLr/whLPt4Xem5wF5nGhkIDZhdCx9HlWrOxomtQKRy
         70+uaa2rl5E8+Grwry8X/UADe2gmIZX+5qp9RRRo6z0SLXlpBGgyb4u9GxulrinEtPLc
         rzoyYfzAwUNW57hAJ6EX5B7AXcDit9rUcZs2HlJGHdMXCXFFbgwaEDfUTk8HSXRqBn+Q
         jXx9BzmE3Kr7DDHzNEfFXZPmg7T/r2W6RIGp613QkbUDOoMo7straErFxfVK6THNnEYs
         h/Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWtq8w7FS+EnsV5rVw3zE8cL2cq3YW7TXHlt90ozsza0MdiZ+CEKdjUkDzCuAGr2NYZDCOfLmiYL8wrmSUVh1tWcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyist1GHHDvV7VpSMEw5j7/UO6lHHsfaCOz9xMMYQfKiVXNf457
	p200W03x6FlpXHbODym1qnwxe27Hr6KLro5BExG4GgLY8PU4Nuea8mlO
X-Gm-Gg: AY/fxX6+f8mJn1YVwNkyXF8ss5jCRr01lQhLgfYhHn+TfmnhPlFwaZ4MA9I4qxB0098
	9GeBylPaBVxW7l0RK4nL2R7Pa0Vc4egIf2b5vUSsek+oyXNs0UGnXsSxGkXJLxTCC1tiplr2ELW
	+LjmqyaoF1PVnJDZwHdlz9LrUP0yoYix1VWC8sRqZcqGA67mkBk0kHELygUA5HnYlGL1AgdtGD/
	saZxAG+ZJOQE/naX9GP3J/ZKZHH+4nOKw7m1dogQlkVyiDF0DmiyO8HSUVz5utsEeXQdGaitrA9
	j3H6EWXmxyGg81bKnqkoB48SYJl8ULsZnh7xQSPKyW0ER3dVG5xBfa5hcyTDS6ZuxluPknpM3KQ
	JpjXTdh3EcTP+SbB+XIya5TiWRyEcHrShSJmpqEQ5jEbr/ZtD/vQEBAL+u/je3Ksx4JbIu+Fe0e
	IWoubUhlkUusy8qBy6xOP0w7C5qXqvYcSlSnZB8OC797AIGmDKo3mGI3bR8im/PLqFdVsqVvLB1
	teCZGuvU0KBMh6gjS1lXR/1
X-Google-Smtp-Source: AGHT+IGtuKI5qFtb6bVvEi5z5XQ8k2RY7CgH49pTzGJ37hLsQLej8EohaIgmffXocttMVOc2pcKR5g==
X-Received: by 2002:a05:6000:400b:b0:425:7e33:b4a9 with SMTP id ffacd0b85a97d-4324e370c67mr23635694f8f.0.1766597609763;
        Wed, 24 Dec 2025 09:33:29 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33237553f8f.2.2025.12.24.09.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:33:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] dt-bindings: can: renesas,rcar-canfd: Specify reset-names
Date: Wed, 24 Dec 2025 17:33:21 +0000
Message-ID: <20251224173324.3393675-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251224173324.3393675-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251224173324.3393675-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Specify the expected reset-names for the Renesas CAN-FD controller on
RZ/G2L and RZ/G3E SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/can/renesas,rcar-canfd.yaml           | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index f4ac21c68427..dab79dffef4b 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -188,8 +188,9 @@ allOf:
           maxItems: 2
 
         reset-names:
-          minItems: 2
-          maxItems: 2
+          items:
+            - const: rstp_n
+            - const: rstc_n
 
       required:
         - reset-names
@@ -232,8 +233,9 @@ allOf:
           maxItems: 2
 
         reset-names:
-          minItems: 2
-          maxItems: 2
+          items:
+            - const: rstp_n
+            - const: rstc_n
 
       required:
         - reset-names
-- 
2.52.0


