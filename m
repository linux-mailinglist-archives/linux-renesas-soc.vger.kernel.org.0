Return-Path: <linux-renesas-soc+bounces-11616-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C0D9F8EC1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:15:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF30B7A228F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53451BEF63;
	Fri, 20 Dec 2024 09:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CZxrJx1I"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94F119F471;
	Fri, 20 Dec 2024 09:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686111; cv=none; b=uhbEpMGS4BtpJqq3dIqqWaaBCnk0K4WFhRYBSAs8/NcJcgGjD42VBSCyiXgrcmfXUmbLeyczIF8xoq8xIVAuo9Ep99KNEZYBjtfU6WQ0Z4vogAiuzhmWY0dFjzrb8x7snlrQtHKzOOB33jLeoE6830na+pVHzXSE3za2a23eraE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686111; c=relaxed/simple;
	bh=fUsTrT2Z7MopoDcDkCKFcEfHJwCx9TfBiX6p2baFEVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXzI5CcNEM6FOjHp7L1ySaAy+KEO+ESTKDSqSmOj9r4VjLLWYqs9gkdt/WZv7vhOcBLYLCLKAm33EzsGVrleOQRg7TO5uupAAnSLxDr3OrFdnVYT0qnBZ6oPC8ON4m3Egmh4eyp8CWnXyHHbKCEUBidx6u5UdJXxAWN3cZPse68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CZxrJx1I; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA439BC0;
	Fri, 20 Dec 2024 10:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734686065;
	bh=fUsTrT2Z7MopoDcDkCKFcEfHJwCx9TfBiX6p2baFEVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CZxrJx1I5G+O5XdWrzuMMRhiJNT5cY3oiZzrxBhSH4I++ua9rbNAwt35NZjFXNQIq
	 0gE6rERRFcJLxXqgb7BYs5+nGFkI/50Fg6c2qogx5sRbe5tugvNCs8tp9qYSWlZ8aU
	 VxyNxqcWjUK8kM14fuNZHm1fzTsPQM+RgPCPa4jg=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 20 Dec 2024 10:14:39 +0100
Subject: [PATCH v4 2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-rcar-v4h-vspx-v4-2-7dc1812585ad@ideasonboard.com>
References: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
In-Reply-To: <20241220-rcar-v4h-vspx-v4-0-7dc1812585ad@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=fUsTrT2Z7MopoDcDkCKFcEfHJwCx9TfBiX6p2baFEVQ=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZTWV0SSSBY6ACPNXX9AKMU0j5tzERmcZrxeiN
 PI4uJnJ9DqJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2U1lQAKCRByNAaPFqFW
 PPnGD/4+PAqWYA+dfmA/PMWMFa/m0wFVsfWnd+2/J1ThhnBl8le4Vx/5NLBwPK3GyvBLudEYBj0
 5UrG+X6+pNT7T4BbVEFnweOG9baC2pNx4X5VENU3WiZ6zo2AJa91+3Us1sOrEQ+xZc72sJBbv39
 6s3F2OJQ5/DXnwWDBxNFkEw+ADzDchDija/7iNbG47xJYUySLpO5olKPUhIO9FTXO/qCP273ZEw
 gGtrZC9li1yy9MT2G75mPqcJpalIsPGMgs2YhPyTGutvMQbzC032zFAsNncs/HXMjYL0fg02ppQ
 NcNl4nrjPzehcdtf8SLnwlCEZbj7lQsgX9FcBS0hiYDyTOOagKqLiFfpV/ODdbo73UEEarV7t2d
 KEq5xxOBwKpc6ocrDrQIxuJuy9Hx1wfL3xiUSVxCvkub5p9ggxbz9JuIl1H+DZAiGXt0+Swm11n
 6+vnKALTIv4RLrPPeMydX5oeaiPAmy40CfaJ9ZBJD0L5nXXMohkQZi9UYptT1Skj4eTGMmZarX4
 pgirYOEQxfaDiyGyKVOLV2MPvs+nt51DCMMnG6Dt1ukq3D0ds9pf6r3KYv06m3mjmU/PW1YlIDH
 tYwT60CleoxKHcVqL2ComPqnxP5fdgbw0PV8ZSkapbe+xh4OUe+z2mRoQBedHzpYN64zfa7LdDt
 Ne/WZ88g4G7AjVA==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the FCPVX instances on R-Car V4H (R8A779G0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
- Place FCPVX in the ISP power domain
v1->v2:
- Re-sort nodes by unit address
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 61c6b8022ffdc3b22444fb13e748b4aaebe454a4..13bc49a535f8655db2af0493779f2756317ec806 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2453,6 +2453,24 @@ port@1 {
 			};
 		};
 
+		fcpvx0: fcp@fedb0000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb0000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1100>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 1100>;
+			iommus = <&ipmmu_vi1 24>;
+		};
+
+		fcpvx1: fcp@fedb8000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfedb8000 0 0x200>;
+			clocks = <&cpg CPG_MOD 1101>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 1101>;
+			iommus = <&ipmmu_vi1 25>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

-- 
2.47.1


