Return-Path: <linux-renesas-soc+bounces-13072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43728A324AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 12:18:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BAB63A1F1A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Feb 2025 11:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD48520A5DD;
	Wed, 12 Feb 2025 11:17:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB6561F2365;
	Wed, 12 Feb 2025 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739359070; cv=none; b=SHqy4/bwSGHGNrfgWbYCEm1f+lE9rrJNMewDXxLk6mPNdq8wReqZnTJlevsWN6GWYPDG2j4MGd3AuA4HhxnQn8kTJiQgUubVoTWL3KCQUpllATqZ7FjJq75Iv6IBYMzg8I+QLr4FnuWzBX/0xxZWMTg9agcF26R4whTMtkjQBeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739359070; c=relaxed/simple;
	bh=aiwZ8oWAMTfB13+j0CWxxs9DddWkHa4KjZz3+SIRYlU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9YQf+vYYElBHzty1peqdrBoNjjOy4C79JVv9NLZmCkIyemTLLbWz/HCUClc6yf1z3acDtQhAUgKjgi4KJNYF6XjYACFi0CC6pBBBuy/M4Z3B7cBNJSnz7yMHcA22BKjZZ7Q1u8yRBRkEA7G1mJmoymRtkZBqT3sJ1PUGOThi0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: LiY0wLY1SxC7V143jjB6Tg==
X-CSE-MsgGUID: kUL3uXcjRcevleL0aKic9g==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 12 Feb 2025 20:12:41 +0900
Received: from localhost.localdomain (unknown [10.226.92.135])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 95777425C955;
	Wed, 12 Feb 2025 20:12:37 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v5 01/12] dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E SoC
Date: Wed, 12 Feb 2025 11:12:10 +0000
Message-ID: <20250212111231.143277-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
References: <20250212111231.143277-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document RZ/G3E (R9A09G047) ICU bindings. The ICU block on the RZ/G3E
SoC is almost identical to the one found on the RZ/V2H SoC, with the
following differences:
 - The TINT register base offset is 0x800 instead of zero.
 - The number of supported GPIO interrupts for TINT selection is 141
   instead of 86.
 - The pin index and TINT selection index are not in the 1:1 map
 - The number of TSSR registers is 16 instead of 8
 - Each TSSR register can program 2 TINTs instead of 4 TINTs

Hence new compatible string "renesas,r9a09g047-icu" is added for RZ/G3E
SoC.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Updated typo in commit description offset->base offset.
 * Update typo 15->16 for the number of TSSR registers in RZ/G3E
 * Collected tags.
v2->v3:
 * No change.
v1->v2:
 * Collected tags.
---
 .../bindings/interrupt-controller/renesas,rzv2h-icu.yaml    | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
index d7ef4f1323a7..3f99c8645767 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/interrupt-controller/renesas,rzv2h-icu.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/V2H(P) Interrupt Control Unit
+title: Renesas RZ/{G3E,V2H(P)} Interrupt Control Unit
 
 maintainers:
   - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: renesas,r9a09g057-icu # RZ/V2H(P)
+    enum:
+      - renesas,r9a09g047-icu # RZ/G3E
+      - renesas,r9a09g057-icu # RZ/V2H(P)
 
   '#interrupt-cells':
     description: The first cell is the SPI number of the NMI or the
-- 
2.43.0


