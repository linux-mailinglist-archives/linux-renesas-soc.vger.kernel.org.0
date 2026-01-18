Return-Path: <linux-renesas-soc+bounces-26966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D9CD3957C
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 14:51:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 05FA530011A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 18 Jan 2026 13:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE38330D3B;
	Sun, 18 Jan 2026 13:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="v2cvH6hw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pMsh0H4Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17020288C25;
	Sun, 18 Jan 2026 13:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744291; cv=none; b=QC/NDUs0p1stui+kxhETC1yvyG7KR7O2Qc0VcJ+PC/p+aIhYG9R9iNeH3fUgSDwurXrqz7pEDLhN3ob50IOiaUwt4Do+8K8h3UfLoudLPe+T/UEc+iZ++ILjYvwQEweS+5mXuAr3IjOoaqc337ohj47e4hiGdI6Mw9G+p/sxSwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744291; c=relaxed/simple;
	bh=LRXNRjqN5HDfYBQfXKIqH8bvpUM2vpCkHusCuixEeFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FKaVOyHvnklM+kC7BALTNeHEQyCAWBxPEVqcEPY20l86FXYigSCXi5TPq/Y/nJG/J1hbQ8Egm3HJSdvyhHbe9waAmlCO5KzeK/ClQs4TWBv+IxER6PYZRFOqrEI6iLGJAMif88Rq4oOt4mOP+42ImeicC3bsVb5Qi/XHpX1US7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=v2cvH6hw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pMsh0H4Z; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dvFP565rTz9tpB;
	Sun, 18 Jan 2026 14:51:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvBE8+SKwTjBSKMw2l/9Ug2dxlc4yNoGR1L7gNyligc=;
	b=v2cvH6hwyP/IDKdU0hZoiWSTXqy8amn6v1JACc/sm+WxDzdmGR2bpiCSw3+EVlKJPWIom9
	1ZdNqATvp+MpXxHSzO5v6cfdT/wfDhL7PMENEbcJ91l7uHWDAwSjpsaD7M+56fmHj112p9
	zCNDMOTUaSc96fgS5hvVvKL4PbOnbQV8ZvJO7EPt3WES/lJwKqz0uzneSeMtrPk9261SH8
	xnAJji1soezRxC/Ms7hE33nolJxd4X/GkMGp69hD5bpZiY7H0Yejmry8m0KjGAeZEfFDhs
	2xDK3UtEWWTaKqcly5al4R7T4E1TUCtQVO4XfiWtB32tRwhuPur3TVqUKtGo/Q==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=pMsh0H4Z;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768744279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvBE8+SKwTjBSKMw2l/9Ug2dxlc4yNoGR1L7gNyligc=;
	b=pMsh0H4ZqsZQHlVEvIiY30oy5iPTVXWUWyCQj0YSBeu9wITfWVVb/7vUcDGDLPB3fmQCZ2
	HQyU5PaAUt3/bt97W6aSFvQNfXgxJhdqF41JnOSF12E/HNk/5SQDqhgtydDKUtXbcQd7PE
	kQevb/wp1WW+mMhhK+CHMTjhNJ/xruhQzC9YZY/C0XYJq9dyygAr73S9cZ0l8cofWETjCR
	ZH/8jPD9GnEMWY+W2+XknVfs6P6M1mW1KUix1FlbdPMByIC0+4ZiHDF0h2Vh0kl4EaONAD
	TtsPbvXajNx6g5b8WrPpDrvLKz8KupjYBMDjsrgsibHWLPdDtT5Ngm1L/rGFVg==
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
Subject: [PATCH v2 3/9] arm64: dts: renesas: r8a77961: Describe PCIe root ports
Date: Sun, 18 Jan 2026 14:49:51 +0100
Message-ID: <20260118135038.8033-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: enij98tb8kyy8i87mgasaxn1acg1751r
X-MBO-RS-ID: 260d75be11ba1f38994
X-Rspamd-Queue-Id: 4dvFP565rTz9tpB

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
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 89f6c052c5e06..9d76e39eab72e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2499,6 +2499,16 @@ pciec0: pcie@fe000000 {
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
@@ -2528,6 +2538,16 @@ pciec1: pcie@ee800000 {
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
 
 		fcpf0: fcp@fe950000 {
-- 
2.51.0


