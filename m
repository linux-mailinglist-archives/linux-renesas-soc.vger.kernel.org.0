Return-Path: <linux-renesas-soc+bounces-24213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20114C3B168
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 14:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CA6DD506147
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 13:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B18C33030F;
	Thu,  6 Nov 2025 12:56:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4080632F753;
	Thu,  6 Nov 2025 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762433761; cv=none; b=FFl3q/Xb/lUhCoNoaWSJcUINFbI67lj6xCHm8hPKfiYGxiTANFFlvhJ5WVA/LxCTYFTdaTYeOO1quUauPfU0TRX+P+WdnMcW76sc1P39xgpioCPMrJowxbTdMpq7nh843twiuLx5UX9KxsZ1DNpJhAlTiZJ3eu8ENYWAMyJmOso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762433761; c=relaxed/simple;
	bh=QMoa/oRZJb40LO++811SohRkXFZF5YydLKs+awgn4cA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j1w9bqmCWxSO2tw7XIT/0ER/lPkqNMkFWataRg3AC0RPJv5kND0W51lyUtqY4hGAHstOMKh8wF6n6lepinvMzvcxV3ENdBnJS2mw8L6EbtLq0keauvQE0IGBnLvCmfY19qtBvhJHq9aHcwgY0Cu1RYiOSyr3AQjqS4wSuFH6t/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: u3BxgNbQSaW+TXNJr5IKyA==
X-CSE-MsgGUID: 8N6ZCC10Te+bHiuKeHEPlw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Nov 2025 21:55:59 +0900
Received: from [127.0.1.1] (unknown [10.226.78.121])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8EDF44006DE3;
	Thu,  6 Nov 2025 21:55:53 +0900 (JST)
From: Michael Dege <michael.dege@renesas.com>
Date: Thu, 06 Nov 2025 13:55:27 +0100
Subject: [PATCH net-next 03/10] dt-bindings: net:
 renesas,r8a779f0-ether-switch.yaml: add optional property link-pin
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-add_l3_routing-v1-3-dcbb8368ca54@renesas.com>
References: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
In-Reply-To: <20251106-add_l3_routing-v1-0-dcbb8368ca54@renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 Michael Dege <michael.dege@renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762433735; l=754;
 i=michael.dege@renesas.com; s=20251023; h=from:subject:message-id;
 bh=QMoa/oRZJb40LO++811SohRkXFZF5YydLKs+awgn4cA=;
 b=fHI+aZkv/zDDRA4mW3R0SbF2/rn3CsRo4Qvq9HXfRNFUtirxecP4FVdBLOONRNLmuCMeRhTWU
 1Fx+2R8kZACDnZsw2n/poqHU3d+wTq94PWWNxC+ADKwUg0E+b/X9L3M
X-Developer-Key: i=michael.dege@renesas.com; a=ed25519;
 pk=gu1rwIcCrAxNMv2I8fIfiQvt51xzZwnQy4Ua/DscQt8=

Add optional ether-port property link-pin <empty>

Signed-off-by: Michael Dege <michael.dege@renesas.com>
---
 .../devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml
index e933a1e48d67..54cd427d8ae5 100644
--- a/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,r8a779f0-ether-switch.yaml
@@ -126,6 +126,9 @@ properties:
           - phys
           - mdio
 
+	optional:
+	  - link-pin
+
 required:
   - compatible
   - reg

-- 
2.43.0


