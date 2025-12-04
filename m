Return-Path: <linux-renesas-soc+bounces-25565-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73773CA48EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 17:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72F0F3011B23
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B942FD1D6;
	Thu,  4 Dec 2025 16:40:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from 7.mo581.mail-out.ovh.net (7.mo581.mail-out.ovh.net [46.105.43.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AA9346E50
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 16:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.43.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866440; cv=none; b=TWH6nvEa2DggrQ9ijbQ9q/JAlDHn1uxPPKDQdpQ/k6dhoKoYF6Gt+QCxP4dmxbSW+PmFq+/62tSnDJ0Lz44P2LGrTo2RVFd1T5wOfe8pXb61B3i/80ZgHe4VwpSke+FxzFkSn7d3ez2dar/4YZzkbNbPXX1iyij97sdyDn5uHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866440; c=relaxed/simple;
	bh=YgsFnZuDSq0GL2hrNLtRnqJd46AcXwGsEsQYq7gDQkc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dx+OXZVe0TwUuYSi3e+dLxNqZ0tZ4fln/UtCSz2eyhFH6PVZJ2k7ukgYeDvCv6OF/AG71kLeVJIlMlLGZoGo+cOKGISF79Gl0EBYOwpUPsP9+awhg0oz9CYHQihArpM5KQc3db1dbhNEu+AelWa9x+yixcVVonL/51/iAshhle4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com; spf=fail smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=46.105.43.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=bp.renesas.com
Received: from director6.ghost.mail-out.ovh.net (unknown [10.109.254.91])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 4dMg4l5hJNz6T2T
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Dec 2025 16:31:35 +0000 (UTC)
Received: from ghost-submission-7d8d68f679-mkpf7 (unknown [10.111.182.250])
	by director6.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 965B3802FB;
	Thu,  4 Dec 2025 16:31:34 +0000 (UTC)
Received: from labcsmart.com ([37.59.142.99])
	by ghost-submission-7d8d68f679-mkpf7 with ESMTPSA
	id GduLDmO3MWnQjQQATXHgnQ:T3
	(envelope-from <john.madieu.xa@bp.renesas.com>); Thu, 04 Dec 2025 16:31:34 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-99G003460cefc4-7799-47b2-966c-ddc2d12940b4,
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
Date: Thu,  4 Dec 2025 16:31:21 +0000
Message-Id: <20251204163122.3032995-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251204163122.3032995-1-john.madieu.xa@bp.renesas.com>
References: <20251204163122.3032995-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13215531634329355653
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFEGK2N2myt6To4lF0zpgRRy/gXzl74WEUzGt3DXEB6g7BZnOj3eP0eDHaST7e5QJeICzCbEkb3gGfs6YZYfIJcwArB7EU3IrdyXmfO8Qxzzag3oJFdIMWm0JQZ1CqmpOHdayN9WWtNQysxP4obz4OBqkfUqMtKmm6n5jiN7Tk+mPIeKKAlg42TskEh+Cds6GrmAWWJ7L7rRywyHE1orOTKM0zayHlTPGElK7/kdD9UbFmcfJcEko8JQ2yT1qhxKUZzVNo2xTgaRem/sY3/7WDDakQIjJWet8IffjZbEmfGqSQxfZZkEcGGS7XHF93ud+9hU6Ebfzh0zCguIq2O8SA/g4KWoDQDG8Y18QbSy3QYNCaTxPXe7lfUc++1qGyyP3A0Ngh2J2W1apNCBmiuKSBcXPwsoGg7EiKnCVByUuhU/MWeeLgtdTJgsDfq3fy5+TCa4ERuH5NxBJGbsKq0KgF/KOjPW4fan1LGn6x1qqUuIHKBv4qBNxb9RSsoKtr+MxEdaUhPQFGThEna5QtIZzQUS6njEO71ssRwxNATG/sH98J2odMlnb8tg9tHrMZuqtEdLpLiX5+QW94zc9fBXJFrf0jAedIm7v60gCmH+Ek0UlBCCyTIfOBjoC8N2rDnMn8qrFI7z7x2KOcpUOw5Ydz83sD3J5Yo+Li90+H8wP/kzQ

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


