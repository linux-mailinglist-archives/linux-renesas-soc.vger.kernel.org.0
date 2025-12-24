Return-Path: <linux-renesas-soc+bounces-26107-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 66372CDCF0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E14AA30287E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA592F12AF;
	Wed, 24 Dec 2025 17:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvO7HMN4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BF331A801
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766597615; cv=none; b=FKK/h9IHNbzXUn9OGP85tTQmeFPoIUZjzMahSyt5Yq5l/GdtSesBBYluGhp8VlVGH+r6kvjltM3deWDRedrQwFE5RHUp8cWeuDsLNhsLmHCaDorGybfZ5gpfScEtk6lnNA/jg6XOUfn/D/6AhNYRcR3siTooG0Ns2fWsz7JVQ2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766597615; c=relaxed/simple;
	bh=IAgTrLeU5gkIh7B0wc8d2Q68oYxKfgo1p3dIcb7YgPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CSo/AvOMELIgPNwGHJe2bNkuYHeJto+/Lbet1HERtin8P7/4HZig701/UVAbJ2L0+kJNuzU7vJvlsGKdgmJWz9R1xKReNFSAINCnnQdGeBFZGZmqUrBc5cG7ajAiyXiCldcfkEbj/CmkA864KzyL6VU1QbewD6ydRB/o5QpaNok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvO7HMN4; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4327555464cso295109f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766597612; x=1767202412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYHdy6br3U7djIDtV6khzqRU0Wd/hj8N5uKRz4nab8c=;
        b=EvO7HMN4kxbMShPQyAH34LViX8QiplmQS7P7nu3cc3eeVjUeNlAuuQp2TGtb2S8zf0
         +He5eSiAWIihWcsN/ewf8zNozgncmhRKsc69YpneOkOLKqudaxl5zVhBX55qZEt3BFLr
         VglnVkD/MFhQ8eZa49GvAdcjCkBhr4MgUDxSm+CxMgZTr5QSO+GCeDA9A9jbhxeXrKVy
         gOmGPjA3SMtueYezovljFiBgfLnUMWrLAYd0psffF6CL+Jz84BSzEPesQBsObeWZgUd2
         PlEC/lfDQKGzw+4HwS22uzUWmsVcbFAVlp9H8loes3Yohtq1Ng3KVQiMJ7xYzn0pWgpg
         6kUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766597612; x=1767202412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mYHdy6br3U7djIDtV6khzqRU0Wd/hj8N5uKRz4nab8c=;
        b=wEGBHrZ04H0zifOyoHaBLzePWQlw4HqNQNG70Y5NzrJ5v0sq07diL2sZIDbPI4tN/Y
         GANh6hzgZbO/ThJwZ/B15gJhpqCNc6L7XF+eIuaMvP2PHeBs9uYVbsjn2oMTIXJXsuyu
         H4Ncc/yB9Zw1jPnS16yWBir/xPib45KAWhgBAV4/aiZCV931ChN/h5I15mHGnuKUoLBp
         UPzt44q/+TDdc5SbewxQDl/S/wP6510CIgWyF6tqjdSD16X9aGec3g+Bd4UeP1BERYP5
         1rgU+Njo/YWwtnfiGZVHR1RcPWYyTlHNm1jO58BX/AFKRnQRKifBEdKUhJCM4W2gupBz
         2eTA==
X-Forwarded-Encrypted: i=1; AJvYcCXTeyuSVLkRjSBbVAXyXYRxSVIWZ/8IT/+KKNwpgsuouG4m84SolxtFyt2dwp9zOo7Mstj6ba7ML+ttjhIwWZ1x4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwiKCMim2sa2I5Vv4CmouiU/AU/jjM2vsf+s6TMQEx1pDN12VY
	C1fhTkF33cOTTux9nYueo3Le+9qNx7r0NM51X39FdBT8wWs436TYPg1W
X-Gm-Gg: AY/fxX5M5zmr3aFAq3AwcvXSyA+KjkrrQi8feR7conuONBadIt1wzzDVSCynM1Y7S2W
	nzz8+6zHDp9u2JaWUdjXP19frOzLRBnIoDlh01vxxg5dm5dqqyr+FR8Vh4c5S9MTB4rFAxrWNwC
	sTffaZ4LiTWLqo2Jki2KcGZV/d1f1MJSvfl79IadWWwPD+Ugdamr/+Nn2OtQWwdcusAUc7EQdU0
	qjIQpqUHBd79XBhm0nHqL83ZKNrV9xH/tI0JY2g+RkSQYZNcgpkrMClD0oOnUlLiXHDD3pKeqjp
	H/WJRr449NDKVtMgPYTt9Q5pD4UQydfMhxHB3gSYyyPxpGJ0FhH0WpPcsYQ1tUxjku+rehd3IoB
	lpUD8mFwlWAmf0qRED4xLltNK6ncgkxb6xwBwEeJYzcuicAHgPsNFRxats9Afr/FuGqKRiHEUXB
	njuHNU9e6V2R2W+CTVaTEwhEovYnwauUulrb+o+HvsCf6BLiFwc4eN1/P6cdpibp5OQZMK5P0hp
	5S4s4MxmxRt6PeuOkCFerAK
X-Google-Smtp-Source: AGHT+IERAWfOskT5GxcOrtRD67MA8yPRDgoFhuWWwMLsHw9fE/tK+vLZnfCsAgF5VsZPBdtP2RmbtA==
X-Received: by 2002:a05:6000:1865:b0:42f:b9f6:f118 with SMTP id ffacd0b85a97d-4324e4cc03bmr23099208f8f.15.1766597611844;
        Wed, 24 Dec 2025 09:33:31 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33237553f8f.2.2025.12.24.09.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:33:31 -0800 (PST)
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
Subject: [PATCH 3/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/T2H and RZ/N2H SoCs
Date: Wed, 24 Dec 2025 17:33:23 +0000
Message-ID: <20251224173324.3393675-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
in that AFLPN and CFTML are different, there is no reset line for the IP,
and it only supports two channels.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 393b0a15c7b3..a4c6b2002127 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -50,6 +50,12 @@ properties:
               - renesas,r9a09g057-canfd     # RZ/V2H(P)
           - const: renesas,r9a09g047-canfd
 
+      - const: renesas,r9a09g077-canfd      # RZ/T2H
+
+      - items:
+          - const: renesas,r9a09g087-canfd  # RZ/N2H
+          - const: renesas,r9a09g077-canfd
+
   reg:
     maxItems: 1
 
@@ -166,7 +172,6 @@ required:
   - clocks
   - clock-names
   - power-domains
-  - resets
   - assigned-clocks
   - assigned-clock-rates
   - channel0
@@ -246,11 +251,30 @@ allOf:
       required:
         - reset-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-canfd
+    then:
+      properties:
+        interrupts:
+          maxItems: 8
+
+        interrupt-names:
+          maxItems: 8
+
+        resets: false
+    else:
+      required:
+        - resets
+
   - if:
       properties:
         compatible:
           contains:
             enum:
+              - renesas,r9a09g077-canfd
               - renesas,rcar-gen3-canfd
               - renesas,rzg2l-canfd
     then:
-- 
2.52.0


