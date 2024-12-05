Return-Path: <linux-renesas-soc+bounces-10962-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 553959E57B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B2A4188457E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575FE22145F;
	Thu,  5 Dec 2024 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fcocQJQ/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D5221441;
	Thu,  5 Dec 2024 13:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406346; cv=none; b=lb5dx361XEy7QPu01HvHxIsGNa9ZYUSThOOjPCh9Y0KzOAfWyxh5oQ4acdkP7dxgODGnY7qOF30qP5MnMVkM80Qn3/q+/ob+9Ax2i/A9RmhbzaEwDSNP4LXIrRfswWXESZK33zWcp2R94mkqyq3NFxJNI1CobQsNuM8PhgyCiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406346; c=relaxed/simple;
	bh=CvG5cV3/BnOqrex+A4rcAyfGhlZH/bFpQ2vkN135FkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CJl8ljNIz5CDgMRQ1idNQnWkaOyFKZUHPPWnlIvfh8XQQ0wgyXEt+EjYYraTewCIP3ov2DDtUsYOfwXS3raj1e/9zamiOsBszVzAfAMkoVNDdKLO21YqTydOY9L2A7j7f9imDkG5d52SNgQmYr3rnsXSQEjB8BUFxX+tJQzlw3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fcocQJQ/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AA733E;
	Thu,  5 Dec 2024 14:45:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406313;
	bh=CvG5cV3/BnOqrex+A4rcAyfGhlZH/bFpQ2vkN135FkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fcocQJQ/mTBKbtvWtrWnl7cMgtQQ+bfVtYLL61OTIg1O/fDSsh8q3O0RuDq8o6XRV
	 h4aW9QMUalMyIKWzzr/44s9EisbgWMzj/hCUUyRjALhlBRojzX2F/14QGn3YoI0fDJ
	 fkkpUOqZQOgPKHLq6cr2nZT63W2HxsPQHw4w1HLg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:04 +0200
Subject: [PATCH v2 09/10] arm64: dts: renesas: r8a779h0: Add display
 support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-9-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=bdk0P2sOC8R4gh5BoZ9fg3apaeHjc9+QqgKmbv8gVqY=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa50SPX6Ulwze9yvprRJT2bV+YlEh2b5013yH
 5C4krNYpPOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GudAAKCRD6PaqMvJYe
 9cw3D/0Yqk1LwxdZY7MhaT6rNyfJMQZK3yTV2MMIA3KuOsVlwbAt9laTn0yo+iUffJTg6Vk06KG
 bkMIu4agYIWvF+MVCTNi3Gp+YzOkK13Ftc0MYNfoOByYZjN6T5W1dfRmpG59J10/ERz+rlqf5rC
 4Hmx9wxOOts7TGjtwgGzrn0L8hLDrUlFxgv88KEMQJAGRn9PbanhtXx27xVEOCXastW7kP6fw2g
 EkztfNa2eVuWYE2bIOxtn5Ckzz+6AfnGxHJc/f6YWa73UiJTQetDiJYJAPl/4wmzqLHY6F6g5s4
 8KqsIuEev/pyCsAciKZNm6J8lY1zfzslmlbQX3yRlCeVCT8riXw7g5JLxfp3GLqC/I7D3pnPVM0
 Tl4kQFRBgUD9zi/Pna5clwQAujcTLxoAzY3NkRKUlhUyihpwEv6ho1ub6BWnPvdLAw2o8MWXEB7
 7dh/sqZL6zS6ZqAW94EIxYZrPdUJ2X4Zr0EAorFtAdU1m45tpO8cm4s0V5QSISjSukxMDjFNE7e
 q7w94wrGNy4IEIPGa+B5eGWH1VSwiAqFS0vPrQIsz5uOJyF7tCEE+GuEO+NYZmLxjjTv1Wobz8t
 LY3K+iVn1n0/57clmJY1qWvAH0OeusO/o9DawsAjMTcGxHxTqxwhLXUomcjGInRZerWr3EnVAY4
 eX5J9agJoFdtzMg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add the device nodes for supporting DU and DSI.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 12d8be3fd579..4f97c483fd4b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1828,6 +1828,50 @@ csi41isp1: endpoint {
 			};
 		};
 
+		fcpvd0: fcp@fea10000 {
+			compatible = "renesas,fcpv";
+			reg = <0 0xfea10000 0 0x200>;
+			clocks = <&cpg CPG_MOD 508>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 508>;
+		};
+
+		vspd0: vsp@fea20000 {
+			compatible = "renesas,vsp2";
+			reg = <0 0xfea20000 0 0x8000>;
+			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 830>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 830>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		du: display@feb00000 {
+			compatible = "renesas,du-r8a779h0";
+			reg = <0 0xfeb00000 0 0x40000>;
+			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 411>;
+			clock-names = "du.0";
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 411>;
+			reset-names = "du.0";
+			renesas,vsps = <&vspd0 0>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du_out_dsi0: endpoint {
+						remote-endpoint = <&dsi0_in>;
+					};
+				};
+			};
+		};
+
 		isp0: isp@fed00000 {
 			compatible = "renesas,r8a779h0-isp",
 				     "renesas,rcar-gen4-isp";
@@ -1996,6 +2040,35 @@ isp1vin15: endpoint {
 			};
 		};
 
+		dsi0: dsi-encoder@fed80000 {
+			compatible = "renesas,r8a779h0-dsi-csi2-tx";
+			reg = <0 0xfed80000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 415>,
+				 <&cpg CPG_CORE R8A779H0_CLK_DSIEXT>,
+				 <&cpg CPG_CORE R8A779H0_CLK_DSIREF>;
+			clock-names = "fck", "dsi", "pll";
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 415>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+						remote-endpoint = <&du_out_dsi0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;

-- 
2.43.0


