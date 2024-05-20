Return-Path: <linux-renesas-soc+bounces-5412-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0B88C999D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2024 09:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3547EB2189A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2024 07:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD66A1BC3F;
	Mon, 20 May 2024 07:59:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6081BC2F
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 May 2024 07:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716191983; cv=none; b=do+afjTT6CCWCgj1bx81bjm1/rp2LeS8IIt9EMGjGfA36956grTNubShUijW4BWBbRxYxJtJ47yf9KxWoGbMf/fyTU9wdWNqqmMGlL2D8cdMCCZH3DBD3Rww8DT3FodKxlQqZyqDAwM6kKasCVgxWl7iezVku3lsgE86PffFPIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716191983; c=relaxed/simple;
	bh=X+1IVeHOvTENtf3ttukmAq90g3BeP5/AXks5aJAgx4U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JSwME+ctY0abbL+ROXYXr8VxzIbF5fIEjpyiD6ICdC4Ytyi+8OPbgqxsCLYYvKizvTbT4RO64wC5dCoJBHEzkBgQPdfWQPIIBsb0jY9VB8jAq91jCmexhdMFnPDQbC/3Xqjk/ho3S+UPeV25KjodviP/1Vawh/FDA0JG7x0T/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.08,174,1712588400"; 
   d="scan'208";a="209033458"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 May 2024 16:59:38 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 76D4741C2B9D;
	Mon, 20 May 2024 16:59:38 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: white-hawk-cpu-common: Enable PCIe Host ch0
Date: Mon, 20 May 2024 16:59:31 +0900
Message-Id: <20240520075931.126476-3-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240520075931.126476-1-yoshihiro.shimoda.uh@renesas.com>
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


