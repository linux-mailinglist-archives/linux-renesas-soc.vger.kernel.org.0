Return-Path: <linux-renesas-soc+bounces-7444-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC99939F63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 13:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FE341C21F22
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 11:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0213414F130;
	Tue, 23 Jul 2024 11:07:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A2214D29C;
	Tue, 23 Jul 2024 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721732873; cv=none; b=YThZ2cvB5TI4JT0ZK8XsCpMcPeWX7h6sMoiewrbBBt1+6+lFSuZpXhiHd/KsfjUFfBCrZyOA2saG2MaxSbtW4Cv4+1uZV+IAvojg1uIHoBjjalTXhtbkL0X2ZpxAbLexRB9QRpZur2lT2+RH4G5/bM87eYs+ZxQngreBEd5KvBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721732873; c=relaxed/simple;
	bh=um4mqvdEPBqjV6NGmqY6DadJUup7MGb7BobyHMijabA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jI0GSf5GLd7p1HGMd44KXtXrIt9jKW7mrpFVMwHzZIBh4z03uetfDMB+GXWrIgK8dnjLz0AErN4hVpMxjdzo+sIf2jmhMBIRsWxxvIyV3XcJ1e/E3nm5ShYknXqDWB6O6TkCNz8+ubYOmq4KWSCg9UkmQgDNDD6XgKPYGoxFo7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="212373632"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2024 20:07:50 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id EE46342F3F13;
	Tue, 23 Jul 2024 20:07:46 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V1 resend 1/6] dt-bindings: soc: renesas: Document RZ/G2M v3.0 (r8a774a3) SoC
Date: Tue, 23 Jul 2024 12:07:28 +0100
Message-Id: <20240723110733.10988-2-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
References: <20240723110733.10988-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC documentation for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
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


