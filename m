Return-Path: <linux-renesas-soc+bounces-11617-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354F9F8EC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 10:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DBA916621C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2024 09:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D971C173F;
	Fri, 20 Dec 2024 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J600pIkA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C017A586;
	Fri, 20 Dec 2024 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734686115; cv=none; b=r/5QhHZ5p2pcJlbySkmXaOUh/E2Ns6xGaLYX64EkhV3lBYK09BElLbWpaSmu/yHopWjmkaHyVqcYyfdYbsf2EsDcg3pGHKXygl/QeytmDxCcICNpk+xlR/0bksajcWyhxMc4Pvqn/zCfKXhPvFynYRjXehtiN9mUelDEhCQ6XHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734686115; c=relaxed/simple;
	bh=E6vaocoSUG7H31Unn/d+CgzkmWBWqP5e63DYvB3I50Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RkpiYRbG6wv6FUeysqL668DE22xpNFePrXVQOcztL2H+i8V8eGDo+JkPVGsuTqbaH741RWJkaoZMxroP225enV5m53NiPbrUePGOfKsem655etqLffb68YrZxmsUutILDQhdXToCwogW5NPgwpZtLDSmCVCM+AiMpKqTzaE1DUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J600pIkA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 84F111063;
	Fri, 20 Dec 2024 10:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734686067;
	bh=E6vaocoSUG7H31Unn/d+CgzkmWBWqP5e63DYvB3I50Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J600pIkAGhBquCyzWJ+uasv+YrywEi3+Ob0jWk8+0Qf4nWP0zWuxLoo1AUtIVgKjo
	 /YGUIHX0a9X6Osh4N3ILbt5WMp8OUR0CFBTQPiORHazPl3wuBpgYG0ARPrSJpAvs5T
	 27RCPBf9/xiCwblWUJCpL5mT9tBtJu7dTpEvuzxQ=
From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Date: Fri, 20 Dec 2024 10:14:41 +0100
Subject: [PATCH v4 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-rcar-v4h-vspx-v4-4-7dc1812585ad@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=jacopo.mondi+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=E6vaocoSUG7H31Unn/d+CgzkmWBWqP5e63DYvB3I50Y=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZTWVR0LoPzjC7OwVcGcWD0ZzgQdgvbIVP3wfj
 XFrmBneg2uJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2U1lQAKCRByNAaPFqFW
 PMvZD/9pjqnaddfrEB+x4iouZKU3oThtUrRzRy2eruW//+1wMQxGaVoixOIX8cH4WZzD7KVfJ6F
 1iomuVJ1dVRc37HWxggWIFAibrE06dPytHkWKE1fuGFVB+nAGCV2k28xqCDs3D0wN+cHl516Q9o
 znb7Zn56pxEQFyIDd7HreR/8njxB5945YGrNIQ3ax3JrI1AEbN9kTXbEQIzMze5lKBLrc9TQSwx
 UORoDlqsBwXpUbAJ2nZDMATm+MP1/qKcPjVWyb8vc6rDCippHxT2qD347s5Rxh9CQo6R9B4Xee1
 hYcenFDNxGEn5Wt/S/BaYCE/UXrWRr3+pIkMIaImpH2qFjADN8Yvz4RI691cdL4xcjHSbe0mMZZ
 fLBhMjE0TEZtVQiOp5SaSyyiiptlvttORX7F9o7WAuUjq7j+aNuutjSmhJBnfplo3w2FAAYXUmL
 4rqd/em3Z1Q7wtEKVjJjjas+lQG5QBTYWlIHlIPoHlgdq1vkQE+9kVOIWXOr/OoQePgrJi/eQFI
 cqvErL7PJvE/uiCR3qU97+4+vOG3TEYF8GmnN3uYmUG2QkPSBcY5238+yBBNzE+JykGicYsE7iM
 Qa0/RMzcGdXLTF9iyEcKaZbpMjYZnC4GpiHy29xQHCfqCk1bINQlLu92mWyqlzYN03nhuytLLxB
 mQ327QqcGY4oOAg==
X-Developer-Key: i=jacopo.mondi+renesas@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

---
v2->v3:
- Place VSPX in the ISP power domain
v1->v2:
- Re-sort nodes by unit address
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 13bc49a535f8655db2af0493779f2756317ec806..104f740d20d315d43af9d0e63e418155f14a600c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2471,6 +2471,28 @@ fcpvx1: fcp@fedb8000 {
 			iommus = <&ipmmu_vi1 25>;
 		};
 
+		vspx0: vsp@fedd0000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd0000 0 0x8000>;
+			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1028>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP0>;
+			resets = <&cpg 1028>;
+
+			renesas,fcp = <&fcpvx0>;
+		};
+
+		vspx1: vsp@fedd8000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfedd8000 0 0x8000>;
+			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 1029>;
+			power-domains = <&sysc R8A779G0_PD_A3ISP1>;
+			resets = <&cpg 1029>;
+
+			renesas,fcp = <&fcpvx1>;
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

-- 
2.47.1


