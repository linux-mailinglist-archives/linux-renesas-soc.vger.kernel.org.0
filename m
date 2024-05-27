Return-Path: <linux-renesas-soc+bounces-5522-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 630108D01F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 15:42:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E933C1F29532
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 May 2024 13:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3179515EFA3;
	Mon, 27 May 2024 13:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="cO8zehea";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DryPEH++"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from wfhigh1-smtp.messagingengine.com (wfhigh1-smtp.messagingengine.com [64.147.123.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409C415DBDD;
	Mon, 27 May 2024 13:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716817310; cv=none; b=OUCeg7iEuv99NFucVyUPKTeLIHnbSlj/cr1+TQEb3avwZhfpRf/ee/EDIvcm1HOSO89L0rDoTXz6bcyukrzwq+7ISiTIhMJ69mPu0z5gBued7BRhSmy+Q/0Q+fL6QOjgy+ZcUrPlXsG4QXq5i/MK0Du18P3jZXQoWGO1/dpgyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716817310; c=relaxed/simple;
	bh=kyGdloOzCG5pfCWEZfef+84uu+sDoOcJAS3c18HSMYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eU43KxHWZVbPffET7Ki4uxKrrj/tP5Ov4UXf7ez+gwlktHcV/YBgxDZByVePcmOwlg7IUT/ttP80XdSZaeR1XH1zHWhZQX10KTrxcSjqAPhL0HSGV8XGgqll53vsIrQ0MPjlUwhS0aPAtt+jwzY8UyiF3XkpqiupIfgEU4Na9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=cO8zehea; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DryPEH++; arc=none smtp.client-ip=64.147.123.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id 15A8918000AC;
	Mon, 27 May 2024 09:41:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 27 May 2024 09:41:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716817306;
	 x=1716903706; bh=QrPieT4gCJoo8+WU9wZpb9lfdnHtkZU+nqXZ3kSIDe0=; b=
	cO8zeheavDJsyxcH5d1XNnEfDMIE7m4Dqbfe6nQd0vZ6PqWRJ6TUz4EIx6SItcam
	hexLmZwA56NkOQHZBSeQrecyUg1grjdr5DybQB2zJHBWjn89Dych/ykYpuc0dqz2
	NyR+BwRvDUvC/6sXin2Z9+MU9MPBq6ZUrcRyFL6TAhm0DxLaLUQ/b/WeZccrOc5O
	WvisI5sae87QSvOIYqMPDmj8aZFczX5jSTlqDsforX6P0bjBvjyphRLgl8s2kyu0
	SBSqhVlyWii6MTEu246+PfTCZaoGFMoUr9h3Qn8/C7BWvqruftyCJeLGVIalNqyE
	JNIrik8wpZ3+gqrozUefig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1716817306; x=
	1716903706; bh=QrPieT4gCJoo8+WU9wZpb9lfdnHtkZU+nqXZ3kSIDe0=; b=D
	ryPEH++KKCJMstOrvdpArkKjgSxugqjM2IaBSWvWg9VF+XTpCjdB2unbwdNxh1qQ
	eN/A+6OTmZ0TQeb7HTdPAicEQVqaa7lwfti0BXTRPz4fh4c7CgoiieSmbMne/Ok1
	iymUYDUGPnZpDkS9TfazmMNXnkgQFlg7OtD3Uea5L3fW0f2dKTVBWScRIzEelpGC
	ULugR0Arlu6eeA7chkXFkC2Rj91a8OIrfC8xUe2XsEc85/NXOsMit2LCEt6xMKQm
	sbsq2i7sJiGYbvEIRD4LBrBNbHsAVsvELAi/LkfCCCBYDh0xew9mLG4Q13BhR8fn
	pkuhcs3KkB3jDWrrxVXjw==
X-ME-Sender: <xms:mo1UZknua5UCg0mlkbYItwaZ5BtdkP3XOJ23WKY0YYQHpRzG6Znt7w>
    <xme:mo1UZj0nTNgjFBgxQ-OYQAPp26fei6hC1_PKSIV9LZ4Sj2Ll09C8uEBkMmC0FGgqs
    qiBY863UZJ0V3BArzc>
