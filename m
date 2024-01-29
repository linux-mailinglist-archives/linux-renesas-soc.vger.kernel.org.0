Return-Path: <linux-renesas-soc+bounces-1957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0530784151E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 22:24:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 383C51C21CA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jan 2024 21:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02B72AEE9;
	Mon, 29 Jan 2024 21:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c7VetOAL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CBA1586C7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jan 2024 21:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706563442; cv=none; b=sEAkvpsOjzgn6kH8NVyfr5Pt0ElY0eltGXJ/TbnlqvfuzuAn14fsSc8UjjFgTgZbZPSDj/KZ3fIsRHj0H4lTOBJ1U15I9+e0067okei+yfZzGu2F4pYjGqfLORUlSUwXwNt5cA8JfsitO3NI/NmOrcOWkVc+/mg2mnxkSY6t+bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706563442; c=relaxed/simple;
	bh=k1GRh25etFTzV0TbJNBHdGdMzhY9M6eqleb+ccaQwX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=on36nFZoQ6VYJrFW+YL7Jb6KwhDcHuWNPyMQZzXtsnwM3Kx8vtz2bf7674GCCejKTSK/mKpUmLCW6YDUUX49QarIrOvIyMDT/p7xvyLb6dBt9InqNGtoRKXEFgI4mXEmaIhxIHMaxqMIFaFMEbzEs0vvlXTFvmXlMRrhDb99uvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c7VetOAL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=tnP8mYbKnfOf93yFIfgxQY+r9CeIktlYjlPhdDrf66o=; b=c7VetO
	ALxwXnZOTAsIi+htvwSI6NyI/3HhxGDwBngFdRqmnv8ldKP/m/Dj2teMG9gNjD8F
	a7tsQAYB947gDzrjvveTz/c0LeKQzL7TnpuL5sLHvPvllQATs/qrcxRZ0zK1zjJz
	P3k3WQhqdKTBamAsoRlcwrqcHP8fsm+Kv/XnwohobIhpWHoDSFyp6tdrTvMaUxol
	MduK8Lc3c9RDCiPnHQfVxq9+VklcQJNJEQn3koj0y8Cas1nxj4S1TxsgfmlgzWXU
	6i5fSwbFDtOWmHQshnzdgAzlxiWh9Pga0Dlkqar3ZikDwYJ1muL7pnGe0JtqzDYl
	6jgHwJLSPfiFJM1Q==
Received: (qmail 2612167 invoked from network); 29 Jan 2024 22:23:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jan 2024 22:23:56 +0100
X-UD-Smtp-Session: l3s3148p1@xtBuQxwQhOdehhtJ
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
Subject: [RFC PATCH 2/2] arm64: dts: renesas: ulcb-kf: adapt sound 5v regulator to schematics
Date: Mon, 29 Jan 2024 22:23:50 +0100
Message-Id: <20240129212350.33370-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240129212350.33370-1-wsa+renesas@sang-engineering.com>
References: <20240129212350.33370-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sound uses the standard 5V supply, so rename the fixed regulator as
such. Also add properties dcoumenting it is always on, also during boot.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Or shall we move the regulator to ulcb.dtsi? I tend to leave it here
because 5V are not used on ULCB, but I am open to change it.

 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index 6b6a0a8bc1db..84b0976503b7 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -59,11 +59,13 @@ pcie_3v3: regulator-pcie-3v3 {
 		enable-active-high;
 	};
 
-	snd_vcc5v: regulator-snd_vcc5v {
+	reg_5v: regulator-5v {
 		compatible = "regulator-fixed";
-		regulator-name = "snd-vcc5v";
+		regulator-name = "fixed-5V";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	wlan_en: regulator-wlan_en {
@@ -210,10 +212,10 @@ pcm3168a: audio-codec@44 {
 
 				VDD1-supply = <&reg_3p3v>;
 				VDD2-supply = <&reg_3p3v>;
-				VCCAD1-supply = <&snd_vcc5v>;
-				VCCAD2-supply = <&snd_vcc5v>;
-				VCCDA1-supply = <&snd_vcc5v>;
-				VCCDA2-supply = <&snd_vcc5v>;
+				VCCAD1-supply = <&reg_5v>;
+				VCCAD2-supply = <&reg_5v>;
+				VCCDA1-supply = <&reg_5v>;
+				VCCDA2-supply = <&reg_5v>;
 			};
 
 			gyroscope@6b {
-- 
2.39.2


