Return-Path: <linux-renesas-soc+bounces-26106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 893E4CDCF05
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 18:33:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3ABA9301B82A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Dec 2025 17:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C53C3233FA;
	Wed, 24 Dec 2025 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AH5eAVkQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7653D30DD35
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 17:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766597614; cv=none; b=ZprFItal94I1S5vyznakW4ybVrGXHiMxHmSGv4CBq5wbVhDH/bXK35iOf3P3IyOwewpfkVkvPFPvwpdixmVOmFzmSp1ZEoTZ6N/uy3exkgmdo68pyf9fwi71LHLiNcNra46AM+rOWpdVtIz/jfyHhkPi8XXTsrjO7pk3rY27nQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766597614; c=relaxed/simple;
	bh=biwc+waTczafG61aaaV8/vWNdTrADi/Xff+npzKS4DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J7Xiu2MTDebqVJYnNeTjIRTWGHVVy70DzDSZBou83XhZA+NKKF1eZO85CaoEJythe8EHZudj9+2Xk7SmDs9dMdPHHpKH+PTi8ZLh1fKeVDKKNVWSFuckkGNTHkLavztk6lZp1xvg6yo4ScOBWR+4xxh6jqFRF9p+pz+vARA7/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AH5eAVkQ; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso59805955e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Dec 2025 09:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766597611; x=1767202411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rO1DWQbDcCKw25L+IPKi/eW3gvZHQ6BcPZc0m3O8u5M=;
        b=AH5eAVkQSgJf2yKPIdT+EtEWJOqzBhYQCuH2QhhVAiZiUCJ0LFTdpV2muVBbq98bHs
         fGyKBaDFAp8ZEvh6uSvyW4PoU+Wz4wJRv5l1CM9NlGrwuqJnk7t5U1WqEQ/g0UeokJr2
         YSakxSajKwnfuEWiX5PngjDKJ3ZKfJCH1TLRG5V9iolgZxhCYRJFiIiz1Oypm/xnx1H3
         i8iX0kr3tDc9rJp2L4I6VdauyR17ltKGlqBtldAWBRGpQofmvft6JuzfjqWGgFr60vLg
         1N2iYKg/ZeoEyL9gGkO4Yxh0TmSwxk3aNk1J+CheHn1+4e9JJj7WCB4+pQkwVk50aSJy
         //xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766597611; x=1767202411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rO1DWQbDcCKw25L+IPKi/eW3gvZHQ6BcPZc0m3O8u5M=;
        b=TtohB2aHkiFeRiyyQiHpfhgQU1POW0Xd1pk0p2iQcg4LTcd5aQ9v3w1/Oi/29C0HX9
         /vqFk3yp02iUJV7JuL51599ctqem01pbcXXwzesKxPoE8Z6mvZy6n5xjC6Rk2L3uX160
         TrMIAlILPvu0JBrZRlQ3fgZ2f3VKKl3ov556BFJoH6JuuPgzj5EYvdSgHOmrQot9p3v+
         ejDwM+T1Db3cFgDQj9NW5Scg1aJ854LKBXdzEUw3kLBZZGd0O4agDIPCsccupSbTkVwk
         hsGkTildDX0YdRNL6qQtjB497u/jWAjM13vLW/Wu3bRxwEv1XpAfCEgtdN43wlhH6U3K
         CwNA==
X-Forwarded-Encrypted: i=1; AJvYcCWUL0bFnVjnd+4FUcWVg/d0NY1d3NENbUVTxQoNt/Bbd+nNTKO9s4oAWVkOhe8WQjP+97jz6/XS/puMdjU7K+neXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQFmgA5352SL++EHM7v1fovhp8Adnqsy73VrUTtrnY78EnMXlt
	6ipRAgiOTvaKa/1Iq+enH9v52Pxr7hVO0InSntYPZ89WNebdV3NVenY/
X-Gm-Gg: AY/fxX6c61ZDdoWwZ3yIbjEDTpa7a5g5iZzdQ5a4mN2QuCrVImpCN02zzuZ0MjTHp0x
	JPYgioqIgTY+Ugs/Ye5upKG7nxi0elreD2o10SZvyms789i4Sxdd63f4PHaYStOxWUyyPWgqrl9
	iZhaWhf3DYFXmPmXs7h/XZDi4jkvhGNoiZGpvcApfSwxYxZ66NpqBFgRsbz5OW3XHweDGw7y4+j
	0VFJOqNdy0arTNUHcpasvxQNCHwfHROSvsaFJTlP9x2m2/jJXuwUwW7CrLkDGLO6MoJE4Bkxbd3
	wBVoA973ZJrpN83R93LKHKILkcjhkhrm8I2Tk+CNExQw5nZm9QvWvts+wbKy5s8vY7wmiLO4zXu
	F5WwpLHB/ugKx7rn0YX555XRhjbQfpnytYicpSrXuy24Q0Lz++5jIbD+EXw1gUy3Mu/217l2zB+
	zNp1tyLu6UcbbT8PNrjwLwwlP7o7uSGlhnbZPRwZl7fMZBoUBClvh3uQ7wZs+NzgLLbgfbdty96
	juqEUR2pRk3DzL97uZ3aOk/
X-Google-Smtp-Source: AGHT+IFQYICYTEeiM1pVNXlzsYjx1yAlvPgwTWBQmCxByGu2qRELn6JVsKCopH1giSEOGeVSvRkIag==
X-Received: by 2002:a05:6000:22c8:b0:431:104:6db2 with SMTP id ffacd0b85a97d-4324e4c7440mr19728193f8f.3.1766597610741;
        Wed, 24 Dec 2025 09:33:30 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:3371:7b65:aaf4:d2e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm33237553f8f.2.2025.12.24.09.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 09:33:30 -0800 (PST)
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
Subject: [PATCH 2/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/V2H(P) and RZ/V2N SoCs
Date: Wed, 24 Dec 2025 17:33:22 +0000
Message-ID: <20251224173324.3393675-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Document CANFD IP found on the Renesas RZ/V2H(P) (R9A09G057) and RZ/V2N
(R9A09G056) SoCs. The CANFD IP on these SoCs are identical to that found
on the RZ/G3E (R9A09G047) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/net/can/renesas,rcar-canfd.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index dab79dffef4b..393b0a15c7b3 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -44,6 +44,12 @@ properties:
 
       - const: renesas,r9a09g047-canfd     # RZ/G3E
 
+      - items:
+          - enum:
+              - renesas,r9a09g056-canfd     # RZ/V2N
+              - renesas,r9a09g057-canfd     # RZ/V2H(P)
+          - const: renesas,r9a09g047-canfd
+
   reg:
     maxItems: 1
 
-- 
2.52.0


