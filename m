Return-Path: <linux-renesas-soc+bounces-10797-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 039089E151A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:07:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 757AE28071E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 08:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542C31E1C03;
	Tue,  3 Dec 2024 08:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="G7WBO42w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90811E1048;
	Tue,  3 Dec 2024 08:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212975; cv=none; b=W5pHVBxB46z/kow77ny6qEPmUpHXKghS4VWRD1bzRXylhyUstR9GWp/4hWbBPxyd4i3O8OYp/7rp6hZhKbrQy6wJXWriB3aF4a8Wa6CshBIzLHVaMalPe4Ck6iLa+ViFlwH1YYyfuihuIm6TrXnF3TTcIyj8IB/xQ2HnJAAvL/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212975; c=relaxed/simple;
	bh=RWVLj+6YB43d8rRQnYdm2xl4F3BtKMrSAQX0cjQhFFk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E73iaw1ncqj3/6Z/fumhsZ5mJow6eNBamgJOi+qZf6I7sqLlHBlQH/YJAPeqvvHxJSVxv8Bb6VCV7cJec009MHFxkONi4TgSPGF+cXBhn/iXMygZfm1zL8hENtIFFD0q8m1u0eqgdDBcBJqf/8nmKn6IiXVFBjdIjfGeAyX7yu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=G7WBO42w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AF5A1112;
	Tue,  3 Dec 2024 09:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733212943;
	bh=RWVLj+6YB43d8rRQnYdm2xl4F3BtKMrSAQX0cjQhFFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=G7WBO42wEdWIbOqv0iwkjx0J3sKovzFymhcRUhlfPhnclX+tlbi8yac/434Fh4mRK
	 EVpGQlNkXTyDDXWihvTuqQAmLXcGgZ8dI8Dfgz43j9s6p5VBbB/3gNq3XPcoqWvUwS
	 3Ho8fZUIZV+Mvj7+3RRjyOfkKm5y7xixYj0bidsw=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:39 +0200
Subject: [PATCH 5/9] drm/rcar-du: dsi: Add r8a779h0 support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-5-738ae1a95d2a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9Inz7swUGZNMUmq1FqPlDEY1Ugw09knlzM2EIBoVHxc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrseA0J63hsolJ/x+UHz5TC6KxKE6YB7eaGM6
 qennVJ6dsyJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HgAKCRD6PaqMvJYe
 9TvlD/90F0+7VrosPqLrT/spYfDECGUjtDMMvPtCEXLXl9rUwgvcIbCAj+Vo2Giaaupx/h5mYn1
 o2c7oc9pJfqifUfOxXqfGTrhzogF2HL8c0m0+eKYGzc6PaZRxx9guRsgBegYTwVgTzvTrvkyMNL
 xgi1vlPT7zlTxZAs9IuG3dx6F1+h6j4MpFgweNJIcP3iKCusoqN+OVzkGkVccDr+hs4JikprNA7
 ZR8E8sy5QHIAlJh23Hnzhz/43WXHGm5Er1hoCkGTdjVqQdqrw3ceb+D0PZ9FE/G46KEDDuNaKjY
 7WoiKNFIKwak7Q2bmkoSL6ei6Y5xWKVub11kX9d/oq17T0XB/R7sDlVKn199AYvd4SgKTJPbYDa
 uV0yVjZm05hc6ReqD3UniJxaAFgOLwOyQ3sOgYTC2taLLE8KheCMbugNWL4Xpqu0NWDaGCVCdaW
 yN6lCFky0Sw6hcWokL2rkKgJ8Ug3tKutTg9h6O36H6Dmy7QdWXUZJ9+kAJVpTpOQ8ALnsWffJmt
 rqX/UheaVZGMKiHj2uIVKTbDUaH9aEP9ZXfFeyX99wIIXTjpHC3OPvcKrh+RbQlxWebxcR1eLdn
 oxEwziVX1RfdIqINgN2PMqpDFhnIuZ9/D0ZgRr8NJmHIhOVi/A1fCcP3ku/4a3ddJYfE2IB7DIJ
 3vZ6I22ljYuUyKw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for DSI on r8a779h0. As it is identical to DSI on r8a779g0,
all we need is to handle the compatible string.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index 92f4261305bd..36e902601f84 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1081,6 +1081,8 @@ static const struct rcar_mipi_dsi_device_info v4h_data = {
 static const struct of_device_id rcar_mipi_dsi_of_table[] = {
 	{ .compatible = "renesas,r8a779a0-dsi-csi2-tx", .data = &v3u_data },
 	{ .compatible = "renesas,r8a779g0-dsi-csi2-tx", .data = &v4h_data },
+	/* DSI in r8a779h0 is identical to r8a779g0 */
+	{ .compatible = "renesas,r8a779h0-dsi-csi2-tx", .data = &v4h_data },
 	{ }
 };
 

-- 
2.43.0


