Return-Path: <linux-renesas-soc+bounces-3346-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A1F86C8DB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 13:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1E8DDB237BF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Feb 2024 12:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F32137CF04;
	Thu, 29 Feb 2024 12:07:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CE7D7CF17
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Feb 2024 12:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709208466; cv=none; b=qGYVayS95f+F5BNEqXMZICprvDTPLU2pKA5GKvHn5gmEW6nFcn4KtQTnT/UBkUqDtHnmZcBYpCLxu2vLwmopyVZB5daZoXG1fmQuhpUGo+420JfUxq4BVxMpRgd2vameGu9xoxbbk82l7olBB2QpLOhh2CUmO3HWb3k5jpzbf/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709208466; c=relaxed/simple;
	bh=X+1IVeHOvTENtf3ttukmAq90g3BeP5/AXks5aJAgx4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QZHnyp/rn8KausL50rXC2sjuaIzLWxWVTWxHT+PxBpd9lpgj5Vs8uOv/lXPKB+EAV9WibGJkQVpTYpC39w7EX1vDxLXXDqlf7Zl3KT3MU8WHsJZIoZh3QXcXbp2BTBm0W5vtV1IhLNi5JdL7Lu7SlL0fG71P0Lsii9BJeRxuD6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.06,194,1705330800"; 
   d="scan'208";a="195830426"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Feb 2024 21:07:42 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id AF059424B03D;
	Thu, 29 Feb 2024 21:07:42 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0
Date: Thu, 29 Feb 2024 21:07:41 +0900
Message-Id: <20240229120741.2553702-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240229120741.2553702-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable PCIe Host controller channel 0 on R-Car V4H White Hawk boards.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 .../dts/renesas/white-hawk-cpu-common.dtsi     | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 8ac17370ff36..3fc9a541f777 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -111,6 +111,12 @@ mini_dp_con_in: endpoint {
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
@@ -277,6 +283,18 @@ &mmc0 {
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


