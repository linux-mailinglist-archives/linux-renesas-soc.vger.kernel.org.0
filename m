Return-Path: <linux-renesas-soc+bounces-20461-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C0DB24AB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 15:37:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82BF316BF2F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Aug 2025 13:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8DB22E718A;
	Wed, 13 Aug 2025 13:37:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065E7261D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Aug 2025 13:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092232; cv=none; b=vDv46IrhSOZGwoBEPSY09u4pFJD66Po4bJjM/tpkfibVQWuJAfpwGnb4o8RuoKxWFbGVkbgYZUgBRLzjms+c3e0olDiUfgpARGahYp58Ffg7My9lmG17pNw6TTJshAMInZLTGaZbOyexPIw92Z30omVcfi280yKI6AwZyy+9ly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092232; c=relaxed/simple;
	bh=ktKxQiMLbKMiCxhoxiMnH4GKIOxbmgjqq05sEvaY3xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQxkpcZWk1JEkG+6Io+hqubAQCy/XD1GYKuz5v96rKVeThQccWfK/5GMG1DmeZ5bGRixN39ZcRKRbKlxu1k37eWqiURmt1yOaBIdF5pgrc3MmFe5WF1TZNmomhVJite8dxuH8jhrZ+AzLgzyxgFuo3eGYvIRlXVje2EKBw5v+eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A02CC4CEF7;
	Wed, 13 Aug 2025 13:37:10 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
Date: Wed, 13 Aug 2025 15:37:03 +0200
Message-ID: <d1ca3cd184193084b6de4332d47d0aee1923f6a6.1755090456.git.geert+renesas@glider.be>
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

Currently, all R-Car Gen3 .dtsi files configure the CANFD core clocks to
40 MHz, which limits CAN-FD data transfer rates to 4 Mbps.  However, all
R-Car Gen3 SoCs except for R-Car D3 support CANFD clock rates up to 80
MHz.

Now the R-Car CAN-FD driver has gained support for Transceiver Delay
Compensation, increase all appropriate CANFD clock rates to the
documented maximum, to support data rates up to 8 Mbps.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a77951.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi | 2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 6ee9cdeb5a3ab478..c389ebc7e6ce8f00 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -1373,7 +1373,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A7795_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index a323ac47ca70f3db..6d039019905ded0a 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -1245,7 +1245,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A7796_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 49f6d31c5903b8b3..1637b534fc68b19d 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1245,7 +1245,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77961_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 136a22ca50b78674..353a771870893994 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -1108,7 +1108,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77965_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index 01744496805c3200..e7a5800bf74216fa 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -568,7 +568,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77970_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index f7e506ad7a211a57..964aa14f3e65d925 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -621,7 +621,7 @@ canfd: can@e66c0000 {
 				 <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77980_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 6b8742045836b9b9..e16ede6eb3791ad1 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -1061,7 +1061,7 @@ canfd: can@e66c0000 {
 			       <&can_clk>;
 			clock-names = "fck", "canfd", "can_clk";
 			assigned-clocks = <&cpg CPG_CORE R8A77990_CLK_CANFD>;
-			assigned-clock-rates = <40000000>;
+			assigned-clock-rates = <80000000>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 914>;
 			status = "disabled";
-- 
2.43.0


