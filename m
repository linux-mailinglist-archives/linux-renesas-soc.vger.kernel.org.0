Return-Path: <linux-renesas-soc+bounces-23402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ACFBF9DA8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 05:39:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34DBF19C4637
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Oct 2025 03:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CCA238C1F;
	Wed, 22 Oct 2025 03:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="CVBykxuA";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="l5fpUsj1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D017248F51;
	Wed, 22 Oct 2025 03:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761104365; cv=none; b=r1V/KRe2VopgjynKSZP6ixCZNRnn4B2SV0wWhZSViHR1CBbZ4dk6+e5aPlTz/N9XJzsp9n5EFKDxKtiniGyDnFBmLL04Xu3TctYz/7TMgs8AaMnbR6qISYGdzdztpwlUumV4Xr60f5DqjwAIHPNUPB8Wijm8MUW5+iVSeFQNs0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761104365; c=relaxed/simple;
	bh=Qhq+mtdrpC5KQmuRTYsQyPG2/xLfK5Zp1bANkcHOc9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aX4z7irYWH2L9Oo2oxaeduk7fscDDzcd1FzdL5E0OgRUkTiuSKSUho58rlNCfzGeMhH5/1QhkXL9wAiPb9+e4RXE56SS6NJH2SgKCctD9pGOIN0hHpaLEo6SWdcV6Kg0Se5ebAmczCXUv1XeF9xWRqpQ1vQxikwwr/QQ+UEAVQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=CVBykxuA; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=l5fpUsj1; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4crvzS1sqlz9sv4;
	Wed, 22 Oct 2025 05:39:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761104356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKwgLB8FkO0dhUYgXj3M0MYpxaqmrxuN5ELsmbxw00=;
	b=CVBykxuA4TGhn81ojCRn8bISletRhSntBXBtpccr5/g49yc2HAx/hyl8yijcF/5Q4H3K3v
	IOME36VTKaWgUusTvHyvKmpeekPdKytptZBEMqcamMCecIKu4K2ovaZwmFSeRdMtRhaqtM
	R5WUQq3zr6CSaDikGHrv4awMDBEKwgYBPqa2wdLiu7i0N1aSZ15uGwg62J1J5/TPLrTgbm
	zt6OCgNwJy7kNyP2a1BLiAOs8O9oOMOVTENtx/BHhnP82eQMbwERGN1Yt1AvsIAXGasQ9Z
	rVDHVb34n389pfEWudblmkQWU7v+R8ZcR8CKUWw+gV+8/fvYQ3eHRwO7+lidew==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=l5fpUsj1;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761104354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EVKwgLB8FkO0dhUYgXj3M0MYpxaqmrxuN5ELsmbxw00=;
	b=l5fpUsj1K0Hj9ZH0grQXC/oYIJp2DP/ASUhqG2ipGKfZDY91ms6zs0tKvceVpUKdbi0CKm
	av9usi61WlcCFbIz3x1Zv5L0UHBDVtFs96RjUa0UBPWKJs8HnMSHc9PSlV154OZMtieLen
	AUbFML7NRTnBE4uS4pily0XSvaAAGt6dK4kpeNoV+SREHDEdpA9YBdmdzyPeKTy+qaW4ET
	bhKHwnmw1LcvvLfndL48R/q6EHIMc3bR3gz6pX1OxGqM/Ww1yVBB3dr0++O5mK8L+O9e3D
	jVTLKrDh6y5T5LDmMlhEO94rnxHidJnGYTg1/W7shMMGYcx1butkUEiy5vWBtQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Matt Coster <matt.coster@imgtec.com>,
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
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 2/3] arm64: dts: renesas: r8a77960: Add GX6250 GPU node
Date: Wed, 22 Oct 2025 05:37:56 +0200
Message-ID: <20251022033847.471106-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 277680da7b3c2d126cb
X-MBO-RS-META: 7kfgk3esuf7nd3gxtk5fd7odw1qb8ff8
X-Rspamd-Queue-Id: 4crvzS1sqlz9sv4

Describe Imagination Technologies PowerVR Rogue GX6250 BNVC 4.45.2.58
present in Renesas R-Car R8A77960 M3-W SoC.

Acked-by: Matt Coster <matt.coster@imgtec.com>
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
    - Fill in all three clock and two power domains
    - Use renesas,r8a7796-gpu for R8A77960 compatible string
V3: - Add AB from Matt
    - Disable the GPU by default
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 5b7e79b413394..e03b1f7cbfd6f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2575,6 +2575,23 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a7796-gpu",
+				     "img,img-gx6250",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_ZG>,
+				 <&cpg CPG_CORE R8A7796_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A7796_PD_3DG_A>,
+					<&sysc R8A7796_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a7796",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


