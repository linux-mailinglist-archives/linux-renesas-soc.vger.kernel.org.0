Return-Path: <linux-renesas-soc+bounces-17025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F8AB4CD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:34:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6768C1B41931
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 07:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D343F1A5BBC;
	Tue, 13 May 2025 07:34:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3C51E3790
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 May 2025 07:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747121647; cv=none; b=nlXRXZBtcXywvDhZ8zqPsOKoMbpdHIUKwzQ6kkPd8p4gQbkQUnythBCYtwdxNCjrLmefB5gAKG+y0x+xExAZTG3QEcl5HvmE0e+mE6FhSxyD4Kd3r3h990ODrsjvEPfMD+JX+vBovJ9pP/McO0bN7VTWDP5bhk/FE3Fd4vxmLZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747121647; c=relaxed/simple;
	bh=ECQSLHs8DNloR189my8SriGedu+36Q1D621A4mDdlr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sigsvQf/CoXdgEH2rbObJZwdDZPzEWGkVaIuDp6RnUYDYm+Ni0VXjz/FHtrfBdGJp7jrMp4V/92cOW+ensm+EKSkU35sFZogCZbptdFv9YS8vn4x3y8kzWgZGLOOeyj9kWythgEEdwOmFo7Ra4d7iGAARKXWE1tEFjM4OgYsHFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:e731:371c:7707:a2ae])
	by baptiste.telenet-ops.be with cmsmtp
	id oXZx2E00W4HZolA01XZxtQ; Tue, 13 May 2025 09:34:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uEk95-00000001VdU-0En0;
	Tue, 13 May 2025 09:33:57 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uEk9F-00000000AK3-3Pu8;
	Tue, 13 May 2025 09:33:57 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: net: snps,dwmac: Align mdio node in example with bindings
Date: Tue, 13 May 2025 09:33:56 +0200
Message-ID: <308d72c2fe8e575e6e137b99743329c2d53eceea.1747121550.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the bindings, the MDIO subnode should be called "mdio".
Update the example to match this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For dwc-qos-ethernet-4.10, the Linux driver insists on "mdio".
For other devices, the Linux driver does not seem to care, and just
looks for subnodes that are compatible with "snps,dwmac-mdio":
https://elixir.bootlin.com/linux/v6.14.6/source/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c#L302

Lots of DTS files are using "mdio0" (copied from the example?).
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index b525eca5385067d8..90b79283e228b037 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -710,7 +710,7 @@ examples:
             };
         };
 
-        mdio0 {
+        mdio {
             #address-cells = <1>;
             #size-cells = <0>;
             compatible = "snps,dwmac-mdio";
-- 
2.43.0


