Return-Path: <linux-renesas-soc+bounces-10799-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E23899E15C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9835B3004D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1991E230B;
	Tue,  3 Dec 2024 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vJPaH7gG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFADB1E22E1;
	Tue,  3 Dec 2024 08:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212978; cv=none; b=VQzqgV5DOyUcOic5g+3uXfwOsjvw0/FvsXutiGD2knGqMrzF8n7ib78M4NbjOHacZTr+4UrSBkYI64ddhmOJhwR3KCeEQ30C+i78Tx/6qh1WPGOoQ9gnAQ471JWk891GD9XgGCwNwXGOK/OoB+WSTHPq8P3vVtSWKY2YbGMfvnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212978; c=relaxed/simple;
	bh=FV8UEbSlss71OlZ2aJSU0ycFMLOsLvxik5vPZ5wfSMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbvtbNyiTkQjx4V1h0dv0ooXTsY9nuvWxAWig/C0FAJGr+f468VPzytkYqkHwWwOHSXWg1DIE93bJanVhLBeNhavExw2ZG1vu0QSMeRw1sJ8wkCe+rCnpIs9vwbfPmsVp7Myv1L+VDQp7OrFY+Bu6jkFzwKtLJH/CKvEkqBPWh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vJPaH7gG; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F339114A1;
	Tue,  3 Dec 2024 09:02:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212946;
	bh=FV8UEbSlss71OlZ2aJSU0ycFMLOsLvxik5vPZ5wfSMI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vJPaH7gGa6t4j493OLQZm9oniU6e8pDlhhY6zP6EDz1PD8IpqELDx/1VDbCM4Mp9u
	 DXAs+/yxplKUhbnyIS219mPOWGQqit8x5xdP5lZRiRgwyufsagyMX9CQskexFFg50N
	 LSXBfQ8UtelpsaNxnRAcaAIBGB61Y20MEnWnHB10=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:41 +0200
Subject: [PATCH 7/9] arm64: dts: renesas: gray-hawk-single: Fix indentation
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-7-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1543;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=HzYB1kcwwRSiILGAuXsvkVfgYgCEfjcCalsP7DgXg9w=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrseCqjw7cSGWYBuOGtA6BlMlCZ+t335x9DKm
 7mNh0CrSF+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HgAKCRD6PaqMvJYe
 9YrPD/9vjO2pQ3qiKBtk4FHfaJy2SNU0uWH7cfxg28CZZ/vnTwwLNscIqSE1XLiJCKT2+pmIpUg
 qxI8WXcSmzyxrHkTHETNxr9+DWClCnZ3Pr+Voc959qkkVIBKtMxDRUj5nv9VG47J9lo51d29kAw
 dBTJCZdLbD+mxqQPy23TSyptUFGHiceKMb67kiWsQgMuuY+KP3LRbjpTIH3K+WcIruTMNlJCOY0
 UB96txQnTKom6puI2hea17rH0L7b6oKGzeFGiZa4uGfiL/e2sl77x9pA7yfHqUZvkh0G4KLbHOF
 1qFfb+pS7j6XXclfdY2Xz4Y6gSDlD/NHCEBqhTC/9pw17bhuvhvR42qGR0oxyRuyQvsy7tfILeh
 uY64zpAvSMReArppG4M+1c01fpF0YBFt95+OAu/gesUn8XoeRVTWCN1/fobGunjrLCASsYlDrfj
 SAG5/sOTUaxwUQ7TmOTPqk5cB1kCIKPr1MiFZXhDdnp5kWVA9WC5DmSC1HP3H/gWxnr3eUhZjtN
 W2ymzYWuBrf7KcsnpifY23EOs4gWG5OtRJ+iHHNVRT11rxYYTo//18ntOio+fsdppzP+xHAWLeM
 khXJX1uZ/6txUfRXYv+ccKZAAconoUX0IfknrP7jWfuVmnPKatdBgpPvC7Fko2Z7s2O6Vvh2W7P
 eVq3vJmUU4JUEEA==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Fix the indent on the two regulators.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 9a1917b87f61..057f959d67b3 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -127,21 +127,21 @@ memory@480000000 {
 	};
 
 	reg_1p8v: regulator-1p8v {
-			compatible = "regulator-fixed";
-			regulator-name = "fixed-1.8V";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-boot-on;
-			regulator-always-on;
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	reg_3p3v: regulator-3p3v {
-			compatible = "regulator-fixed";
-			regulator-name = "fixed-3.3V";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-boot-on;
-			regulator-always-on;
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
 	};
 
 	sound_mux: sound-mux {

-- 
2.43.0


