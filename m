Return-Path: <linux-renesas-soc+bounces-26968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 521EDD39584
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 621AC300A6F8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6E8E331213;
	Sun, 18 Jan 2026 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="KltbS8z2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="t7YPvZty"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874BB33121D;
	Sun, 18 Jan 2026 13:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744297; cv=none; b=Lu1oAqiRlIrJA+wg8nToGu5aVS5mEg3dkd5pDBkwa8cO9dIA7oLont9SUyjkdBQfrSYmnu3+ojWe6gLROjKouannTC+N33H9JaQc7ZDJNy7onglBhWeagtX8lE/V1RKl6uiIBBBBSG/XAzutL0OfRb3+71vxQL4A30LdbZJ4arA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744297; c=relaxed/simple;
	bh=EotnGWEPPglLdPs8qxG0Ymh9F5zKvLc02lGgfc+7taw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mGlAleVzpNb1/HFOwnBdKc2Gp4N00dJuE3yU4CT6zB3Vly/UBEPSVcWGLBkJ7wi++v7rInS+E+FVZDi569cgYYrKIssI5OWfyBO8h6EySQDoeDVfUpYbdLsxNh50WmoWXDT4q8bXCi1hV4cuSBz+U/cG+qmQefO1DIzdBpQeXgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=KltbS8z2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=t7YPvZty; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dvFP96dfhz9sTb;
	Sun, 18 Jan 2026 14:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tf+2LW/K7uHWYSeL+4oc/nXbmfZwSn0ljbgPq5lr9nc=;
	b=KltbS8z2UEUWyS/OrIFlivEeczmhECPTvUBYry8ue/epTrtftY1DN252uOO7oP3o4WDkJu
	L/HPXzoCU+cOm4kbYYsQqMPw4tRcrKfxzr7toCO/cCihxRcUvq5JKVcAe3CsNoPsxI9HWa
	xXg53iRVvdcyUNv217BMnxiuFll/kcUTXZd4gWNIw8Oppmc4yb32ncxTHFLSV+0tcFMyuD
	2cbNAOowSZ30L+G19qSmYoENy/mVA0QpXX83CD5AfArm05/LYEdLSgD+DYcFmoRY/R+BCs
	6nYEa6SmEr75qPysRbHgNIAOgGLUygQpmb0MO5mhiojaeOMbsf90xLmQ5ek9Kg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tf+2LW/K7uHWYSeL+4oc/nXbmfZwSn0ljbgPq5lr9nc=;
	b=t7YPvZtya0/YEvtYi/dcX+XBA3rIOt2EjZAplBZYkrqmaV4ODBxpY3JR8xtvGD15zC4T/i
	gwOYDFUsn2xJ46/p0RL6CAtZENo3xKYr8QjWBvKbit1uVWBzib03lJmS8uDym3tUAn9qzx
	Ha6ynlhIBF6fE7W4HXyV2jIhPr9M2G2kXoAt9fHE20POChs1X39T8uppc4cD9uf45lrljr
	c0ObZe166kiXJtKe+/qg6RY9688lYMXfP+kC5DVTCtqJVOrE71SO+OVIYvCEg6i3EM+8Hp
	8GMeA6otwHvsGiPBPuL/HIAyxeGV22LQeruhha5uoqEpmv/rHFLiu9zBcegLow==
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
Subject: [PATCH v2 5/9] arm64: dts: renesas: r8a77990: Describe PCIe root port
Date: Sun, 18 Jan 2026 14:49:53 +0100
Message-ID: <20260118135038.8033-6-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 68jt9cumd8exuazkag4goauxrgq5qoa1
X-MBO-RS-ID: 31b220a7fad67fb80eb

Add node which describes the root port in the PCIe controller DT node.
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
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 97a7cf675efa7..82e9ab458b05b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1929,6 +1929,16 @@ pciec0: pcie@fe000000 {
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
 
 		vspb0: vsp@fe960000 {
-- 
2.51.0


