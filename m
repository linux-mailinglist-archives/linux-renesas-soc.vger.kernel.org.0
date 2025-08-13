Return-Path: <linux-renesas-soc+bounces-20462-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A27B24AB7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 15:37:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B9C2189BA70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 13:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A273F2EA74A;
	Wed, 13 Aug 2025 13:37:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890432EA739
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 13:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092234; cv=none; b=ttgRhakrjNG4hAo+ag2AUaJhaxAFINL2y7W3o6SPZUzJzc4yGLayKGrElL5h6hO0xOI9wZUQqYo4w5sIuJcsL0j5dHNXeyBYH+ZUiz5tSio6dDs9tfjpzcVvOpusNzEJb2kDUqfOoPnW9NuYu5fMsK3yV8LxEOOh9S+VGNkjPNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092234; c=relaxed/simple;
	bh=+LjAaVigsJHWqTNRzr3rwMr8FXI7kRikX7E4MWwDAZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jGttQ8q9c6ptyZ2er6If1ZjXBXguFCl+/zBId4l/qiAOGQHc6iPz095Z/S4wNeH8AYfCEdsHOcdvCheRV4MlRK84T7foc7+/lbnJlqZlVSAKJCP7h/M2/eJrRhWED/zia3cvo6dFaVNvyx/IjgHokHcDlNjO8e7g6I7dAYaFrtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6B4C4CEF5;
	Wed, 13 Aug 2025 13:37:12 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: rzg2: Increase CANFD clock rates
Date: Wed, 13 Aug 2025 15:37:04 +0200
Message-ID: <0dd1c17135707587e9e9d6d68b2eaa1921fbcb7a.1755090456.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755090456.git.geert+renesas@glider.be>
References: <cover.1755090456.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, all RZ/G2 .dtsi files configure the CANFD core clocks to 40
MHz, which limits CAN-FD data transfer rates to 4 Mbps.  However, all
RZ/G2 SoCs support CANFD clock rates up to 80 MHz.

Now the R-Car CAN-FD driver has gained support for Transceiver Delay
Compensation, increase all appropriate CANFD clock rates to the
documented maximum, to support data rates up to 8 Mbps.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index c8b87aed92a368b1..6b737d91b320f483 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1186,7 +1186,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774A1_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index f2fc2a2035a1d491..3f15d656215e15e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -1070,7 +1070,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774B1_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 530ffd29cf13da00..55df063cb32327c2 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1029,7 +1029,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774C0_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index e4dbda8c34d9eaef..5d730b488d46f24b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -1298,7 +1298,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A774E1_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
-- 
2.43.0


