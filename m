Return-Path: <linux-renesas-soc+bounces-12230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 912F0A15C81
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 12:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B9287A135B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 11:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBA6187561;
	Sat, 18 Jan 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kaTwn/fH";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l1BYxfzU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72A4487BF;
	Sat, 18 Jan 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737199390; cv=none; b=MXpWoLqGlC43MiOy7yes5UNfNJvL16bKtf9RsNaPqoTO/xigfKhkrQ32wO3H4D1vAP4bqI7Sa8kF2q29Oc4TglhCgK//wK+qYmpH3JPMB9WTfVpCiBE6sMA94fuS+36Wtg7/eUelRUmyi7NkgJOhgJwfVv8sw12sOAXyryLAAjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737199390; c=relaxed/simple;
	bh=j3V1t+F/jaPfF47C8Kzi+eWKXStjop9dkBFqCWJ4SDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0IJnuXvhNzqATQRoK6nhWWAS+wG48OD+Xg3eYDlmpzYhADX5m+voYp8AKo8gCiuw51Sz08xv/ooW3jXLTvLmYWMp2DI9GhHN0qSNpiG+7feUiLJbX1hsN5ce90GRndguU51DoecB+SoSKNaKK7Dzkp3RpYOMAoqNKwaG/RcDcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kaTwn/fH; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l1BYxfzU; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4YZvBG1sPYz9skP;
	Sat, 18 Jan 2025 12:14:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H28thG/7gsRTlTRsLj1+D2yQgfkc215Y94p59uZOiFE=;
	b=kaTwn/fHEHGBYnp1dw9JHTRsIyTYMIgllPDUTKR5v1Q/9kLVqiVqIULOqP/kyIQTlrnkpS
	w9YOJ7wJP+wr4Wah6ig/lV87Cio2BZ0p3VngadKPCKPfRVL6t0cM8rrpcaT2WWsBwwUHiz
	QjGF6H1q0HFuP49AZ7IW90GO79YlNeHl8IbYWjw2S1mtIKWs8+g/m3iB0L5UZSQSDPKb70
	ebyN5Gz6Nt/ZesN5tkp2cgXJ1hYT8fmjOYp9xnERZSYv6fqFE565lVUOClsovKD7Xymf7D
	HkNqyiPMFqP6AdlMaD0qxqY/PuDZJDuAKDLsFZ4g6bsFOSEZqa7mdQbTvNvzFw==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H28thG/7gsRTlTRsLj1+D2yQgfkc215Y94p59uZOiFE=;
	b=l1BYxfzUMVMmMMk5Z+TPBG8SM5G4igr70Go53lMNYRxzqFSwJT5ERJ8keCpIpqjRJuHyVa
	k+DhWskXAMXknYlqYzy4dkxh05fljqdzcMiAA53BJu1A8hLrPw22PjetfVQMK+S0YAtESB
	stTG38EcR6rClow/9lj4HKMo2jZzRJrTyfIWPCuKHK+rt3RZ6dU4fdF3c2HtS6szDXLD7n
	TBwbFe+44Idvh9DLH2IcS9r97Ks6eIBB4q48AJuk+A53vkuwNf2vKwB+EvO5wgTNfMdBlg
	QX7onfkT87KeFC0nnYDKCXG9qVC/OsrTNJMV1dVnTwR75IL2HDHmsuyER/Z3sA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/5] arm64: dts: renesas: spider-ethernet: Access rswitch ports via phandles
Date: Sat, 18 Jan 2025 12:13:09 +0100
Message-ID: <20250118111344.361617-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6idgtqos3ymrujijt3bpiaj3u8jemggr
X-MBO-RS-ID: f8d397af97b6b2107a8

The r8a779f0.dtsi now contains labels for each rswitch port in
the form 'rswitchportN'. Use those to access rswitch ports and
slightly reduce the depth of this board DT. No functional change.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../dts/renesas/r8a779f0-spider-ethernet.dtsi | 87 +++++++++----------
 1 file changed, 42 insertions(+), 45 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
index 5d38669ed1ec3..069f36ba53a4f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
@@ -42,61 +42,58 @@ &rswitch {
 	pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>, <&tsn2_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+};
+
+&rswitchport0 {
+	reg = <0>;
+	phy-handle = <&u101>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 0>;
 
-	ethernet-ports {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		port@0 {
-			reg = <0>;
-			phy-handle = <&u101>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 0>;
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				u101: ethernet-phy@1 {
-					reg = <1>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
-		};
-		port@1 {
+		u101: ethernet-phy@1 {
 			reg = <1>;
-			phy-handle = <&u201>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 1>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
 
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
+&rswitchport1 {
+	reg = <1>;
+	phy-handle = <&u201>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 1>;
 
-				u201: ethernet-phy@2 {
-					reg = <2>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
-		};
-		port@2 {
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		u201: ethernet-phy@2 {
 			reg = <2>;
-			phy-handle = <&u301>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 2>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
+
+&rswitchport2 {
+	reg = <2>;
+	phy-handle = <&u301>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 2>;
 
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
 
-				u301: ethernet-phy@3 {
-					reg = <3>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 9 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
+		u301: ethernet-phy@3 {
+			reg = <3>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.45.2


