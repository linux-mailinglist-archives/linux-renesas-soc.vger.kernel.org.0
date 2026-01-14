Return-Path: <linux-renesas-soc+bounces-26772-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA72D1FEF1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 16:49:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F0D5302D297
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 15:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 265A73A0E93;
	Wed, 14 Jan 2026 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQay9AKd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1AE3A0B39
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405534; cv=none; b=uLYqNZl2GrAn/gcWx23TrlT34btJ8DenwRw9/ascqG2sQYU9UKecz8zcllz4cQVvx4ePt2isBH+rUIgwPjEA1Edk9SCNlNtwCkY7n+t3USuj9FmLQVB/kcO+VFXp9HTMMfcE01sEVE00Q8D+P17jbrhQB4FTMT0VzTnOO8DT9Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405534; c=relaxed/simple;
	bh=BeaGFvCEUNXGuH6KMXUttkAC8B37iG/MIp121wnhoII=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOox0XVQkqLZT8gXrb6LMNuVnbx36Dv9N8GiAk6+CcZiHPv12U1ja/dKqkKmQrMOhSS1eFM2/ejvqHIG+opcqTTxUc7Z58PLGr3tijs1GtpZbf+C4vvgzc2Eh10BZLAVP8h1sXzCKxsXC64jPoMSLmzikMcCiG2Z8ZtL8JQb6lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQay9AKd; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so66630935e9.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 07:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768405530; x=1769010330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3WgHhzWTacwK5LZn1+KNAfXyou7fks/IWFiJfss6To0=;
        b=eQay9AKdhwXIXEydvBrxGaonobdeMbxwRZYmpAIWtt6ObeZgJgRDZYkWJe2GPc41sV
         3Yg0xV5989ggKt/dREkt8bwQSw8vCAywbimIlaM/aqYNAYH6RQqyrFZBfzXFxVS51RDk
         qpPM2evWqrNt/Ur6cEuQR4971jJprfsKuQ8b3HcweZdGVnuzShfYKQQ2bDjZwqPadTpi
         hRiHLWC8U+Ah1mUtn71UzEcu53nxCBsS4E9whHjw/jOScUZDhVRYjWvBn/rsBJtTAIBj
         +o8h0ty9JrNpUammeCRLw9V8jhZRxoAthxL1YseNrFcCoZ3YjwnyTInLnbSsV/cEJbml
         knKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768405530; x=1769010330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3WgHhzWTacwK5LZn1+KNAfXyou7fks/IWFiJfss6To0=;
        b=Mv52CkrvRhrlrdF6IoZd9cwjzO2zR5IS5a6yfk30/DnvataTC0Pnv7c0i0QDqhbgAa
         nN60CJUXn+gFfu1oNyaTyip6bd+f74GEwZp9+KXXBmf5i6wQOTEvzoQqSdIbaN3U+gH6
         IqhC+ddRDTTvJTGWtjv2VeujCiY2EyPzaK80dxFJ4VkFnM47DbfOfZ1GGkl3ux6ENCJl
         z0nD4gHTbiMFGuNow28sXZraA0XElwRWL6zrdjcbsHXH3Fl/mgUIJ9os7U/ydjhz+U34
         huTSaksz5WvY3c5HQz+7YFghmF7OLZepm9B63xcEL7ua32Obui95l4KfskI0DNlsbsn3
         EVMg==
X-Gm-Message-State: AOJu0Yx0AUtnFnk5HmLnGv+pWlDiteLTk2eB+gjEg4CISSipBRZMHdRm
	LbINfnwGy5FZ+VgTY4us+BJAE1lDJKZT+pMT2C1KMGCJERE1UoUp/mgb
X-Gm-Gg: AY/fxX6k+4KMETZALUbfUzOuAF8HwKv3gBbJoGQaLUGXrVSc6WXQGcXaffk7hecD2qy
	XqV3TBiUtYa8VDnGdOK5+55G5bMgHZnTQziIah2/hFHJXZil8KTI9GD2nqHeQXHXWhmSgIDxXs/
	W0BMy/1X4810IzV+74dHptfwA/OB5gmGyZ52Xp4TtEiTyPk3dITVz7WP8IyQU/IBqDLx/uvIHhO
	RdH9a9zt8BSk/UVIbRxXnilFD5Xz7o2uF5+dmCO5iargdYp6LBLsDhK6xm3VaHbNg1sFY9O/C4Q
	OEwj5vt8jZD4TG7IsL0ZhC2e+ek6qVllrrc05JiuZXWLL1W8h1T4vUCoxm2FtyaCSK4JrGABlj5
	CjXD+jqjZ50G9pHJoaTNITR2ZIEE/MwyAZFeBsOAlHPixY+jjHQaru0qFyOQhxWxntJlnTKnjBE
	EfnpsZv3PmDDoekCObLOnXZmz3sAFh7weUh/06xBRhAZTZLG/9StA8zJCd34lwQ997Lmjp7Jt1I
	gGefDuIQL7o1uu2Sd3V6A4z
X-Received: by 2002:a05:600c:3e8d:b0:47d:6c69:bf28 with SMTP id 5b1f17b1804b1-47ee481cf37mr30807625e9.24.1768405530249;
        Wed, 14 Jan 2026 07:45:30 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:7f20:df14:ac2b:3d74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee544387fsm33867105e9.0.2026.01.14.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:45:29 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 2/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/V2H(P) and RZ/V2N SoCs
Date: Wed, 14 Jan 2026 15:45:23 +0000
Message-ID: <20260114154525.3169992-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260114154525.3169992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
- No changes made.

v2->v3:
- Added Acked-by and Reviewed-by tags.

v1->v2:
- No changes made.
---
 .../devicetree/bindings/net/can/renesas,rcar-canfd.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 9bfd4f44e4d4..fb709cfd26d7 100644
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


