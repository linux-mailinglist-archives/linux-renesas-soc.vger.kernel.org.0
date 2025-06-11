Return-Path: <linux-renesas-soc+bounces-18047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0F7AD4ADA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 08:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF2E317BB42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 06:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2108F227E87;
	Wed, 11 Jun 2025 06:12:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE6F79C0;
	Wed, 11 Jun 2025 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622340; cv=none; b=pi7JsCpmbPo8dJLwGY54oyl6xIejVgHXz9cyyk2gflAoiDFjyYs1Xt5vj+261fcacUo2hYeB3atRlX/WdHWSPxXTMZTCACjRxXBCKKCm2rtktmmuymwumTmyDoT5cGkKKJLZguHH7gDjEybuEfg6jUQRI7DZW2iJcikbVtvVVdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622340; c=relaxed/simple;
	bh=KYZS6ylw0+j3rSwF0uF7DM6S2axrVeGj868QC7LIJOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pu210x95chFwUBCHl4GV20zAtpNbqpSPaac/tp9IE2q7AMicIu2ngW/pMaWkaI0F9Aqvp5r7DPxuw8nYw+dWp0xVWXKEElDsIP1ygJUeirdJKhA09sFlu63iYKVp4Dwt0YlV8OGjeT1QmctuFfpis7/+53Cb7Sl0J1q2Dr6hESE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: lK3HUqeSQ8+0kLLglFpQqQ==
X-CSE-MsgGUID: UCm3em/OQky6/StfTn71zg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2025 15:12:13 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.57])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DA042401BEEC;
	Wed, 11 Jun 2025 15:12:08 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	netdev@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH net-next] dt-bindings: net: renesas-gbeth: Add support for RZ/G3E (R9A09G047) SoC
Date: Wed, 11 Jun 2025 08:12:04 +0200
Message-ID: <20250611061204.15393-1-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
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

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviwed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

This patch is a split of this series [1] that originally added support
for Gigabit Ethernet (GBETH) IPs found on RZ/G3E SoCs. As requested by
Jakub [2], I send this as an individual patch to target net-next.

[1] - https://lore.kernel.org/all/20250604065200.163778-1-john.madieu.xa@bp.renesas.com/
[2] - https://lore.kernel.org/all/20250609083008.0157fe47@kernel.org/

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


