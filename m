Return-Path: <linux-renesas-soc+bounces-18557-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F4BAE0D69
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 21:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27B7B3BE5B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Jun 2025 19:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC045244E8C;
	Thu, 19 Jun 2025 19:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QlvfoknH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE3C244693
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Jun 2025 19:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360688; cv=none; b=dXibYVCLg8QjKKblWE9ppq4y1Uu/1T1iMc6b2qBX/hUaPSc1eK8qpOcNqAbEvLLp090rrALF69M17AycasEC5J7vt2wa0bw6Cbd/Lzbe7iQjMchOdZ89mSlf77Cz+jBmc6wlyjfBYX+EcW9jxZgXeMbvYsaUABy6Bt2gmz34Toc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360688; c=relaxed/simple;
	bh=Tc35LYnloxYekiZZhivWmAHnrRtMhAnr/P2YRkymKvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OXmYWAkQYOkyWut+yWgyg9gZOpCuP4EqI2QewttyUSiF4xLew6U2oUA3YFbhV2s0M7/8cWTYhZ/ph4lOQlcmTWFeW8XwxJINM4kq2r7IL7QGv9oXXavCnuWPCKJuGY6J8t/rZcrOpImgLps5jGky5ldQb3xa+x3Bi9IxmMmqgpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QlvfoknH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eo/zVUS27I3iBJXxa3aUPvdwg21sDptKqghnN2ZomoU=;
	b=QlvfoknHmSi/Dq3caNFm392jfiSZQpqi6ESZKcTLZPGP1oUAe9roq4Sq7Tl43tE768gle5
	OD2ZbUQnTrSQrTFjH/sy6MK7uoNQdXtAU5O0NDHIPnn0y90rRIIklSIOxEuitB1QQxYq3c
	0r/W0HRckWskaW4nudaEVk77OOTEPB0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-410--ujauuIfPGOIoVTMItiAUA-1; Thu,
 19 Jun 2025 15:18:02 -0400
X-MC-Unique: -ujauuIfPGOIoVTMItiAUA-1
X-Mimecast-MFC-AGG-ID: -ujauuIfPGOIoVTMItiAUA_1750360678
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8117C195608E;
	Thu, 19 Jun 2025 19:17:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E157419560B2;
	Thu, 19 Jun 2025 19:17:47 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:15:55 -0500
Subject: [PATCH v2 03/16] drm/panel/samsung-dsicm: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-3-0df94aecc43d@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=983;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Tc35LYnloxYekiZZhivWmAHnrRtMhAnr/P2YRkymKvc=;
 b=vN92IBQi+M09EbSRlRz+7klMp240mFog3YQFqIvUWNP4EPGP0V5d40UNgVhMKMGQioZJzKxlt
 4mDoniewSgwD271dOvPPbqJJrVnML3dE9maoN1t5FCwFi6HaNRX+SIk
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Put the panel reference back when driver is no
longer using it. The panel that of_drm_find_panel()
returns is or the purpose of finding a out->bridge.
After which it is no longer used. Drop the refcount
accordingly.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v2: Explain in commit message why the refcount is put in the
attach function which is not usual.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de657af7fd14388 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 			dsi->out_bridge = ERR_PTR(-EINVAL);
 	}
 
+	drm_panel_put(panel);
 	of_node_put(remote);
 
 	if (IS_ERR(dsi->out_bridge)) {

-- 
2.48.1


