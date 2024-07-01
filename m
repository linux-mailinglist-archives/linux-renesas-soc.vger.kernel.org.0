Return-Path: <linux-renesas-soc+bounces-6947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6954E91E2CE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 16:51:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C6121F2288B
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Jul 2024 14:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6165616C86B;
	Mon,  1 Jul 2024 14:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="MbYr7JIR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OE6cmGWh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A083216C864;
	Mon,  1 Jul 2024 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719845442; cv=none; b=TU8we98AFlwYzwabtIik/flEg6NgMq8TO6IzKLkZM8dRzidxKXabkggDgGXeR6Pshi71OG1mQ0CQggqdjdtDGo8rX21IiodexoJ4VzaS99OGkxWAaN/VHflpi12dDqe8OQuuM1xiFQracc0QEBWrd75MNtLnqbIOWVhgjLbSl2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719845442; c=relaxed/simple;
	bh=dR8Ja5vm2Cr3wHogMm5wnlzQ1uEw9RG52Gma9EEOdHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lhj2W4e7hqxQym6uhccAORajpwGiNIcNsQfTnU1qGu3+hYtkEP11RJNKIVIqfoFPsKhmVSk+qDKSpRbh0JRyl6gmSQnHvDRhnzeo4PY6T9iLe+0EYPBsIXgQ0X5a+TpiRgDNaaluCvuVECTnLQlhDK1WJGn0VsLsXdYNiWwOoj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=MbYr7JIR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OE6cmGWh; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfout.nyi.internal (Postfix) with ESMTP id 9B5CF1380194;
	Mon,  1 Jul 2024 10:50:38 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 01 Jul 2024 10:50:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719845438;
	 x=1719931838; bh=3GEVtm8FOMBqPO9W0qZGTKOCQi2JN/k6F6NQ58MmTC4=; b=
	MbYr7JIRfFoLnU8v4u3aJL5jFWQzefz9AVfgMhhjekOBTy6wxY4SP/lj+CJKeZvl
	sk8+ZFkDl9+5hWo2M5AKGxYbG8LQaLf1+A4NxeFm2+tCnY4UsDwJvxCdHKj55ube
	WKGQZ/CMJvhe8ClPAzMdFAQI9fIJQoEYOhXIbDKfitrTikYK9JfKd9yDyOWgBfmD
	165ASyZz/kygtPkv4U4b+C4sbTW3T+6mhY/e+qsTz5X7ymEYmK9vnhjHl5NGBOZL
	dMTTvbEiy/klxLK7AiGzpYl7LqMMCfT9J9y9/aD2REFP2hgxjSJDgi9Hsvw43W/E
	UzFUdMqTNUH3WHQ5K4yV3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719845438; x=
	1719931838; bh=3GEVtm8FOMBqPO9W0qZGTKOCQi2JN/k6F6NQ58MmTC4=; b=O
	E6cmGWhDBlSy4FGRchltK9UgUoEXm/n6A6hMbQVobXVhiSSoUqRVFhwtZtfBTx0D
	RFh5uP4l0GlK12JSOkYxaNLyOzYhbt7MMeY5JmPj8dZS1AvSarvE0FDNTkocy+DG
	1aILED24aV3X83uq+rhGmkLhkm7kmxLaSJVC4JeI1k8TAMlgDJsgtw2kb/XuHTBp
	s+T5g+0sW0S7zu+Q1MCQx1t9Mrw3Jom++Ekog8QEVTigdrzKZ7O3Ig+hBc+dt37w
	CVsQ8vRViZZPQbkwGczFRORieeI5y0g19JjZSWZcMJoyE3cljk7E5UobXp+jRHge
	LAZji3W7qyuswz1MYlv+Q==
X-ME-Sender: <xms:PsKCZpYtfiaezWkzDF-Sm0t7hsepaNVZAcyViNudrq98DgV9SzA2IA>
    <xme:PsKCZgZJ7CLQe54koogsA7S2v5lHAlCheLpSIwQv9qncvcT9xoR-W3LTdVkookO4V
    kjdCuJP32-OGanXViE>
X-ME-Received: <xmr:PsKCZr_THqVA7fOygGTleGVaoy0h56l5iYhRZRn-4V_Z0-D9TOGPq8Eyh3e71lvZX9IsJ0YJ0-l-rdxaWxG1EOKZNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgdejlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvg
    hsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepheeigfeuveeu
    tdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfeegnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghr
    lhhunhgusehrrghgnhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:PsKCZnouVRtdLONZxNcIqb9zAYy6k3xKs-psXzP7I1RSE_-w3i6RRg>
    <xmx:PsKCZkoqwgtX8UwMQ3lhwdcv-K4YxbpJ1UD9uxPeliBea1WrLMNP7Q>
    <xmx:PsKCZtQZyRzdYSembA5H_tn6Cf_QFFS1VQaqZGyiHr-WvTB0M2kjNA>
    <xmx:PsKCZsoI4gh2q2x4gSQAQ675gxuyhh93obDXGAj6G59jgN2s3Xn9Hg>
    <xmx:PsKCZsIgsv_kE3GPhh0HRUNZ8nH60rsuThe5lBDz0tEFT0KECqrtM8Vx>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Jul 2024 10:50:37 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r8a779g0: R-Car Ethernet TSN support
Date: Mon,  1 Jul 2024 16:50:11 +0200
Message-ID: <20240701145012.2342868-2-niklas.soderlund+renesas@ragnatech.se>
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

Add Ethernet TSN support for R-Car V4H.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Dropped #address-cells and #size-cells as there should me a dedicated
  mdio node for the PHY.
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index c5fc414928c9..bdbc230f26b6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -558,6 +558,20 @@ tmu4: timer@ffc00000 {
 			status = "disabled";
 		};
 
+		tsn0: ethernet@e6460000 {
+			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
+			reg = <0 0xe6460000 0 0x7000>,
+			      <0 0xe6449000 0 0x500>;
+			reg-names = "tsnes", "gptp";
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tx", "rx";
+			clocks = <&cpg CPG_MOD 2723>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 2723>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779g0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.45.2


