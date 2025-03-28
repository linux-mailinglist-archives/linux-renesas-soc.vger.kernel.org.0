Return-Path: <linux-renesas-soc+bounces-15002-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94ABA74DE7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 16:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8FE517B71F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 15:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB5C1C6FFC;
	Fri, 28 Mar 2025 15:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="KNJK1+8N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D3E3594A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Mar 2025 15:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175997; cv=none; b=kw+k+9ZYCw+UI+RGrWtY0iUzfUah2/dC0Ndd572rBAwzjn9BgoJNF4kUnPJjemWuYqYQL6+R1wDHLAsV9gi+zt9RuygFc3oLXZdJqaRAWqMJcNNl2gPFH9Tx00l7TxIODfDvER94cFL7pvAw2nG+yXlWDWQkeSN3yIjjNBEqUDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175997; c=relaxed/simple;
	bh=WJCZMRqoTmctobBD9on9p0tjY+lofVd+8Nqsfi/woyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaoUrRm37jdZUrg2WaqQ+h2rCrqsm+MpdinJsrOQ2JAxOpUXbUGkVBTxt62CK3osk47Sw4KgUnjeayudBkgnFILhlSfrrT7D32akPQLxxoAryvHOZhH436t8prmonRVgYhewcMjWR4Hgq3IS1SxKaYxdjdLnUo86IZiTpcYQ/hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=KNJK1+8N; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=1dfAcsDJ9FoXmMqtKsWAH8cCQ6eMQYaN5wYHw/2xWiY=; b=KNJK1+
	8NAuu4N6oCsOK7BSmkTSAphzVGiWZFv9YvLg4OAQMo6xgqL5WD5V2+USzzTDDGyx
	06OoCgxI5zArZbKLy3eQ3cd2tmppztxsMwhcl1RRvYMaGFsoiVJh6cqWVilurx4T
	0yW5XdZKnPpykRJHZ2Ohu1qGleovAC7ETnlwnxPRspoh1q2OZgZfNEQOxV4sg/yZ
	HqDcHRxMPW/f/CAdiJkffLXTd8RZikksF6Ukb41U14dMDqhKIUy2Ebgqq3J5FIjU
	4qI/LH6rB2aYBN2oC7EYsmuqsbvewWc7O4AZcbYFSN1zkg2afVChG+/Cyb07ylil
	VO/MgDhCM7uNnjsA==
Received: (qmail 299040 invoked from network); 28 Mar 2025 16:33:10 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Mar 2025 16:33:10 +0100
X-UD-Smtp-Session: l3s3148p1@MyGpyWgx505tKjE8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 4/5] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe LEDs
Date: Fri, 28 Mar 2025 16:31:37 +0100
Message-ID: <20250328153134.2881-11-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index d50a1d91e968..ccd47f0181b4 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -8,6 +8,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 
@@ -24,6 +25,42 @@ chosen {
 	aliases {
 		serial0 = &uart0;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-pca0 {
+			gpios = <&pca9698 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca1 {
+			gpios = <&pca9698 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca2 {
+			gpios = <&pca9698 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca3 {
+			gpios = <&pca9698 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca4 {
+			gpios = <&pca9698 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca5 {
+			gpios = <&pca9698 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca6 {
+			gpios = <&pca9698 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-pca7 {
+			gpios = <&pca9698 7 GPIO_ACTIVE_HIGH>;
+		};
+	};
 };
 
 &can0 {
-- 
2.47.2


