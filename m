Return-Path: <linux-renesas-soc+bounces-31506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FGMJd286GkHPgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31506-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:19:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB66A445D0F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C01D5304A5B9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA2C3D3301;
	Wed, 22 Apr 2026 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhS1tL/Z"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65BD3D2FF5
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 12:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776860104; cv=none; b=tZJ16tI1Ina5YZQtVJUNaqLcD3b0fVRFBijglo0IYvM38mDIbZFXqMjgeSxiz29/ISH0jnyKVdVbWTOsSdw0ouhp5Ke0neMBYiZDJt1QWvdR+VzBC8+2HGD3s8bwsiAlg6J0LewNcreZnFzBKZIpN3a+clT9MXuTFRxbbcO5Obw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776860104; c=relaxed/simple;
	bh=L3mfDEdUtkrf6vafhVgaTGAZ+H/Cv4eshByKCax6nuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWWWO5PXt+dZNY5Sw+xPw0r0Ec+mQacjzQCXENh8j+harEJVzV8ct8bLXLxddKffnj2uZlSnYvsXlr7gaKukiU5ZMrnOh+69hS+1TFYky4fyCH1s3qZBismzX3KBCS666nUj46q6W+4WA+dtiKpkdnovuAC+4/tDIILVKthaKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhS1tL/Z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so44793935e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776860100; x=1777464900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLinte2bTrSfydnPw4RU23zBy6zkLJ7eny7r/S0aKYo=;
        b=EhS1tL/Zdy5sLeQSlOQ/pw3BJj5VLPmwNKyIH16SpcwW++tK31jDXtMlHBTlcT5ZYV
         /2DKomz/cAejjr9Vd+Iaawn3rK6OwoLiZyrz+zRnEF/knSrNRvWusj4PHUzmCBmiX0B6
         c+rk6WwRlv0Zp2ekZ5xfwupWE3a1rqb+khUAPYNAsg84/TwhNdeceA7c+/G2YttYo5c2
         dL/puhZGCmrPP3LIlQQT386JHLl4+iXfNwshphQQjPiVT2alzccU/NlPFPaxomVdDHoH
         sOZPC7zdoVGJyNNP9dqYHaOLtIk5XWf79qpyqGt1bVcNnYThS2G5sSSzb6KCqBYyndnq
         jQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776860100; x=1777464900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLinte2bTrSfydnPw4RU23zBy6zkLJ7eny7r/S0aKYo=;
        b=kbVP72ysKr/aOhbGEKHHA6NeqjtAgnlh1ctQSJn7C2JNf+4j5vBtG+X7+DI9FDfKHm
         A+D5Ltqt5eeqyQzD6KpTSKOc3qDnKQ6aykKTx6ai8HRB5v0umPMYFEFJLqQHEg0VCUI9
         H4BvHHSZJKlpuFp73SwGnTrebvj+YIwpi6ZXqBu6Uvy6WbBGR4h3RKRj78NFvwbWJfE/
         T3qr+J4pr+Uam2N889DE2PUaTqfjL7FweSa2GQC6ALnlyzwu/I6U4598pCGhFCSqH+hc
         kSZ9JUje9M8a3p1bQs9Lw+Vr1Ge5QYa253EX3hRrikb25VWyQERo8N8CuPsQVBwyKQ3j
         vmLA==
X-Forwarded-Encrypted: i=1; AFNElJ/qQbnxmcR4v3UJUJS33cqLWZl3Gx6G3etzRIv5tG95IlOZKa+B3IPTswBGMLdZiJpNYSMDMNwREcyO4eWJ2P39bw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbUYL1WfWh9eGCQ1+bNQlVnaceWaAlCDBFAXeK+HH6gOVHcmmB
	FQl5nuRPvqffbAouWm4kUyC1xGvTHMh8LJ0dQjHaZgFOT0JmdXYUCUFK
X-Gm-Gg: AeBDievNP+MKIZS2x2FB15ql0nNBdnoG5bF1E+qVKcL+Q76pdML9yImp2yimHhjZUJM
	gjhHY8cUEoQRAskdyAG0bM/v7HX7bc55Z7mClnJ/oR0kXym8rgO/k0u5J/HgRgssupvIyuogj8d
	AXK6X44cCeGgK5HFtxmPF0JS5PHC+7KQHNTkCYv5+z8mbkuEse96LNe5/imvzGjMI2muh8Q6CQv
	8TK/RVw4A9AcPPLs0nnXvxXdxCXhddcWSg4j2d/6WOztWECly0bAy4dX864Rxi1E9CIHoUklkSw
	/HT6eWNdK/NnZlJmZMoHUq+au/esnVl86FXtYJSPR6F6L26weeztJsPQH2TysjBR4zoQ7mnFEwW
	OUjWVXdB/xZ+WSNX5sbd8/iklvXJsU9JnbKUE6zmKUrNWwUtRV0H6/MMU/yENtfD5xDmocmmjSk
	lGzy5yYXd5TLo6mcJf9O+q+ae5w9fWOqUjsMZe6WdJdQ==
X-Received: by 2002:a05:600c:4895:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-488ffad67f4mr158637015e9.19.1776860099737;
        Wed, 22 Apr 2026 05:14:59 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:a996:3b08:6e96:ca85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891df9e50asm192056665e9.0.2026.04.22.05.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:14:59 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] drm/bridge: adv7511: Clear HPD IRQ during atomic_enable()
Date: Wed, 22 Apr 2026 13:14:54 +0100
Message-ID: <20260422121457.166780-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31506-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,ideasonboard.com,kwiboo.se,gmail.com,oss.qualcomm.com,microchip.com,collabora.com,lists.freedesktop.org,vger.kernel.org,glider.be];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: EB66A445D0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

On RZ/G3E SMARC EVK, suspend-to-RAM via PSCI powers down the ADV7535
chip entirely, causing the HPD status bit to be in a stale state on
resume. When the display controller driver's system PM resume callback
invokes drm_mode_config_helper_resume(), it calls the bridge's
atomic_enable(), but the stale HPD IRQ is never cleared, leading to
incorrect behaviour.

Clear the HPD status bit in adv7511_bridge_atomic_enable() after
powering on, so that any HPD interrupt latched before or during
power-loss is dismissed before normal operation resumes.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Tested HPD, s2idle and s2ram on RZ/G3L SMARC EVK connected to ADV7535
on both polling and IRQ mode.
v1->v2:
 * Dropped PM support instead clearing latched HPD status bit in
   adv7511_bridge_atomic_enable()
 * Dropped suspended variable from struct adv7511.
 * Updated comment in adv7511_bridge_atomic_enable().
 * Clearing the HPD status bit unconditionally as there is no harm.
 * Updated commit header and description.
 * Dropped the tags.
---
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 6bd76c1fb007..7663814b4032 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -792,6 +792,13 @@ static void adv7511_bridge_atomic_enable(struct drm_bridge *bridge,
 
 	adv7511_power_on(adv);
 
+	/*
+	 * Clear the HPD status bit (ADV7511_INT0_HPD), so that any HPD
+	 * interrupt latched before or during power loss is dismissed before
+	 * normal operation resumes.
+	 */
+	regmap_write(adv->regmap, ADV7511_REG_INT(0), ADV7511_INT0_HPD);
+
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (WARN_ON(!connector))
 		return;
-- 
2.43.0


