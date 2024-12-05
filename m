Return-Path: <linux-renesas-soc+bounces-10961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B47589E57B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF95016A27A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2138E22144B;
	Thu,  5 Dec 2024 13:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QDcIQTpI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2D21D5AD;
	Thu,  5 Dec 2024 13:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406345; cv=none; b=oilUgRj5xx0ueTFwCu77NWcn0cbrasY1a7Ci6e5+1RtxKSDjZQR6SgeRyc2jvcebB0ponfuBroFiRbFKYAE9hOep/ChJse7D/AlO2S+gA8zH9oqGeKFRX5a8vxRbd8ugy8QOwZZQVa9np7AUyldIQEkMub4cFywnIFbHEleSYCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406345; c=relaxed/simple;
	bh=qoTsg3vndyaPE/uVLOmVNadi0lVmr7QYIfbec2DlMKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWkjyXe1IbMxCmn6D4//0QrQdNFejrnBSKOBdc9cbOd3AqxHS2IVcHpmvKr/kjLWg0OpkIomwB7FMFUxP62a430+9olXvf94IWPkIAqXP1/yfQfxunxchGBqM7yvD4MF4g1JSGHeW5gPljtqODy/hddo7b4HoEjdvkcEQsVJSws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QDcIQTpI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 774472B3;
	Thu,  5 Dec 2024 14:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406312;
	bh=qoTsg3vndyaPE/uVLOmVNadi0lVmr7QYIfbec2DlMKc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QDcIQTpI26NEcgMaCWYakp4o+FHIUB1u3FhguEl+zZ0lBaFkvBOLv4E7wK5+oEOEa
	 jJC0LEHyvf5mgr+TetLl6Kt4xRn81YlDE1MHYhGr+AxBjx5tfQK5NVPOukDIm6dyPh
	 uXsb14VvzS3MflZnfkSMRf2gfGb4klQ7A558nMWw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:03 +0200
Subject: [PATCH v2 08/10] arm64: dts: renesas: gray-hawk-single: Fix
 indentation
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-8-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1675;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Us/qOVaconodKiCI/8cMfuQCvz6NZT6cEboixpCmzug=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa50VCq39RfrqAvgPMh8IWT5NJwBWYlDgLM2U
 ZlMuBxaMoaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GudAAKCRD6PaqMvJYe
 9VLfD/wLsXlwdAsjP+Z83i54Pqtnz1S8ievnRw/TnUf0dqhknxnxVHdJQ9bcLdwChclkDlVFWOv
 vQFQjQP/CPd8xOKNTqflSLrtJGXG9ulQY83QI5NJYUF33Lz8hJNZlRpmRuKOJtrLU9gc8xWreH3
 xu75yfwEugUVlz/BUQ7tv4pK69IF5QWTcz3ofpv4XI5WcXQZ/w+dZQhVePdbrrpqeIzPGeYFpuo
 v0DCJM6uJK2sdbD7w5zV0s+0bXPTMi+d+iJVzMshkrRn7H9EeYga/6QG2ngVvZUHt1mdyLmHHUY
 UQ2bZdbeY9Vde04RgGtr/Kd0I1PU8LLtvcwaNNmv7yRZ1IAsAHmye9D9LUbc3scsex1eYVeWPA7
 Gkhd6s8lu/hs5OinF5XleI71o9B/DbOfp5nqBujDkFeYAOcDG3tgn6DMMgqaVvXwJ9AvmDCUyAJ
 J6+CoAniXQsAQ10mNNzGfE81ONrPAkB99HUH+u2QiCVij8quNgQeURAdOj9CooRMLj1XYAQkFFI
 1TJgSpxUAXFYxBOfTjY66HjUamXPZTEB41gqFVX+3qlr5SuTAk4H87YVn5jL9pVpmqAbW4sSRAC
 nm2MgdOpfT/rup9DV8BrbPVfJuDm7RJci9WaPk44C8h5UyqkKo/o4rkloIxPUZk5RJ5gUZgkDXV
 hQ1cl6LEMQ+UXfw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Fix the indent on the two regulators.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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


