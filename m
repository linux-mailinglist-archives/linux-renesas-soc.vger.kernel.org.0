Return-Path: <linux-renesas-soc+bounces-12232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 898C3A15C80
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 12:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDEE63A1376
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 11:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0397918A6BA;
	Sat, 18 Jan 2025 11:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kj2DNjCP";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T3Pc+1dK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62989188A08;
	Sat, 18 Jan 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737199393; cv=none; b=OkHMM2HWhsvdt9sWzTcFB/khF8RhvtnegyMGPa/dSKqQoHcwSaAD4n/g2fnJRZTVNwC83dIJy3TIQOJhsE9PErsL/xFFU1bnnGE7L4DAuOgRk2znMtw4ikSuJep2mDP/iWgnWRV0KstCC2hKmNREbvIPwud+HVDeGOvDN5rOLxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737199393; c=relaxed/simple;
	bh=7Hrpo7UUkON8GTEzSTDV74BtjVQY+830Ku6O2IdNOdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nlqh40U1uyZgpCHh+rWuCxZkFqLw6+oG6EyQwmPIUWzcTEXjXswSJKC1sGyMB662P1s6JhYWpCBRJnEOAK0AQQ/IvwwK5vc4oh23Lt/Z1wfRATWKJ1GewthEtV58g1zYho+3inFstjZubP4XObLmarvwdY2b6scdoTr3fNerMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kj2DNjCP; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T3Pc+1dK; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4YZvBH4YDJz9sqc;
	Sat, 18 Jan 2025 12:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bw1E7VebGu/07f+zwSP8xjgvwa8wtrXVpYgFq69OsM=;
	b=kj2DNjCPmRH532qvXtgxawm9kOFDrURMVk5LQrJiPJORbWgXAO9csNtXtcEc8mBmDe/yiV
	nH6gKmRyYNdidyKAB+ohrzHjaHOl96jHfKlOTDmq8+sIam68VUwttQpUNcv8e2VrPZsUl+
	mgDGQlAHJ+JGhw0bCeeMkRlSnD5scTkJLk9LtcDXEHOqQa6lM7l6SF9Gluxqc0Cnx1o/7z
	OmC5KYnPUu2CNj+L1Io118EEkyEmzc7q+TmkZLsG0r+af4VS9XIOkfNRxjMM4nCZu/2nVi
	vY2/uDPOw+HGinh9G4ALyMc90HPYyEt33/Sl6X2dCwGyqxPA7nJuSZjTAkUvHA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Bw1E7VebGu/07f+zwSP8xjgvwa8wtrXVpYgFq69OsM=;
	b=T3Pc+1dKX14T1/bfGwE6O9BliCPmJPyEv1HfcKagzMXDxOWkOKLesdTA9vcStmOdA3wLFZ
	vdsQ0SwvoxF4DG1Js46SiFGrroZKLhKObgMvr+D37XXsDA0YXi6goZkL4GTtLvyhtJheJr
	hJU9MfEioGfQcNd3VCpcEmR7ov9jZ2O1H2/E4AXIDsrJhLdpjYL06EFxNE1/Vm9IyXQS6W
	KlrZdiIs2qC/dcwOE2QRZLUB4gsRY/yVESJDJ638mn5HL8iTN+S0TTRy8lQ170KWmi1egD
	1pdCM8vUmfjT4rQOngHuOw6c5cyD6P99mEU4Sh8Q3XiNR695+ihit3q2K9hNXQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: renesas: s4sk: Access rswitch ports via phandles
Date: Sat, 18 Jan 2025 12:13:10 +0100
Message-ID: <20250118111344.361617-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: s78poq3c4knqny85yzo4whxmqj1pz3y7
X-MBO-RS-ID: 9aa30760ce97dac0b11

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
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 67 +++++++++----------
 1 file changed, 31 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 5d71d52f9c654..4bf526535ee05 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -179,53 +179,48 @@ &rswitch {
 	pinctrl-0 = <&tsn0_pins>, <&tsn1_pins>;
 	pinctrl-names = "default";
 	status = "okay";
+};
+
+&rswitchport0 {
+	reg = <0>;
+	phy-handle = <&ic99>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 0>;
 
-	ethernet-ports {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		port@0 {
-			reg = <0>;
-			phy-handle = <&ic99>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 0>;
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				ic99: ethernet-phy@1 {
-					reg = <1>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
-		};
-
-		port@1 {
+		ic99: ethernet-phy@1 {
 			reg = <1>;
-			phy-handle = <&ic102>;
-			phy-mode = "sgmii";
-			phys = <&eth_serdes 1>;
-
-			mdio {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				ic102: ethernet-phy@2 {
-					reg = <2>;
-					compatible = "ethernet-phy-ieee802.3-c45";
-					interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
-				};
-			};
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 10 IRQ_TYPE_LEVEL_LOW>;
 		};
+	};
+};
 
-		port@2 {
-			status = "disabled";
+&rswitchport1 {
+	reg = <1>;
+	phy-handle = <&ic102>;
+	phy-mode = "sgmii";
+	phys = <&eth_serdes 1>;
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ic102: ethernet-phy@2 {
+			reg = <2>;
+			compatible = "ethernet-phy-ieee802.3-c45";
+			interrupts-extended = <&gpio3 11 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
 
+&rswitchport2 {
+	status = "disabled";
+};
+
 &rwdt {
 	timeout-sec = <60>;
 	status = "okay";
-- 
2.45.2


