Return-Path: <linux-renesas-soc+bounces-20095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DDAB1DA9E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 17:15:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 698FB189532A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 15:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB04265CC5;
	Thu,  7 Aug 2025 15:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WNK5wTyt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC83D265606
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Aug 2025 15:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754579698; cv=none; b=qUILVJr43t/pPgeZSXNzDW48b8GjhtmtTYBref14lcqjugqL2z6vNA21E4ozZeCyHw4I20ZCSYitS7I3C/iKHCLMljs+L9XCa6bgRt1vXsxiaHCx7If86cdPSgHMn5QDXGV5YGPlc2b43jCLsjHrHL177fmo9OIZBpFvEiC7ZKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754579698; c=relaxed/simple;
	bh=2NsfVT5hdCt5ihJKPbs1TxKliYfEHIYKdNofIeEivm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qg6C/y735CEPEkkBEZRMxZRNCObz6XFbA0B60ykmkpJXP91mKQmy7+Wbxecww8XkmuyBUKsLRVJolFdiRh6nwjPztNwGQW32ea70hPmekaG+ZBqLplWcua/sb8webMbPGOU1ZGvBZWs78hP+heG8uZLNFQ4E89ircC2NB+Uo4zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WNK5wTyt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0E76CG8MTU8mpvwEgzpi9svekC9i0tGmgN1+BotBQxc=; b=WNK5wT
	yt3VSE79FAMR/ViPXAjPdXoitdkxCHyFHIWzh31meDTuKWkRfTkxhEV15aNljlLK
	OidEkDTXLifwqeDQI40YURf6CQ5mjQ1uNXzU/5hdtM1ZLTTIv8wr+ujBsrcxCM0A
	JlZRh+qIXMtmGIGAetDzeS7u+6dxGpqOhD30iaqojKpebAp0D9ntZF8KwbormVKL
	VPOlPxo3PGfbaZgseLQ8Yq0KENyz9XgSGDNG+5oQ17+amAhwynvna+ZuV2DVQ/vn
	SoqxLy6YlWwiADFNSyPVB4kS5fUEah6BJQlPtXWhO9ZBlWFqWQlaT3LdG+K4TpRt
	pmge8lVNmltYzpDQ==
Received: (qmail 1277633 invoked from network); 7 Aug 2025 17:14:53 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Aug 2025 17:14:53 +0200
X-UD-Smtp-Session: l3s3148p1@1cdc68c74AjCtheG
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Date: Thu,  7 Aug 2025 17:14:37 +0200
Message-ID: <20250807151434.5241-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
References: <20250807151434.5241-6-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable I3C on the dedicated connector of the RZ/G3S module. Provide
safe defaults allowing to connect even to slow I2C devices.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..17fd30df3432 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/i3c/i3c.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 #include "rzg3s-smarc-switches.h"
@@ -172,6 +173,12 @@ a0 80 30 30 9c
 	};
 };
 
+&i3c {
+	i2c-scl-hz = <100000>;
+	i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.47.2


