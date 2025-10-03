Return-Path: <linux-renesas-soc+bounces-22635-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AB2BB83DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Oct 2025 23:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8F85B4E47DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Oct 2025 21:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432B926C393;
	Fri,  3 Oct 2025 21:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="LuvyHFtL";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gpVAuUm3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FD533F6;
	Fri,  3 Oct 2025 21:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759528430; cv=none; b=XKlUvYFq8tfcRxEzpKDZuSav0GphXfncU4uqgafAdEIMhTRfkZwzfoJxE9hEOsMRz+eutp51SmfDvXS3yAnfbJePXoutb1C/9TTJ2f2Iyx3NjJzeP/kUE4Na9OHvO+FdeUR04/HfiRXgmIRVt5TyVQfguJP8SA49ry0kN7nen9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759528430; c=relaxed/simple;
	bh=+hc8gpXwWR/eNuz4N/7rv41aYFpfLpG1MM5KKzGJjEc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BzFKltShXYAGHCNqDG+6Oa7i/9BfYC932XkIh8id0a8pB/XLJ+Fl3sh/MK4KgQrGAB9NEj4jNq6wKV/HEXJzrmnedFCULWVNQVpgKrSgOLe61RihZQvrLk1VXCmmNcenbcU8TCaVzpb/MSVsYQVkWmHVcgbtriXFNl+Smw+a9/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=LuvyHFtL; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gpVAuUm3; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 91E617A009C;
	Fri,  3 Oct 2025 17:53:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 03 Oct 2025 17:53:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1759528426; x=1759614826; bh=AJ
	IdbmmBCFnLvvSiMQVZIiDOs/Hqfu4CpR0XclHKWwA=; b=LuvyHFtL6cVyDjZOEO
	Hr4LLln0hWFf48fU/PRlKy9/CvcDSrxg2181WhzMHZe8qm1B/hSoRmdLg4zdsc+3
	RMQP7dJbpCaVu4iePAmFUm8YjDyrKrTx6CsTHCFPJ075F4rftFo/RN+QOlW7ZxHr
	4pfDnVA26DuoAQXjhqpQM+63nlLC+ADpUAefgDvXKeekJkYo0YukYU6cQwmrFTbT
	IRuLw4JCPCn7upOsYw+a2UJx43OXtohYcQqWO6Z3ff449fh3KllBlXx0s5ErXHUp
	/EDBaEtZftzazPTSRq+ThlrG3M/U/BrYXenn+ZoclatjOuCScHSP1HGyII/s9nRW
	wPBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1759528426; x=1759614826; bh=AJIdbmmBCFnLvvSiMQVZIiDOs/Hq
	fu4CpR0XclHKWwA=; b=gpVAuUm3ak2K5/kpSazq2tzXfKkvk12uJzvUkc6iNf4V
	9ZTQcdYqNbvJRwp+N1mFEV0dbiNBEw24HrN5N/++JZyVqWkrWXlKp1/nBT0uRQHz
	uqfFLyuUPcEeTAD4I1EnhvVO2pS/OvQ1050T5snNZhym/vWbMhkfiyRx+7w0uqph
	MNMsbfqbsDAc9qHBryn7C8xNixM3SExrYXe1nybNtZJbw9q7WiEZb7tYZoLOf7sR
	jjY/4Pfwp5epOYv/RqHPeVWeqreWiCEjxOeYGJSBBS4QA9WzVazm1YC8o0mrgK/m
	sQjfQ9Rs/AnXSkRRDOwUP2GR7PXsbm1wdhwoTCoyCg==
X-ME-Sender: <xms:6UXgaKhDXTIfcwLvXm81S7QuTcDCMIXXbkRHIV9LQFGmA7NNPmElEw>
    <xme:6UXgaP9z61h5qgXbPm8vCXY0QRr8RS2_C_9s48CRzrBL-7TJmlEhAl7r-gaYzfb-g
    Aoe5cj2cxbvE5hw1MC7QLZqAnyzt7MdJwQeIaTQexvoPQ8f-6I053w>
X-ME-Received: <xmr:6UXgaGWtC_njN80qPk_jMfCoOQ6fsT8LkaYGTmHMLldxmwuNxQg_7Oefni37j5ogHGwuOSh5607_53UTdylCkfG6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeltddtfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheppfhikhhlrghsucfu
    npguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghsse
    hrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheduleetteekgffffedu
    feeuvdejiedvkefhveeifeegffehledtvdevhfefteegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgu
    sehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopeifshgrodhrvghnvghsrghssehsrghnghdqvghnghhinhgvvghrihhngh
    drtghomhdprhgtphhtthhopehmrghgnhhushdruggrmhhmsehgmhgrihhlrdgtohhmpdhr
    tghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoug
    htsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehnihhklhgrshdrshhouggvrhhluhhnugdorh
    gvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:6UXgaDBIfwiqj7Gv_Sii86lB8H6y2v-WRBnSR05oFD3qtG-hFkpgKQ>
    <xmx:6UXgaLHYU-4Mkg1DNQM5gG6gDPoKtKXk-dU_d-yrhsIA3zl3Ndem-g>
    <xmx:6UXgaE4wWofAF7V5FSiXbuspVjzkELU-4H-DQ6-VkWq6lq5s6hjC2w>
    <xmx:6UXgaBneWkg0CeCXIahKadhVx8J7wl4SXo6cdxDGvsF8n_OZCx9tKQ>
    <xmx:6kXgaHnyGqyzCuz3IaZRfTh58lBfDHZx9G9N37WFz_X1GxgjC4tzbMg2>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Oct 2025 17:53:45 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] ARM: dts: renesas: koelsch: Update ADV7180 binding
Date: Fri,  3 Oct 2025 23:53:18 +0200
Message-ID: <20251003215318.39757-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the more modern adi,adv7180cp compatible for the CVBS input found on
R-Car Gen2 Koelsch boards. This aligns the bindings with the other Gen2
board with the same setup Gose.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts | 34 +++++++++++++++----
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
index e9f90fa44d55..9c97215a7039 100644
--- a/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
+++ b/arch/arm/boot/dts/renesas/r8a7791-koelsch.dts
@@ -295,6 +295,16 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	composite-in {
+		compatible = "composite-video-connector";
+
+		port {
+			composite_con_in: endpoint {
+				remote-endpoint = <&adv7180_in>;
+			};
+		};
+	};
+
 	cec_clock: cec-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -383,13 +393,25 @@ ak4643: codec@12 {
 		};
 
 		composite-in@20 {
-			compatible = "adi,adv7180";
+			compatible = "adi,adv7180cp";
 			reg = <0x20>;
 
-			port {
-				adv7180: endpoint {
-					bus-width = <8>;
-					remote-endpoint = <&vin1ep>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					adv7180_in: endpoint {
+						remote-endpoint = <&composite_con_in>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					adv7180_out: endpoint {
+						remote-endpoint = <&vin1ep>;
+					};
 				};
 			};
 		};
@@ -900,7 +922,7 @@ &vin1 {
 
 	port {
 		vin1ep: endpoint {
-			remote-endpoint = <&adv7180>;
+			remote-endpoint = <&adv7180_out>;
 			bus-width = <8>;
 		};
 	};
-- 
2.51.0


