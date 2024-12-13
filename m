Return-Path: <linux-renesas-soc+bounces-11294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 668939F0E66
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 15:04:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C62A016222F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Dec 2024 14:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B9F11E32DB;
	Fri, 13 Dec 2024 14:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Df/1B3yA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82F1E2852;
	Fri, 13 Dec 2024 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098611; cv=none; b=E2E2vbjpH/RKAMHXNQ3O2Jup1jl9JTSTXNCm6wT08oPIbBu9QzJ/rYHPPdKuALPehIry9yc69hoGCzIQBReO7E16goYKT9Zk+r1zRcRx5evFjqCJuWXqQecQv3TkPf7pwV7MQSvb4FKqrz7cGfHDaegvueNhjtXI+R5QWEcO+6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098611; c=relaxed/simple;
	bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dYw/Th1IQxjVKedRVXh1vTXeyvbDutt3H8BuXs92oy9i5lDvF6THntqYcFdAlT0t/UmkmJ9HlKfBapnBdjNnmX1ZdqhX33XB3+2ovSGQzDeSAAnI03EuoZ2aRdfn0XZqVNxmUTw5Z2G7B/UPiL4CSQXrtVLo0e4JMZFTcHlcC5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Df/1B3yA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9F9EA752;
	Fri, 13 Dec 2024 15:02:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734098572;
	bh=47sDiubgqaQkaDbcosAByaG1Ni6cOzGOKnQlTVO76og=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Df/1B3yAi+Gp2hpeqto3JEPA85Rp3SE+AeOYjXPaLhgfx9XlSK2iUQDdkWs1TLKse
	 VOzzNrZ+z0pygHy5a+lhAU+S7srC/ybRdhAIumf24f17nrSzxsAiBnBZm2sdv1jis5
	 WtCdRycB8wWmEAIB8IuOKk8EisMzOKBCbB9v0DqA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 13 Dec 2024 16:03:02 +0200
Subject: [PATCH v4 6/7] drm/rcar-du: dsi: Add r8a779h0 support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241213-rcar-gh-dsi-v4-6-f8e41425207b@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=dOcoxtMfzjVQWbNdCVgHPfsgULtxlauUf/dbpEGcHa8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnXD6hYuVq4r0AVmh8DHjN9dFuFHrlXwKPcJ+aR
 rGqYLKdF42JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1w+oQAKCRD6PaqMvJYe
 9d/UEACMGNHHrrQVhtbcd1SgDmfQXs1wf0pixw1JaWvyMpACYc/sNrvZD02FitS4XVh2VISfGdD
 8nP57aAlNL1AgjNABcJRjVznJg1StoPBsjwgZUgiAskuqpRW0nMTov1IrWXamPd8YmT3vI/r7OW
 K/ofqL3icJvhJcgnKG5tY+27tWHjiFa80JzTLm4f4CBGTnJpeJvud3RErqxUdwHYPiMUP7ZJzMA
 l9SmqJbKHJVi2GpLZXyVC0LeJEYXPl6GpdYat+HTAl96unhDQmT5eE6Dxh5w3fH2/Hdt85AHr9N
 0skT64kC7KM2Yru7GAC1RZy048jbfZqg+3wIMhj4UBn34+ACuFAfyWWoSQ9T6Pk3n2AmgZHxBXo
 jWykSx1nwybEwMnU9i+WFbKV3KrxEQF7UnvytjwkUjegRdiEh0Nq8jB/cARTcq+lhtYj8gvt9Tu
 uGBWm/VtKriRg60dX2n5oUOP2/7cuYLvisj6Kp34nFqSdGEJt35lP44xejj2Tuq7ZeIxuM0yymT
 mLy4r1jjuuJc3aw08qj14sJF1pZibQ2ZJZXy1dvCUvRUfaEZ90Oij3S9V/PSNrLSK11RqojWiNE
 lTK9JCJyHp/WvgQ+IEKrpLty4xfs8uyO7w+L68Shuq13TLfyP+goF+/iigegJEiJeXlWtjvDaPL
 LUDaiS+66mJjTBQ==
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


