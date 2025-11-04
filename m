Return-Path: <linux-renesas-soc+bounces-24081-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E89A1C3156B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 04 Nov 2025 14:58:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA3918886A0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Nov 2025 13:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF48432AAA6;
	Tue,  4 Nov 2025 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="XqnHzGMw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hsvFXjC0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AF232AAA0;
	Tue,  4 Nov 2025 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264666; cv=none; b=oCTjGH3fHeD13jt1h+nX1P56yk+snUR5uvamQUXTkdmTAgJOrvDZb8pkEbbVdiytLM1SZYihIAl3hAMGQMwD6ndq01a13+1+M88JHh5inanRaTSwmiAV9s08wUX1Hf7faJgpH+AoTjr+RQvhRl7hzS9+hgGGEnUaqo0EYnyW3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264666; c=relaxed/simple;
	bh=Y4qo3kFR4XB1SRPLi/OImGlV2UO8B5qGOcOW6BztSqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RB0q3/XAkrBPhSH9FxB2vOThlKg13QOrHFU7CXTvXBTAaH9c0rklpwkdvdvIHq8eFDQWO5hXV8VgVxVy3WpGpsVF59BBp0mIsfQPfqAt2ygyvd4HXz7Wyu/GyZEhyhgt2BvBwE7MQHe1zKK9MzbGrArkgVrVxp1gduMM0vBfSPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=XqnHzGMw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hsvFXjC0; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4d19531mXkz9tdy;
	Tue,  4 Nov 2025 14:57:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+4v08Xiy+uTM94ewOyhc69Z/ILAxeJA+JIfK4kmp4w=;
	b=XqnHzGMw6/+lZcOqhupS8oqPCiKbPn51s0ypPsgrzL/A9NL18yKbKpeKm186LZZQ/uRqv3
	uEwAku63wFsrc4j+D1ChrikYJb1dNXgDLxudaA20doo+R7UQLbWwgZdX8P1GcS+xAuvhWV
	4zyQUa+N9k1wkUmn6XCoa7OM9oq9ph673/Dnh1YT8HNc3kQpp30T2HgE6HqWiJYR2lPj6h
	SwlCX8/YmTboSr+p9v+hIO3EqeIrOrC3E79sMsh/CYxQjHoj9HrX2V2Rjjnr7wpwFR6AnA
	27dFyk/rcA7e+RWtFmGlQC5eTkDSXcQ7KfOhML2zHsYyfPj2nLu8ZPtNWHThGA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762264661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D+4v08Xiy+uTM94ewOyhc69Z/ILAxeJA+JIfK4kmp4w=;
	b=hsvFXjC0zOOXdSyNmlFdVdsMQmuaK4nt2XDzpd7HIb5eTT5QsHDZFTDU6tNtIcy+VaE84p
	+QEGjO5zf5VQFG4eqIF3maWcthBDP+cIo7VQ8f2nTz1BA8g5CQWdd/cKvZX4XQhD2oadXZ
	ALafxiPPaOC0HpUVHpdtytA+fE+/YwgRKgnbZpyoUw0G8H6fRMDLQpI9kD9obDFSJCC+v+
	sZEAXOqlhmRR9q9G9sNplHSrGaVI3pkr7JRpnxNZTOLV7s6F7McaEBtA/sW37xH6eV429+
	KNuiGNz2CJNvGSlKvCJ+UcnpB2LUv97evt4FP/Szb3uxY2mzFUM602NQVnGcXA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: renesas: r8a77965: Add GE7800 GPU node
Date: Tue,  4 Nov 2025 14:56:07 +0100
Message-ID: <20251104135716.12497-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
References: <20251104135716.12497-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fd6q819nhbkcsuqcwjz45r4cicp14c4m
X-MBO-RS-ID: f50eafe9fe47865ebe2

Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
present in Renesas R-Car R8A77965 M3-N SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Add RB from Geert
---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 0868b136883c..4e730144e5fd 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2450,6 +2450,23 @@ gic: interrupt-controller@f1010000 {
 			resets = <&cpg 408>;
 		};
 
+		gpu: gpu@fd000000 {
+			compatible = "renesas,r8a77965-gpu",
+				     "img,img-ge7800",
+				     "img,img-rogue";
+			reg = <0 0xfd000000 0 0x40000>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77965_CLK_ZG>,
+				 <&cpg CPG_CORE R8A77965_CLK_S2D1>,
+				 <&cpg CPG_MOD 112>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&sysc R8A77965_PD_3DG_A>,
+					<&sysc R8A77965_PD_3DG_B>;
+			power-domain-names = "a", "b";
+			resets = <&cpg 112>;
+			status = "disabled";
+		};
+
 		pciec0: pcie@fe000000 {
 			compatible = "renesas,pcie-r8a77965",
 				     "renesas,pcie-rcar-gen3";
-- 
2.51.0


