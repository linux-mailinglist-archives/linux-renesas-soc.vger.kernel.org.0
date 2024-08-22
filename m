Return-Path: <linux-renesas-soc+bounces-7981-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A995A92F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 02:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C50DE1C22CA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 00:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EC13C3C;
	Thu, 22 Aug 2024 00:45:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD091D131B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2024 00:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724287512; cv=none; b=P/1u3UA7QoJdP9b+YzTSo2HQOsBtXe3zHe9rDYmtanOPITMJdTjBCljIVl+jk8NgiQ6Yb3SOlC58LzFfNH9JWcn3+Oq404nTbVk8RCfD6QhNH9TB22ZI5aeWIZr9B1qAq7KtCcswaf7vXr648dOfeC/JXTDtkDljX80cp2hkHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724287512; c=relaxed/simple;
	bh=yDkEa8s++9rB3oxRnJXkQlo7XtDMlYrNPi9TeG7aOcc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tU1khjSyAOKEtssie7KLOAn/Y+Dw2SzlOLX5n8fNJNj/35FD7mwSaZxP9CJ6roAkO7sHqECSCoNcSIE8rMDTm53KXPkCparVJlqvp/UyqPE4v7EB7s/XGzaORirLWwO5RowK7pbOcTDj/EsIPQemivbgZRiERH2+QUZqUVFJRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,165,1719846000"; 
   d="scan'208";a="216223510"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Aug 2024 09:45:01 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2DFB040E09EB;
	Thu, 22 Aug 2024 09:45:01 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 2/2] arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0
Date: Thu, 22 Aug 2024 09:44:54 +0900
Message-Id: <20240822004454.1087582-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822004454.1087582-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240822004454.1087582-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PCIe Host controller channel 0 on R-Car V4H White Hawk boards.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/white-hawk-cpu-common.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 80496fb3d476..3845b413bd24 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -117,6 +117,12 @@ mini_dp_con_in: endpoint {
 		};
 	};
 
+	pcie_clk: clk-9fgv0841-pci {
+		compatible = "fixed-clock";
+		clock-frequency = <100000000>;
+		#clock-cells = <0>;
+	};
+
 	reg_1p2v: regulator-1p2v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.2V";
@@ -288,6 +294,18 @@ &mmc0 {
 	status = "okay";
 };
 
+&pcie0_clkref {
+	compatible = "gpio-gate-clock";
+	clocks = <&pcie_clk>;
+	enable-gpios = <&gpio4 21 GPIO_ACTIVE_LOW>;
+	/delete-property/ clock-frequency;
+};
+
+&pciec0 {
+	reset-gpio = <&io_expander_a 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.25.1


