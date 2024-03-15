Return-Path: <linux-renesas-soc+bounces-3808-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76DF87CF12
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 15:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 740922826A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 Mar 2024 14:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC83338FB9;
	Fri, 15 Mar 2024 14:36:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D75F37145;
	Fri, 15 Mar 2024 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710513385; cv=none; b=gyWLKb9SHqfsQpyi/amm9wC7Pu8WQZIh0Ya/hB6Yn4RXDlH5hORDUJA9HRZWqNA/NswoGvCQQI+3LVYaI4TpbxzJ41RTWbJC63cTGpDH0XvTFMtS2yfHeGJYdx39Pn2Fxeh2RALUxXScvytePKVY0ouwMEDF0sLB6ksa4nUkPCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710513385; c=relaxed/simple;
	bh=zy9KGCSyKGkFhfSQnDv88uutMsJBfYRH3LuZ0rpvEpQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkDu1CR0ycG+nRqN495gE6ppP13IPqgA7h6KcTgXdRRVUkAf8goycyM/VyrTPVWnixAvhNci1l06qpgra9A6W+89pmj/uVxquwezx8ZshZNM9BgqwYr5jqiTp+kxow5m9mZjmB8yqsRKZIT2J9ueTIB2Y1X0jjWrV7XwB1lj1bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.07,128,1708354800"; 
   d="scan'208";a="197901601"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Mar 2024 23:36:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.102])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 04A98435BA56;
	Fri, 15 Mar 2024 23:36:10 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v19 2/4] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Fri, 15 Mar 2024 14:35:56 +0000
Message-Id: <20240315143558.221340-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240315143558.221340-1-biju.das.jz@bp.renesas.com>
References: <20240315143558.221340-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v18->v19:
 * No change.
v17->v18:
 * No change.
v16->v17:
 * No change.
v15->v16:
 * No change.
v14->v15:
 * No change.
v3->v14:
 * Add Rb tag from Rob.
 * Moved the patch from series[1] to here.
 [1] https://lore.kernel.org/linux-renesas-soc/20221215205843.4074504-1-biju.das.jz@bp.renesas.com/T/#t
v2->v3:
 * Moved minItems/MaxItems one level up.
v1->v2:
 * removed quotes from ref
 * Added maxItems and minItems for renesas,poegs property
 * Added enums for gpt index
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index d9374144d82d..957cf28b2c4c 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <2>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.25.1


