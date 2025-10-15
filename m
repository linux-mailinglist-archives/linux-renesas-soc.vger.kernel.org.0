Return-Path: <linux-renesas-soc+bounces-23090-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 112F4BDF702
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 17:40:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F56F3C2596
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 15:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F31632C337;
	Wed, 15 Oct 2025 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ts5+XU4E";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ox3W2Jta"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19B31D730;
	Wed, 15 Oct 2025 15:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760542842; cv=none; b=eOhTdV2cBApsJZIiRoPMuiE+ipjnD3tIzYGzN+DWbLXdqgoLXYCMMDO4TK1V6uS3lKUkDWiPcrCJa/YwRSuPNbj97bsKHzi83aA4TO2QYbe+Mtc/EZFnfuw2vw4DmK3ujTS83835OqJ72tWbEIEoI0bEpDBsdcnEWp+XTtwOGoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760542842; c=relaxed/simple;
	bh=vXaxlDaljo3DrUaTZaX7U1L3tWLa3vJ9t3g1e5xesD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e6bHPyCtKYg14tFcB/ZI/4A+629rcTPqb2/ChZfSkHhzi6FaQ2py72VTUcKSlY1itmsVsRcOjs8cDaoY5fhMuY0JcDXH3BwCr/PrH4YG9nLu54/ocQdbIp3tLOTK+AJbPUPTazrpCvSmkks8ZkzBgSMFX4YFOMpc6ub6S/RELDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ts5+XU4E; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ox3W2Jta; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmwK12bwPz9tgG;
	Wed, 15 Oct 2025 17:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760542837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WALWGBujqpuz8lR80FyOJBIEDnbfCjtWd9uM0KYO5Yw=;
	b=ts5+XU4E9uoeHP5aS64D51GHt/43rxLYhmiO+ceTFAlILlRkBOW4nuwRPhS/QoDBsMaYaU
	KCPIayrqg7nsW4oZQ3S9IwE8p6SPMTeujQ53CjnBgInPF8bGhU18qcM+ONY4/fSACDfUIC
	lyL2BBOcApE3N6w+6rrmWUEpuBOLXSx2EMk1pj8YC62TU9FyeLXpfAd7DlAQe92R1qwpZz
	X1QZWMvhZq6ufUFICtCqXXkrmGFmqZEEmw1Ots7KGfwz7atEJspdd7Oa6pgngD4RLsMMLh
	57lt4tIyRcWKeA7UoMItrjtW2bKKVWuxMW0RIj63wpCSCES1kmXIyIYBkKNKcQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760542835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WALWGBujqpuz8lR80FyOJBIEDnbfCjtWd9uM0KYO5Yw=;
	b=Ox3W2JtanoRnnGjuRU71a1yZIYIdVPzwidldeUfyJ8Rh7BK1YGGrheGYY5oeSM6oDNZgzb
	bKsUn0gaex8TUY18GUGxZzMGPp5oNStT8JzPJKvff3p2YuFpnnso5FT+QdLPNFpEcUNl8m
	9CYL84WwKmJA+5rOq2keXj1PfIAm0jW8P4wt/aBNRNtx+3bCfe/wgyrU9r8GwjK/c4AU4K
	8LBEvA/Kax3eUKobLyaNjylwj0E3tJbzAofHE5Mzh0GkeSgN36I5dlwhmibhG/zLAWkfI6
	K5+pC3s652vYmuAtLZVngCxQ7JdGKXJhJF1YBE1fx1zlilWdFXCgFBnmu/Y9KQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
Date: Wed, 15 Oct 2025 17:38:58 +0200
Message-ID: <20251015153952.185249-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
References: <20251015153952.185249-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e2ada218b4f0bf9902c
X-MBO-RS-META: xes7cftrux7je99qpochttto5be99b3u

Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77961 M3-W+ SoC.

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add RB from Niklas
    - Fix up power-domains = <&sysc R8A77961_PD_3DG_B>; for 77961
    - Fill in all three clock and two power domains
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 12435ad9adc04..aa7f5de61e787 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2455,6 +2455,22 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77961-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77961_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77961_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77961_PD_3DG_A>,
+					<&sysc R8A77961_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77961",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


