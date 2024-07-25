Return-Path: <linux-renesas-soc+bounces-7512-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A31BB93BFA3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 12:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555AC1F21B8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 10:06:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAFE198A10;
	Thu, 25 Jul 2024 10:05:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFAD197512;
	Thu, 25 Jul 2024 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901959; cv=none; b=bW7H2cQp/Oblh4wY45PpbOB0RMVz09KXH/sWoq+4jY5yA2lhZIEDytITDRyy97v+QBv/wuu6KFyoTG3+opaZXx06VYkSZoaIhaBBvIq87PO9nbdzpR4dJFxrYUuHkz+gNimFj8XuETL2I2kC33Znnj99OUh1a2h5Fb7GegPOOMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901959; c=relaxed/simple;
	bh=zvGJ4Hc1M8WU0s9U2VP0YR0B5R5PrXAe3vuBOtLJkAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YkbuyPFw03orKhRw2iwsA07cGCofHRe25WQy1aQk6L7LEeg7eu6rUPZoc4es6ctXZuVNjKJ0UYBKCYGJoDOuRZ/eAJEBKZmMmTdNRjKLz0sh93svPIRSNxzdiMqAn0vScioIR118CC+wUnsN6o3cmORccpFgYkok7pyxSdSMmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="212750840"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jul 2024 19:05:56 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6453A41F581D;
	Thu, 25 Jul 2024 19:05:50 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH V2 2/6] dt-bindings: power: renesas: Document RZ/G2M v3.0 (r8a774a3) SYSC binding
Date: Thu, 25 Jul 2024 11:05:30 +0100
Message-Id: <20240725100534.5374-3-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SYSC block.
The RZ/G2M v3.0 SYSC is similar to the RZ/G2M v1.x SYSC however, it lacks
the A2VC power area. To handle this difference, introduce
renesas,r8a774a3-sysc compatible.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
v2->v2 resend:
* No change.
v1 resend->v2:
* Updated commit description to reflect why fallback is not
  applicable here.
* Added ack from Rob Herring.
* Retain the tag since the change is trivial.
v1->v1 resend:
* No change.
---
 Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
index e76fb273490f..347571e2545a 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
@@ -25,6 +25,7 @@ properties:
       - renesas,r8a7745-sysc  # RZ/G1E
       - renesas,r8a77470-sysc # RZ/G1C
       - renesas,r8a774a1-sysc # RZ/G2M
+      - renesas,r8a774a3-sysc # RZ/G2M v3.0
       - renesas,r8a774b1-sysc # RZ/G2N
       - renesas,r8a774c0-sysc # RZ/G2E
       - renesas,r8a774e1-sysc # RZ/G2H
-- 
2.34.1


