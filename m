Return-Path: <linux-renesas-soc+bounces-22109-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F818B8C112
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 08:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B620B188A8DD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 20 Sep 2025 06:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D6A02D63FC;
	Sat, 20 Sep 2025 06:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NFiHSH2n"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC02D5C67
	for <linux-renesas-soc@vger.kernel.org>; Sat, 20 Sep 2025 06:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758350694; cv=none; b=tE3CNefEa26S7d8cWtlbO6hB6FvnH+LI0NEcMMN9eWIUK6Re4i8qg6rYA/B8yOFZSMD+dk/JY/C2zNb3jLPkuLI9qCwO2WeNkEjmP/PE1fovTs9CGPx98EsMEhVdNk+oGRSf0Le62flB8gs61PpvbpjgfdTXOkhUc05ReU/BIZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758350694; c=relaxed/simple;
	bh=adCNxgKFruXwiC9WhVVvWimxEkESUZD2mVICOOLgnMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gATPnrZqw5uSXp64wGpKEVZ7WsAkb/6WfrK1e+FVp+oNuzQKdz3jjNMiBmF92sWYtODGoozSM7GjGD9fLHdTRVMsSKQR0jUJcNu6YTTzVpVKyeFOwJgANgWw7teLt1FVLlvkWnWkziBbRn+aor8GL/ON1dJEvHmIDzNLDakf0yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NFiHSH2n; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=4s70JkcfftvaCF9XrXy2cBd/Dwx356YlZSYmzXN5DTQ=; b=NFiHSH
	2npzunebhRMm/oCcchfKOr4n8ZJc2mUbNEl8AVUO1V9324LKGoy0UyJd0VfXHaip
	n7HvzmXxEdmdRK3Rm9ii1SXnKTsex5DgjzQ6GQxf8pOpjGJ8n/ri95Z+Sk+5oHpf
	6hm8hxhNr7BS0J3q2KyogeCrstha3zlHH44nKAJeTRGG5cP1h/8WR5BHi2hEcUPD
	z24LnQat4rrJUCugdKEwSRC1av+no9BbT+nsBhQ/i4+lVzl6R3hlisoUcAGz6I+Q
	Lrx+XCD36WqR5bCFkw/XKUx03aJfdTilAWV7IKMy9nvwpe4EfsZL0SPv9dKUatE9
	zYd5ROchfQ8q1kfg==
Received: (qmail 4169259 invoked from network); 20 Sep 2025 08:44:42 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Sep 2025 08:44:42 +0200
X-UD-Smtp-Session: l3s3148p1@7i/R6zU/XskgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH 2/6] arm64: dts: renesas: r8a77960: add SWDT node
Date: Sat, 20 Sep 2025 08:44:29 +0200
Message-ID: <20250920064428.5544-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
References: <20250920064428.5544-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a77960.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 6d039019905d..2fd08c002a47 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -330,6 +330,16 @@ rwdt: watchdog@e6020000 {
 			status = "disabled";
 		};
 
+		swdt: watchdog@e6030000 {
+			compatible = "renesas,r8a7796-wdt", "renesas,rcar-gen3-wdt";
+			reg = <0 0xe6030000 0 0x0c>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A7796_CLK_OSC>;
+			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
+			resets = <&cpg 401>;
+			status = "disabled";
+		};
+
 		gpio0: gpio@e6050000 {
 			compatible = "renesas,gpio-r8a7796",
 				     "renesas,rcar-gen3-gpio";
-- 
2.47.2


