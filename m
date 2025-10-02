Return-Path: <linux-renesas-soc+bounces-22590-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DAE8BB42ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB71819E0AF6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F03A30DD32;
	Thu,  2 Oct 2025 14:40:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364D62C027F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416052; cv=none; b=huZ3T9gNN4aWgfisfOQdcyadocXbMMCuQPyi5bXlOuXrc0dy7UG/LRP4mxHJJIGzekmGDY42o5a7boVCEKpNi1OkrqbQUydQFcQixmNkXi2/6dSFMzOAJvZmxpxW6nAxM8qSWJpQVnMlCF+P497hQfVj9s48oYQwgtKA6U/mglQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416052; c=relaxed/simple;
	bh=cUmDAiwYY0lmBzAvDSVC2RbAXY28u8fPkYZmZYEt3Vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bufNOMskkh3uqUu7nXQ3JFXo0LlaOZJC97LdocjMKODa4akLzT6LcmZLQ9i6PzW9PbxfNM6xubwYux3sDCauGyTM0EBSbrsx5ScKVYqNoSJoGEij6AbZM8fWRCr7shu1riUxVk269TO/O1weXVAsahkGvy3OHxUekm70rhts7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0739C4CEF9;
	Thu,  2 Oct 2025 14:40:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/13] ARM: dts: renesas: r7s72100: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:29 +0200
Message-ID: <6aaabd73f6732f932b5708b1036a9c398c44cd19.1759414774.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759414774.git.geert+renesas@glider.be>
References: <cover.1759414774.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the "interrupt-parent = <&gic>" property from the soc node to the
root node, and simplify "interrupts-extended = <&gic ...>" to
"interrupts = <...>".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r7s72100.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r7s72100.dtsi b/arch/arm/boot/dts/renesas/r7s72100.dtsi
index a1e4e9ac8f621acb..245c26bb8e037ce6 100644
--- a/arch/arm/boot/dts/renesas/r7s72100.dtsi
+++ b/arch/arm/boot/dts/renesas/r7s72100.dtsi
@@ -14,6 +14,7 @@ / {
 	compatible = "renesas,r7s72100";
 	#address-cells = <1>;
 	#size-cells = <1>;
+	interrupt-parent = <&gic>;
 
 	aliases {
 		i2c0 = &i2c0;
@@ -84,7 +85,7 @@ p1_clk: p1 {
 
 	pmu {
 		compatible = "arm,cortex-a9-pmu";
-		interrupts-extended = <&gic GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts = <GIC_PPI 0 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
 	rtc_x1_clk: rtc_x1 {
@@ -103,7 +104,6 @@ rtc_x3_clk: rtc_x3 {
 
 	soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
2.43.0


