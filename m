Return-Path: <linux-renesas-soc+bounces-14093-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE67A54EE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 16:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1874B3AF571
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 15:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EC11FECAD;
	Thu,  6 Mar 2025 15:25:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3D818DF89;
	Thu,  6 Mar 2025 15:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741274744; cv=none; b=XZ7/V1ctCpHali2YzERMsiAcvQK4IyIkDa+OrBjA+K44HPvTTdfv2TmOP3KlWZxsoR3qrrEIphrYccjcVawoXCVTjg0Pe6r4e4+nP6w8uISNw6qoTxG/WB/tNHzzT3qZV99DSOW8pgN0efrh96wRLFRjtbvgQvDFdvYN1rayZqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741274744; c=relaxed/simple;
	bh=BCH6FA6jrYbhkn4cbgHDsudYnot5H6CehRrkZlM/KgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNMDx33LxFuPoWMd0j6hbDI+zIbPVIK6SQBgnQKaWVGp4e28zjeZ8srPjXFS4XWH1fguPMJC40hdkRPsY7E0VPG6v+RBGoD4bNELJ3P3L0iK/9+UUwKbSPT7choP9UKnn2bdxvm4pR5ATWt4CqeN/ar+mXFkr1m/iwv6TNK31lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: Wzwqi6AjTNOWBX2wFXsEqw==
X-CSE-MsgGUID: gyrqW2lCSRaRZ2cUEpLQfQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 00:25:38 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.123])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D3DF84007213;
	Fri,  7 Mar 2025 00:25:35 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/13] dt-bindings: soc: Add Renesas RZ/T2H (R9A09G077) SoC
Date: Thu,  6 Mar 2025 16:24:35 +0100
Message-ID: <20250306152451.2356762-2-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
References: <20250306152451.2356762-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add RZ/T2H (R9A09G077), its variants, and the rt2h-evk evaluation board in
documentation.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v3->v4: none
---
 .../devicetree/bindings/soc/renesas/renesas.yaml       | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 225c0f07ae94..98563a31b5e1 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -554,6 +554,16 @@ properties:
               - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
           - const: renesas,r9a09g057
 
+      - description: RZ/T2H (R9A09G077)
+        items:
+          - enum:
+              - renesas,rzt2h-evk # RZ/T2H Evaluation Board
+          - enum:
+              - renesas,r9a09g077m04 # RZ/T2H with Single Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g077m24 # RZ/T2H with Dual Cortex-A55 + Dual Cortex-R52 - no security
+              - renesas,r9a09g077m44 # RZ/T2H with Quad Cortex-A55 + Dual Cortex-R52 - no security
+          - const: renesas,r9a09g077
+
 additionalProperties: true
 
 ...
-- 
2.43.0


