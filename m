Return-Path: <linux-renesas-soc+bounces-11431-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C029F42F7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 06:34:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35D118908B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 05:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE2B19750B;
	Tue, 17 Dec 2024 05:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YerdW6zR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95823187859;
	Tue, 17 Dec 2024 05:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734413557; cv=none; b=ac7IuyjdTD/cKwmwNR254OoA7bTzjarZVUcMVn1lSE4jqqKWBOjYp0LJjQzK93uzEYl37+u/cef/9F+Ivz/7sHljuAhDaTc6A2T9qtobXH41DzrYmXxi13H6piQeqK3hmWbrzXJI4FEkwInYQYn8xwwL0vErA92Rf4LZqlHGfbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734413557; c=relaxed/simple;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZ0KGhGlj3h7WlDKaM2F8SjBY8PhJfnNZxM5/0b3Ws1tdx7/iCtZsIRuoC21oCUZ2Oqt4ntT8KQbjBtWNd0HGfcI4hflueDt0DU/kQIh0rNa7ou2vGYInm9sjzXoxekJ2nsaT429Z/NyNokQypA32JImvhueMryPR5+o5MNZCJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YerdW6zR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8C1071045;
	Tue, 17 Dec 2024 06:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734413515;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YerdW6zRTwsPW1OpzRxk3XwhvYFdB1JAxvFmfNC/jVzZezoR+7tVhsPKhPPyyQMfk
	 OPmH2m6KxfTRPKSWwjGtTarPu7iOfFSe5jHD/W1hKWTUw1XLhewbRmV7T02G+eG0SH
	 BXSs+3vNBpCOcNTh+D1PV5fTUCGULaI8KlZYZivE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 17 Dec 2024 07:31:39 +0200
Subject: [PATCH v5 5/7] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-rcar-gh-dsi-v5-5-e77421093c05@ideasonboard.com>
References: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
In-Reply-To: <20241217-rcar-gh-dsi-v5-0-e77421093c05@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dTprj9jjuLmoedubnDT5F4e9cHFBPmdT8w1PeMV2wF8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnYQzksDlo9EgclgP9WNJkKGxCrBJaEbI6GANCK
 g6nE/O2vsiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ2EM5AAKCRD6PaqMvJYe
 9fUmEACb+qW4GYNJBdtbvyfcxPXOKcaUxh9pDlowd8vEl0+1JvG7nFDEwGMiaaHhLn+saQ/Lvam
 lLy2AkouSTsJ7MU1p+1ryE/Stizea+9613jVQc7IeVH30s/dEhQuZPLFjIpu4J9hq4uMvZJTOK2
 xqjdwphXqHf2HcdJqvsKOsO8EEeTq+rA2+oDWdQDgDAk7c7lnNzZ2efjQUuUkJgAQ6EaLP7aO75
 wCcq6BlV0zUiVDUN9vOKJcVA+YCuRbe1MQaK2jbKsOLpYHoNSyVRqUYLL2x8bx5WD8ufI96Gwrr
 7qAGcHxD7TQ4LTvVp35ETC6Dly7wFvGS3Q9dNGD8W83Ww9XKgy0NsOuor/eQdo5GYtmzRI3SNxk
 H0VeQ/GGWyETNrGy3VhB4rn7Q9MHNCKMANZGDG8aH4oFw4mmivJC5KwxVySjAaW7HCaqTTVYX4D
 /0RCLBNK0azrBJHvi3mzrO00/TUGSuYCodipu4kiZ3BGzGfwRjE8mNRJH6FD73+i+0VSmYYQddR
 +j9wjByix7y64ZG/JDhu+PmYqC8xPxV6XjhyICTTdyA2IW/Ukvfpn2RjStQQySCCzCHPx5ClLoE
 Nudws37QFWxpiWw1L6N40tOuqjSOLClaqwDX9BZTwl78KPDGgCDxuf28gAh7mYzEQOjtnHMGqoj
 N7motJequEnU/jw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DSI display bindings to support the r8a779h0 V4M.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index d33026f85e19..c167795c63f6 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - renesas,r8a779a0-dsi-csi2-tx    # for V3U
       - renesas,r8a779g0-dsi-csi2-tx    # for V4H
+      - renesas,r8a779h0-dsi-csi2-tx    # for V4M
 
   reg:
     maxItems: 1

-- 
2.43.0


