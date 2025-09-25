Return-Path: <linux-renesas-soc+bounces-22351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E30B9E6EE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 11:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67A421892EB1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Sep 2025 09:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C7528468C;
	Thu, 25 Sep 2025 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ghnpnZzT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC4D219E8
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Sep 2025 09:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758793221; cv=none; b=rswwQmX4CgRJiz6MTnvSBBZydA7HjEiVSLyBhwIcT4NGk8yXdYbZJpdrVT91H/9MovmjQroXxuMBxhQWLyenXri48Ymd7mIJrYRf60C9Op5RuICXRKx0M9ZsKiMSdZ8mnRbfYIf7aZPyHhsOV3Yfjsr3gVMIqHppSjIrc/DmxQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758793221; c=relaxed/simple;
	bh=HG4YPpLkRmb8dO/09/uStf/H8rpgRkf5QbSiBhwmH+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QOF5W4sjxvUP65AYAQQp1CID+NKpqW95JJ0EOMM2Jj1pxp54qf7Xv4442MeRP+Ru1r55cFTj9TFQVaMTJMSGVtImKZBESpNeqRs1qFxTmAUUmD/BiJtrIJH0vYAbgYWAPQ1wEUClI/dfZi58MA7z0vhdOn9azNtoVsQabKIP5/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ghnpnZzT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=L83T0z76GCpkvFYkVvej4Iy1UjLMdmPYpykho6d/5AE=; b=ghnpnZ
	zTA9TZZb7Y//JbadhujNQsgLhbdsUo4WB7hTSQza0MqGM+xXLbvpe/aKTa1m7uDz
	MhxGNgX73cTTcagDg7HQb4obY1Qd5GtyfszWD8CYoqv8NLWinhBpXVDH059CbONq
	4LtKov3I1tsIPspgX5j000muuOebCbGuML+179IxUtqpEqG6FSHLNFN/+59aKkJg
	idERqFe7GqWEIeppvr33kLTlqShI2p6oG0bP8NkJuAEhmQS7BZKV8/YE8Y7DQoQX
	4M2kjCxjNECChSu7l8ogegWJaZ+ks9cASvHdMZN6o8vkDEuetEjndFcv7Em4I4ko
	Qy89sO7MSmenT2bQ==
Received: (qmail 1813224 invoked from network); 25 Sep 2025 11:40:16 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 11:40:16 +0200
X-UD-Smtp-Session: l3s3148p1@k4Ll9Jw/tMQgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 03/12] arm64: dts: renesas: r8a77961: add SWDT node
Date: Thu, 25 Sep 2025 11:39:42 +0200
Message-ID: <20250925093941.8800-17-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
References: <20250925093941.8800-14-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 1637b534fc68..bbfd72705db3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -330,6 +330,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a77961-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A77961_CLK_OSC>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a77961",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


