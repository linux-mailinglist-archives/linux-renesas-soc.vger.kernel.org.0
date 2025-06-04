Return-Path: <linux-renesas-soc+bounces-17828-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A915DACD811
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 08:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A939A7A7D46
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 06:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE55623D28A;
	Wed,  4 Jun 2025 06:52:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C75B239E95;
	Wed,  4 Jun 2025 06:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749019958; cv=none; b=bGPwOrZUO6j6wgBJfqpMZHZuKsLXrwcE0hQMdk/MMAcTlcx22/OrQs1jovXzSMYArPk9eJugVQKFowFy6qP3ZaJ5U9mTYnMrM/H3DpTiarf8UTQn/l9i/H0+s7xNElb+yFQXcx41l45BLr13Kj4SekRR57/yNYS4VQC26sRQIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749019958; c=relaxed/simple;
	bh=gFi66agZIDdm3ZebS+y58a886iHwY2RETazs5Y0X29Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs+A2mogU7aN6kQKVVZY5CwaVc/FMTden5CYVP09QqUOdl3OVVuhZN6W5Zn8gpjgD4ZiqLVJy0G0LnfD14aezbSkm5R1e7cgbTJJ36jJY7qw1uKprheuP+auyTDz1vktNdrgFuoIInQI1/jmlaV0lfJ8L/3q36ESJDGYJ6oR3PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: e1IbYxyXSRWc23nuNir5/A==
X-CSE-MsgGUID: ey4rej8xRD6TUcO/6FkNrQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Jun 2025 15:52:33 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.93.1])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 807E0417CC3B;
	Wed,  4 Jun 2025 15:52:28 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: prabhakar.mahadev-lad.rj@bp.renesas.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH 2/4] dt-bindings: net: renesas-gbeth: Add support for RZ/G3E (R9A09G047) SoC
Date: Wed,  4 Jun 2025 08:51:58 +0200
Message-ID: <20250604065200.163778-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
References: <20250604065200.163778-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the GBETH IP found on the Renesas RZ/G3E (R9A09G047) SoC.
The GBETH block on RZ/G3E is equivalent in functionality to the GBETH found on
RZ/V2H(P) (R9A09G057).

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
index c498a9999289..9961253d1d41 100644
--- a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
@@ -14,6 +14,7 @@ select:
     compatible:
       contains:
         enum:
+          - renesas,r9a09g047-gbeth
           - renesas,r9a09g056-gbeth
           - renesas,r9a09g057-gbeth
           - renesas,rzv2h-gbeth
@@ -24,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a09g047-gbeth # RZ/G3E
           - renesas,r9a09g056-gbeth # RZ/V2N
           - renesas,r9a09g057-gbeth # RZ/V2H(P)
       - const: renesas,rzv2h-gbeth
-- 
2.25.1