X-ME-Received: <xmr:mo1UZirbSY0qr2Gm-J3_rpk1cLwmD4ViDwJV6fDK25CMMt02oTB1JWPjR5l-LX7ERTFfb2ZXr_9kbd8mTZyjdqq6OyfBrPpqP2SE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdejgedgieehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefpihhk
    lhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnh
    gvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeehiefgueev
    uedtfefhheegkeevtdelueeukeevfeduhefhhfejfffggeffleefgeenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggv
    rhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgv
X-ME-Proxy: <xmx:mo1UZgl59T6nshcg2Jje2Ysb9Xz6HiFue8LqMLzA8p6WjgjenYKofg>
    <xmx:mo1UZi1j0vdWO_KM2r8UMCHApTQuXeJ630QSWcq9FKUSfSW6kHHhJQ>
    <xmx:mo1UZntEEX7OB7-6U7_j5Uv9wp8DtUZupJKMvwIVKo_CE03kFiX3Rw>
    <xmx:mo1UZuU74m7-fJhQ0IJXtTepJ_1UmmbhP5MFvd65CKIonrX_D4YBZQ>
    <xmx:mo1UZrn6sR3KeGgCzlwB-0qMva-NwPpK7RgeNa989zIDt-ilOgHSK_uT>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 May 2024 09:41:45 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a779h0: Add video capture nodes
Date: Mon, 27 May 2024 15:41:27 +0200
Message-ID: <20240527134129.1695450-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240527134129.1695450-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add the VIN, CSI-2 and CSISP related nodes found on V4M.

One thing to note is that both CSISP0 and CSISP1 are in the same power
domain, this is different from other Gen4 boards (V4H). The reason for
this is that the V4M only have one ISP core which is connected to CSISP0
while V4H have two ISP cores, one connected to each CSISP.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 666 ++++++++++++++++++++++
 1 file changed, 666 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 11885729181b..bd83e35e7738 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -547,6 +547,454 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		vin00: video@e6ef0000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef0000 0 0x1000>;
+			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 730>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 730>;
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin00isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin00>;
+					};
+				};
+			};
+		};
+
+		vin01: video@e6ef1000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef1000 0 0x1000>;
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 731>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 731>;
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin01isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin01>;
+					};
+				};
+			};
+		};
+
+		vin02: video@e6ef2000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef2000 0 0x1000>;
+			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 800>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 800>;
+			renesas,id = <2>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin02isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin02>;
+					};
+				};
+			};
+		};
+
+		vin03: video@e6ef3000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef3000 0 0x1000>;
+			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 801>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 801>;
+			renesas,id = <3>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin03isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin03>;
+					};
+				};
+			};
+		};
+
+		vin04: video@e6ef4000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef4000 0 0x1000>;
+			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 802>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 802>;
+			renesas,id = <4>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin04isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin04>;
+					};
+				};
+			};
+		};
+
+		vin05: video@e6ef5000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef5000 0 0x1000>;
+			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 803>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 803>;
+			renesas,id = <5>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin05isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin05>;
+					};
+				};
+			};
+		};
+
+		vin06: video@e6ef6000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef6000 0 0x1000>;
+			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 804>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 804>;
+			renesas,id = <6>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin06isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin06>;
+					};
+				};
+			};
+		};
+
+		vin07: video@e6ef7000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef7000 0 0x1000>;
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 805>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 805>;
+			renesas,id = <7>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin07isp0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&isp0vin07>;
+					};
+				};
+			};
+		};
+
+		vin08: video@e6ef8000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef8000 0 0x1000>;
+			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 806>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 806>;
+			renesas,id = <8>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin08isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin08>;
+					};
+				};
+			};
+		};
+
+		vin09: video@e6ef9000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6ef9000 0 0x1000>;
+			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 807>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 807>;
+			renesas,id = <9>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin09isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin09>;
+					};
+				};
+			};
+		};
+
+		vin10: video@e6efa000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6efa000 0 0x1000>;
+			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 808>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 808>;
+			renesas,id = <10>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin10isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin10>;
+					};
+				};
+			};
+		};
+
+		vin11: video@e6efb000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6efb000 0 0x1000>;
+			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 809>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 809>;
+			renesas,id = <11>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin11isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin11>;
+					};
+				};
+			};
+		};
+
+		vin12: video@e6efc000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6efc000 0 0x1000>;
+			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 810>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 810>;
+			renesas,id = <12>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin12isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin12>;
+					};
+				};
+			};
+		};
+
+		vin13: video@e6efd000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6efd000 0 0x1000>;
+			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 811>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 811>;
+			renesas,id = <13>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin13isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin13>;
+					};
+				};
+			};
+		};
+
+		vin14: video@e6efe000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6efe000 0 0x1000>;
+			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 812>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 812>;
+			renesas,id = <14>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin14isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin14>;
+					};
+				};
+			};
+		};
+
+		vin15: video@e6eff000 {
+			compatible = "renesas,vin-r8a779h0";
+			reg = <0 0xe6eff000 0 0x1000>;
+			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 813>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 813>;
+			renesas,id = <15>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@2 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <2>;
+
+					vin15isp1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&isp1vin15>;
+					};
+				};
+			};
+		};
+
 		dmac1: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779h0",
 				     "renesas,rcar-gen4-dmac";
