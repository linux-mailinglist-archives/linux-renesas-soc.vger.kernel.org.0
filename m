Return-Path: <linux-renesas-soc+bounces-5019-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A218B983A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 11:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07081281014
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 09:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDCA51C45;
	Thu,  2 May 2024 09:57:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A625676F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 May 2024 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714643843; cv=none; b=JG+VgHk5pnykT63zKPA9yEzuWABVPXG6lkyMpFiMrTicuEJj57qTLRs70tMmA0GctdtCopJk3Qd8v6cyf24/55FdxaI6+PcQP09xcO6UP6aDfrvdS1uiW8t4eyHY6Jus0Rq/IjUNWUPbwLI7IWrQQ501NVBzCQ22zYlhh2YjsXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714643843; c=relaxed/simple;
	bh=i3bcuMyG4AM1MOLlMIZI1V5ciCzZ7sDRQNyXhrrOjzU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BO6Xq/eMDwBdbRApBAyrRfbpfO8DdlGgGuJ23/WqTWSrg9lXA1KHdN8NA8y5NFBbM+WX/4ZKCMlTnmCCRfc53bDKMGIAo56cmDTp5vvnKiVyKrunWp9TZMeBa533sk38HxURrZVvHXXU9vXWHrlfBVqzc/SML7pikm2MLmH0w8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:93f:7d7e:5c98:dabc])
	by andre.telenet-ops.be with bizsmtp
	id J9xC2C00H3PjoSD019xCxQ; Thu, 02 May 2024 11:57:12 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TAv-002nZZ-Vh;
	Thu, 02 May 2024 11:57:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TBg-004jYc-7P;
	Thu, 02 May 2024 11:57:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 7/8] arm64: dts: renesas: r8a779g0: Add OTP_MEM node
Date: Thu,  2 May 2024 11:57:10 +0200
Message-Id: <b6c501fe8422fb57da3997c8e96322724090794b.1714642390.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714642390.git.geert+renesas@glider.be>
References: <cover.1714642390.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the OTP non-volatile memory on the R-Car V4H
(R8A779G0) SoC, which provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index 9bc542bc616909d1..0f9ab81ce289409a 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -463,6 +463,11 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		otp: otp@e61be000 {
+			compatible = "renesas,r8a779g0-otp";
+			reg = <0 0xe61be000 0 0x1000>, <0 0xe61bf000 0 0x1000>;
+		};
+
 		intc_ex: interrupt-controller@e61c0000 {
 			compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
 			#interrupt-cells = <2>;
-- 
2.34.1


