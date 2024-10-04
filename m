Return-Path: <linux-renesas-soc+bounces-9398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0FF990412
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75B9F1C20DDA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BB0215F46;
	Fri,  4 Oct 2024 13:22:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8992139DB
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048161; cv=none; b=G4Rtt8xGndk0aWoND6FvYJgBog0vLXgoV6G9zWVL37EcoG2m0/pPIyUzkp/qLQctzkDrBXoxtUsXEL59xCbm5Qe6cRJdo0CFmQAIKmE8sH1nfGa6KFUbwbPbJrmPXUDahu6okv2+rPD9A3vhLIqobPggHAnA4Yljp305TZkgkio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048161; c=relaxed/simple;
	bh=VpTJqIHW0cQ8e01GhtC2xGeA98VW7Nkv9TjvRbP/csA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nDOnilQKO2VZgozqLmMS1CcEPjbFHybb8IvhEgLhIxMY6gPOPbK29k0pnadbM8PjfAi+P+UmXiGUSR6DObMyreH83lbAK4KaFeeqsIqpxgU7PaU1o0ZLmc1gcT+5fnjnMRqR3mplnEhbV1puIqeFnJiY1TDOkszO+uzPPAZp0BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by baptiste.telenet-ops.be with cmsmtp
	id LDNc2D00D4NXpdT01DNcjV; Fri, 04 Oct 2024 15:22:36 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001Ele-At;
	Fri, 04 Oct 2024 15:22:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUV-H9;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/20] arm64: dts: renesas: Use interrupts-extended for DisplayPort bridges
Date: Fri,  4 Oct 2024 14:52:53 +0200
Message-Id: <2b217486221d90eb3c127f5e44f9c886161ab8c6.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi   | 3 +--
 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 99b73e21c82c2b18..e8c8fca48b6963c9 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -208,8 +208,7 @@ bridge@2c {
 		clocks = <&sn65dsi86_refclk>;
 		clock-names = "refclk";
 
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
 
 		vccio-supply = <&reg_1p8v>;
 		vpll-supply = <&reg_1p8v>;
diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 6dc968352c046129..36f5deb7f24afc2e 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -246,8 +246,7 @@ bridge@2c {
 		clocks = <&sn65dsi86_refclk>;
 		clock-names = "refclk";
 
-		interrupt-parent = <&intc_ex>;
-		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupts-extended = <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
 
 		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
 
-- 
2.34.1


