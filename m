Return-Path: <linux-renesas-soc+bounces-11040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C0F9E7AF6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 22:29:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D725F16E342
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 21:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BACB212FAB;
	Fri,  6 Dec 2024 21:26:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9552147EB;
	Fri,  6 Dec 2024 21:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520388; cv=none; b=SzRqF9rcP4eSJg9mu7f/sDlcA+7kdioTOmGi6MVhX2S78gCU8rl9xkAJXsVRVZ3KJ7pw1Tx7E+Uq/InFoyuutGw79qz88FQwHkP/kRO0qpJ0aSzLPq3z2uI3ZkU3lkoCEvRLIdrp4riM6OdSnSO3S4sRIiXHIYPGA/0RTxp+88w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520388; c=relaxed/simple;
	bh=tjaxyPZX7DBC9gxmmMidvjlvsft5H42B8soXY+k+Qu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVs9hoRFWpXCL2Go2PX0SSvRNAGorPp5DDhO2peya8TlQ6OqMES8P3L2PdqXqPqtg/5GEDN94S2POyawi8IPqZxgmzx2DMdZJ5Kb2OSjoJrDTp3lqezQnhq6bfJFTr7Uml9o1qyOzCcppGGaIC24RUIUdQaYco1L94/lX97WFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: B5demF7VQK+DxPA6JmV6aQ==
X-CSE-MsgGUID: AShzcCaeSumTXJSVUfVZxw==
X-IronPort-AV: E=Sophos;i="6.12,214,1728918000"; 
   d="scan'208";a="227147362"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 07 Dec 2024 06:26:18 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.246])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EB62E40913A6;
	Sat,  7 Dec 2024 06:26:08 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: john.madieu@gmail.com,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 1/5] dt-bindings: arm: renesas: Add syscon compatibility to RZ/V2H(P) SYS Controller
Date: Fri,  6 Dec 2024 22:25:55 +0100
Message-ID: <20241206212559.192705-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
References: <20241206212559.192705-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the RZ/V2H system controller binding to include syscon compatibility,
allowing it to be used as a generic system controller.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../bindings/soc/renesas/renesas,r9a09g057-sys.yaml        | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
index ebbf0c9109ce..8e6aa7e44857 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas,r9a09g057-sys.yaml
@@ -22,7 +22,10 @@ description: |
 
 properties:
   compatible:
-    const: renesas,r9a09g057-sys
+    items:
+      - enum:
+          - renesas,r9a09g057-sys # RZ/V2H
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -44,7 +47,7 @@ additionalProperties: false
 examples:
   - |
     sys: system-controller@10430000 {
-        compatible = "renesas,r9a09g057-sys";
+        compatible = "renesas,r9a09g057-sys", "syscon";
         reg = <0x10430000 0x10000>;
         clocks = <&cpg 1>;
         resets = <&cpg 1>;
-- 
2.25.1


