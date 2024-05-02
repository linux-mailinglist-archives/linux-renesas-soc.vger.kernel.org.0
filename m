Return-Path: <linux-renesas-soc+bounces-5022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCD8B983C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 11:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53DAD1C21476
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 May 2024 09:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0063956751;
	Thu,  2 May 2024 09:57:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7868756770
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 May 2024 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714643844; cv=none; b=lyl+2PEqFhrgZWJzwgzrShkx2h3R6KdbeK+6dwfqB7QflzmzsHh9+tuiG596pr5QOITyQaSqzt7xjdlYZADDZx76iTmOicq86nKlwZK8lGBWvHJza5diY0rALgjH6R659rywN2umm1wMEMFYLbpeHM7C75tN2wNDKugSXLqxv9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714643844; c=relaxed/simple;
	bh=jAJv4tcMRuN6EOgJM/ak6xYzvJBS5Vr0jKxw2W+C6Ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sOoYDg6YYDL7ae4dzraY0c0pXh3CMuHP2GfoBVYj1OPY2wJhTUSCxv7NXBjPC9CJ1sNJa5vQp6atcIsNENkW9q8eniALRdLBP4/pbVnK/nUICAAcFsPvQ7b2XaCI5ULXwdSEhvd/D8T4V2sQuUFrGFiWRAmrTk82c95DmQv05Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:93f:7d7e:5c98:dabc])
	by michel.telenet-ops.be with bizsmtp
	id J9xC2C0083PjoSD069xCJC; Thu, 02 May 2024 11:57:12 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TAv-002nZP-UK;
	Thu, 02 May 2024 11:57:12 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s2TBg-004jYU-6C;
	Thu, 02 May 2024 11:57:12 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/8] arm64: dts: renesas: r8a779a0: Add E-FUSE node
Date: Thu,  2 May 2024 11:57:08 +0200
Message-Id: <80dffb3b93a2952f2da1bedd67d7f9080fd8e108.1714642390.git.geert+renesas@glider.be>
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

Add a device node for the System Group Fuse Control and Monitor block of
the Pin Function Controller (PFC) on the R-Car V3U (R8A779A0) SoC, which
provides E-FUSE services.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Assuming the Fuse Control and Monitor block is driven by the same module
clock as GPIO Group 0.
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index cfa70b441e329a0b..1abe92c98358eddb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -245,6 +245,14 @@ gpio9: gpio@e6069980 {
 			#interrupt-cells = <2>;
 		};
 
+		fuse: fuse@e6078800 {
+			compatible = "renesas,r8a779a0-efuse";
+			reg = <0 0xe6078800 0 0x100>;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+		};
+
 		cmt0: timer@e60f0000 {
 			compatible = "renesas,r8a779a0-cmt0",
 				     "renesas,rcar-gen4-cmt0";
-- 
2.34.1


