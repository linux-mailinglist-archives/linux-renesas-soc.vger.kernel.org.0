Return-Path: <linux-renesas-soc+bounces-5451-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF778CCF21
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 11:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E60931F237ED
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2024 09:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 096931860;
	Thu, 23 May 2024 09:26:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9347E0F1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 09:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716456381; cv=none; b=gLu8MiL722WaTOdnHseElviJhNdWS3IRqEBKHdyHygw6m1U1LmfumZoUxRHKaQDwnnSekcfQlDzRsXPrpF9ImNOusum7ugOsdpWoC5H4aT64jIJxO4awEqLCdgDL1plPBJceh2scmiyZXChCM6i8JzJ+orcY1TLOGbDeMMCZSQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716456381; c=relaxed/simple;
	bh=kDEu54Ect+BOQffeK9VIRvml0vZxlfVr5QKiYQBYDps=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NTGlAPGAOSpN6dk0MYLuj1d0CAHLI5FtR9l97NhQ5nW3MxhnsessNPB9sLQjbUfpSA51WiS0p+JvawizgkRjEZvQFyfaXKWKxRcBmocJNF75klrQ7Ek8zsbEP0Kcdk2BpHzGXS/JUuARANmEAgL0lnCV01vQfOAmMeyHgiwwczQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4VlN0130d8z4xCQg
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 May 2024 11:18:57 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:58b6:dec0:6a57:abb4])
	by laurent.telenet-ops.be with bizsmtp
	id SZJp2C00843lBA101ZJpGc; Thu, 23 May 2024 11:18:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sA4a8-003L2x-O4;
	Thu, 23 May 2024 11:18:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sA4b3-009CLN-C7;
	Thu, 23 May 2024 11:18:49 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: condor-i: Add I2C EEPROM
Date: Thu, 23 May 2024 11:18:45 +0200
Message-Id: <33a1ec9ee8fff7708f699c668d7399fde2b46553.1716455483.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C EEPROM U197 on Condor is also present on Condor-I, but it was
moved to the other side of the bi-directional voltage-level translator
on I2C bus zero, and relabeled to U230.

Move it to condor-common.dtsi to make it available on Condor-I, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.11.

 arch/arm64/boot/dts/renesas/condor-common.dtsi  | 6 ++++++
 arch/arm64/boot/dts/renesas/r8a77980-condor.dts | 8 --------
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/boot/dts/renesas/condor-common.dtsi
index 7c34d14dcd7e1ca0..8b7c0c34eadce5cb 100644
--- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
@@ -227,6 +227,12 @@ adv7511_out: endpoint {
 			};
 		};
 	};
+
+	eeprom@50 {
+		compatible = "rohm,br24t01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
 };
 
 &i2c1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
index 68d1f1d53b3a38b4..1d326552e2facd06 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
+++ b/arch/arm64/boot/dts/renesas/r8a77980-condor.dts
@@ -14,11 +14,3 @@ / {
 	model = "Renesas Condor board based on r8a77980";
 	compatible = "renesas,condor", "renesas,r8a77980";
 };
-
-&i2c0 {
-	eeprom@50 {
-		compatible = "rohm,br24t01", "atmel,24c01";
-		reg = <0x50>;
-		pagesize = <8>;
-	};
-};
-- 
2.34.1


