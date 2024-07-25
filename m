Return-Path: <linux-renesas-soc+bounces-7504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E1A93BF69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 11:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18BC6283661
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 09:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F717172BD8;
	Thu, 25 Jul 2024 09:55:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4825C6AD7;
	Thu, 25 Jul 2024 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901350; cv=none; b=B6m0xxuWD7t1Hv9CRLe/K3EOcLW4jI24Anv3TbqtooylVARDyLsEtxt8Mb2TfCQncKb3DU7mGHMCJzFA9UlI6qNZz7thAxfSOMHMYtTzxmhofbc2NBR2RPWe82NjtTIlO4jp7pZvXQjaC3MUIKDjdHunFi0E3o5RZE95knfw3xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901350; c=relaxed/simple;
	bh=Edw7JyHqOGxDtPo5tRO415UtDOPfxkAy3AC/XU7LDlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ykyo5o/3UfBIwl92mW18aogdYDGJz80RYhtk69dQDNsp98sAa6JaRztSjuQXEiNhbZlGSCfzDynWSEz03mrjs/RTKbwlLNJ19CkjvifMRyL0olL5yQXKKH/Z+1zGzgmmlyWjgB3Ld3JL5cEKgl6Te4THpkDqiPEn1CTt+unLs/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="212749103"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jul 2024 18:55:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 76805400618B;
	Thu, 25 Jul 2024 18:55:43 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V2 1/6] dt-bindings: soc: renesas: Document RZ/G2M v3.0 (r8a774a3) SoC
Date: Thu, 25 Jul 2024 10:55:25 +0100
Message-Id: <20240725095530.5199-2-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
References: <20240725095530.5199-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v1 resend->v2:
* Added ack from Rob Herring.
v1->v1 resend: 
* No change.
---
 .../devicetree/bindings/soc/renesas/renesas.yaml     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 09d3ce97efa2..d582992aaf0e 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -127,6 +127,18 @@ properties:
           - const: hoperun,hihope-rzg2m
           - const: renesas,r8a774a1
 
+      - description: RZ/G2M v3.0 (R8A774A3)
+        items:
+          - enum:
+              - hoperun,hihope-rzg2m # HopeRun HiHope RZ/G2M platform
+          - const: renesas,r8a774a3
+
+      - items:
+          - enum:
+              - hoperun,hihope-rzg2-ex # HopeRun expansion board for HiHope RZ/G2 platforms
+          - const: hoperun,hihope-rzg2m
+          - const: renesas,r8a774a3
+
       - description: RZ/G2N (R8A774B1)
         items:
           - enum:
-- 
2.34.1


