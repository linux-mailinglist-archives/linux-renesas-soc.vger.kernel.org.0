Return-Path: <linux-renesas-soc+bounces-13576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EE1A42019
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 14:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 626CD1881DD9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2025 13:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EEA424CEF6;
	Mon, 24 Feb 2025 13:13:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1B324BBF4;
	Mon, 24 Feb 2025 13:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740402792; cv=none; b=OQbm7jX9xxbp8LIO/JyhPGlWhsiiGufrTijD4id+zYYResW2Ag1Kwjxwejx+9mrxsPrVqdPJ4h1Mx/qMG66ek7BAGTWutZW/log44wz/kXwZP0ai98mjTH9X6IoZm517K/m3YeLrSyLsK9njaj95KXq5Jq/nBvtq63uJItdH4qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740402792; c=relaxed/simple;
	bh=fWdhaSJdGIl0XV0eqhEFi9g5BEFMVdUmk9HuFD320So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CS54sGNx5rpLsNfgYWTCqNZsKQVFv9+sal6AVLbJdd6otO/ME29Lb7iwbBzMqA310OM5MjZIDMG4/LhSJmEfCkbuw/AwItTNrmlISEHKT8JcqtJW0FCoWrxzEF4iR2dPmiU34yIo3qSpjC5WDkFcahtErDL8JozDize3Vtj97CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: TEcvpLYJRgWLdViYoQZIIA==
X-CSE-MsgGUID: PcojiE80STSyob1HkPFPFw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Feb 2025 22:13:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.231])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2EDC2402EC50;
	Mon, 24 Feb 2025 22:12:59 +0900 (JST)
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
Subject: [PATCH v6 01/12] dt-bindings: interrupt-controller: renesas,rzv2h-icu: Document RZ/G3E SoC
Date: Mon, 24 Feb 2025 13:11:17 +0000
Message-ID: <20250224131253.134199-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
References: <20250224131253.134199-1-biju.das.jz@bp.renesas.com>
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
v5->v6:
 * No change.
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


