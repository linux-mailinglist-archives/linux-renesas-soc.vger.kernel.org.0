Return-Path: <linux-renesas-soc+bounces-11293-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBCA9F0E5D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3FE2818B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D871E2828;
	Fri, 13 Dec 2024 14:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fyQmb9XB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B9E1E25E1;
	Fri, 13 Dec 2024 14:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098608; cv=none; b=b1MVOfJnTj8jLb5ThEx7eyRgS2WRtvSLRb3Jp7bs8iGOpNlO1IIlJocPMZYD2m1ULnqzkCv2k9DySkxKLfbrbPebijIPt0uMGJhqUQoUefni4m/0W5rafv78G0/y3PEIkc5HsBqkgRTKP/WGsewE0E/AAfnF/lK+x3jQ6BqeltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098608; c=relaxed/simple;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=plMruCph+wV8qZtw22PWa6ZNu9OHFWuhsIlru+Kd7V5Ll+quvaREHltlCEK+XNoyw9j/aMPGrFsKsd2L/qey/E/Fr2JUmFup/TirkwIZB0gr9OhEWeJi34gT7aRcjkaAphxCMxFxPzqcikgZaq7yP7S1PV/ANaIoHoSojySPOl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fyQmb9XB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D629C1449;
	Fri, 13 Dec 2024 15:02:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098570;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fyQmb9XBr/KAVtLsxKMmpK5T7jynP6fNu5yVrokyFbxih2hAGPla4aDn8xDRMUi6N
	 8tvMWdmxemBINW6OC6POvx/bQeqMuHXMukZthtV6lw6nX5b3yKM+hkz62gupuyys1U
	 dKDw2mtZI6mzTtoJ5p/H83qXAv8yDZPCQOBu+Ylw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:03:01 +0200
Subject: [PATCH v4 5/7] dt-bindings: display: bridge: renesas,dsi-csi2-tx:
 Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-5-f8e41425207b@ideasonboard.com>
References: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
In-Reply-To: <20241213-rcar-gh-dsi-v4-0-f8e41425207b@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6hMnD+fNBuer1EFdM2qFSzwqoddiP7q/OFJ
 MHLM3o3Q5aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oQAKCRD6PaqMvJYe
 9QQlD/9aI20lPyFuchw04t+kA5up3ZVXMi/KrRy4dcPnErcXfePBeF3TSXvA73kH5QXBal2O+0T
 /VYyYkrKw5YKybdqAVZP1WPPdV4akre0o0y9IKDQFias9lZyUvJImiM/ZHlEt+c0GrLWo3Yn5k8
 hjk4I5+mu5MWNgzoLXsa+KBmtAYaMJ/wlthnu9nWxclbphDl9gZ7wxR/pk9uIgAUcHn7bMQ2kz3
 I7YNx6ln5s1BFSBwNTiLvYDid5iBLmSL1uJe2HT0yrQrXKA9CLnqdrZDsTfYVLDDN7kofzQYxro
 vNNQGIE1IUtwEgtNFjJfkV+5n2jGJlquLVOynccuTqqQ1++iANMAw4rCA4VJWtlVVmoBNB0fU9T
 snsiP4XFffFg7B0kYwFxLNnM/ml7ojwojGxjeZdDUP8YUh53MOO2GKrPZ5hmRBimeEaXmRqUA0C
 Z/REmDCmxvApWrBclAVa+UC7lQY5XGfQMfUrR75ozMd6eLd2dPGB4ByyCwVZj6fxs5Zs/Vr0Wyu
 hu87KH2BqfX+qj5uWRXkKxhvB3SM6c1DXcwWrWdh9J3/ua2BpvY2Vp/FI8E9P3TAKCp8y+pSZSQ
 tdtkv6B2nNlNManlWiAR0KcUKDkikf/DdTUsikWBxF8FvB3dy4Gcqe1knyUvTagCiHIFOq4YiQV
 DKRlUGbw+pe+RCA==
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


