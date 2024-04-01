Return-Path: <linux-renesas-soc+bounces-4191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1598B893708
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Apr 2024 04:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A97F81F21689
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Apr 2024 02:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB4A4A1B;
	Mon,  1 Apr 2024 02:40:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2DA34409;
	Mon,  1 Apr 2024 02:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711939202; cv=none; b=LSsseg0vXPnDPZ1Z+qnanQzKgqQYVEZOwnVnGEYzZ4FCsm7aMYibXIQdFlXS7U6FsfwhZf6jPOCmOz37dvY+vKDa2tFgVsGNWJJcQkrFpnaDxkE8/nKx0DU/9TtCoPIN58px7awYKMrPL0dN4vKsYXsKCAq0DtkWZeioIsR0dtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711939202; c=relaxed/simple;
	bh=dGonVUKvl7liV10e3coRejTBfxj+bpKkbHKvOrjwuug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oisXFU4jqSas4G3I0wFplNoelp+k8vgZ4qQ9H5Dglz7S0xQa9RKkBgKXyQJUi9uLhAXEJn7MA+s6VKZrWII2yeTrl0RjhfkvN4aLqMwpuVGsSJlFjGA6IUeczDvYQeyZA6yiNCpf20hpBqOHPh9VnUQIq5iFq8FpbUHq0m9Nvmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.07,171,1708354800"; 
   d="scan'208";a="199904684"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Apr 2024 11:39:50 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8FC81400A6C3;
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
Subject: [PATCH v3 2/7] dt-bindings: PCI: rcar-gen4-pci-ep: Add R-Car V4H compatible
Date: Mon,  1 Apr 2024 11:39:37 +0900
Message-Id: <20240401023942.134704-3-yoshihiro.shimoda.uh@renesas.com>
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

Document bindings for R-Car V4H (R8A779G0) PCIe endpoint module.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
index fe38f62da066..91b81ac75592 100644
--- a/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
+++ b/Documentation/devicetree/bindings/pci/rcar-gen4-pci-ep.yaml
@@ -16,7 +16,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: renesas,r8a779f0-pcie-ep   # R-Car S4-8
+      - enum:
+          - renesas,r8a779f0-pcie-ep      # R-Car S4-8
+          - renesas,r8a779g0-pcie-ep      # R-Car V4H
       - const: renesas,rcar-gen4-pcie-ep  # R-Car Gen4
 
   reg:
-- 
2.25.1


