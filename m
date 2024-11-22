Return-Path: <linux-renesas-soc+bounces-10663-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D8A9D5F16
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DD1E1F220AB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A901DF250;
	Fri, 22 Nov 2024 12:46:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3B8800;
	Fri, 22 Nov 2024 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279583; cv=none; b=Q4swVT6eADsmnjJpnKiblyQaBPFbHx9rSbEkfjQYHyC9xHX5iuP5TqXHUYU7ubrRpSLITmOFkrzIc1Z+6aemEnf/VgmjZiXXlh7+5mPBSOCXiAE9nWELJvdvct/z/Dow0tCDnmKHvU8JdBTpLFfy59mOsLIg7gjpcdNfnkoltNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279583; c=relaxed/simple;
	bh=3jfMjTowWC6zFBJWKcGP+O+KnJLTl+M1GWlygnX+oxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xy9TvyRN5bmXhucMisnRfqIfsRxM1xJNuazaXWKUznZ2n7GJ0UtVo2PPE+gegaEyT+zAB3ZM9cYAtaoS4EAaPBW25NddK38uQxf1I1zzW0f2QfzFwZZI59vlBR0L1LKXHzga+Jnec/cGdSR0Afb3ZGUSmY813ftrlJWt/RUFp6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: BPUbWp5BSUWkRWG8c6UyEA==
X-CSE-MsgGUID: uqnoRtHYSQK7pZMxG7V1XQ==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="229765855"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9CD39423A742;
	Fri, 22 Nov 2024 21:46:10 +0900 (JST)
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
Subject: [PATCH 02/12] dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
Date: Fri, 22 Nov 2024 12:45:38 +0000
Message-ID: <20241122124558.149827-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Renesas RZ/G3E (R9A09G047) SoC variants.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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


