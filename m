Return-Path: <linux-renesas-soc+bounces-4733-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCE88AADD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 13:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF8BDB2117A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Apr 2024 11:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0306581AC3;
	Fri, 19 Apr 2024 11:42:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F182B81725
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Apr 2024 11:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713526948; cv=none; b=Q4s6Fufti7EX6x9WAHr42oXGeL/pbJNvT0yGiO55e2PiPd/gXHbB2NBiehkJ5pgJ2VbxUfzaxhnKQiyzK5CUfT+uy3xqVbkhkiXHL6ytArec3XGMmgNepioglXPc3g/8v1Jj+ibz8aZEnEKRiUvePKEVGi/9wTSmpPeoQkr0GY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713526948; c=relaxed/simple;
	bh=XI1CIY8Uy1ePPx0r2pbVyCDv5z03IxUZnSNpHy8+vBg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JSOIytzTsLTwOwEy3ltDEBNirIzdkNW24/8ZcdLXX2tOcZYOSTNvoaW90Nn7ipMh8q/Yv87L3UpUC5vqbzoUYW0bFJGkMD0El17vlfZq+tv3AsgEoz8V1NYQLGbFsqnd3WDUlsxyJVnb1PCGxHI/Zc3cxf8Y2U3/K94bSogbkus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by laurent.telenet-ops.be with bizsmtp
	id CziF2C0090SSLxL01ziFdR; Fri, 19 Apr 2024 13:42:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxmcb-00DFk9-RF;
	Fri, 19 Apr 2024 13:42:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rxmdD-00GDIk-Au;
	Fri, 19 Apr 2024 13:42:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Thanh Le <thanh.le.xv@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: iommu: renesas,ipmmu-vmsa: add r8a779h0 support
Date: Fri, 19 Apr 2024 13:42:11 +0200
Message-Id: <13643259be4e8a8e30632de622ad7c685dbb7c61.1713526852.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thanh Le <thanh.le.xv@renesas.com>

Document support for the I/O Memory Management Unit (IPMMU) on the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Thanh Le <thanh.le.xv@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Interestingly, the IMSSTR register is documented for R-Car V4M, unlike
for R-Car S4 and R-Car V4H, so the second cell of the renesas,ipmmu-main
property could be added again.
As nothing really uses this register and the associated bit numbers,
I think it is better to keep it simple, and not partially revert commit
b67ab6fb63bbbe6d ("dt-bindings: iommu: renesas, ipmmu-vmsa: Update for
R-Car Gen4").
---
 Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index be90f68c11d18b03..0acaa2bcec0898b2 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -50,6 +50,7 @@ properties:
               - renesas,ipmmu-r8a779a0           # R-Car V3U
               - renesas,ipmmu-r8a779f0           # R-Car S4-8
               - renesas,ipmmu-r8a779g0           # R-Car V4H
+              - renesas,ipmmu-r8a779h0           # R-Car V4M
           - const: renesas,rcar-gen4-ipmmu-vmsa  # R-Car Gen4
 
   reg:
-- 
2.34.1


