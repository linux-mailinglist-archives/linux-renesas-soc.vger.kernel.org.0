Return-Path: <linux-renesas-soc+bounces-7539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AE893C91C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75FBB28451A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2145FEE6;
	Thu, 25 Jul 2024 19:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="gAZozDvp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2F64D8CB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936972; cv=none; b=FNOE3/c+IEBeqayBsT6B5Ko+GAoDkOzjLVXwU6XXZpKccWFZcuC8hpDeWpxBzMVmIxr+7ft1CjRZngqZ41wvATK+n6XDkHSvkN4XqhexMCBBXqbdUHXEF4IrUpI4yuMrQa+RjDKr5fO5jqNKW/584A0DLZAPzubKaGR/wlzWwpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936972; c=relaxed/simple;
	bh=YMtCYT6ECddCr+hRLtPKFJNhWU2AOPNdcuzcuXaHQhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDLqq/F44sCOwArzHe6bvFhrbQ42cZyYsd2hzJXAppVItgt0nIR/VLuVs7B1k/Hln5ADuCUauHnXQpfvmDtXRJ4IHt7087GrepzdtIBc8KtJZFsnoglkP+ZluJTH9KbDJu9mNMSMxNbKYRJ5ZRq5TYi8yK4pbvOBzO/j26XkK2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=gAZozDvp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=6pLIssl6f0AQDJ56js/PcWkGNoDzsML07G7rrFNxDqM=; b=gAZozD
	vpuf9xOgjG4IXxJxOztbBw19HzHZIKo0m0LJnjJJXp+HHwlYKOCnibl/qwuwMi/e
	PD+kRnxoPKhhfkWPwYDtKGMN/LpZBbkbUV5Hu4xKOv/2z3cAKvNu2zbcR2xXDWYS
	iZDwxUAmsICntVkr39/A0jcTNq94HdH3ub7rw+roThhmqBdp0JhXluXktxYEhW5d
	VWsRWeb2/vBRtefIhEvptpubocdZvDiKgTrVE+gfMfOGf/l21GpdbSkJLV4Z8Ggc
	VC7w6BcSTXW2+7QtzwMVDKfAUhqH9pjwDVs5CmhSQGudhw9ycEPItnq6eidAlEvU
	DuZAfJ9VPu+shVwQ==
Received: (qmail 3088337 invoked from network); 25 Jul 2024 21:49:28 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:28 +0200
X-UD-Smtp-Session: l3s3148p1@j8RWsRceRrwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Khanh Le <khanh.le.xr@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 3/6] arm64: dts: renesas: r8a779h0: Add PWM device node
Date: Thu, 25 Jul 2024 21:49:10 +0200
Message-ID: <20240725194906.14644-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khanh Le <khanh.le.xr@renesas.com>

This patch adds device tree support for PWM/TPU on R-Car V4M (R8A779H0).

Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
[wsa: rebased, dropped TPU part to be upstreamed seperately]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index a03ab2b6a859..000ea93d65e5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -781,6 +781,56 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a779h0",
 				     "renesas,rcar-gen4-scif", "renesas,scif";
-- 
2.43.0


