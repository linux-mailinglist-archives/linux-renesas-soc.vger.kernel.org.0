Return-Path: <linux-renesas-soc+bounces-10986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 260ED9E6A40
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D429316A3F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 09:34:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D69B1F7580;
	Fri,  6 Dec 2024 09:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WpFWiIeB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58AB1F4726;
	Fri,  6 Dec 2024 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477614; cv=none; b=oh2TeuNmtHplx3II4pzrTN7SLhOMcsnBudEobAdmnsi3EkC0YtIAZd49MvRc8Kpg7hfsAvyVr7EjLCb6FZcMJNVSgs9qE4Gz5SxSfrOXBzZJyo31he9blyZL8LbLXaAr1E9AGtcqkVAa4oE6qBoVoXCCi9/YFezvqfqToJJuH0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477614; c=relaxed/simple;
	bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWfKNJEJdy/5b5+RKV4XeOcYom6kI+IDqN70/dXD8IiTaod2eCpv54xlcCZCKNY36/f57kRqKa1/r6Pl4Z3xxd5A2vYKaaUfbBDFpe4qcYJxtc2pb8UZOvpLOkpdxAlCubN+YUnJ9ycTZhj54o+j+ESj1c5tL+pWwuRrP7O2hw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WpFWiIeB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67F5B1980;
	Fri,  6 Dec 2024 10:32:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733477579;
	bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WpFWiIeB3tZn+ZuvWqYv5O5tFXIdUh6ijhPsF2L6i2u3MMQMrzLiUJNKt3uvnWYEf
	 bG+El030u/l/LD6rHE9I5tzwnvCseJL2Fq/Kp0bj2ERRARsa990ohKGjAHiKX7mZSy
	 qYHjyEzOJLzt0w4DmUr0P7Nl6Ldz/7SflNSHXvYM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:39 +0200
Subject: [PATCH v3 06/10] drm/rcar-du: dsi: Add r8a779h0 support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-6-d74c2166fa15@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dOcoxtMfzjVQWbNdCVgHPfsgULtxlauUf/dbpEGcHa8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTb3nQBI6XHEpBoRQlNxxmfH9d84KUIaWyi4
 raoOkDEK8+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE2wAKCRD6PaqMvJYe
 9fPBD/0dIvi+Y4LWuiRvh0683PRMLH12xNAS9IDo4X86JAdn0aHDirUMj7mnJAinMAGCrgb7X1K
 Ql0H1aiN+/z0clWrRRWf1evurFGRRJr/h6LBOxcx4ptUp4N1v2/Vd8H9CNV4uhlEc/LQNzmyAO5
 8GBr9A6DmS1E4s+geFZ5pLOrFr4cgVlVMnxK1GIwx+f4BwTgtbI/v7XaZwZzq6JRKGhK2tXAfYX
 NvZIacf8DFv+oVB6iyM7R8Tlzaju3u6pg6r1iZ4ZvdazVPGcefi/QyIJbpGfWLq42Cwh/3fY33B
 wq5PREl5XfM12mD7VPBrYObZR/V8EwvhM5tLFyOgGpfTpvCQAnx6Gy3KF711SHmEmVm7HKcAAJ5
 m2ytYpRjnhBQ7ldeDEQEJ+IL3vg9GRaN8rREDz3mXXxPpqQPXr+Gt5yjVuFNwpUYsYblkaNRIpT
 AdR8e2lm6FpOhrSGtxTarExw+WEvaM3Ohrvb36nLoHihAmaUVaQL829BtoiwncbjxerO0JbdVmc
 XPrBeBoCIgDFt3MtI23hIuR5LdiEikZQfvb2eJnW3SimXqkH6Duk/osYT61fmiafl6yzMCEEUyh
 bosL7CAqQIfUebtP0w2Dv12KI2+5Inu6PZWzaW1Xuzn5Wtgaxk2VPlKV5NRy7AyekqC7DtIm4Y9
 Y8xsOfIvm5kU1bg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for DSI on r8a779h0. As it is identical to DSI on r8a779g0,
all we need is to handle the compatible string.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
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


