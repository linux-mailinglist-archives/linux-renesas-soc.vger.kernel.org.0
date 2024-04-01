Return-Path: <linux-renesas-soc+bounces-4188-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B085E8936FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Apr 2024 04:40:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4AAFB20DC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Apr 2024 02:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613A21362;
	Mon,  1 Apr 2024 02:40:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6AB385;
	Mon,  1 Apr 2024 02:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939200; cv=none; b=jeFgkO7nCoRypyJpEoXxzQZG88pl1L54KYbl/4TcKxeWY+h3ZWAoYGiTpMNI8gPlt1wd2NdpLZ+KWIEyaBLmqqn2verBDv6a6EWzL/rm7F4Jok0thZzLWdybvbwtdGBu0+balOkIQPzTdvtSYkZuYwsWHld8Ay51Bj8ZXGGiDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939200; c=relaxed/simple;
	bh=QHWTwOOMMPET8PzAlJc3PFCQ9tLxuzBQFNBgnWpopiA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z50UXP9xhYsxpSl2d1ZEgfswBADQV+5NW8qpAjHgLIa+kLG3G56v09PQs5SyDdRFysg680/VsB++CUD8Iz4evo+/NpcqXvxLe2v9ZWEpdDZVrE11kEjOK8wi5AawV9JubzH8wDV3AKhvKKQMliNdkXJ/w2K+BldKcEms5gV89Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.07,171,1708354800"; 
   d="scan'208";a="199904681"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Apr 2024 11:39:50 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 667CE400A6C3;
	Mon,  1 Apr 2024 11:39:50 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org
Cc: marek.vasut+renesas@gmail.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/7] dt-bindings: PCI: rcar-gen4-pci-host: Add R-Car V4H compatible
Date: Mon,  1 Apr 2024 11:39:36 +0900
Message-Id: <20240401023942.134704-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240401023942.134704-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240401023942.134704-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for R-Car V4H (R8A779G0) PCIe host module.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
index ffb34339b637..955c664f1fbb 100644
--- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-host.yaml
@@ -16,7 +16,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: renesas,r8a779f0-pcie   # R-Car S4-8
+      - enum:
+          - renesas,r8a779f0-pcie      # R-Car S4-8
+          - renesas,r8a779g0-pcie      # R-Car V4H
       - const: renesas,rcar-gen4-pcie  # R-Car Gen4
 
   reg:
-- 
2.25.1


