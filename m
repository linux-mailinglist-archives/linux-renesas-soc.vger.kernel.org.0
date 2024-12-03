Return-Path: <linux-renesas-soc+bounces-10827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F4F9E1A05
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47FD62848AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D95A1E2855;
	Tue,  3 Dec 2024 10:55:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0AC1E2842;
	Tue,  3 Dec 2024 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223339; cv=none; b=iR70EdlF0lCBP6vBP7+aRdSqePaL0mv+O8rgCfIaeBkFjv7hSaoVatM5iweJ3OLy3+YP0w0J+zUqB/O8VI4cHREU/KwhxproMBbWvc2mNi3jmDf46AybVgur0WSLoUH1Qa8WyAtLWCplerDEFef3Lb05RS9HutaPhsN2R66mzhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223339; c=relaxed/simple;
	bh=BkS5NGLe+XrlU8Nq40oJSaeQ2ynDfiztyTGzi3onipY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4pHIxIK7wsipytbD2uKaNbAfATlE+cUGFlQpMyGTlax2uH9WwlwT0MGbiaxSGKMGnMvwdTnkLqRgsQy61qNFO/THVgY3fUpoC5ScKbZ+e7CPr+UdOtzHo+QRoBxLYnWTE2Y0bshkAJepyblnEnInw5JpihTx7/6u6cSHEnQfKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Uptgq1wuS3Wh/3rlvYxjLA==
X-CSE-MsgGUID: MrAZ5pN6SBaU77V8JpU+qQ==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754379"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:26 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7D5A4400753A;
	Tue,  3 Dec 2024 19:50:17 +0900 (JST)
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
	Biju Das <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/13] dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
Date: Tue,  3 Dec 2024 10:49:29 +0000
Message-ID: <20241203105005.103927-3-biju.das.jz@bp.renesas.com>
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

Document Renesas RZ/G3E (R9A09G047) SoC variants.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected Ack tag from Conor Dooley
---
 .../devicetree/bindings/soc/renesas/renesas.yaml    | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index b7acb65bdecd..7cc2bb97db13 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -525,6 +525,19 @@ properties:
               - renesas,rzv2mevk2   # RZ/V2M Eval Board v2.0
           - const: renesas,r9a09g011
 
+      - description: RZ/G3E (R9A09G047)
+        items:
+          - enum:
+              - renesas,r9a09g047e58 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
+              - renesas,r9a09g047e57 # Quad Cortex-A55 + Cortex-M33 + Ethos-U55 (15mm BGA)
+              - renesas,r9a09g047e48 # Quad Cortex-A55 + Cortex-M33 (21mm BGA)
+              - renesas,r9a09g047e47 # Quad Cortex-A55 + Cortex-M33 (15mm BGA)
+              - renesas,r9a09g047e38 # Dual Cortex-A55 + Cortex-M33 + Ethos-U55 (21mm BGA)
+              - renesas,r9a09g047e37 # Dual Cortex-A55 + Cortex-M33 + Ethos-U55 (15mm BGA)
+              - renesas,r9a09g047e28 # Dual Cortex-A55 + Cortex-M33 (21mm BGA)
+              - renesas,r9a09g047e27 # Dual Cortex-A55 + Cortex-M33 (15mm BGA)
+          - const: renesas,r9a09g047
+
       - description: RZ/V2H(P) (R9A09G057)
         items:
           - enum:
-- 
2.43.0


