Return-Path: <linux-renesas-soc+bounces-11523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8B29F60FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 10:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42CFC7A239A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 09:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 272FB1A08B1;
	Wed, 18 Dec 2024 09:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SONlG9Fs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7736919F422;
	Wed, 18 Dec 2024 09:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512771; cv=none; b=HRV5/rVJD3Hcn9kVFGeLxaGgFbe4jy4R5k01yOQ29byABcFo4IMJ04V6Bd+uYbTQTgDuLTCctMedJf9BBbYWJhGNzKOnb79d17RhUv36KNgooXgqhVkHqTLXLn3y5htBQavtmmzzk4zg9U778xPy+M8e/sdlYNSr3oTWa3Sd2lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512771; c=relaxed/simple;
	bh=uq8TgpIgbcMe1O9uiKHRrNcGZAdZvgl2WksQo0PqQHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQZP4OJIH6AsF9+JbUtaD0o/EZGd2SAuflk+3hCY9DEjqKbVDyrUI+SAurKkCKvevlQn8d7ZPMyHMGECbJaTcNRrZT+aHxWjmi6MC20l7O//plTW8wEndopxF89eo+w3CRgMFc5urQ0feako+VIPtS2pX7hSpfkpqRjOMNCfqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SONlG9Fs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B3DEDEE;
	Wed, 18 Dec 2024 10:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734512723;
	bh=uq8TgpIgbcMe1O9uiKHRrNcGZAdZvgl2WksQo0PqQHE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SONlG9Fsz/HhqSfLvLDG+zXHY5phBTn98shqJEOd09Y6tWD2MxK9V8Q8I/qPbICkF
	 EQyuTdvOya7BGDbCDlvsPJplJtZsj4qvccA8TEXieM0NkwmDfvIJw1ag0zaFsHSkLW
	 8HpW2YAPBStL9XZdwSHKQQyBew6rvLwDQfXjz4+U=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Wed, 18 Dec 2024 10:05:37 +0100
Subject: [PATCH v2 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-rcar-v4h-vspx-v2-4-c673647d96e1@ideasonboard.com>
References: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
In-Reply-To: <20241218-rcar-v4h-vspx-v2-0-c673647d96e1@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=uq8TgpIgbcMe1O9uiKHRrNcGZAdZvgl2WksQo0PqQHE=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYpB09OPRnO37Z5k1jBs4HlqXsD+YQdJ0MHio/
 vSUWlZhIFmJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2KQdAAKCRByNAaPFqFW
 PN/PEACw72ECzjMUpoyDKUQqyovUuyTIIzuStVghAJPpJ67JYQ6BNzEa0UGvdbZEzt1+ytEJtDp
 F4nOtzmRasnv+ssBIfa9JoaNuYOSlU1qUoJEPtO/tiW6rk73PlQJ2X+m9hxHNO6lctluv5CFVTZ
 fyNYSga+GfNV7UuCT+txUlC62GJr/QmzAka1P+3iB7o8AloPIbNYCtz1Peczylr5OJS6mZis+Vn
 UpzR+MTA63e5Hf9TGMjZVHGzGucYu8eQ4qPzr+MkJjBV8U6vNqBf8LF8BMnWIviFWA53dswoZDB
 FxWCohYytjEl0pJVSCFVtAkQfZxGVkcNB1NgYxSqu/tNXi+jfX7+ZNUZyoP7kVJQ0qn/jhjbMwr
 hjTRTjVdH4Pp9ciXUYHCUwfRxR7kp/Ouckp9F+gmDoYKn1aBpGvVZVj4tbtrwQaonWPNnt5DhVn
 kMSrtai4kN8owxFAPO960/sJq5VefxZaV31ymsCN8ZWdVvv4XctgVB7tG8dqnmvhe83hMyUSyim
 dlJGanZADzj1gwYetJjjeW1qoBiLm+oe09jJ6VssCEFhQnD9fpjHet7R0tbqiamR6JKBATwicP+
 0SODoqxL7cd1BTSMMss5Xqh7BGxHfPaEqO2w19rzMIV9cBpm2TZ7ZR+YdiLq1lYJroT2iiwCWSA
 I0BJNVCNmWd0NKA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

---
v1->v2:
- Re-sort nodes by unit address
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 3eb53deecb63cf1aacf4a2ed663fe5402aa1199d..cf2550abc58620c453e312d6fd3f46fa1a58c1a1 100644
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
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
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
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
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


