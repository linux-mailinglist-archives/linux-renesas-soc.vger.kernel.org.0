Return-Path: <linux-renesas-soc+bounces-10828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD719E1A06
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7F428434E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203291E285B;
	Tue,  3 Dec 2024 10:55:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F3121E2853;
	Tue,  3 Dec 2024 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223340; cv=none; b=kzHFN7paZ+S0a2KWOJqy4iZ5q6+qHQEnEltQ5o1HNc7aU9+otzO/e14NzHrXMpPqJfWatWV10mFY1R4Ih+TnkRnOY0JTa2bGRX1inK8wGlEV4rE43qRP2hjsCeCs/j7AI0BXTxjpwY/U6b4DW9p1LCdqRxB6SI0k5cCjBTerCow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223340; c=relaxed/simple;
	bh=SaRPBbEw/J0MvD3sGG9Zw9g/JlBMBuJYa5d5CPyRo/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IQTmCPpD2xBUm8Z9Tq5lrxNoEyJpiudkHuCV3HdZ55a/sDxaTrxoutfLkIQOA95ddTyV5D+Cr6l/NS5X0Zz9SsMjHXunV76NYKLia02FlZLuMiYN8nsMskBsWAfXnUevakarvo7YGMn4ogwAAnolr22CWgAujgboZQ90/3U+oGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: /jte91FxSLasgxybh1sA3Q==
X-CSE-MsgGUID: 067r4LIwQwGlC9PXfpXY2g==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754383"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 342654005634;
	Tue,  3 Dec 2024 19:50:20 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 03/13] dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
Date: Tue,  3 Dec 2024 10:49:30 +0000
Message-ID: <20241203105005.103927-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Renesas RZ/G3E SMARC Carrier-II EVK board which is based
on the Renesas RZ/G3E SMARC SoM. The RZ/G3E SMARC Carrier-II EVK
consists of an RZ/G3E SoM module and a SMARC Carrier-II carrier board.
The SoM module sits on top of the carrier board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 7cc2bb97db13..1785142fc8da 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -527,6 +527,10 @@ properties:
 
       - description: RZ/G3E (R9A09G047)
         items:
+          - enum:
+              - renesas,smarc2-evk # RZ SMARC Carrier-II EVK
+          - enum:
+              - renesas,rzg3e-smarcm # RZ/G3E SMARC Module (SoM)
           - enum:
               - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
               - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (15mm BGA)
-- 
2.43.0


