Return-Path: <linux-renesas-soc+bounces-10991-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEBD9E6A54
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E4B0287923
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 09:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121281FCCF3;
	Fri,  6 Dec 2024 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BxV+fEbB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7425B1FC105;
	Fri,  6 Dec 2024 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477624; cv=none; b=IPs/j6cdgmfHabLdQ9cbBTNNj8xf/ETHN+JwsJ6o/rMb1KpVVPwzRVgCPne4dfTfdtBsw2CaGxznLvrFzPieCChLYkVNF8InDGdKHsqwbqiQ9dKDlBREOp1IAIwmIzQE4nUuWYuEjG2BUhVIIobjISFpjYkqua2hn0HI8vA1YLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477624; c=relaxed/simple;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HTYqhCJKGcBYDyQtR2lkW2USTTZ3JWuGnqjukf4oscrwpQtDq174ylkHIILNXoYnBD8GAeiL8E/RB0nyhmjJVpAMc9/SsG7L6q4QJPY3QT1wwTQ0AiVc8iUOsPz1vBQHnwKS6+yeQMExEzf5Bj+Q8R8KyHJqnMoY+oAJO9fPcY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BxV+fEbB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 57D63FEF;
	Fri,  6 Dec 2024 10:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733477574;
	bh=7hzw0SzmxWLVIEQik4mqnwQiiO+6a15pjXhcBTuLaI8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BxV+fEbB582PIWf5iUCPlHw7fB4zMMLrZTPcbYlwQi+c0k5riprNA9zjQGR/CA7pW
	 DjdU0fAi8fFevzPz9nXglrgATYOj3i/iMxtiSc8/lHYMFrrarBQvyMTeuo5mjfWTFW
	 dNoCynoky+b1pYAM0uu75zYBUqc3sB4nFsE/1iDA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:36 +0200
Subject: [PATCH v3 03/10] dt-bindings: display: bridge:
 renesas,dsi-csi2-tx: Add r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-3-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTaNEBZorD2e2FGf5qufr2OT5g/o0jnoTW/d
 8dH5FWArfCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2gAKCRD6PaqMvJYe
 9TdsD/9ykPgrcfKcefWXV1Nb9U41qlE83epgXgSTeIruwoZqkCf3/JWNyOjbXLCg79RZ9vxORK+
 bzhQMIc1snECLh/8LgWxTAZ8hgZO2nPPUaruhTqSUbTVxld8ey239WIkPmYyBMhnm1NQXsmqREH
 TPXfBM+4lq0AuvtiDFue8R8xpW2jiI4DAIZL5d96cBnEYJu1axHdZuXL+zHJKsyWSivBhB3Vxuu
 BVLFXv1tOngor/H5Q0IiIidEX8V8IkNmyJf2HvqT5K8AUAi3lcmommOI6lmE0xBzszPs8L04qXB
 iCYw7PpmDnsow5aEz1xcGRdxsH/I8+eNSOE4TeFhyR2r/1nUlenUk7PtK9t2DLldvAuRTHin8NQ
 TpLW5grpqhxcM5IIle4qRpk96wLtuuQxZZfpzwi00lycUv+7bfoB1oV2JN8Q8cLR/ozqwU1yflF
 kIxrMn6ZoVhs2ZldHjpzO9bISAUNiNHcbsi1bbs5gK+Z/fzUOizN5TsmJDtJwwfTWVKq/sclX0Q
 q9ccDRRvmZXd1xfO8zNiJM/c6nLjOWCYnB5fqwQs4cn7cRjI9FB1EJZNnz9McYyxtvkpaIEYMXN
 hwARqFmOnfBl2NacvKc7ClqM9wZ7630j8+3zds/pH/Cmx6Ti6peSZsIBPf2pg21MaZTBuil5o+U
 N6mklpM8WwZPm4A==
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


