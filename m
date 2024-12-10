Return-Path: <linux-renesas-soc+bounces-11178-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DE79EB801
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 18:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0E7F283BB1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Dec 2024 17:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF0923A566;
	Tue, 10 Dec 2024 17:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="hDi+eEZM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EEC2397AD
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 17:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733850622; cv=none; b=ByX69Knq8+3GxL/RALFvs1IyuayZ5ofozldJRa8vUu3U5zOTduwlKP+ggGwyHEYVIidIpJ79cor9WomIq06+SwXL7YdgFuNXDOYLwhR6MQbwRLea2FsAs029qN2m4N6tu/fj9FoXET0Hr92J+WCcAF5dv9v/u+eCBYM0LsSEaMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733850622; c=relaxed/simple;
	bh=hgummav4gWlxydCCaiYlSrENU1T64Eunf3Cfp6+7rSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e5h6EiATP504UMk4PKbSmenqR0ooNlUHh8ltN7H9Uwc+qo998/u3wBmNA/80bRACXELbYAVocEdyJ6+8+8+WxGQrzn5/Ln7KfuP6TFzZx0GmURFoGyjdOZZaweOulLFq6VKLmN3rsmHb1fPs9UMhRGWiJndpWzkPtH3WLHCLSJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=hDi+eEZM; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5cec9609303so6813638a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 09:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733850619; x=1734455419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFuKmapnbE9+QOXBiNESOVZ7AOkqywZ/u7IM8EV36Uw=;
        b=hDi+eEZMHKYaStvYGNqdq89LdNEds2TOOG3WmHMR2G5bGIw+1r7JQMrwNVZfDNGpQq
         67ciFOKnp7z+LRoH5r1a22banVTgRw05K7pEhUj7MyX/rloEGEncZE7eGcVfzXAEdjU1
         J+ZeOGFMmxO0i3FyoB/bHDuRHEfDrxwiSKLKu0JQXTDNFLSyeeI6ZceIYCG7hxfxoKQf
         ntMm/dLiPvrjDIk8TD+QvRLDjd53E6RhInc2wHnOa3GfkiWj5wCWA7ZL5aBMm9SZXWk8
         8TXzRDFkHHXW4WvzkIFKH0Ra45UICMoqR1uvMS9K3cBpe0uCRXP7uhuZepJJWNnMIWzL
         nt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733850619; x=1734455419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFuKmapnbE9+QOXBiNESOVZ7AOkqywZ/u7IM8EV36Uw=;
        b=kE8t2XuOYHGCc1XzyWfZW/hz0RLWkJXaQSnmC0KcdRRsfNzEND9n8CNi2KFerbQRjC
         juj+gZHdR4cqR3A37x/wIVpd46qpFBZTOhgcnFIiWrIk93ePoxQv9jbKK8cw0tbGna9A
         PUganPqcUIUilKjBK6DWqJQ5y6Jol1dE+OomvWvdM8lZZ5fDaCjo/8vm/m3kDA9vW/JN
         U/pYRPffpk3MQFqwoa5z1FRxxWgS8YJ+p7VZcsHkkWO8PG0cZXSUGlbfJLqQuXRE3XmI
         cOW7E52VgZAOmVFJIAI2wZBBoWU/wvsw/58arfmxHXaprgSGAp+u4Q2afwOZ4RF3C1bk
         4BRw==
X-Forwarded-Encrypted: i=1; AJvYcCWgn70DkVbI+O2HSH0a7UnttnottHMCVKbtpMPNNKxHTAybjzec/Nv+ZNsWHreeb59DP7mXqL7Mfx1k6/EKRza1Hw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYWxHTWsdHHi7+wr11S4//vaVdY0yNsXSnInLpqTbHP+bLq8TA
	xmimZTxSldR8RHGUd22NKKQKn321aQKcBvjWPA3d7gFRk2WXN0Lgdk3VvI53UM0=
X-Gm-Gg: ASbGncsVfK2E3PntcdwPlQvgy+Q77zpXczIlD0EyRwOIp2oHqpKQZGS2wVaUNP1zeMp
	LqnUBnmhkbJvGbxJs3V7VbzPDO0YGJ0XBvJdZygn43pm1hG9QMQTdrmyAUolfGQTboqtHBPmln+
	rpR6BZ1v0CRWDNr6ZF2VIaz9iEbAPF/IU+IJ3xd8sWWfWemuzCUB6YCBP2xU8Fx5Cso/p4J9CcQ
	q7yvK6odFxwIDfDPwspBRY0KrZEtBJXxAKf+gKiEhHWiQQoHYoZy184U2q1RVgLaKdwVN6uqZSM
	lJO+WLt3
X-Google-Smtp-Source: AGHT+IGIek6OPyyjZZjrXkuvdN81VR6DHl8mzdwNbzCCYx8cbaECzDZswIN2k+lpO7iWi6HMxuv6jA==
X-Received: by 2002:a05:6402:360f:b0:5d3:bab1:513f with SMTP id 4fb4d7f45d1cf-5d3be6c4046mr19223495a12.18.1733850618930;
        Tue, 10 Dec 2024 09:10:18 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3e7936581sm4853124a12.56.2024.12.10.09.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 09:10:18 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 06/24] ASoC: renesas: rz-ssi: Fix typo on SSI_RATES macro comment
Date: Tue, 10 Dec 2024 19:09:35 +0200
Message-Id: <20241210170953.2936724-7-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241210170953.2936724-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The SSI_RATES macro covers 8KHz-48KHz audio frequencies. Update macro
comment to reflect it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- collected tags

Changes in v3:
- s/sh/renesas in patch title

Changes in v2:
- none

 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 178c915331e9..35929160a8a5 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -71,7 +71,7 @@
 #define PREALLOC_BUFFER		(SZ_32K)
 #define PREALLOC_BUFFER_MAX	(SZ_32K)
 
-#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-44.1kHz */
+#define SSI_RATES		SNDRV_PCM_RATE_8000_48000 /* 8k-48kHz */
 #define SSI_FMTS		SNDRV_PCM_FMTBIT_S16_LE
 #define SSI_CHAN_MIN		2
 #define SSI_CHAN_MAX		2
-- 
2.39.2


