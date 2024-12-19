Return-Path: <linux-renesas-soc+bounces-11576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C209F7E02
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 461F11893C76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E639227BA0;
	Thu, 19 Dec 2024 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DsNY7IVg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63302227594;
	Thu, 19 Dec 2024 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621926; cv=none; b=Biboe+tUefAK4eNgvgUqdbwjgsbkoUWydUrRyS3tmV2Ua8ZipG8fFSRpXZi4OgdhJpwYccaGT+xtzClnPksurI7KRjorQWmbcrsDUmslF0j3Wd49/AARCchdbSFE/kje/q1LUghfPRRdMXXA4yVl1ftA1cgnFsPTfTOPJeOMZ+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621926; c=relaxed/simple;
	bh=VTkLpaiH+VM6UokTmNQ9l0jXwGpqKfr0LWdoGEB/x24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kyF2ts4VhxadR51nSEXYtn1BNPso4G+2VBoevGf/Yes/gDI9SXL0jfM4qZaCSW81DIo+HixjJWtdPvVARgCzu1kGf4pxa1II/eaJbboItnvBIiXGxxn6KcxA58pJBcJ18WLKvxVqJ6dzmYqHbxPL0aRcLwsdF7tWLJghdN6SbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DsNY7IVg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 90787BEB;
	Thu, 19 Dec 2024 16:24:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734621880;
	bh=VTkLpaiH+VM6UokTmNQ9l0jXwGpqKfr0LWdoGEB/x24=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DsNY7IVg7mL3HI8JOEuJw8FhoA8EbeTT6k6WLNMnGE6ISnaVuLq+a5No4NelXHWZC
	 AfmF85OiMIpcfvswzPcPI6q9bPU3UAR8Ys4oEQZRlwYGFBO+HTVnroO6jPjxaI0egu
	 tjtfxpHG8PQuebGAjEP5hv6rgYDO5OtBuI8QIWMI=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 19 Dec 2024 16:24:52 +0100
Subject: [PATCH v3 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rcar-v4h-vspx-v3-4-8fe8d2afb268@ideasonboard.com>
References: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
In-Reply-To: <20241219-rcar-v4h-vspx-v3-0-8fe8d2afb268@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=1572;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=VTkLpaiH+VM6UokTmNQ9l0jXwGpqKfr0LWdoGEB/x24=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZDraGlgRmWoS4x1AbfwY1jM6qpwiIGA0yaAKm
 684rh30hF+JAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2Q62gAKCRByNAaPFqFW
 PNERD/94s/dpZpcG+EFAz403FgCP/bSTu89TjwR0cTm6YS7wblaEXUlWf6utZUL51I73w8rMir8
 knn58ci+SJ/HnkJD+Aod1pfcYGj731eGeQr8aYEnLYYchBh1ew9SyeL04a1hKcd+D4syWtqvaCF
 Ub4BMaLFfjHyu2EmwF9GBgFYRXETNJoeS+zEzJCvpDiOF4JXq4Fq9rAFZfiPsXv7ohAYFr/kgJJ
 zYyweNRSuvIH9BpcST2DeZdNP1bjqL071yv8ntG2XZ/mnRqmW11ljVYyAq30P/LnJx1Vrns18pM
 2q2j8WijHQKwAEcbkqsFOS6wnP+pgoln79BHsseuCjmksd560BW/PMy+bsTH6neVRaELIh7uhGe
 jZmPcb3w9T2a+9waPw7h9CUQsGj/eJtT3pp5lkAhHGT4OifNbPV5mf6AQqRHO9Kx4bHPXBu4Gkr
 BjppmxfKbOL+B8A8zuuPyiVT+hWovU37HUafW1u204lXxIYUQWbbQyf2iQuiWqHbL1/3RA7uuxy
 hHawxhE+ek0iP0qdl8qIwkUMv6o2KMzFveo6C5NAaENNoMtRjWJ7gp5n63D23c601NGMqbaK7f2
 uZ/PVrrWzORiSt8Od99GaFCXGl6EOGa9ibYGCXdB8BsGy2/zDZyLjB8C/+qrOY5r/hHP2KMqMbN
 fwuiLtZZbrB1HIg==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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


