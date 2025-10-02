Return-Path: <linux-renesas-soc+bounces-22601-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EE5BB4310
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 16:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18FDF1889847
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 14:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55D230DD32;
	Thu,  2 Oct 2025 14:41:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37B2EC08E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416069; cv=none; b=Y+XXg7TDgAoqB7aAwz9w6mxGObI/WAggLZDgXNsVbLr2vp9dA3Rrv+e4w5kGeKS5+fengTazqO7IpMvvsSdyz/mqf5SXrI1GPIGuwB4jBEUeBWIkrVLgGQqpKGyNX51jMD5qtEyuZ+3gPcDAkIlh7mJjjK2/YZVWFjGveMyeFm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416069; c=relaxed/simple;
	bh=Njl0fN8QCdlI7sR7ci10W19snRCJiUPSsSDb/9CyTns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CbWZFYVxclx1JzSSugpTHPFmwxXRdpF/iw4TfiFLhzgkL1kTmtyh6E5zJcKS0GN08wS6FoIOoXxaTL/A2kNHB1npsKrnRK1RDkr0Jg8rJf6PN5nd2DEnA2esrGrWZ32f/MrhSl1pwIdvm9kctAhXN+yqY3ifgc01m4XJuiv7VoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78C22C4CEFD;
	Thu,  2 Oct 2025 14:41:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node
Date: Thu,  2 Oct 2025 16:40:41 +0200
Message-ID: <8416011a488aa5ba883fca2647d09e21cad26351.1759414774.git.geert+renesas@glider.be>
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

Move the "interrupt-parent = <&gic>" properties from the soc and timer
nodes to the root node, to reduce duplication.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 13a60656b0447084..95e12b34f8bad37e 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -13,6 +13,7 @@ / {
 	compatible = "renesas,r9a06g032";
 	#address-cells = <1>;
 	#size-cells = <1>;
+	interrupt-parent = <&gic>;
 
 	cpus {
 		#address-cells = <1>;
@@ -63,7 +64,6 @@ soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		interrupt-parent = <&gic>;
 		ranges;
 
 		rtc0: rtc@40006000 {
@@ -522,7 +522,6 @@ can1: can@52105000 {
 
 	timer {
 		compatible = "arm,armv7-timer";
-		interrupt-parent = <&gic>;
 		arm,cpu-registers-not-fw-configured;
 		always-on;
 		interrupts =
-- 
2.43.0


