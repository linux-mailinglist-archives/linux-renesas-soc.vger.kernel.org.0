Return-Path: <linux-renesas-soc+bounces-9410-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0B4990429
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD401C20D1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82DD0215F5B;
	Fri,  4 Oct 2024 13:22:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84A2215F49
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048168; cv=none; b=e7gH8RvE2KxpdLwex9G4bvJBWUFKusIntyqtu/OcPvQwf5375/zX5sHyFjVgxYZIVmVJ0/b1vLhZpV4nRW0vQ5T5kWfrKfdSG7DY1Df9QxHVr62qAvtE49bRuGilE0/3qyI05YYpddhWLcg6fuZG5LXEU3QKwSckAJvVNx6cxac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048168; c=relaxed/simple;
	bh=GxH4g8iLzYBZNgggRiwxHfBBgjxajwi+HsC3+zBIRhg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CS3uNpjYPNnV27w+T2h1Oc9+rRnM8D3VcSBm1xCsr1nrC/p1+O4fgaKkc0Vww6CMVw/iWy7H7+2iszZPl4CSedfG99r9s7JkQvEb8IUbw6eYIBlt02hMQUIVvDFnFBtpAetZBR/tYLAKS6Oy8qZrXH52yPfSTDESD5p3S7zPLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by michel.telenet-ops.be with cmsmtp
	id LDNd2D0064NXpdT06DNde8; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGK-001Elt-O1;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yUB-D4;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 07/20] ARM: dts: renesas: iwg22d-sodimm: Use interrupts-extended for port expander
Date: Fri,  4 Oct 2024 14:52:49 +0200
Message-Id: <835b5e851939f6fa2c9567d6850a7e0c2574c1c7.1728045620.git.geert+renesas@glider.be>
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
interrupt.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
index 24411044ef6c4f0b..3ac2526a24a1e130 100644
--- a/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
+++ b/arch/arm/boot/dts/renesas/r8a7745-iwg22d-sodimm.dts
@@ -185,8 +185,7 @@ sgtl5000: codec@a {
 	port-expander@44 {
 		compatible = "st,stmpe811";
 		reg = <0x44>;
-		interrupt-parent = <&gpio4>;
-		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio4 4 IRQ_TYPE_LEVEL_LOW>;
 
 		/* 3.25 MHz ADC clock speed */
 		st,adc-freq = <1>;
-- 
2.34.1


