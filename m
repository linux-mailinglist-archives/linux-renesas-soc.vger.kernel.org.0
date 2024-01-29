Return-Path: <linux-renesas-soc+bounces-1935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 414F58407B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 14:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73CCB1C23581
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 13:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBB9657D7;
	Mon, 29 Jan 2024 13:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lz4EXjVJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AD9657A3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 13:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706536733; cv=none; b=ZLdJ3sJUFQjuTIuPdPqw8iNIoVhOw3XXwiJPe8BHR7kiknk52C8XuszfmerD7Uga9zOrSkmxQpP+616ZoQtQ/dtnCNUNCg/54+Cw2gt3qJBmwC922P/83KPIH0U5dDl9nwsNB3g7wGV7HP7U221glyNOHPfRNqbNNfnkyukJv1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706536733; c=relaxed/simple;
	bh=lvucS87GbyosylJ5xACgdTr+uXBpcMa19S30EvRZtjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R1QRlQntrR+b10qLAu++DiBaTovUnbWkJVao5KebmN7bBOYhLCot57zhe/Py7KniOzAlWdt5TFzjTz5zC8d3AZq7CjCqxF/KuS+2ZLZft2IuT2N+in4DiaDFIP/sAwcgMzlN6TgiDu/EgCGJCSaarR263o7tb0O+oqq02Cto9rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lz4EXjVJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=sFUBZOKL1rgWIm
	lADgR9uZisqGeOSpQQbfi/XorVR4U=; b=lz4EXjVJ+y7nNECX79Gg/PMc2Frw6V
	Eaha0fq+Z57U0dG5YFtv+I/igqcWCDpCj1GFBcujQhrNgD0fKq6veyyFL35+na3r
	QZcy5iF3ioFeSQVgTzI7MKE9A5LJV4wf4uOs5SQoo0b9b03PUxy2yg6BdnWdLCwA
	f/a78Pc5jQX2WQfDcCtRFM5JfI2caJmoPvXU78LSGxx0RKeLEq0/GDyi3BUp2Awr
	wRLZmXfYXjRp9/xI7tIjWAnasFIs5gUDi/m0QAO3yuIuTOSiWGINkw7NnB4PG7Gz
	68kyMVhYsp4SwN9n9BgWZBi3VEMypYhpjT5w3E3G0cZe4UVwsfioGlLQ==
Received: (qmail 2500472 invoked from network); 29 Jan 2024 14:58:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jan 2024 14:58:49 +0100
X-UD-Smtp-Session: l3s3148p1@xD2RCxYQpK5ehhtJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: ulcb-kf: add regulators for PCIe ch1
Date: Mon, 29 Jan 2024 14:58:40 +0100
Message-Id: <20240129135840.28988-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Without them, no power, so cards do not get recognized.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Changes since RFC:

* rebased to the GNSS changes Geert just applied

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index e3cc0e0e73cc..c8dc06f0dfed 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -39,6 +39,24 @@ hdmi_1v8: regulator-hdmi-1v8 {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	pcie_1v5: regulator-pcie-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie-1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&gpio_exp_77 15 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pcie-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio_exp_77 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	snd_vcc5v: regulator-snd_vcc5v {
 		compatible = "regulator-fixed";
 		regulator-name = "snd-vcc5v";
@@ -323,6 +341,9 @@ &pciec0 {
 
 &pciec1 {
 	status = "okay";
+
+	vpcie1v5-supply = <&pcie_1v5>;
+	vpcie3v3-supply = <&pcie_3v3>;
 };
 
 &pfc {
-- 
2.39.2


