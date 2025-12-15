Return-Path: <linux-renesas-soc+bounces-25744-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB5FCBC5A3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:48:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57ED83009422
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1965229A30A;
	Mon, 15 Dec 2025 03:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H5i4x0Co"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029632749DC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765770499; cv=none; b=PQIWBMbkOLM3DFxlEJenQsFBhYJlKyC2IlKIo8r0TGJJu4KyPPOfQMxO5URAlTfgi+kEDOL4Qs8+/YHHCpL04M6qEKN00LpBu8Yx7OzbZ5Z1tnSZlPiTuVoK2lgWXYozjwzDO6P7hLituKwEEKKqeFRCcepCL8FLvi7QAbe5RJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765770499; c=relaxed/simple;
	bh=dJN3s1je6GuCfYWmdGugTM3CVpTFHaZ2GuftgCevzlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJ6NTKqIGIz4ur46kD3XuIIbgpBNQY4XJcGbAuo+dNqFA9PKMOrTPrf3vFM7DR/EjMlOorES72DvvNwhcKd4OGbrwKTl3MXkJqwBnow8XbldBmHMpnV5D10+wzSwvbyHz/8mZ3yKKzS97hd7JazlZxc5NIo1lgobWD/zZqTWFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H5i4x0Co; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=vrKjhgBRnfIkg0v0nx9pCGN+h6880nXFHV4jkFovMdA=; b=H5i4x0
	CoYIfQ8P6AfEApXqOLgqJyxRAWC6Aryf87B7g5FW4v9WAY4WkNZIT5MBjdbeGu1r
	pKj/4Iabyztad0YpB54OkeoWsjb0q4lEsM/rgrgwgpCU49yux0PLNueE5vMB2JdT
	KDrOLWuJAMp1EbOoMPG1EQpoA4O960JMfqmoLA8L6esh3ZLgv9zIyudN7pAqprEN
	mPNwRtSBvOOLXLvgXo8voiKUr5wRGA0+kpXLBy6PTtcerDDBqbBRNYVmsTeVfIlc
	oxaGN+y4pt7LdUcUWxegmc3YtjKxLAM3Q+T3ZDP6TkpZg5/MlQGnlPwZRsjx/eXT
	iTpvW7OvG0SdvkCg==
Received: (qmail 821402 invoked from network); 15 Dec 2025 04:48:12 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:48:12 +0100
X-UD-Smtp-Session: l3s3148p1@kH5DevVFENrN3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: renesas: r8a77970: Add WWDT nodes
Date: Mon, 15 Dec 2025 12:47:15 +0900
Message-ID: <20251215034715.3406-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215034715.3406-8-wsa+renesas@sang-engineering.com>
References: <20251215034715.3406-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 1007ee48adc3..1f6676e2795a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1209,6 +1209,38 @@ port@1 {
 			};
 		};
 
+		wwdt0: watchdog@ffc90000 {
+			compatible = "renesas,r8a77970-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffc90000 0 0x10>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77970_CLK_R>,
+				 <&cpg CPG_CORE R8A77970_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 325>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
+		wwdt1: watchdog@ffca0000 {
+			compatible = "renesas,r8a77970-wwdt",
+				     "renesas,rcar-gen3-wwdt";
+			reg = <0 0xffca0000 0 0x10>;
+			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pretimeout", "error";
+			clocks = <&cpg CPG_CORE R8A77970_CLK_R>,
+				 <&cpg CPG_CORE R8A77970_CLK_CP>;
+			clock-names = "cnt", "bus";
+			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
+			resets = <&cpg 324>;
+			reset-names = "cnt";
+			status = "disabled";
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.47.3