@@ -647,6 +1095,224 @@ gic: interrupt-controller@f1000000 {
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		csi40: csi2@fe500000 {
+			compatible = "renesas,r8a779h0-csi2";
+			reg = <0 0xfe500000 0 0x40000>;
+			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 331>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 331>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					csi40isp0: endpoint {
+						remote-endpoint = <&isp0csi40>;
+					};
+				};
+			};
+		};
+
+		csi41: csi2@fe540000 {
+			compatible = "renesas,r8a779h0-csi2";
+			reg = <0 0xfe540000 0 0x40000>;
+			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 400>;
+			power-domains = <&sysc R8A779H0_PD_C4>;
+			resets = <&cpg 400>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+					csi41isp1: endpoint {
+						remote-endpoint = <&isp1csi41>;
+					};
+				};
+			};
+		};
+
+		isp0: isp@fed00000 {
+			compatible = "renesas,r8a779h0-isp";
+			reg = <0 0xfed00000 0 0x10000>;
+			interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cpg CPG_MOD 612>;
+			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
+			resets = <&cpg 612>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <0>;
+
+					isp0csi40: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&csi40isp0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp0vin00: endpoint {
+						remote-endpoint = <&vin00isp0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp0vin01: endpoint {
+						remote-endpoint = <&vin01isp0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp0vin02: endpoint {
+						remote-endpoint = <&vin02isp0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp0vin03: endpoint {
+						remote-endpoint = <&vin03isp0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp0vin04: endpoint {
+						remote-endpoint = <&vin04isp0>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp0vin05: endpoint {
+						remote-endpoint = <&vin05isp0>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp0vin06: endpoint {
+						remote-endpoint = <&vin06isp0>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp0vin07: endpoint {
+						remote-endpoint = <&vin07isp0>;
+					};
+				};
+			};
+		};
+
+		isp1: isp@fed20000 {
+			compatible = "renesas,r8a779h0-isp";
+			reg = <0 0xfed20000 0 0x10000>;
+			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&cpg CPG_MOD 613>;
+			power-domains = <&sysc R8A779H0_PD_A3ISP0>;
+			resets = <&cpg 613>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					reg = <0>;
+
+					isp1csi41: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&csi41isp1>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					isp1vin08: endpoint {
+						remote-endpoint = <&vin08isp1>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					isp1vin09: endpoint {
+						remote-endpoint = <&vin09isp1>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					isp1vin10: endpoint {
+						remote-endpoint = <&vin10isp1>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					isp1vin11: endpoint {
+						remote-endpoint = <&vin11isp1>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					isp1vin12: endpoint {
+						remote-endpoint = <&vin12isp1>;
+					};
+				};
+
+				port@6 {
+					reg = <6>;
+					isp1vin13: endpoint {
+						remote-endpoint = <&vin13isp1>;
+					};
+				};
+
+				port@7 {
+					reg = <7>;
+					isp1vin14: endpoint {
+						remote-endpoint = <&vin14isp1>;
+					};
+				};
+
+				port@8 {
+					reg = <8>;
+					isp1vin15: endpoint {
+						remote-endpoint = <&vin15isp1>;
+					};
+				};
+			};
+		};
+
 		prr: chipid@fff00044 {
 			compatible = "renesas,prr";
 			reg = <0 0xfff00044 0 4>;
-- 
2.45.1


