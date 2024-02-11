Return-Path: <linux-renesas-soc+bounces-2588-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF24C850999
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 15:21:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2624F1C20E16
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Feb 2024 14:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAB05B5BD;
	Sun, 11 Feb 2024 14:21:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9D5B5C9
	for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Feb 2024 14:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707661305; cv=none; b=RQEIDlTq0Pqx7IoseTS+kf72TDWlEUDstOjzLOBpxSatBuMgHy57K0D7GJ5u4oWglr3wnTHY533dC6Kbiy89m/q2n/yYSJDYk5OJiYF3QVIhXLc5hDw+UuE16a8nchMiE1evVNerP5+/MpKKaYgnPHXyJZ9HrIBISQY/LimxWrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707661305; c=relaxed/simple;
	bh=OveleW9YbCEfEeicmpbVBXDqdfRnXhCShB0FV4fuRxs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K7bgK3HJphcD5eQCMHNscRt4vTKmptdh89eATuQqli7OxrkjiK5+95PkURx/YazUjXBkchnIIj1sQIFDdj1txfunbCLCMffNgqlkRbn7Bn48ZBzysjpKYgssevCvSybBfxAHRri+k9liSSoSACqgjGmLx6XyJ5TxXrEvvNyYDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5c16:aeff:e73f:ad67])
	by baptiste.telenet-ops.be with bizsmtp
	id lqMY2B00G493aJM01qMYAb; Sun, 11 Feb 2024 15:21:34 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAhz-000Qh6-KT;
	Sun, 11 Feb 2024 15:21:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rZAi4-006Wmu-KE;
	Sun, 11 Feb 2024 15:21:32 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: r8a779g0: Correct avb[01] reg sizes
Date: Sun, 11 Feb 2024 15:21:31 +0100
Message-Id: <83437778614a7c96f4d8f1be98dffeee29bb4a0b.1707660323.git.geert+renesas@glider.be>
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

All Ethernet AVB instances on R-Car V4H have registers related to UDP/IP
support, but the declared register blocks for the first two instances
are too small to cover them.

Fix this by extending the register block sizes.

Fixes: 848c82db56923a8b ("arm64: dts: renesas: r8a779g0: Add RAVB nodes")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 7b05b9b3e0a85f44..9bc542bc616909d1 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -776,7 +776,7 @@ channel7 {
 		avb0: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a779g0",
 				     "renesas,etheravb-rcar-gen4";
-			reg = <0 0xe6800000 0 0x800>;
+			reg = <0 0xe6800000 0 0x1000>;
 			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
@@ -823,7 +823,7 @@ avb0: ethernet@e6800000 {
 		avb1: ethernet@e6810000 {
 			compatible = "renesas,etheravb-r8a779g0",
 				     "renesas,etheravb-rcar-gen4";
-			reg = <0 0xe6810000 0 0x800>;
+			reg = <0 0xe6810000 0 0x1000>;
 			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.34.1


