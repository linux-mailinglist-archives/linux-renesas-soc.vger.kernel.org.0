Return-Path: <linux-renesas-soc+bounces-2589-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7017985099A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 15:21:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2C9F2281FBF
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 14:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDF25B5C5;
	Sun, 11 Feb 2024 14:21:46 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108F05B5BE
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661306; cv=none; b=JPcumQWS5zwPa5eSzkbNvHdb7PgfSpX6/tSFNRANp6VeTpX/fnR8Mtxh4/pzcBTik+aO3QlLZrHYdXdb7XErA+lhNQ6LDXiQzhYiIJoQ67xdXl8pGvYt4m2/38Ghhn123r1CIAM9+wgTX83tVOQjaCc2zK4RqRNE1Vum/FtGyYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661306; c=relaxed/simple;
	bh=LjFWgTazxp1J/kCEmH69UStVEBTsLX+AuBDb96QzGQI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CENkZE7cjdLX4Xt6oeoXcZnnQUHkRzCVZNc7mzCPwwyE2VZZ77yuzC4t62tXfO1iEngbS6FMFIh2OTDiaI/fDL4d5D8BoZQ6ruEB33ymXMGXWnzh4/kfq73mHQ02Cd0Sznb3o5BHPykuF41pahs4BekWBF5BaLgrv2v4KuvNhxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by michel.telenet-ops.be with bizsmtp
	id lqMY2B00B493aJM06qMYrV; Sun, 11 Feb 2024 15:21:34 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAhz-000Qh4-K9;
	Sun, 11 Feb 2024 15:21:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAi4-006Wmr-Jb;
	Sun, 11 Feb 2024 15:21:32 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779a0: Correct avb[01] reg sizes
Date: Sun, 11 Feb 2024 15:21:30 +0100
Message-Id: <ce6ce3c4b1495e02e7c1803fca810a7178a84500.1707660323.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707660323.git.geert+renesas@glider.be>
References: <cover.1707660323.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All Ethernet AVB instances on R-Car V3U have registers related to UDP/IP
support, but the declared register blocks for the first two instances
are too small to cover them.

Fix this by extending the register block sizes.

Fixes: 5a633320f08b8c9b ("arm64: dts: renesas: r8a779a0: Add Ethernet-AVB support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 2f8f2ccab8c23728..cfa70b441e329a0b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -667,7 +667,7 @@ channel7 {
 		avb0: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a779a0",
 				     "renesas,etheravb-rcar-gen4";
-			reg = <0 0xe6800000 0 0x800>;
+			reg = <0 0xe6800000 0 0x1000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
@@ -715,7 +715,7 @@ avb0: ethernet@e6800000 {
 		avb1: ethernet@e6810000 {
 			compatible = "renesas,etheravb-r8a779a0",
 				     "renesas,etheravb-rcar-gen4";
-			reg = <0 0xe6810000 0 0x800>;
+			reg = <0 0xe6810000 0 0x1000>;
 			interrupts = <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1


