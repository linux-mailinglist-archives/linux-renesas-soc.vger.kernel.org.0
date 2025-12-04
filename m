Return-Path: <linux-renesas-soc+bounces-25568-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF5CCA4945
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 04 Dec 2025 17:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79A7C3005539
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Dec 2025 16:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9CA2FE052;
	Thu,  4 Dec 2025 16:41:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E1A1C695;
	Thu,  4 Dec 2025 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764866512; cv=none; b=QP444cyN3XT38Q4Ahjl/swR+4JqxEQvZ7lfC+wMal7o33CvfrOS8ZoWoImwxr0a5dNMiE8P7Fu5g5FEOV5vMv/eBfXTxWEMuWBxbKsQ2AG+9cn+ve23Q2XtfN98EFs3OVWb8CTgg8mzWp6sbOqBgzMunI+89pNi99w6nrwaWQOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764866512; c=relaxed/simple;
	bh=YgsFnZuDSq0GL2hrNLtRnqJd46AcXwGsEsQYq7gDQkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VH6Qza6lThBS+JoFFdge+Z0CIisTKDO9Xj+Zcb+YDfaYiWX8K2FB3jUXiLGTpeCpdwPiG5K5pnn33ZdkKwz+3hAYJWaceGDIXhqVkJXFdrtt3uTMCjDyys1dr8ReEN+GwrPyluHp6t+8je6OSZy4EML3c1FEQYU/ODKy5Pz6EXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: KVCAhgtSRmGwzvxDQx3qkw==
X-CSE-MsgGUID: s5nFJ85EQbW6GP28lobzkQ==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Dec 2025 01:41:49 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.26])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id B7AED4023991;
	Fri,  5 Dec 2025 01:41:40 +0900 (JST)
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
Date: Thu,  4 Dec 2025 17:40:27 +0100
Message-ID: <20251204164028.7321-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
References: <20251204164028.7321-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


