Return-Path: <linux-renesas-soc+bounces-15836-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C87A8589D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 11:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3509D3AB114
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B846F2BE7CA;
	Fri, 11 Apr 2025 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NqUQFl3u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8345A298CDB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 11 Apr 2025 09:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365280; cv=none; b=bxKoWT6klRaVDQhcDvG5o7RNznZ4IkFdmtxaw/tQqOCn0iniAW1EugMWqdrD6uRw0ukbEnXVoAD+lSZTck+hRJc2NX5F2l2PtGUYJWNZKrwFeQtsYkyfeWXHct6jSeoUV5azpyIVtS+WxRruI3spOquBHp3pkvnxVWajDltdkI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365280; c=relaxed/simple;
	bh=BaRjS6ccVtFHaVZV+I7+bYSOX9qmbnPV2QvWvk5Lgpg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pnd8ZnyzzbZdHCW6C1oYnAgarYPSFmWFrGaNlqtbrR4oTycl9UnYoixOfTKwloVnTM5bEuIVxkER7so+3JY8XCX/M9ENZsR09D5YMCZMRCnDmdIPc/tmFNRXO8KyumSdi5CHX0s9RXmBOOV54Wzk4JN9Q+qNFtV8MWRsPz5/0fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NqUQFl3u; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=grJv3Jh6xKy3qn
	ou0MCUvfpOyK44dVp7TixQ+SSk9l0=; b=NqUQFl3ub5Uvi+fZeUNbdlNOu61ldi
	4oyupJ+ScD7VGSir0gCIboAgQ86C18bp0HIuE2GEXA6mcDNPTvZobn8HoNJErCf7
	urx3CvUd6FqDHVRkzW36Q0ayEy8gZkSkftqH81932RZMbT6lh65sy3gQRYEIeuoZ
	8U2yUWBP2KAEh8vn5BonhRsBUJItayJeOpK3rvs3qLeLQa8FO3mMYTCyVT1KE0uj
	McZbiRGy6KraalF3E4I+Z74/izTiahs3jUb8n9re9T9R2eekdwPORABupM4cRyuT
	3qEAfuFcJs3osn5JWeONvsA43n1Q10LygOF9mxc9quUMZ4gEFvkpQ3Sg==
Received: (qmail 1242903 invoked from network); 11 Apr 2025 11:54:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Apr 2025 11:54:36 +0200
X-UD-Smtp-Session: l3s3148p1@EumgsH0ycs8ujnsS
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: correct LAN LED nodes
Date: Fri, 11 Apr 2025 11:54:26 +0200
Message-ID: <20250411095425.1842-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This board only connects two LEDs instead of three. Also, give them
descriptions to avoid namespace collusions.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 23 ++++++++++++-------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index ee875902a75c..068563d6047b 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -6,6 +6,7 @@
  *
  */
 
+#include <dt-bindings/leds/common.h>
 #include "r9a06g032-rzn1d400-db.dts"
 
 / {
@@ -102,15 +103,18 @@ switch0phy1: ethernet-phy@1 {
 			leds {
 				#address-cells = <1>;
 				#size-cells = <0>;
-
 				led@0 {
 					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
 				};
+
 				led@1 {
 					reg = <1>;
-				};
-				led@2 {
-					reg = <2>;
+					color = <LED_COLOR_ID_RED>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
 				};
 			};
 		};
@@ -120,15 +124,18 @@ switch0phy10: ethernet-phy@10 {
 			leds {
 				#address-cells = <1>;
 				#size-cells = <0>;
-
 				led@0 {
 					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					default-state = "keep";
 				};
+
 				led@1 {
 					reg = <1>;
-				};
-				led@2 {
-					reg = <2>;
+					color = <LED_COLOR_ID_RED>;
+					function = LED_FUNCTION_ACTIVITY;
+					default-state = "keep";
 				};
 			};
 		};
-- 
2.47.2


