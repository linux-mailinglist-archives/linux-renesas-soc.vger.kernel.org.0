Return-Path: <linux-renesas-soc+bounces-11484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EB19F5586
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 19:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE853164736
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 18:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A471FA154;
	Tue, 17 Dec 2024 17:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RlrSPaKB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416751F9F5F;
	Tue, 17 Dec 2024 17:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734458041; cv=none; b=gnH76Y1otA6uCxK7y7Kohc5lnN5jszZKdRXSbi+OpGR/H5GvdtV4zhomeBmWwHyoNtX2Nicoh2XxtM/xQz15TDw96UsjioDF2XqyPCbdlyR0MaSWAy3U1aot/zXDpaSkLJBALJoKpVaqySTmnGJl1kdM3ILad69M3EoHBJMEo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734458041; c=relaxed/simple;
	bh=mo9HZf0+C76zOe6oEAVBZ4C3Ezowqaf2EVu2kE+TSVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WbkrRnT0Ok3Ukv+JPhDz87AUoI8rNw92Tj0McZ53VtELw/QNy+U4PZxqHMLLfu1uF8FKQeSzys8h2viwnYgKWy33gIJftqQboPMLYusgcI9QI5lJrCby5miHxPczCbOdRN/m0ESb5ATEBLVnG7qFTdtok3zd3chN+lY1Qf0QkyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RlrSPaKB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.104] (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF3D880A;
	Tue, 17 Dec 2024 18:53:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734457997;
	bh=mo9HZf0+C76zOe6oEAVBZ4C3Ezowqaf2EVu2kE+TSVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RlrSPaKB7xQw3eViZlQPX23wygkYi7LLxyo4+SACb1fvcHW6xg7PEWHE5dcVz5fhp
	 cmOSJqs5dje3WCUaYsTtZf7bQsgxRoRWZ4Kj5jp8JcD2Eph66GZKTPZkcCE5B3sFuS
	 nLws/BJi+2lCpgp1j+obDN81rC321PDIoW1cCk0k=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 17 Dec 2024 18:53:17 +0100
Subject: [PATCH 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-v4h-vspx-v1-4-de04ea044ed4@ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
In-Reply-To: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=mo9HZf0+C76zOe6oEAVBZ4C3Ezowqaf2EVu2kE+TSVE=;
 b=owEBbQKS/ZANAwAIAXI0Bo8WoVY8AcsmYgBnYbqu6W2YHmBqQ3mu3qmHNWDRhRCKrpBci5Dgg
 7m/nHz0eIGJAjMEAAEIAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCZ2G6rgAKCRByNAaPFqFW
 PEMfD/9mLCh5r8eJ90x/tCZWpcX8YMqUa3GcdTTTvdidvqL3MAAtXfGgDxubRh7NMPTJVVOcWo/
 IFsAAyDHDJy8iUQ8O/Hc9f6b6lVk1/HyiR5B7wHN9KYmse0ijhVLJktyMaJUF3sb3bas5I8tX4H
 uMbehJT0m09w2Y6y+zgGGNwUyTLLil4aA1zt8qbWEDiUs5hTEV7tmuvXoOf6FT7M5mHNG2MNBNn
 64uI0U8t4UW+LaHu3MtdzWM9CAAjOLWAgd04DEwNFLp4gb7GLGIbtJyUHCvz+x+e8bjECEcBnKK
 j/UE1VWYek22tCPbH574y2gblJLDF98cX/HXjo2rS8fHhYdITbbLqtOd5L185n3AtB64GHOm6fm
 pUsdUqg3nqlijKCGHF8+Mzw0Ialy4/w+xkzcNc5TDT05ZZRBn0ie9wYMkvmNT8bTSRSOO8gBIuF
 LgIkAWwIbdYY3fni7FHsPW2+P99QweDJZ+woyw1Xf61EaCXbFHNFQSAeaqareA4kW6nMwsulVVd
 7mRUQg6scwK9pzKLLFy39ALC5k93ZzAXyMIMwXFcgNCox+18NqCQ6KoGKN2E/yVzbUUj+gPlJus
 bLSFxNheZGAXOUVHuMvIXB5gZklYKWbXPrvujKFldQz6sWjf9J1fjv1V9GX74v4bDdslPzRsLaX
 sqRnI8aPjLc7+Uw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index e49748563e2f5706ed982d6c9cc1df59f27bd0dc..bf4ec5fb7bbdba55e2994f332fcbd623839079c2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -2211,6 +2211,28 @@ vspd1: vsp@fea28000 {
 			renesas,fcp = <&fcpvd1>;
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
 		du: display@feb00000 {
 			compatible = "renesas,du-r8a779g0";
 			reg = <0 0xfeb00000 0 0x40000>;

-- 
2.47.1


