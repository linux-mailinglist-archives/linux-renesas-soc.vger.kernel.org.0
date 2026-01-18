Return-Path: <linux-renesas-soc+bounces-26967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C61D5D39582
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 87525300461B
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD8132C92D;
	Sun, 18 Jan 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DotJFJo/";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xgEPgKDT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F832B9A9;
	Sun, 18 Jan 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744293; cv=none; b=ei+lr64uV6U3Aztzy1+fwq9UbbSaRDb+Yue/DuJEncCw9CpHC9v6O/nT7/JCD02yyJSq4nCfttljigFxNgTm+ZO4f+3cPxVyiXCy0uFZ240ao26LxcgZJdcMe2MUPmfFrhXF2/lR2MsHj+OjnknFeOkg03tLyzF2hBLEj1VimpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744293; c=relaxed/simple;
	bh=X93+oLqO7sAZo53Y08VVgvXdC9J6bcG5JtTsv9+uutc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ki+LR2ov/WhLJNIkqn4pLWb7SGWt+vgFClTZmKVPe6XAPPQ/fumBnp1kKTx0417GrKutd3rS4mC+lPXy/yX3Ue4S1ZKBWy1d1E1xPUPp4kBIsq8SUcM61dSC10xR+mAx4vdfCebsEo5lgc5E9+JFBjp3Gp2hE4qvGf/Qgieedhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DotJFJo/; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xgEPgKDT; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dvFP81ssrz9tpM;
	Sun, 18 Jan 2026 14:51:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1a03pvBjJEeWxBQlizzxXeqoHf+pxHr2XWF4oncp5Sw=;
	b=DotJFJo/KbrlNJYdoxVVMC7Ktrg9AW2cFBjKnib/mpeEFEc54tKon5Tq3waxLZ2+nUQZOZ
	G60P6NLukB1/aQMdzhH5X1teuUyUTf2LwKp2WqClH7NVZyGVo0NcXJm2w6WuAX5BptL4Sd
	5i5b9U1ECDyLCdKf8iHunc+VLLb21Ax2EGaMhTjbPK7hfNe2untgb6C8KI195dQGT8VsBe
	wCuG16AvsZP8rk9AAo95VLYlfwryfpvu5cN0YI3GKpDs/zKnXHhag82OCNMOWQJzQPJPWy
	AdUh+SEG5KwIEr9ZgNV9qksPcLKWtcQBfYvNUqVp+lQPjsFO988AjbZ8PHYAYw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1a03pvBjJEeWxBQlizzxXeqoHf+pxHr2XWF4oncp5Sw=;
	b=xgEPgKDTNmuH5WqrcSL1wjg0d18a5iGL79nG85I39HeOn3UDwPBwEMjnSpW59WlREGznn8
	vhOySi06RAm0EONBckqIH9pSh+/tRwTtP4CrfzAU/rZa1I/05pHEYzsqqmyu0uxZFzsgAL
	KrZAG0e8zW8XmtmAeVXp9d7TyAKzuAyGJycblM4aa7DOX0rUHLY2IRyz7676K3jvw4bgUV
	Ekl/6CMKRZtkXr70tfBtGOclXiJmA44jf7HTBQtlDsCZ9bHYtlQYNydK/bM59DdVKd7bSX
	MBs2P5VFpTa9/I2XJFx5A2qnhCW2kRGFB+0msGknfSUmaP+CcpltXdYRk8xJoA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 4/9] arm64: dts: renesas: r8a77965: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:52 +0100
Message-ID: <20260118135038.8033-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 7d0a2511c75a681a189
X-MBO-RS-META: ywoxfzgkfj9bo356hrte58ran1aecdmw

Add nodes which describe the root ports in the PCIe controller DT nodes.
This can be used together with the pwrctrl driver to control clock and
power supply to a PCIe slot.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: No change
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 425561e658caf..611a9335c63ad 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2494,6 +2494,16 @@ pciec0: pcie@fe000000 {
 			iommu-map = <0 &ipmmu_hc 0 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec0_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		pciec1: pcie@ee800000 {
@@ -2523,6 +2533,16 @@ pciec1: pcie@ee800000 {
 			iommu-map = <0 &ipmmu_hc 1 1>;
 			iommu-map-mask = <0>;
 			status = "disabled";
+
+			/* PCIe bridge, Root Port */
+			pciec1_rp: pci@0,0 {
+				#address-cells = <3>;
+				#size-cells = <2>;
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				compatible = "pciclass,0604";
+				device_type = "pci";
+				ranges;
+			};
 		};
 
 		fdp1@fe940000 {
-- 
2.51.0


