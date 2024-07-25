Return-Path: <linux-renesas-soc+bounces-7505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B01B93BF6B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 11:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC5211C20F40
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EACF16F8E8;
	Thu, 25 Jul 2024 09:55:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC9E6AD7;
	Thu, 25 Jul 2024 09:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901356; cv=none; b=Hnr5nAMk4R90ae/u2TXlSSsit7TQ0AZJcfpY//EqVjDAwwJgfMZXSvGowwvsQmxSOM7gf6CExG6WQ5vA7UmmE7KUi+8L508VDVyhte9JsjnXaJQ8NnApEy13I/+5zpOoIkr5JArtzk2Cf/sHYbHM+1m6aCUbqFx9+z2nTOjD/5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901356; c=relaxed/simple;
	bh=24z1wmQF1GQN7kqFSosiZDTfNOe+0BdOQ2q3F8VF4YI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oc04iHxbxic4d63huzJzypdpDtNlXwZt2iM17L8sYUSIbPJ7e5wT/djZEaJtsQVh4tn/UQmVWixoU4R6NKzfgMEbshRhM3dTBnv5+EHomriPA5Rv+V8kvwslCwbRiuIVEFV8xajijXA6B5gb+yyyvSe8APjH7TFQvuE+VPwJctg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,235,1716217200"; 
   d="scan'208";a="216707501"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 25 Jul 2024 18:55:53 +0900
Received: from localhost.localdomain (unknown [10.226.93.56])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id F2C824000C79;
	Thu, 25 Jul 2024 18:55:47 +0900 (JST)
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
Date: Thu, 25 Jul 2024 10:55:26 +0100
Message-Id: <20240725095530.5199-3-oliver.rhodes.aj@renesas.com>
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

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SYSC block.
The RZ/G2M v3.0 SYSC is similar to the RZ/G2M v1.x SYSC however, it lacks
the A2VC power area. To handle this difference, introduce
renesas,r8a774a3-sysc compatible.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
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


