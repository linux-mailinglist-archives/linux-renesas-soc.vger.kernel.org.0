Return-Path: <linux-renesas-soc+bounces-7541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EBE93C91E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 21:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DF731C22265
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 19:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBB1535DC;
	Thu, 25 Jul 2024 19:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WJhbHbk0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26103FBB2
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jul 2024 19:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936973; cv=none; b=M2lLoryYq4xRBrFeyHIPxW/zufL+LZhnuUBOQ4esATOSZipyqSHrlTLt8gQzdn+M0dmamqpEFh5iqP9fU/Oa2kyaNmgRYZMFK+F+zL2Oh43p0DB3OefbkNsWjPwIjeSQYmSAVoldKDyV5hVH/9yp0VY0FPA4t2hvwksv6/jWxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936973; c=relaxed/simple;
	bh=gTOUylpY1RKRApF1zXhgCothHhPOinq7S/oV5Yhc5OM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et6XrujuRNnjWe2k2w9+V0rKSAvNtvCWjbUuuBZQ9ulbF9bL5gd8TXE2LTflcawSG5f6knkuYRme3YWoXmRvPUeNxbwN5MvLIO61TOYxfHzz70f8p0PpP9DdtnHPQQw7c7brzOZC0duz/D4rD+EmHEu1BGp11lRI8rkWdzrCP30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WJhbHbk0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=6uqMhEM9nmOHC37lFgmLD2a+qCxhZw6dubdxheQE+6s=; b=WJhbHb
	k0195XGLuaCsz6lG4QruUH2Jt9xpwsvrceA4nU3eMowBzDfGY7PjkglOtxmgf1xu
	BOWr4ML/qxGOaKBScikXcJEdQMhxiGKlq4c/EyUdEOWCJYphEGMKy+Ke1W3HsPzJ
	qg4GKw4JaCYA5ZQNiFQ+ntHuhC4O38z/eAJFSUb4o31s8w+C0KyCS9CBWP/mVixu
	KH9OV7ijXrFj6xgIm6BFRldpQaFPsCrnW98PaT91nb25jq52CCucxlrfNsKHxAud
	HoCn38Qn8BCqhszIOON5bpdBuJhkQnlErLsunn0gZ/OOdHXx0bLfNStFpLgm/yOM
	q6Qt620TJI6MY4dQ==
Received: (qmail 3088368 invoked from network); 25 Jul 2024 21:49:29 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jul 2024 21:49:29 +0200
X-UD-Smtp-Session: l3s3148p1@3D9esRceTLwujnsv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH RFT 4/6] arm64: dts: renesas: r8a779h0: Add TPU device node
Date: Thu, 25 Jul 2024 21:49:11 +0200
Message-ID: <20240725194906.14644-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
References: <20240725194906.14644-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a device node for the 16-Bit Timer Pulse Unit (TPU) on the Renesas
R-Car V4H (R8A779G0) SoC.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 000ea93d65e5..e12935eafff3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -1023,6 +1023,17 @@ vin00isp0: endpoint@0 {
 			};
 		};
 
+		tpu: pwm@e6e80000 {
+			compatible = "renesas,tpu-r8a779h0", "renesas,tpu";
+			reg = <0 0xe6e80000 0 0x148>;
+			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 718>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 718>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		vin01: video@e6ef1000 {
 			compatible = "renesas,vin-r8a779h0";
 			reg = <0 0xe6ef1000 0 0x1000>;
-- 
2.43.0


