Return-Path: <linux-renesas-soc+bounces-3216-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D93C786816A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 20:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90BA428A38F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Feb 2024 19:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDACF130E25;
	Mon, 26 Feb 2024 19:47:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0FED12C53D;
	Mon, 26 Feb 2024 19:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708976851; cv=none; b=CAmrKUqazDvk0Nud6ZtTKBcnM0R7fQOHy0/udxusvXwUrQ0KBb+5NcsoCTnXZ9RTZcVx1kydXNHXSnco9F+t3r98wLZalQC7T3+SLvXSv+qE+ApRhllWWIaTabPHQgE5FoTKZEjDaE30f8xNzOVIik69zUTMmcCScff5ep4PP80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708976851; c=relaxed/simple;
	bh=g8lFNMj3/BUbHcOdcwKfxt7R+dQXelKSiV9DzeRbLi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HP684Q2hpT9nFMehnNYi6d/sWg/QlZknpJBSOQgBywSPLXz8IHMQvrdOt5KOErqBHbMB+nyUalHoUuSRbu4jj3uvrIQFmsGz9yupBns50qSiHhht82MoX5ffJO644o4STXElNZ9E8miRpX7JY5luTi6ngzGBUDYWl3DBYY8vdTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,186,1705330800"; 
   d="scan'208";a="195384718"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Feb 2024 04:47:29 +0900
Received: from localhost.localdomain (unknown [10.226.93.86])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D747E40065B4;
	Tue, 27 Feb 2024 04:47:25 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: rzg2ul-smarc: [DO NOT APPLY] Add PMIC IRQ property
Date: Mon, 26 Feb 2024 19:47:15 +0000
Message-Id: <20240226194715.427597-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
References: <20240226194715.427597-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index f6f6f8280df6..812af2891a95 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -21,14 +21,26 @@ &cpu_dai {
 	sound-dai = <&ssi1>;
 };
 
+&pinctrl {
+	pmic_pins: pmic {
+		pinmux = <RZG2L_PORT_PINMUX(18, 4, 1)>;  /* IRQ6 */
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
 	da9062: pmic@58 {
 		compatible = "dlg,da9062";
 		reg = <0x58>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
 		gpio-controller;
 		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&irqc>;
+		interrupts = <RZG2L_IRQ6 IRQ_TYPE_LEVEL_LOW>;
 
 		gpio {
 			compatible = "dlg,da9062-gpio";
-- 
2.25.1


