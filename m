Return-Path: <linux-renesas-soc+bounces-16904-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF04AB18F4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB134189F51B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63612248B5;
	Fri,  9 May 2025 15:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="meSdd+cQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976ED136672;
	Fri,  9 May 2025 15:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746805172; cv=none; b=mo1vxRKQbOOphxU6iCCXpEed7/KBBLNclRDZfjektKsh/Zqbbg7a/r+HdR+bodNuc7cOcUlpS1rizk+B2aPzyUvnGdcxkjB5glYRWQL01tI3EWdh0KUvG44BSa7uu8Dw5f0U4PK3NmSWscXusGrH3x+iq5GyXEOtyzQeYdepg0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746805172; c=relaxed/simple;
	bh=h35KYhyDIY5FYpoH0z1DlbM6R9T4ekv/dXpUMKacj7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qx5QE1IGG+e1rVSv6G7OCeDqnZAxamM9uLWIlifNGajZT+IQuFd6fxrWOZr5zvG+sv7vYT8PJr+qW+OSKdHoPG21vPyUCPV+byQp05NFxJeOCJbodLCKGkkGnZYMJFa/WbDoVLtPd1Tuxwd+9nmwISKuFRGJRMHAlAGVNdhAnCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=meSdd+cQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3CE8C4CEE4;
	Fri,  9 May 2025 15:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746805171;
	bh=h35KYhyDIY5FYpoH0z1DlbM6R9T4ekv/dXpUMKacj7c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=meSdd+cQkAcZMRTu/XE5E9PC5QCOgy4oI2z0NCbqt89fIE/gZbnMkd0Zw/jbXO9Qj
	 nWH9PWj3OTf8KbvTBCnXnpJw50jcjl1OlhtHbHTqdMo8pViaBBdT3xuIhxqUWE2MOf
	 TjBxgsWGx6kB11wgPls+veS+qTTdaaGxURCTw4BCzDwKt7V2Aj0JvJJlbsuIn/M4Oo
	 tRzTYCAVVls9vUlMMzw2GN+CAaKDq/a929hBst+U2+wfwG60EJ1htnOqOLI1EoRfoD
	 sjnkWPhuew0yyZ130ZelHWGnQNyCsRfI4uOPc4EcnFWAUU1pDwZzOxphCozb9fyOkR
	 aaXJNbVf8bt7w==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
Date: Fri,  9 May 2025 16:37:59 +0100
Message-ID: <20250509-mantra-trickery-56f699596346@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509-sapling-exhale-72815a023ac1@spud>
References: <20250509-sapling-exhale-72815a023ac1@spud>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1190; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=VAAp3Lqucp6m4bL2Y2Prj3TWCfZjW9uhGkbCvekmR9Y=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlyiqFHm4XeKr7gPH9WNImJWzb92b/l70VeO2W5hrbuW 6B7ulmjo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABOJusHwV+5u25LDDZ6sHx3y klT3ydy9+8Y74L6kjX7Y2t8zFW5L7GH4H8n/7XzO5kjn+U8n/CueGbTjTOMTdx19r+64Y0Kr2lf mMQIA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

When the binding was originally written, it was assumed that all
ax45mp-caches had the same properties etc. This has turned out to be
incorrect, as the QiLai SoC has a different number of cache-sets.

Add a specific compatible for the RZ/Five for property enforcement and
in case there turns out to be additional differences between these
implementations of the cache controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index e0ddf8f602c79..66c6fe0cd162f 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -143,7 +143,7 @@ plic: interrupt-controller@12c00000 {
 	};
 
 	l2cache: cache-controller@13400000 {
-		compatible = "andestech,ax45mp-cache", "cache";
+		compatible = "renesas,r9a07g043f-cache", "andestech,ax45mp-cache", "cache";
 		reg = <0x0 0x13400000 0x0 0x100000>;
 		interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
 		cache-size = <0x40000>;
-- 
2.45.2


