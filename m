Return-Path: <linux-renesas-soc+bounces-11574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3778B9F7DF8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 16:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BC41169B6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Dec 2024 15:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACCE22688F;
	Thu, 19 Dec 2024 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gkvpWdNo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFD222654B;
	Thu, 19 Dec 2024 15:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734621922; cv=none; b=aUMbZyS6wHR0SHZdbVN00oLE0tSNgosP5aC/2VxgCN40dF0OmLlHU548relh+3QtHta1YFGw6SDMPbXXUXYPv5Utdq/wWextCGJC5jOfGasTbGKf/afNgj0oG4Y0e1nF976DneGFxyfQ2NZqmV1OqtlrWbKdr9s+h58kn3k5QLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734621922; c=relaxed/simple;
	bh=Gvfbqv3B3NzBfBKSwmYjobKjdbf2jPxzYKt/0gzx9SI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMAQa/SY27WhC2FmjbWV/my7VE9a3Gx9Gljra9Ng8eXCsJTlPG1qfT1f67RYFwoFsl6yGwxxw9L92G8Yl40UrnWTW5cZGDJpoFCYXsOfqzYosf2R/mW4S425lTXH9BHj3tX/iP2aefQ1XZZ1Fc5fEuRxKg8TSSrfg41+xUy/rL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gkvpWdNo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F422E6DE;
	Thu, 19 Dec 2024 16:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734621878;
	bh=Gvfbqv3B3NzBfBKSwmYjobKjdbf2jPxzYKt/0gzx9SI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gkvpWdNojTpzACJRgFi5qcYp6txlxyLvJgwHj9+Pl95egpkiSEyTSZTnJXGIqbaqT
	 vKH2Uhb1NIjf0C6kxq2ni1d2/Ve4exeuHxqq0zEpQXSAOpWCPRVgfyabJeDaQ/Uxdd
	 iiG32IAIFXs8VrywBsAlEeXtHYFmFAOQFnCz3u7A=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 19 Dec 2024 16:24:50 +0100
Subject: [PATCH v3 2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-rcar-v4h-vspx-v3-2-8fe8d2afb268@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1423;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=Gvfbqv3B3NzBfBKSwmYjobKjdbf2jPxzYKt/0gzx9SI=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnZDraiYLc7WZOogjh0OR+mxR6Mmr160AAXL0Nk
 R5SHNAdpUOJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2Q62gAKCRByNAaPFqFW
 PCl9EACccBVFOqN1brun8guSrEhwf9CC1tf9/3GTbndE7dBMTAKfEKbk1cV8TzwbkOI+MDgJ3c0
 fsy9BufSyYBPjddeJ6GXUAGl/XqU86nxaCVk9sUWJRr+RUqylbg/VfLiSRNIWi8e8WTYas2FUT0
 hYgNKaQr+1acFaPs9pkPc+AlEaxrYLJBrMXsoJbChL5JRmEbPsiAlCTlJ5VzEfuTilVnGps3J4A
 GoOIxQOWRpeEmA3RW46Vc1gg3x9v2LUHvX45/lJZqm8308wgcvI58slgSTEDz/bGp/UO0H59Mxa
 AcwpA+WDUcG/Cjxat2Q5iQtIKqsn1v1Ok4ZHWSc/XEP4u1qPozMJijkhJcFI783R/zYCfV0wtyG
 OH0xcgvrv2yxEY2ZankxNwhtYzAVMetQxa9MRfePso/5VtacsMFGqNz0Htd6io4bEe9dwzEEKX4
 t+IWjTIBN1lZOEZFu7oNIxcGpGZCqIMkTZjSQwg/JZOfkHj5arnIVSMm3w1i7xj9U5m7Yfxqe1F
 s0Z1ClJs639a43GHfBp0SBV1pwZtL5ve+5JmOUVXZepIH3UdlimcKP6dU6lJHVmCKEBz9a4/TYk
 NRlHItRvpLt515ljgVE+8X+pArslDzah7q/BTQUIxSHkmGW80CocluZ+gaJi08CjVNjRypaSe+a
 tGg4aflaLnbiE2Q==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the FCPVX instances on R-Car V4H (R8A779G0) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

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


