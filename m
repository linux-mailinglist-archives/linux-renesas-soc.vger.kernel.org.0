Return-Path: <linux-renesas-soc+bounces-18556-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E386AE0D61
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 21:18:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B95FE1BC172C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 19:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35561245016;
	Thu, 19 Jun 2025 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y8AaDjY/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409BC221DAC
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 19:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360680; cv=none; b=qclldim/FcXEJ/0z5pQMK8VpwkPE7IDbLw+mIBfl5oaz383u/WCjOTHnFTZirbQepl3IzaZpwL0FvqS1l/ER8VCg2m+WlUDKX8IVvpKLkqcWymzpeb19PBQYvAkcA62PdIhjGMQr04YXYyMcE/0Q8T4oUp20vTWMk//p7ro/KUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360680; c=relaxed/simple;
	bh=ST6gjD9VoyICwBm50h8zGvdSJVunJy885W3sLa5J6Jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRB+MrqI0WtdngyaCbd+z94oV/gH8JM6p2+zGBCM9qD/DYilGukAHnFmEUeryzK46drp+w4cnp3BH+rxyW//T3OpEtGUK0MrX6Fp8FMHN0/Yxwg+pu1n1VSYlRwQdPLgAFaWzt/AZO0m8Qp6JqGTcm1E0Uh5dvCatGJk6Ol1/fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y8AaDjY/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQGJ423Vt5SJF9bX8twapzBPTzXeITYH2XzCWr+uqU0=;
	b=Y8AaDjY/gdI1OrQgbNIYNh6ecAsqZqXLduzqQW1IPnHogAeiX4CTekGqT3+N/mioU/aqgK
	1kX8/JcMjtO5dRurPn+IjHGPX4uXWvNGtrMGecsjyA6bUOPHu+0eox6x1jBfOTrkIc1LZr
	fQWTCpEyZ8tPnfDmGy0MurBFBvV7x7k=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-ls--TuZHMf-R6K8qq2UeHQ-1; Thu,
 19 Jun 2025 15:17:53 -0400
X-MC-Unique: ls--TuZHMf-R6K8qq2UeHQ-1
X-Mimecast-MFC-AGG-ID: ls--TuZHMf-R6K8qq2UeHQ_1750360668
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2FC3180028B;
	Thu, 19 Jun 2025 19:17:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7937B19560A3;
	Thu, 19 Jun 2025 19:17:37 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:54 -0500
Subject: [PATCH v2 02/16] drm/panel: get the panel returned by
 of_drm_find_panel()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-2-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=1424;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ST6gjD9VoyICwBm50h8zGvdSJVunJy885W3sLa5J6Jk=;
 b=2GD/QlDrfEdGiTy6fKjGhjgkbp1B4kVCHTBPGz6vEdOtoBLw7z/MuOICWzDPIfpy0SutVFUYr
 uOQwo6MYQ5wDJwrmx8Zr73kdxJSsaQmoT3S3bnoZcu+MwaVORo6f+F7
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

of_drm_find_panel() returns a panel pointer that the caller
holds. With refcounting in place, increment the refcount
of the panel that is returned. This reference has to be put()
by the caller.
Document the behaviour expected from all callers of this
API.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index ced6b08923b2150ebda6e1d9001517103895def1..a3aab725f91f76661185b3ebdf3d9b337bdf230f 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -401,6 +401,9 @@ EXPORT_SYMBOL(__devm_drm_panel_alloc);
  * Searches the set of registered panels for one that matches the given device
  * tree node. If a matching panel is found, return a pointer to it.
  *
+ * The refcount of the returned panel is incremented. Use drm_panel_put()
+ * at the caller side to maintain the count.
+ *
  * Return: A pointer to the panel registered for the specified device tree
  * node or an ERR_PTR() if no panel matching the device tree node can be found.
  *
@@ -422,6 +425,7 @@ struct drm_panel *of_drm_find_panel(const struct device_node *np)
 	list_for_each_entry(panel, &panel_list, list) {
 		if (panel->dev->of_node == np) {
 			mutex_unlock(&panel_lock);
+			drm_panel_get(panel);
 			return panel;
 		}
 	}

-- 
2.48.1


