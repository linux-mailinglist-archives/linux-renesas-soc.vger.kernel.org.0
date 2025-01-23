Return-Path: <linux-renesas-soc+bounces-12421-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BF0A1A86F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 18:08:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1F3188E06B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 17:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88B620E6F0;
	Thu, 23 Jan 2025 17:05:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D85214A604;
	Thu, 23 Jan 2025 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651939; cv=none; b=IhGWgEsGhRA5D19700Pld/xX4GwjDBb8vdr9ZjyATmjXK+SL4Qwww8ap+hIkVNehaeTN3/4eDpSakYgg3WU9Rb9Fc9zYET6lEmRSeEGvQL8KJj0OLqlSMW8piijs6gYqwARmPynlvem2XEVbWIRi5rve7vsnlwQ3bB3GJQ63DKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651939; c=relaxed/simple;
	bh=UMIFLaqTqaYzo3YLdSYP/S23GYlJ7ZQMTpTbZvEY0TE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dSZOILcHpcH72dKQBcaDwpdfK7hlwQRDiM5Qq9CJObC7zrVFwG136VjSWjwi68CTfK4Di7eKrHSQUUBhJ7pekHO6Dx/EQIKzaSCWnO3Tk/K3cczFzxnrpBFdmDLwFDlwwzwvD0ZQQyY0YRYt7vxLNsq9bUR6676zVqUet5KN51s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: X0CZG3H5Tou9WlDQGwwIYQ==
X-CSE-MsgGUID: vBGZ0ZCpR0yDMGrwej2TIg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jan 2025 02:05:36 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.50])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id D8311402BC0F;
	Fri, 24 Jan 2025 02:05:24 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea.uj@bp.renesas.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com
Subject: [PATCH v4 2/9] dt-bindings: soc: renesas: Add RZ/G3E variant SYS binding
Date: Thu, 23 Jan 2025 18:05:01 +0100
Message-ID: <20250123170508.13578-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
References: <20250123170508.13578-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/G3E (R9A09G047) variant to the existing RZ/V2H System Controller
(SYS) binding as both IPs are compatible.

They however have different SoC IDs, RZ/G3E has VSP control register
compared to RZ/V2H SYS IP. Hence a new compatible string
renesas,r9a09g047-sys introduced to handle these differences.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
Changes:

 - v3 -> v4: No changes
 - v2 -> v3: No changes
 - v1 -> v2: Do not rely on syscon compatible string anymore

Notes:
    v1: Acked-by: Rob Herring (Arm) <robh@kernel.org>
    v1: Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
    v2: Tags dropped due to small changes in compatible property structure.
    v3: Accidentaly dropped Rob's Rb tag
    v4: Restored Rob's Rb tag

 .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index ebbf0c9109ce..e0f7503a9f35 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -22,7 +22,10 @@ description: |
 
 properties:
   compatible:
-    const: renesas,r9a09g057-sys
+    items:
+      - enum:
+          - renesas,r9a09g047-sys # RZ/G3E
+          - renesas,r9a09g057-sys # RZ/V2H
 
   reg:
     maxItems: 1
-- 
2.25.1


