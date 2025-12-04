Return-Path: <linux-renesas-soc+bounces-25587-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E649CA5954
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 23:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDC75308C3B0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 22:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB18C2D5C61;
	Thu,  4 Dec 2025 22:03:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from 1.mo583.mail-out.ovh.net (1.mo583.mail-out.ovh.net [188.165.57.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF519F40B
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.57.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764885802; cv=none; b=XFpIwz3oa1iKqn+F/bDI8wnFjO2/V/hLgF/V+AdCpKWCZiz1Lp0lRhqaJSnCD/chzjJTNS851slnVkgJPuQUF3ygSXePyR4Y1+1YBGYYl93kzCQf6mMNdyjgUH68bwdnApvMQ9vYPfM19XkftasPWSUPa8tnQZ1VFqm86GLkN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764885802; c=relaxed/simple;
	bh=YgsFnZuDSq0GL2hrNLtRnqJd46AcXwGsEsQYq7gDQkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKDpCj8m0f0rUbHP9uiwQmcZxIlX58yMgungpNQnaZmyrpF8DypKRleb8rnx3WnLRcTIeyqox+HM5GlSkvs6KQ7LtgZP8kA0+8dfrJiBul5yxV8Kq20f+wfnBBpk5WxDo5TftkWXmDcgF+19TnkF4Xy1l7zqGEUgfJ/HKPrcDlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com; spf=fail smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=188.165.57.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=bp.renesas.com
Received: from director10.ghost.mail-out.ovh.net (unknown [10.110.0.157])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4dMgDY1bRYz6MyC
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 16:38:21 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-m4nfg (unknown [10.111.174.111])
	by director10.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 04E91C0F78;
	Thu,  4 Dec 2025 16:38:18 +0000 (UTC)
Received: from labcsmart.com ([37.59.142.114])
	by ghost-submission-7d8d68f679-m4nfg with ESMTPSA
	id naCeNve4MWmh+AYArq+dVg:T3
	(envelope-from <john.madieu.xa@bp.renesas.com>); Thu, 04 Dec 2025 16:38:18 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S008793e570e-a212-4f79-af68-c8066b7fc938,
                    E90FA267686E4F2ED65044873A5FD8D85CF2A6B0) smtp.auth=john.madieu@labcsmart.com
X-OVh-ClientIp:141.94.163.193
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
	geert+renesas@glider.be
Cc: biju.das.jz@bp.renesas.com,
	claudiu.beznea@tuxon.dev,
	linux@armlinux.org.uk,
	magnus.damm@gmail.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH net-next 2/3] dt-bindings: net: renesas-gbeth: Add port-id property
Date: Thu,  4 Dec 2025 16:37:28 +0000
Message-Id: <20251204163729.3036329-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
References: <20251204163729.3036329-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13329247523704702341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFfgzomgYVINCsQWfkHzincempok0LAkqPTfqkWOu70h/rWd/OLHkT5nVMdqOfm1V1cPe+Q8FyiVSOXnEYWFm5b1kJEWiL088GZ/HV/KRfzkkElGDfzLH83xQsa+V7IHy+u/5O44+Xp+4r3WR19aUQ51JOm3KDMghqLlMEI8SGD+dE3QAQsY/Gdw3VBj8ULhqhdRY7mJ4VmiN4h94amT+IDccD9vf1l9C3DiDbZbxM8gaOLwOe1vvYsxsBNRyvQPqnlnYu9yRbCMQJ2bJVS9cGucryWu4WohPHM5OV21NygH1PwlXpT+fYzgnY7JfSVAoJZMSOyzoyYj5Y1Okx7TA2jJ6EogdZb5rCwLbocTyZlttElGD5sychkmjFIDjjz/XITwx7t2PvE9HJNYkl8lq/9liuBw1QOr49tjiayRX1vA147TgbI+Y64cBq6c7VaXBhe+MIvdM8OSYGUy/RYBymUd81cj7DyeI4V0i0hDdTzenyAorRcJn1rYf5wchyR0WYQYMncQESUN5tpDBz+iuIqchnuJfxCKD/1wRaJI/tezgpktVIZTrFnyk+8LzHGNYpklbvwJzQcNw8rAHciNCMsKmRrjZGhVn/ChS7b4oMYnnvo5Q4fc730Winop7gwnsgTHJOd0THR6A3wwJbK233pabPWIA4xuZMVo2mthgW+ig

Add optional port-id property to identify ethernet ports on RZ/V2H
SoCs. The hardware doesn't provide unique identification registers
for multiple ethernet instances, so this property allows explicit
port identification from the device tree.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 .../bindings/net/renesas,rzv2h-gbeth.yaml     | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
index bd53ab300f500..bb59c6a925d3f 100644
--- a/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,rzv2h-gbeth.yaml
@@ -117,6 +117,23 @@ properties:
           - description: AXI power-on system reset
           - description: AHB reset
 
+  renesas,port-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Optional unique port identifier for this ethernet interface.
+      Used for physical port identification (phys_port_id, phys_port_name).
+      If not specified, the ethernet alias index is used as fallback.
+    minimum: 0
+    maximum: 255
+
+  renesas,port-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Optional custom name for the physical port. Used by
+      ndo_get_phys_port_name() for interface naming.
+      If not specified, "p<N>" format is used where N is the port-id
+      or ethernet alias index.
+
   pcs-handle:
     description:
       phandle pointing to a PCS sub-node compatible with
@@ -230,6 +247,8 @@ examples:
         snps,txpbl = <32>;
         snps,rxpbl = <32>;
         phy-handle = <&phy0>;
+        renesas,port-id = <0>;
+        renesas,port-name = "mgmt";
 
         stmmac_axi_setup: stmmac-axi-config {
             snps,lpi_en;
-- 
2.25.1


