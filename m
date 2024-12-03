Return-Path: <linux-renesas-soc+bounces-10792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A935A9E1533
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:09:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C595B2EDAB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3193B1DE3A7;
	Tue,  3 Dec 2024 08:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F+uz8bI1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FCD19CCF9;
	Tue,  3 Dec 2024 08:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212968; cv=none; b=D7VMdut2aSZDD/yWv7AIxzrOQkCFscJwE3o42e4F/D6UeVhqAObmZh3nKxTG/vhqLdUqMsUbGOqUgcNuHLni2GSekmUOBsAQ6Cpel8xnfz+FpyfQtzzQb8dfJZQBA4OJVMNDn4OuSQpg+qmTWyNmgNV/fKWuJD0lJ3wQKeSqHWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212968; c=relaxed/simple;
	bh=QsfXonZPBZ28vJOb/xAkTrjot6SfqgiJkoww35O2YrA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LRjnpbHVxx2oDO8rJLj5cm8U2pVH7Ui8qjI4B2Fgmjd6zNVvTGPLRrr6yDfy92IIevY37Sx9dPbkOgPSTch3Ek0Elj8qhBRbAHfKliLBLibQQE7UFvlZbYk+2rRB+zaBcsrkxr0Ldh/lxncdzJD4wgH9csNR4XnZwoqwlIH37kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F+uz8bI1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5A39B2B;
	Tue,  3 Dec 2024 09:02:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212936;
	bh=QsfXonZPBZ28vJOb/xAkTrjot6SfqgiJkoww35O2YrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F+uz8bI1O4av+DCzVERDs8frPTYO0aMRPw+d/+SoQWqf0bzxyAtZqy1ZkRFygJciE
	 B4/ck0lddhqlGOqPRcR+wdAgS3Mit+MbPKSYgJ/dzAN7+BL9McBwnG3BXQmg7DUKKR
	 xY256ezGRrkErnemmctOnY6diljF5UlkAg+CI8Ac=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:35 +0200
Subject: [PATCH 1/9] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Add
 r8a779h0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-1-738ae1a95d2a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=877;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=ks/0AZ9jnTIxLCPYxabqyUoJw04LWekyUTIAUkDsAUA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrscd8+PrTK1ivuGRSLgFCZmTznqU+FyBEU0m
 9uQzNoTmziJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HAAKCRD6PaqMvJYe
 9dIOEACbU+Q8C5upqrW/FEHfTLqVy4XaqmQHWkACwXwf8f+LntmL6tEDY1SZ5FGL65pnzHZJmm3
 cddS+AGbBbPF7MdhUq9Lz1VNhWlis4VKwD95OEeyl4A7myvJPzgAY9r3H8WlA8E5AWImKzCTR2D
 n+f7pRkrsSwVRcEU7/r/SWe6yzwOuWeq5bF3DtkxF3JyRGF94Z6nLcS958aZl9saLO1/AEofDJa
 Ev1U7z+VuhEGNs27cypCnVq14JxwCy0/fy9Mz/+RnBTQgHUs7Pz0fBDEQcKv0nGJBphIOBBM9Ro
 bszbtA3ZIaQrUq0S91jEyI1cNmen0Yf4+97WXL64VTEBmh4cpmiDG787YeLqnfA4OW27iWWIwwM
 YpVVLo1HWwLh4WoN649aO89XFjzJL2YryDp2IQAvP2CFdOJzytJxxWZBair0j8aqXSiXLkE16HJ
 EIcW55+xa/yjeKUtL5agsmd/dt0pY4ilO/nqPN02fvhh2IuG9b3tY2/gr8JjY1k6EF4VC7oknHX
 MaDy8e6gq8Olexaly1UtD7tjUuxDAh23AjetcucRK7pxYPBcJJ8ZtjKBkaaPATTIQt1FB4q7c7G
 4NuvDFcPw56cRJF+lz/H0lcRQwI3pQt4Gq+VqzjW09B2BjCe15NqVetIVhz8YQfnJqtbJRH0W+i
 snzDAg8bfKRkquQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DSI display bindings to support the r8a779h0 V4M.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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


