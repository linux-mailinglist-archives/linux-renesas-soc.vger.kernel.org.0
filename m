Return-Path: <linux-renesas-soc+bounces-6948-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 044D491E2D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 16:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86FF7282BF7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAF016C86A;
	Mon,  1 Jul 2024 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="g4A7Gcq9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="riZiaQp8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44116C862;
	Mon,  1 Jul 2024 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845443; cv=none; b=cmyBH920FRlRePGoUfUvNVRKd7S/bCV31Pk/xae+TT5LT5CHAfSUqo9bPdTnfha8lfSz++BU7o4HiOfliqnpRcjboqBVXjL0CTYhJhRbWT5qVxxsxtT9lgNKHvqcwxIakGLqMK1drvsu3FXz1QVTbpnmetxkQk5Pf3rVM3pb4c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845443; c=relaxed/simple;
	bh=Kj1nrWJXP7huRyw7w/bdNwnpNC9xU9Kp0u5awA4sw8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrXs2NtPILgToB8WvPqWodzjPQs7/gwTGUtIoQhUpmX3jPPTZRFE4At0nrp4KBKsVzQoTF5iPciXWLcXoS4AK5HwrTvjU/eQ7EndpvPB2NSWjQK/hSD1fJgzIQ017upx3Zi+clSMRmnOkqYMCtRSgQ6G26hctSIF+Y9Z5O0G6PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=g4A7Gcq9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=riZiaQp8; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 4C85B1140217;
	Mon,  1 Jul 2024 10:50:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 01 Jul 2024 10:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719845441;
	 x=1719931841; bh=DXblF9dw0/RDGfos9kMfhQTYzUfsyxxi8wn1+qC1M+4=; b=
	g4A7Gcq9/wm10yEsK9h0O/YRzU+qCPkKhxOgG1l05KpsFkf4ZXO61v4LC4FaU2ct
	zXkact9iEFkYaAnqqM2eT3texUbo19y814q5lL+i1R9FPjyoGwaOkbvSP9I2BM5p
	x1cnyeqqvW6CJ1hA3atqnR3SJYsfB2C0ksYKt2/OgQ6ooPr5O69SwFWhYaheMeGf
	LTTW6dwmnq9Y7Jnf9Qwp1GIwLYF999RbEDoIN/fKcg1U/vK4kbsUwCnJfcKqFCvr
	adzcltbggtE/XTb8z4a6KAEDWxhPzYb25ARYhK1C+NmfkxotMqTZRT4e3dwhPioI
	34RHqyfRK0n2QJvTy/fi4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719845441; x=
	1719931841; bh=DXblF9dw0/RDGfos9kMfhQTYzUfsyxxi8wn1+qC1M+4=; b=r
	iZiaQp80pLoCAdAQRkd9BJpgTvfExoL2d/y2TPeJJs966lWCeANXzthyQg26ZQ80
	nwb3JNaN/kwYDAL//1bnTLuhNGi0C9m2riLQVA6/zNxAHlEC+bPtGjpl8YsMIjHh
	xwnXAf/WiPb9C+h64nRe1Wofyg9S2o8i5mZjh4OsLhv2+pMkC2nz0to4vEvWVNHu
	/RmIC1QQmQ4NTggc7hJib8HLBjbpm8p7JodDx04Kc696QfMIykj0QrdQLhDuh1bI
	c+OCfZntT+OrlrghBo7T1p9mMsGvubpFHKWXW3OwPTXoYt4nQZNP+2xwj/Jymv3A
	XTj9gtUDPmQ5uWqXLAPZw==
X-ME-Sender: <xms:QMKCZmF8CkBBPbL8wAeNFQ7uxiG_BhduWX-7dREh78D6S8FXlg1wRQ>
    <xme:QMKCZnU3mL_wonJ9-dWMqCLxcqNKvoU4JIr1etgHTZHpbE833yqDNoXEsY3oHUtpM
    yNdf5p1yRzxdUTl4M4>
X-ME-Received: <xmr:QMKCZgIT3-KZqMOoW11MZCxZvd7lKEpL7mSooyWJ4Q-e-wMdppv7AYZ_dV4ylF24a-MxaoesTMTh94OhxPesRI1eiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:QMKCZgFQyooH8VzS4if6gifRcb6RGFLrtj1p9GRJnEWTbSRC1AMhow>
    <xmx:QMKCZsW6NLfXkewbjWbzZSXFU632rhxSwNgDRz1p8jkHhtgNTJI4-g>
    <xmx:QMKCZjMgw-UzCIyqJdvHy5Sck2kHRHnWXDwS61zXiVkcBA4o4VUUAQ>
    <xmx:QMKCZj0ZpH4GxMAFaxppd_ltn3QBz7299Q-iqZovG7oE1_Xw4FYdfA>
    <xmx:QcKCZvGIgsmwb-4Yvwop9mMvKyidOh7n2lJPsiwXyl_aQECV7IU5dFnB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jul 2024 10:50:40 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 2/2] arm64: dts: renesas: white-hawk-single: Wire-up Ethernet TSN
Date: Mon,  1 Jul 2024 16:50:12 +0200
Message-ID: <20240701145012.2342868-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701145012.2342868-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240701145012.2342868-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the V4H White-Hawk Single board as oppose to the Quad board the
Ethernet TSN is wired up to a PHY (Marvel 88Q2110/QFN40). Wire up the
connection and enable the TSN0.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../renesas/r8a779g2-white-hawk-single.dts    | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
index 2f79e5a61248..b5f182903702 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
@@ -24,3 +24,54 @@ &hscif0_pins {
 	groups = "hscif0_data", "hscif0_ctrl";
 	function = "hscif0";
 };
+
+&pfc {
+	tsn0_pins: tsn0 {
+		mux {
+			groups = "tsn0_link", "tsn0_mdio", "tsn0_rgmii",
+				 "tsn0_txcrefclk";
+			function = "tsn0";
+		};
+
+		mdio {
+			groups = "tsn0_mdio";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		rgmii {
+			groups = "tsn0_rgmii";
+			drive-strength = <24>;
+			bias-disable;
+		};
+
+		link {
+			groups = "tsn0_link";
+			bias-disable;
+		};
+	};
+};
+
+&tsn0 {
+	pinctrl-0 = <&tsn0_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii";
+	phy-handle = <&phy3>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
+		reset-post-delay-us = <4000>;
+
+		phy3: ethernet-phy@0 {
+			compatible = "ethernet-phy-id002b.0980",
+				     "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			interrupt-parent = <&gpio4>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+};
-- 
2.45.2


